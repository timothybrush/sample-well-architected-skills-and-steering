terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# --- S3 Bucket ---

# WA-ISSUE: [Security] S3 bucket without server-side encryption enabled
# WA-ISSUE: [Security] S3 bucket missing public access block configuration
# WA-ISSUE: [Cost] No lifecycle rules to transition or expire objects
# WA-ISSUE: [Sustainability] No Intelligent-Tiering storage class configuration
resource "aws_s3_bucket" "data_bucket" {
  bucket = "${var.app_name}-data-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "${var.app_name}-data"
    Environment = var.environment
  }
}

# --- DynamoDB Table ---

# WA-ISSUE: [Cost] On-demand billing mode with provisioned capacity values set (contradictory/wasteful config)
# WA-ISSUE: [Performance] No DAX cluster or caching layer configured
resource "aws_dynamodb_table" "app_table" {
  name         = "${var.app_name}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pk"
  range_key    = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  # These are ignored in PAY_PER_REQUEST mode but represent over-provisioning intent
  # if someone switches to PROVISIONED mode without adjusting
  tags = {
    Name             = "${var.app_name}-table"
    Environment      = var.environment
    ProvisionedRead  = "1000"
    ProvisionedWrite = "1000"
  }
}

# --- IAM Role for Lambda ---

resource "aws_iam_role" "lambda_role" {
  name = "${var.app_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# WA-ISSUE: [Security] Wildcard IAM policy granting full access to all AWS services
resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.app_name}-lambda-policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

# --- Lambda Function ---

# WA-ISSUE: [Cost] Over-provisioned memory at 3008 MB for a simple API handler
# WA-ISSUE: [Cost] Using x86_64 architecture instead of arm64 (Graviton) for cost savings
# WA-ISSUE: [Reliability] No failure destination or DLQ configured for async invocations
# WA-ISSUE: [Ops] No associated CloudWatch Log Group with retention policy
# WA-ISSUE: [Ops] Default deployment with no canary or linear deployment strategy
# WA-ISSUE: [Performance] Only synchronous invocations, no async fan-out pattern
resource "aws_lambda_function" "api_handler" {
  function_name = "${var.app_name}-handler"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  memory_size   = 3008 # WA-ISSUE: [Cost] Massively over-provisioned for a simple handler
  timeout       = var.lambda_timeout
  architectures = ["x86_64"] # WA-ISSUE: [Cost] Should use arm64 for better price-performance

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = {
      TABLE_NAME  = aws_dynamodb_table.app_table.name
      BUCKET_NAME = aws_s3_bucket.data_bucket.id
      DB_HOST     = aws_db_instance.app_database.endpoint
      DB_PASSWORD = var.db_password # WA-ISSUE: [Security] Password passed as env var in plaintext
    }
  }

  tags = {
    Name        = "${var.app_name}-handler"
    Environment = var.environment
  }
}

# --- API Gateway ---

# WA-ISSUE: [Security] No WAF WebACL associated with API Gateway
# WA-ISSUE: [Performance] No CloudFront distribution in front of API Gateway
resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.app_name}-api"
  description = "API for ${var.app_name}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE" # WA-ISSUE: [Security] No authorization on API Gateway methods
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.proxy.id
  http_method             = aws_api_gateway_method.proxy_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_handler.invoke_arn
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = var.environment
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_handler.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}

# --- SQS Queue ---

# WA-ISSUE: [Reliability] No Dead Letter Queue (DLQ) configured for failed messages
resource "aws_sqs_queue" "task_queue" {
  name                       = "${var.app_name}-tasks"
  visibility_timeout_seconds = 60
  message_retention_seconds  = 86400

  tags = {
    Name        = "${var.app_name}-tasks"
    Environment = var.environment
  }
}

# --- RDS Database ---

# WA-ISSUE: [Reliability] Single-AZ deployment (multi_az = false)
# WA-ISSUE: [Reliability] No backup retention (backup_retention_period = 0)
# WA-ISSUE: [Security] Security group allows SSH from 0.0.0.0/0
resource "aws_db_instance" "app_database" {
  identifier     = "${var.app_name}-db"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.medium"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password # WA-ISSUE: [Security] Plaintext password from variable

  multi_az                = false # WA-ISSUE: [Reliability] No multi-AZ for high availability
  backup_retention_period = 0     # WA-ISSUE: [Reliability] No backups retained

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name        = "${var.app_name}-db"
    Environment = var.environment
  }
}

# WA-ISSUE: [Security] Security group allows inbound SSH from anywhere (0.0.0.0/0)
resource "aws_security_group" "db_sg" {
  name        = "${var.app_name}-db-sg"
  description = "Security group for RDS database"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # WA-ISSUE: [Security] Open SSH to the world
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # WA-ISSUE: [Security] Open MySQL to the world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.app_name}-db-sg"
    Environment = var.environment
  }
}

# --- EC2 Instance for Batch Processing ---

# WA-ISSUE: [Sustainability] Always-on t3.large instance for a batch job that runs once daily
# Should use Lambda, Fargate, or EventBridge-triggered compute instead
resource "aws_instance" "batch_processor" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t3.large"              # WA-ISSUE: [Sustainability] Over-sized, always-on for daily batch

  tags = {
    Name        = "${var.app_name}-batch-processor"
    Environment = var.environment
    Schedule    = "runs-once-daily"
  }
}

# --- Missing Resources (noted as comments for evaluation) ---
# WA-ISSUE: [Ops] No CloudWatch alarms defined for Lambda errors, API Gateway 5xx, SQS age, etc.
# WA-ISSUE: [Performance] No CloudFront distribution for caching and edge delivery
# WA-ISSUE: [Performance] No ElastiCache or DAX for database/DynamoDB caching
