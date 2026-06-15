output "api_gateway_url" {
  description = "URL of the API Gateway endpoint"
  value       = aws_api_gateway_deployment.api_deployment.invoke_url
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.api_handler.arn
}

output "s3_bucket_name" {
  description = "Name of the data S3 bucket"
  value       = aws_s3_bucket.data_bucket.id
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.app_table.name
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.app_database.endpoint
}

output "sqs_queue_url" {
  description = "URL of the SQS queue"
  value       = aws_sqs_queue.task_queue.url
}

output "batch_instance_id" {
  description = "EC2 instance ID for batch processing"
  value       = aws_instance.batch_processor.id
}
