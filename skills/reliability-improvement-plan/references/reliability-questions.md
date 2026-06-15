# AWS Well-Architected Reliability Pillar — Evaluation Criteria

Reference questions REL 1 through REL 13 for assessing workload reliability.

---

## REL 1 — How do you manage service quotas and constraints?

**Look for**: Quota monitoring alarms, SDK retry configurations that handle throttling, service limit increase requests, usage tracking dashboards.

**Evidence**:
- CloudWatch alarms on service quota utilization
- SDK client configs with retry/backoff for throttling errors
- Service Quotas API integration or Trusted Advisor checks
- Code that handles `ThrottlingException` or `TooManyRequestsException`

---

## REL 2 — How do you plan your network topology?

**Look for**: Subnet definitions spanning multiple AZs, NAT Gateway redundancy, VPC design with public/private separation, DNS failover configurations.

**Evidence**:
- VPC/subnet IaC with AZ distribution (at least 2 AZs)
- NAT Gateway per-AZ placement (not single NAT for all AZs)
- Route 53 health checks and failover routing policies
- Network ACL and security group configurations
- Transit Gateway or VPC peering for multi-account topologies

---

## REL 3 — How does your system adapt to changes in demand?

**Look for**: Auto Scaling Group configurations, scaling policies, Lambda concurrency settings, DynamoDB on-demand or auto-scaling capacity.

**Evidence**:
- ASG with min < max and scaling policies attached
- Target tracking or step scaling policies with appropriate metrics
- Lambda reserved/provisioned concurrency for critical functions
- DynamoDB on-demand mode or auto-scaling configs
- ECS service auto-scaling definitions

---

## REL 4 — How do you design interactions in a distributed system to prevent failures?

**Look for**: Retry logic with exponential backoff and jitter, timeout configurations, SQS/SNS decoupling, idempotency tokens, dead-letter queues.

**Evidence**:
- SDK client retry configurations (max attempts, backoff strategy)
- HTTP client timeout settings (connect, read, total)
- SQS queues between synchronous components for decoupling
- Idempotency key handling in event processors
- DLQ configurations on Lambda, SQS, and EventBridge rules

---

## REL 5 — How do you design interactions to mitigate or withstand failures?

**Look for**: Circuit breaker implementations, fallback paths, bulkhead patterns, load shedding mechanisms, graceful degradation logic.

**Evidence**:
- Circuit breaker libraries or custom state machine implementations
- Fallback responses when dependencies are unavailable
- Bulkhead patterns (separate thread pools, connection pools per dependency)
- Load shedding logic (priority queues, request dropping under load)
- Graceful degradation (serving cached/stale data when source unavailable)

---

## REL 6 — How do you monitor workload resources?

**Look for**: Health check endpoints, CloudWatch alarm definitions, composite alarms, dashboards, anomaly detection, distributed tracing.

**Evidence**:
- Health check endpoint that verifies downstream dependencies (deep health check)
- CloudWatch alarms on key metrics (latency, errors, saturation)
- Composite alarms for correlated failure detection
- X-Ray or distributed tracing configuration
- Custom metrics for business-level health indicators

---

## REL 7 — How do you design your workload to adapt to changes in demand?

**Look for**: Scaling policy metrics and thresholds, scheduled scaling for known patterns, predictive scaling, load testing evidence.

**Evidence**:
- Scaling policies with appropriate cooldown periods
- Scheduled scaling actions for predictable traffic patterns
- Predictive scaling configurations
- Load test scripts or configuration (Locust, k6, Artillery, etc.)
- Capacity planning documentation or runbooks

---

## REL 8 — How do you implement change?

**Look for**: Deployment strategy configs (canary, blue/green, rolling), health check gating, automated rollback triggers, feature flags.

**Evidence**:
- CodeDeploy or Apollo deployment configurations with canary/linear strategy
- Rollback triggers tied to CloudWatch alarms
- Pre/post-deployment health check validation
- Feature flag infrastructure (LaunchDarkly, AppConfig, custom)
- Database migration scripts with backward compatibility

---

## REL 9 — How do you back up data?

**Look for**: AWS Backup plans, RDS automated backup settings, S3 versioning, DynamoDB PITR, cross-region replication, backup retention policies.

**Evidence**:
- AWS Backup vault and plan definitions with schedules
- RDS backup retention period and PITR enabled
- S3 bucket versioning and lifecycle rules
- DynamoDB point-in-time recovery enabled
- Cross-region backup copy rules for critical data
- EBS snapshot schedules

---

## REL 10 — How do you use fault isolation to protect your workload?

**Look for**: Multi-AZ deployments, cell-based architecture, shuffle sharding, isolation boundaries between tenants or components.

**Evidence**:
- Resources distributed across multiple Availability Zones
- Cell-based or shard-based architecture patterns
- Tenant isolation mechanisms (separate compute, separate queues)
- Blast radius containment (independent stacks per region/cell)
- Shuffle sharding for shared services

---

## REL 11 — How do you design your workload to withstand component failures?

**Look for**: Multi-AZ configurations, failover policies, stateless compute design, health-based routing, redundant components.

**Evidence**:
- RDS Multi-AZ or Aurora cluster with read replicas
- ELB cross-zone load balancing with health checks
- Stateless application design (session state externalized)
- Route 53 health-checked failover records
- ElastiCache with replication and automatic failover

---

## REL 12 — How do you test reliability?

**Look for**: AWS FIS experiment templates, failure injection code, game day runbooks, chaos engineering practices, DR test scripts.

**Evidence**:
- FIS experiment templates (AZ failure, instance termination, network disruption)
- Chaos engineering library usage (chaos-lambda, litmus, etc.)
- Game day or disaster recovery runbooks
- Integration tests that simulate dependency failures
- Regular DR drill schedules or evidence of past drills

---

## REL 13 — How do you plan for disaster recovery (DR)?

**Look for**: Cross-region resources, DR automation (runbooks, Step Functions), backup restore procedures, documented RTO/RPO targets.

**Evidence**:
- Cross-region replication for databases, S3, or secrets
- DR automation (CloudFormation StackSets, Step Functions, SSM runbooks)
- Backup restore validation scripts or procedures
- Documented and tested RTO/RPO targets
- Pilot light or warm standby infrastructure in secondary region
- Route 53 ARC (Application Recovery Controller) or Global Accelerator configs
