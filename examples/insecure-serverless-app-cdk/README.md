# Insecure Serverless App (CDK) - Well-Architected Eval Example

> **WARNING: This is a deliberately flawed example project.**
> It exists solely for testing and evaluating AWS Well-Architected review skills.
> DO NOT deploy this to any AWS account. It contains intentional security vulnerabilities,
> reliability gaps, cost inefficiencies, and other architectural anti-patterns.

## Purpose

This CDK project defines a serverless application (API Gateway + Lambda + DynamoDB + S3 + RDS + SQS)
with approximately 15 intentionally planted Well-Architected issues across all 6 pillars. It serves as
a ground-truth test fixture for evaluating whether WA review tools can correctly identify these issues.

## Planted Issues by Pillar

### Security (5 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 1 | S3 bucket with encryption explicitly disabled | `lib/stack.ts` | 43 |
| 2 | Lambda IAM policy with wildcard (`*`) resource on all actions | `lib/stack.ts` | 121-132 |
| 3 | No WAF attached to API Gateway | `lib/stack.ts` | 142, 163 |
| 4 | Hardcoded secrets (DB_PASSWORD, API_KEY, SMTP_PASSWORD) in Lambda env vars | `lib/stack.ts` | 108-111 |
| 5 | TLS 1.0 security policy on API Gateway custom domain | `lib/stack.ts` | 172 |

### Reliability (4 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 6 | Single-AZ RDS instance (multiAz: false) | `lib/stack.ts` | 68 |
| 7 | SQS queue without a Dead Letter Queue (DLQ) | `lib/stack.ts` | 79-83 |
| 8 | No Route 53 health checks or synthetic canaries | `lib/stack.ts` | 186-189 |
| 9 | Lambda without reserved concurrency controls | `lib/stack.ts` | 114-116 |

### Cost Optimization (3 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 10 | Over-provisioned Lambda memory at 3008MB for simple CRUD | `lib/stack.ts` | 99 |
| 11 | No S3 lifecycle policies (data accumulates indefinitely) | `lib/stack.ts` | 37-38, 46 |
| 12 | x86_64 architecture instead of ARM64/Graviton2 | `lib/stack.ts` | 101 |

### Performance Efficiency (3 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 13 | No API Gateway caching layer | `lib/stack.ts` | 158 |
| 14 | No CloudFront CDN in front of API Gateway | `lib/stack.ts` | 148 |
| 15 | Synchronous processing for large/bulk payloads | `lib/stack.ts` | 179, 184 |

### Operational Excellence (3 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 16 | No CloudWatch alarms on any resource | `lib/stack.ts` | 193-196 |
| 17 | No structured logging (Powertools or JSON format) | `lib/stack.ts` | 93-94 |
| 18 | All-at-once deployment (no canary/linear/blue-green) | `lib/stack.ts` | 150-151, 159 |

### Sustainability (2 issues)

| # | Issue | File | Line |
|---|-------|------|------|
| 19 | Always-on EC2 NAT instance instead of managed NAT Gateway | `lib/stack.ts` | 25-31 |
| 20 | No S3 Intelligent-Tiering or data lifecycle tiering | `lib/stack.ts` | 39-40 |

## How to Use

This project is designed to be scanned by WA review tools (Holmes, wa-review skill, etc.).
The tools should ideally detect most or all of the planted issues above.

```bash
# Install dependencies (for type checking only - do NOT deploy)
npm install

# Verify TypeScript compiles
npm run build

# Synthesize CloudFormation (for static analysis tools)
npx cdk synth
```

## Scoring Guide

When evaluating a WA review tool against this fixture:

- **Recall**: How many of the 20 planted issues did the tool detect?
- **Precision**: Did the tool report false positives not in the planted list?
- **Severity accuracy**: Did the tool correctly prioritize Security issues (secrets, wildcard IAM) as HIGH?
- **Actionability**: Did the tool provide specific remediation guidance?

A good WA review tool should detect at least 12-15 of these issues with specific, actionable recommendations.
