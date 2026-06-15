# Insecure Serverless App - Terraform Example

> **WARNING**: This is a deliberately flawed Terraform project created for demo and evaluation purposes. It contains intentionally planted Well-Architected issues across all 6 pillars. **DO NOT deploy this configuration to any environment.**

## Purpose

This example is used to test and evaluate AWS Well-Architected skills and scanning tools. Each issue is marked with a `# WA-ISSUE:` comment in the Terraform code.

## Planted Issues by Pillar

### Security (5 issues)

1. S3 bucket without server-side encryption enabled
2. S3 bucket missing public access block configuration
3. Lambda function with wildcard (`*`) IAM policy (overly permissive)
4. No WAF attached to API Gateway
5. Database password stored as plaintext variable default
6. Security group allowing SSH (port 22) from 0.0.0.0/0

### Reliability (4 issues)

1. Single-AZ RDS instance (`multi_az = false`)
2. SQS queue without a Dead Letter Queue (DLQ)
3. RDS with no backup retention (`backup_retention_period = 0`)
4. Lambda function without error handling or failure destination

### Cost Optimization (4 issues)

1. Over-provisioned Lambda memory at 3008 MB for a simple handler
2. No S3 lifecycle rules to transition or expire objects
3. DynamoDB on-demand with over-provisioned read/write capacity (contradictory config)
4. Lambda using x86_64 architecture instead of arm64 (Graviton)

### Performance Efficiency (3 issues)

1. No caching layer (no ElastiCache or DAX for DynamoDB)
2. No CloudFront distribution in front of S3 or API Gateway
3. Synchronous Lambda invocations only (no async fan-out)

### Operational Excellence (3 issues)

1. No CloudWatch alarms on any resource
2. No CloudWatch Log Group with retention policy for Lambda
3. Default Lambda deployment with no canary or linear deployment strategy

### Sustainability (2 issues)

1. Always-on t3.large EC2 instance for batch job that runs once daily
2. S3 bucket without Intelligent-Tiering storage class configuration

## File Structure

```
.
├── README.md          # This file
├── main.tf            # Main infrastructure definitions with planted issues
├── variables.tf       # Variable definitions (includes plaintext password)
└── outputs.tf         # Output values
```

## How to Use for Evaluation

Run a Well-Architected review skill or tool against this directory and verify it detects the planted issues. A good tool should identify at least 12 of the ~17 planted issues.
