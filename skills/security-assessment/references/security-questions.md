# AWS Well-Architected Security Pillar — Evaluation Criteria (SEC 1-10)

Reference document for the security-assessment skill. Each question maps to a specific security domain with guidance on what to look for and what constitutes valid evidence.

---

## SEC 1 — How do you securely operate your workload?

**Look for:**
- Security baselines defined and enforced (AWS Config conformance packs, SCPs)
- Account separation strategy (production vs. non-production, workload isolation)
- Threat detection services enabled (GuardDuty, Security Hub)
- Automated response to security events (Lambda remediation, Step Functions workflows)
- Security ownership clearly defined (tags, resource ownership)

**Evidence:**
- AWS Config rules and conformance pack definitions in IaC
- GuardDuty detector configurations
- Security Hub enablement and standards subscriptions
- Automation runbooks or remediation Lambda functions
- SCP or permission boundary definitions enforcing baselines

---

## SEC 2 — How do you manage identities for people and machines?

**Look for:**
- Centralized identity provider (IAM Identity Center, Cognito, federated identity)
- Role separation between human and machine identities
- Credential lifecycle management (rotation, expiration)
- MFA enforcement for human access
- Temporary credentials preferred over long-lived keys

**Evidence:**
- IAM Identity Center or Cognito configuration in IaC
- IAM role trust policies (federated principals, OIDC providers)
- Absence of IAM users with access keys (prefer roles)
- MFA conditions on IAM policies or identity provider settings
- Secrets rotation configurations (Secrets Manager rotation Lambda)

---

## SEC 3 — How do you manage permissions for people and machines?

**Look for:**
- Least privilege applied to all IAM policies
- Permission boundaries limiting maximum possible permissions
- IAM Access Analyzer enabled for ongoing analysis
- Regular review process for permissions (evidence of tagging, documentation)
- Service control policies restricting dangerous actions

**Evidence:**
- IAM policies scoped to specific resources (no `Resource: "*"` on write actions)
- Permission boundary ARNs attached to roles
- IAM Access Analyzer configuration in IaC
- No wildcard actions (`Action: "*"`) on policies granting mutating operations
- Conditions restricting access by source IP, VPC, time, or MFA

---

## SEC 4 — How do you detect and investigate security events?

**Look for:**
- CloudTrail enabled with multi-region logging
- GuardDuty enabled in all regions
- Security Hub aggregating findings
- VPC Flow Logs capturing traffic metadata
- DNS query logging enabled
- CloudWatch alarms on security-relevant metrics (root login, unauthorized calls)
- Log retention policies meeting compliance requirements

**Evidence:**
- CloudTrail trail definitions (multi-region, S3 destination, log file validation)
- GuardDuty detector resources in IaC
- Security Hub resource with enabled standards
- VPC Flow Log definitions on all VPCs
- CloudWatch metric filters and alarms (UnauthorizedAPI, RootAccountUsage)
- Log group retention period configurations

---

## SEC 5 — How do you protect your network resources?

**Look for:**
- VPC segmentation (public, private, isolated subnets)
- Security groups following least-privilege (specific ports, specific sources)
- WAF on all internet-facing endpoints
- VPC endpoints for AWS service access (avoiding internet transit)
- Private subnets for databases and internal services
- Network ACLs as defense-in-depth layer

**Evidence:**
- VPC and subnet definitions with proper route table associations
- Security group rules — no `0.0.0.0/0` on non-HTTP(S) ports
- WAF WebACL associations on ALB, API Gateway, CloudFront
- VPC endpoint definitions for S3, DynamoDB, and other services
- NAT Gateway placement in public subnets only
- Route tables showing no direct internet routes for private subnets

---

## SEC 6 — How do you protect your compute resources?

**Look for:**
- Automated patching or managed runtimes (Lambda, Fargate)
- Container image scanning enabled (ECR scan-on-push)
- IMDSv2 enforced on EC2 instances
- Minimal runtime privileges (non-root containers, scoped Lambda roles)
- SSM Session Manager instead of SSH

**Evidence:**
- EC2 launch templates with `HttpTokens: required` (IMDSv2)
- ECS task definitions without `privileged: true`
- ECR repository scan configuration
- Lambda functions with minimal IAM role policies
- No SSH key pairs or port 22 security group rules (SSM preferred)
- Container definitions running as non-root user

---

## SEC 7 — How do you classify your data?

**Look for:**
- Data classification tags on storage resources (Confidential, Internal, Public)
- Amazon Macie enabled for sensitive data discovery
- Data catalog with sensitivity labels (Glue Data Catalog)
- Different handling procedures based on data classification level
- Backup and retention policies aligned with data sensitivity

**Evidence:**
- Resource tags containing classification metadata (e.g., `DataClassification: Confidential`)
- Macie session and custom data identifier configurations
- Glue Catalog database/table definitions with sensitivity properties
- S3 bucket policies or lifecycle rules varying by classification
- Documented data inventory or catalog references in IaC comments

---

## SEC 8 — How do you protect your data at rest?

**Look for:**
- Encryption enabled on ALL storage resources without exception
- KMS customer-managed keys (CMKs) for sensitive workloads
- Key rotation enabled (automatic annual rotation)
- Key policies following least privilege
- S3 bucket default encryption configured
- Database encryption (RDS, DynamoDB, Redshift, ElastiCache)

**Evidence:**
- `EncryptionConfiguration` or equivalent on every S3 bucket, EBS volume, RDS instance, DynamoDB table, EFS filesystem
- KMS key definitions with `EnableKeyRotation: true`
- KMS key policies restricting `kms:Decrypt` to specific principals
- S3 `BucketEncryption` with SSE-KMS or SSE-S3
- RDS `StorageEncrypted: true` and `KmsKeyId` specified
- No unencrypted storage resources in the entire codebase

---

## SEC 9 — How do you protect your data in transit?

**Look for:**
- TLS 1.2+ enforced on all endpoints (no TLS 1.0/1.1)
- HTTPS-only access (HTTP-to-HTTPS redirect rules)
- Modern cipher suites (no RC4, DES, 3DES, MD5-based MACs)
- Certificate management via ACM (auto-renewal)
- Internal service-to-service encryption

**Evidence:**
- ALB/NLB listener configurations with TLS 1.2+ security policies
- CloudFront distribution `MinimumProtocolVersion: TLSv1.2_2021`
- API Gateway with TLS 1.2 minimum
- S3 bucket policies with `aws:SecureTransport` condition
- ACM certificate resources (not self-signed in production)
- HTTP-to-HTTPS redirect rules on load balancers
- No security policies referencing deprecated protocols or ciphers

---

## SEC 10 — How do you anticipate, respond to, and recover from incidents?

**Look for:**
- Incident response automation (auto-isolation, auto-remediation)
- Forensic readiness (CloudTrail log integrity, immutable log storage)
- Game day or tabletop exercise references
- Containment procedures (security group isolation rules, IAM deny policies)
- Backup and recovery configurations with tested restore procedures
- Cross-region or cross-account backup for resilience

**Evidence:**
- Remediation Lambda functions triggered by GuardDuty/Security Hub findings
- EventBridge rules routing security findings to response workflows
- S3 bucket for CloudTrail with Object Lock or MFA Delete
- Backup vault definitions with cross-region replication
- IAM "break-glass" deny policies ready for deployment
- Step Functions or Systems Manager automation documents for incident response
- SNS topics for security alerting with confirmed subscriptions
