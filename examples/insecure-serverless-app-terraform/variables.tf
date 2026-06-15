variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "serverless-demo"
}

# WA-ISSUE: [Security] Database password stored as plaintext variable with default value.
# Passwords should be managed via AWS Secrets Manager or SSM Parameter Store, never hardcoded.
variable "db_password" {
  description = "Database master password"
  type        = string
  default     = "CHANGE_ME_insecure_password_123"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
}

variable "notification_email" {
  description = "Email for notifications"
  type        = string
  default     = "admin@example.com"
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}
