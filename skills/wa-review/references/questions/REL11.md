# REL 11 — How do you design your workload to withstand component failures?

**Pillar**: Reliability  
**Best Practices**: 7

---

# REL11-BP01 Monitor all components of the workload to detect failures

Continually monitor the health of your workload so that you and your
automated systems are aware of failures or degradations as soon as
they occur. Monitor for key performance indicators (KPIs) based on
business value.

All recovery and healing mechanisms must start with the ability to
detect problems quickly. Technical failures should be detected first
so that they can be resolved. However, availability is based on the
ability of your workload to deliver business value, so key
performance indicators (KPIs) that measure this need to be a part of
your detection and remediation strategy.

**Desired outcome:** Essential components of a workload are monitored independently to
detect and alert on failures when and where they happen.

**Common anti-patterns:**

- No alarms have been configured, so outages occur without
notification.
- Alarms exist, but at thresholds that don't provide adequate time
to react.
- Metrics are not collected often enough to meet the recovery time
objective (RTO).
- Only the customer facing interfaces of the workload are actively
monitored.
- Only collecting technical metrics, no business function metrics.
- No metrics measuring the user experience of the workload.
- Too many monitors are created.

**Benefits of establishing this best
practice:** Having appropriate monitoring at all layers allows you to reduce
recovery time by reducing time to detection.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Identify all workloads that will be reviewed for monitoring. Once
you have identified all components of the workload that will need
to monitored, you will now need to determine the monitoring
interval. The monitoring interval will have a direct impact on how
fast recovery can be initiated based on the time it takes to
detect a failure. The mean time to detection (MTTD) is the amount
of time between a failure occurring and when repair operations
begin. The list of services should be extensive and complete.

Monitoring must cover all layers of the application stack
including application, platform, infrastructure, and network.

Your monitoring strategy should consider the impact of
*gray failures*. For more detail on gray
failures, see
[Gray failures](https://docs.aws.amazon.com/whitepapers/latest/advanced-multi-az-resilience-patterns/gray-failures.html) in the Advanced Multi-AZ Resilience Patterns whitepaper.

### Implementation steps

- Your monitoring interval is dependent on how quickly you
must recover. Your recovery time is driven by the time it
takes to recover, so you must determine the frequency of
collection by accounting for this time and your recovery
time objective (RTO).
- Configure detailed monitoring for components and managed
services.

Determine if
[detailed
monitoring for EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch-new.html) and
[Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html) is necessary. Detailed monitoring
provides one minute interval metrics, and default
monitoring provides five minute interval metrics.
- Determine if
[enhanced
monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Monitoring.html) for RDS is necessary. Enhanced
monitoring uses an agent on RDS instances to get useful
information about different process or threads.
- Determine the monitoring requirements of critical
serverless components for
[Lambda](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics.html),
[API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/monitoring_automated_manual.html),
[Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/eks-observe.html),
[Amazon ECS](https://catalog.workshops.aws/observability/en-US/aws-managed-oss/amp/ecs),
and all types of
[load
balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-monitoring.html).
- Determine the monitoring requirements of storage
components for
[Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/monitoring-overview.html),
[Amazon FSx](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/monitoring_overview.html),
[Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/monitoring_overview.html),
and
[Amazon EBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html).

- Create
[custom
metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html) to measure business key performance
indicators (KPIs). Workloads implement key business
functions, which should be used as KPIs that help identify
when an indirect problem happens.
- Monitor the user experience for failures using user
canaries.
[Synthetic
transaction testing](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html) (also known as canary testing,
but not to be confused with canary deployments) that can run
and simulate customer behavior is among the most important
testing processes. Run these tests constantly against your
workload endpoints from diverse remote locations.
- Create
[custom
metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html) that track the user's experience. If you can
instrument the experience of the customer, you can determine
when the consumer experience degrades.
- [Set
alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) to detect when any part of your workload is
not working properly and to indicate when to automatically
scale resources. Alarms can be visually displayed on
dashboards, send alerts through Amazon SNS or email, and
work with Auto Scaling to scale workload resources up or
down.
- Create
[dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
to visualize your metrics. Dashboards can be used to
visually see trends, outliers, and other indicators of
potential problems or to provide an indication of problems
you may want to investigate.
- Create
[distributed
tracing monitoring](https://aws.amazon.com/xray/faqs/) for your services. With
distributed monitoring, you can understand how your
application and its underlying services are performing to
identify and troubleshoot the root cause of performance
issues and errors.
- Create monitoring systems (using
[CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_xaxr_dashboard.html)
or
[X-Ray](https://aws.amazon.com/xray/faqs/))
dashboards and data collection in a separate Region and
account.
- Stay informed about service degradations with [AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/). [Create purpose-fit AWS Health event notifications](https://docs.aws.amazon.com/health/latest/ug/user-notifications.html) to e-mail and chat channels through [AWS User Notifications](https://docs.aws.amazon.com/notifications/latest/userguide/what-is-service.html) and integrate programmatically with [your monitoring and alerting tools through Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html).

## Resources

**Related best practices:**

- [Availability
Definition](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [REL11-BP06
Send Notifications when events impact availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_notifications_sent_system.html)

**Related documents:**

- [Amazon CloudWatch Synthetics enables you to create user
canaries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
- [Enable
or Disable Detailed Monitoring for Your Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch-new.html)
- [Enhanced
Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html)
- [Monitoring
Your Auto Scaling Groups and Instances Using Amazon CloudWatch](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html)
- [Publishing
Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
- [Using
Amazon CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Using
CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [Using
Cross Region Cross Account CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_xaxr_dashboard.html)
- [Using
Cross Region Cross Account X-Ray Tracing](https://aws.amazon.com/xray/faqs/)
- [Understanding
availability](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/understanding-availability.html)

**Related videos:**

- [Mitigating
gray failures](https://docs.aws.amazon.com/whitepapers/latest/advanced-multi-az-resilience-patterns/gray-failures.html)

**Related examples:**

- [One
Observability Workshop: Explore X-Ray](https://catalog.workshops.aws/observability/en-US/aws-native/xray/explore-xray)

**Related tools:**

- [CloudWatch](https://aws.amazon.com/cloudwatch/)
- [CloudWatch
X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/security-logging-monitoring.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_monitoring_health.html*

---

# REL11-BP02 Fail over to healthy resources

If a resource failure occurs, healthy resources should continue to
serve requests. For location impairments (such as Availability Zone
or AWS Region), ensure that you have systems in place to fail over
to healthy resources in unimpaired locations.

When designing a service, distribute load across resources,
Availability Zones, or Regions. Therefore, failure of an individual
resource or impairment can be mitigated by shifting traffic to
remaining healthy resources. Consider how services are discovered
and routed to in the event of a failure.

Design your services with fault recovery in mind. At AWS, we design
services to minimize the time to recover from failures and impact on
data. Our services primarily use data stores that acknowledge
requests only after they are durably stored across multiple replicas
within a Region. They are constructed to use cell-based isolation
and use the fault isolation provided by Availability Zones. We use
automation extensively in our operational procedures. We also
optimize our replace-and-restart functionality to recover quickly
from interruptions.

The patterns and designs that allow for the failover vary for each
AWS platform service. Many AWS native managed services are natively
multiple Availability Zone (like Lambda or API Gateway). Other AWS
services (like EC2 and EKS) require specific best practice designs to
support failover of resources or data storage across AZs.

Monitoring should be set up to check that the failover resource is
healthy, track the progress of the resources failing over, and
monitor business process recovery.

**Desired outcome:** Systems are
capable of automatically or manually using new resources to recover
from degradation.

**Common anti-patterns:**

- Planning for failure is not part of the planning and design
phase.
- RTO and RPO are not established.
- Insufficient monitoring to detect failing resources.
- Proper isolation of failure domains.
- Multi-Region fail over is not considered.
- Detection for failure is too sensitive or aggressive when
deciding to failover.
- Not testing or validating failover design.
- Performing auto healing automation, but not notifying that
healing was needed.
- Lack of dampening period to avoid failing back too soon.

**Benefits of establishing this best
practice:** You can build more resilient systems that maintain reliability when
experiencing failures by degrading gracefully and recovering
quickly.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS services, such as [Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-subnets.html) and [Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-groups.html), help distribute load across resources and Availability
Zones. Therefore, failure of an individual resource (such as an
EC2 instance) or impairment of an Availability Zone can be
mitigated by shifting traffic to remaining healthy resources.

For multi-Region workloads, designs are more complicated. For
example, cross-Region read replicas allow you to deploy your data
to multiple AWS Regions. However, failover is still required to
promote the read replica to primary and then point your traffic to
the new endpoint. Amazon Route 53, [Amazon Application Recovery Controller (ARC)](https://aws.amazon.com/application-recovery-controller/), Amazon CloudFront, and
AWS Global Accelerator can help route traffic across AWS Regions.

AWS services, such as Amazon S3, Lambda, API Gateway, Amazon SQS, Amazon SNS,
Amazon SES, Amazon Pinpoint, Amazon ECR, AWS Certificate Manager, EventBridge, or Amazon DynamoDB, are
automatically deployed to multiple Availability Zones by AWS. In
case of failure, these AWS services automatically route traffic to
healthy locations. Data is redundantly stored in multiple
Availability Zones and remains available.

For Amazon RDS, Amazon Aurora, Amazon Redshift, Amazon EKS, or Amazon ECS, Multi-AZ is a
configuration option. AWS can direct traffic to the healthy
instance if failover is initiated. This failover action may be
taken by AWS or as required by the customer

For Amazon EC2 instances, Amazon Redshift, Amazon ECS tasks, or Amazon EKS pods, you choose which Availability Zones to deploy to. For
some designs, Elastic Load Balancing provides the solution to
detect instances in unhealthy zones and route traffic to the
healthy ones. Elastic Load Balancing can also route traffic to
components in your on-premises data center.

For Multi-Region traffic failover, rerouting can leverage Amazon
Route 53, Amazon Application Recovery Controller, AWS Global Accelerator, Route 53 Private DNS for VPCs, or
CloudFront to provide a way to define internet domains and assign
routing policies, including health checks, to route traffic to
healthy Regions. AWS Global Accelerator provides static IP
addresses that act as a fixed entry point to your application,
then route to endpoints in AWS Regions of your choosing, using the
AWS global network instead of the internet for better performance
and reliability.

### Implementation steps

- Create failover designs for all appropriate applications and
services. Isolate each architecture component and create
failover designs meeting RTO and RPO for each component.
- Configure lower environments (like development or test) with all services that are
required to have a failover plan. Deploy the solutions using
infrastructure as code (IaC) to ensure repeatability.
- Configure a recovery site such as a second Region to implement and test the failover
designs. If necessary, resources for testing can be
configured temporarily to limit additional costs.
- Determine which failover plans are automated by AWS, which
can be automated by a DevOps process, and which might be
manual. Document and measure each service's RTO and RPO.
- Create a failover playbook and include all steps to failover
each resource, application, and service.
- Create a failback playbook and include all steps to failback
(with timing) each resource, application, and service
- Create a plan to initiate and rehearse the playbook. Use
simulations and chaos testing to test the playbook steps and
automation.
- For location impairment (such as Availability Zone or AWS Region), ensure you have systems in place to fail over to
healthy resources in unimpaired locations. Check quota,
autoscaling levels, and resources running before failover
testing.

## Resources

**Related Well-Architected best
practices:**

- [REL13-
Plan for DR](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/plan-for-disaster-recovery-dr.html)
- [REL10
- Use fault isolation to protect your workload](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/use-fault-isolation-to-protect-your-workload.html)

**Related documents:**

- [Setting
RTO and RPO Targets](https://aws.amazon.com/blogs/mt/establishing-rpo-and-rto-targets-for-cloud-applications/)
- [Failover
using Route 53 Weighted routing](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-2-multi-region-stack)
- [Disaster Recovery
with Amazon Application Recovery Controller](https://catalog.us-east-1.prod.workshops.aws/workshops/4d9ab448-5083-4db7-bee8-85b58cd53158/en-US/)
- [EC2
with autoscaling](https://github.com/adriaanbd/aws-asg-ecs-starter)
- [EC2
Deployments - Multi-AZ](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [ECS
Deployments - Multi-AZ](https://github.com/aws-samples/ecs-refarch-cloudformation)
- [Switch
traffic using Amazon Application Recovery Controller](https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.failover-different-accounts.html)
- [Lambda
with an Application Load Balancer and Failover](https://docs.aws.amazon.com/lambda/latest/dg/services-alb.html)
- [ACM
Replication and Failover](https://github.com/aws-samples/amazon-ecr-cross-region-replication)
- [Parameter
Store Replication and Failover](https://medium.com/devops-techable/how-to-design-an-ssm-parameter-store-for-multi-region-replication-support-aws-infrastructure-db7388be454d)
- [ECR
cross region replication and Failover](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-settings-configure.html)
- [Secrets
manager cross region replication configuration](https://disaster-recovery.workshop.aws/en/labs/basics/secrets-manager.html)
- [Enable
cross region replication for EFS and Failover](https://aws.amazon.com/blogs/aws/new-replication-for-amazon-elastic-file-system-efs/)
- [EFS
Cross Region Replication and Failover](https://aws.amazon.com/blogs/storage/transferring-file-data-across-aws-regions-and-accounts-using-aws-datasync/)
- [Networking
Failover](https://docs.aws.amazon.com/whitepapers/latest/hybrid-connectivity/aws-dx-dxgw-with-vgw-multi-regions-and-aws-public-peering.html)
- [S3
Endpoint failover using MRAP](https://catalog.workshops.aws/s3multiregionaccesspoints/en-US/0-setup/1-review-mrap)
- [Create
cross region replication for S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication.html)
- [Guidance for Cross Region Failover and Graceful Failback on AWS](https://d1.awsstatic.com/solutions/guidance/architecture-diagrams/cross-region-failover-and-graceful-failback-on-aws.pdf)
- [Failover
using multi-region global accelerator](https://aws.amazon.com/blogs/networking-and-content-delivery/deploying-multi-region-applications-in-aws-using-aws-global-accelerator/)
- [Failover
with DRS](https://docs.aws.amazon.com/drs/latest/userguide/failback-overview.html)

**Related examples:**

- [Disaster
Recovery on AWS](https://disaster-recovery.workshop.aws/en/)
- [Elastic
Disaster Recovery on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/080af3a5-623d-4147-934d-c8d17daba346/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_failover2good.html*

---

# REL11-BP03 Automate healing on all layers

Upon detection of a failure, use automated capabilities to perform
actions to remediate. Degradations may be automatically healed
through internal service mechanisms or require resources to be
restarted or removed through remediation actions.

For self-managed applications and cross-Region healing, recovery
designs and automated healing processes can be pulled from
[existing
best practices](https://aws.amazon.com/blogs/architecture/understand-resiliency-patterns-and-trade-offs-to-architect-efficiently-in-the-cloud/).

The ability to restart or remove a resource is an important tool to
remediate failures. A best practice is to make services stateless
where possible. This prevents loss of data or availability on
resource restart. In the cloud, you can (and generally should)
replace the entire resource (for example, a compute instance or
serverless function) as part of the restart. The restart itself is a
simple and reliable way to recover from failure. Many different
types of failures occur in workloads. Failures can occur in
hardware, software, communications, and operations.

Restarting or retrying also applies to network requests. Apply the
same recovery approach to both a network timeout and a dependency
failure where the dependency returns an error. Both events have a
similar effect on the system, so rather than attempting to make
either event a special case, apply a similar strategy of limited
retry with exponential backoff and jitter. Ability to restart is a
recovery mechanism featured in recovery-oriented computing and high
availability cluster architectures.

**Desired outcome:** Automated actions are performed to remediate detection of a failure.

**Common anti-patterns:**

- Provisioning resources without autoscaling.
- Deploying applications in instances or containers individually.
- Deploying applications that cannot be deployed into multiple
locations without using automatic recovery.
- Manually healing applications that automatic scaling and
automatic recovery fail to heal.
- No automation to failover databases.
- Lack automated methods to reroute traffic to new endpoints.
- No storage replication.

**Benefits of establishing this best
practice:** Automated healing can reduce your mean time to recovery and improve
your availability.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Designs for Amazon EKS or other Kubernetes services should include both
minimum and maximum replica or stateful sets and the minimum
cluster and node group sizing. These mechanisms provide a minimum
amount of continually-available processing resources while
automatically remediating any failures using the Kubernetes
control plane.

Design patterns that are accessed through a load balancer using
compute clusters should leverage Auto Scaling groups. Elastic Load Balancing (ELB) automatically distributes incoming
application traffic across multiple targets and virtual
appliances in one or more Availability Zones (AZs).

Clustered compute-based designs that do not use load balancing
should have their size designed for loss of at least one node.
This will allow for the service to maintain itself running in
potentially reduced capacity while it's recovering a new node.
Example services are Mongo, DynamoDB Accelerator, Amazon Redshift, Amazon EMR,
Cassandra, Kafka, MSK-EC2, Couchbase, ELK, and Amazon OpenSearch Service.
Many of these services can be designed with additional auto
healing features. Some cluster technologies must generate an
alert upon the loss a node triggering an automated or manual
workflow to recreate a new node. This workflow can be automated
using AWS Systems Manager to remediate issues quickly.

Amazon EventBridge can be used to monitor and filter for events
such as CloudWatch alarms or changes in state in other AWS
services. Based on event information, it can then invoke AWS Lambda, Systems Manager Automation, or other targets to run
custom remediation logic on your workload. Amazon EC2 Auto Scaling can be configured to check for EC2 instance health. If
the instance is in any state other than running, or if the
system status is impaired, Amazon EC2 Auto Scaling considers the
instance to be unhealthy and launches a replacement instance.
For large-scale replacements (such as the loss of an entire
Availability Zone), static stability is preferred for high
availability.

### Implementation steps

- Use Auto Scaling groups to deploy tiers in a workload.
[Auto Scaling](https://docs.aws.amazon.com/autoscaling/plans/userguide/how-it-works.html) can perform self-healing on stateless
applications and add or remove capacity.
- For compute instances noted previously, use
[load
balancing](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) and choose the appropriate type of load
balancer.
- Consider healing for Amazon RDS. With standby instances, configure
for
[auto
failover](https://repost.aws/questions/QU4DYhqh2yQGGmjE_x0ylBYg/what-happens-after-failover-in-rds) to the standby instance. For Amazon RDS Read
Replica, automated workflow is required to make a read
replica primary.
- Implement
[automatic
recovery on EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-recover.html) that have applications
deployed that cannot be deployed in multiple locations, and
can tolerate rebooting upon failures. Automatic recovery can
be used to replace failed hardware and restart the instance
when the application is not capable of being deployed in
multiple locations. The instance metadata and associated IP
addresses are kept, as well as the
[EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html) and mount points to
[Amazon Elastic File System](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEFS.html) or
[File
Systems for Lustre](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html) and
[Windows](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html).
Using
[AWS OpsWorks](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autohealing.html), you can configure automatic healing of EC2
instances at the layer level.
- Implement automated recovery using
[AWS Step Functions](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html) and
[AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html) when you cannot use automatic scaling or
automatic recovery, or when automatic recovery fails. When
you cannot use automatic scaling, and either cannot use
automatic recovery or automatic recovery fails, you can
automate the healing using AWS Step Functions and AWS Lambda.
- [Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html) can be used to monitor and filter for
events such as
[CloudWatch
alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) or changes in state in other AWS services.
Based on event information, it can then invoke AWS Lambda
(or other targets) to run custom remediation logic on your
workload.

## Resources

**Related best practices:**

- [Availability
Definition](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [REL11-BP01
Monitor all components of the workload to detect
failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_notifications_sent_system.html)

**Related documents:**

- [How
AWS Auto Scaling Works](https://docs.aws.amazon.com/autoscaling/plans/userguide/how-it-works.html)
- [Amazon EC2 Automatic Recovery](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-recover.html)
- [Amazon Elastic Block Store (Amazon EBS)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)
- [Amazon Elastic File System (Amazon EFS)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEFS.html)
- [What
is Amazon FSx for Lustre?](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)
- [What
is Amazon FSx for Windows File Server?](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html)
- [AWS OpsWorks: Using Auto Healing to Replace Failed
Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autohealing.html)
- [What
is AWS Step Functions?](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [What
is AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [What
Is Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [Using
Amazon CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Amazon RDS
Failover](https://d1.awsstatic.com/rdsImages/IG1_RDS1_AvailabilityDurability_Final.pdf)
- [SSM
- Systems Manager Automation](https://docs.aws.amazon.com/resilience-hub/latest/userguide/integrate-ssm.html)
- [Resilient
Architecture Best Practices](https://aws.amazon.com/blogs/architecture/understand-resiliency-patterns-and-trade-offs-to-architect-efficiently-in-the-cloud/)

**Related videos:**

- [Automatically
Provision and Scale OpenSearch Service](https://www.youtube.com/watch?v=GPQKetORzmE)
- [Amazon RDS
Failover Automatically](https://www.youtube.com/watch?v=Mu7fgHOzOn0)

**Related examples:**

- [Amazon RDS
Failover Workshop](https://catalog.workshops.aws/resilient-apps/en-US/rds-multi-availability-zone/failover-db-instance)

**Related tools:**

- [CloudWatch](https://aws.amazon.com/cloudwatch/)
- [CloudWatch
X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/security-logging-monitoring.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_auto_healing_system.html*

---

# REL11-BP04 Rely on the data plane and not the control plane during recovery

Control planes provide the administrative APIs used to create, read and describe, update, delete, and list (CRUDL) resources, while data planes handle day-to-day service traffic. When implementing recovery or mitigation responses to potentially resiliency-impacting events, focus on using a minimal number of control plane operations to recover, rescale, restore, heal, or failover the service. Data plane action should supersede any activity during these degradation events.

For example, the following are all control plane actions: launching a new compute instance, creating block storage, and describing queue services. When you launch compute instances, the control plane has to perform multiple tasks like finding a physical host with capacity, allocating network interfaces, preparing local block storage volumes, generating credentials, and adding security rules. Control planes tend to be complicated orchestration.

**Desired outcome:** When a resource enters an impaired state, the system is capable of automatically or manually recovering by shifting traffic from impaired to healthy resources.

**Common anti-patterns:**

- Dependence on changing DNS records to re-route traffic.
- Dependence on control-plane scaling operations to replace impaired components due to insufficiently provisioned resources.
- Relying on extensive, multi service, multi-API control plane actions to remediate any category of impairment.

**Benefits of establishing this best practice:** Increased success rate for automated remediation can reduce your mean time to recovery and improve availability of the workload.

**Level of risk exposed if this best practice
is not established:** Medium: For certain types of service degradations, control planes are affected. Dependencies on extensive use of the control plane for remediation may increase recovery time (RTO) and mean time to recovery (MTTR).

## Implementation guidance

To limit data plane actions, assess each service for what actions are required to restore service.

Leverage Amazon Application Recovery Controller to shift the DNS traffic. These features continually monitor your application’s ability to recover from failures and allow you to control your application recovery across multiple AWS Regions, Availability Zones, and on premises.

Route 53 routing policies use the control plane, so do not rely on it for recovery. The Route 53 data planes answer DNS queries and perform and evaluate health checks. They are globally distributed and designed for a [100% availability service level agreement (SLA)](https://aws.amazon.com/route53/sla/).

The Route 53 management APIs and consoles where you create, update, and delete Route 53 resources run on control planes that are designed to prioritize the strong consistency and durability that you need when managing DNS. To achieve this, the control planes are located in a single Region: US East (N. Virginia). While both systems are built to be very reliable, the control planes are not included in the SLA. There could be rare events in which the data plane’s resilient design allows it to maintain availability while the control planes do not. For disaster recovery and failover mechanisms, use data plane functions to provide the best possible reliability.

Design your compute infrastructure to be statically stable to avoid using the control plane during an incident. For example, if you are using Amazon EC2 instances, avoid provisioning new instances manually or instructing Auto Scaling Groups to add instances in response. For the highest levels of resilience, provision sufficient capacity in the cluster used for failover. If this capacity threshold must be limited, set throttles on the overall end-to-end system to safely limit the total traffic reaching the limited set of resources.

For services like Amazon DynamoDB, Amazon API Gateway, load balancers, and AWS Lambda serverless, using those services leverages the data plane. However, creating new functions, load balancers, API gateways, or DynamoDB tables is a control plane action and should be completed before the degradation as preparation for an event and rehearsal of failover actions. For Amazon RDS, data plane actions allow for access to data.

For more information about data planes, control planes, and how AWS builds services to meet high availability targets, see [Static stability using Availability Zones](https://aws.amazon.com/builders-library/static-stability-using-availability-zones/).

Understand which operations are on the data plane and which are on the control plane.

### Implementation steps

For each workload that needs to be restored after a degradation event, evaluate the failover runbook, high availability design, auto healing design, or HA resource restoration plan. Identity each action that might be considered a control plane action.

Consider changing the control action to a data plane action:

- Auto Scaling (control plane) to pre-scaled Amazon EC2 resources (data plane)
- Amazon EC2 instance scaling (control plane) to AWS Lambda scaling (data plane)
- Assess any designs using Kubernetes and the nature of the control plane actions. Adding pods is a data plane action in Kubernetes. Actions should be limited to adding pods and not adding nodes. Using [over-provisioned nodes](https://www.eksworkshop.com/docs/autoscaling/compute/cluster-autoscaler/overprovisioning/) is the preferred method to limit control plane actions

Consider alternate approaches that allow for data plane actions to affect the same remediation.

- Route 53 Record change (control plane) or Amazon Application Recovery Controller (data plane)
- [Route 53 Health checks for more automated updates](https://aws.amazon.com/blogs/networking-and-content-delivery/creating-disaster-recovery-mechanisms-using-amazon-route-53/)

Consider some services in a secondary Region, if the service is mission critical, to allow for more control plane and data plane actions in an unaffected Region.

- Amazon EC2 Auto Scaling or Amazon EKS in a primary Region compared to Amazon EC2 Auto Scaling or Amazon EKS in a secondary Region and routing traffic to secondary Region (control plane action)
- Make read replica in secondary primary or attempting same action in primary Region (control plane action)

## Resources

**Related best practices:**

- [Availability
Definition](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [REL11-BP01
Monitor all components of the workload to detect
failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_notifications_sent_system.html)

**Related documents:**

- [APN
Partner: partners that can help with automation of your fault
tolerance](https://aws.amazon.com/partners/find/results/?keyword=automation)
- [AWS Marketplace: products that can be used for fault
tolerance](https://aws.amazon.com/marketplace/search/results?searchTerms=fault+tolerance)
- [Amazon
Builders' Library: Avoiding overload in distributed systems by
putting the smaller service in control](https://aws.amazon.com/builders-library/avoiding-overload-in-distributed-systems-by-putting-the-smaller-service-in-control/)
- [Amazon DynamoDB API (control plane and data plane)](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.API.html)
- [AWS Lambda Executions](https://docs.aws.amazon.com/whitepapers/latest/security-overview-aws-lambda/lambda-executions.html) (split into the control plane and the data plane)
- [AWS Elemental MediaStore Data Plane](https://docs.aws.amazon.com/mediastore/latest/apireference/API_Operations_AWS_Elemental_MediaStore_Data_Plane.html)
- [Building
highly resilient applications using Amazon Application Recovery Controller, Part 1: Single-Region stack](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-1-single-region-stack/)
- [Building
highly resilient applications using Amazon Application Recovery Controller, Part 2: Multi-Region
stack](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-2-multi-region-stack/)
- [Creating
Disaster Recovery Mechanisms Using Amazon Route 53](https://aws.amazon.com/blogs/networking-and-content-delivery/creating-disaster-recovery-mechanisms-using-amazon-route-53/)
- [What
is Amazon Application Recovery Controller](https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html)
- [Kubernetes Control Plane and data plane](https://aws.amazon.com/blogs/containers/managing-kubernetes-control-plane-events-in-amazon-eks/)

**Related videos:**

- [Back to Basics - Using Static Stability](https://www.youtube.com/watch?v=gy1RITZ7N7s)
- [Building resilient multi-site workloads using AWS global services](https://www.youtube.com/watch?v=62ZQHTruBnk)

**Related examples:**

- [Introducing
Amazon Application Recovery Controller](https://aws.amazon.com/blogs/aws/amazon-route-53-application-recovery-controller/)
- [Amazon Builders' Library: Avoiding overload in distributed systems by putting the smaller service in control](https://aws.amazon.com/builders-library/avoiding-overload-in-distributed-systems-by-putting-the-smaller-service-in-control/)
- [Building highly resilient applications using Amazon Application Recovery Controller, Part 1: Single-Region stack](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-1-single-region-stack/)
- [Building highly resilient applications using Amazon Application Recovery Controller, Part 2: Multi-Region stack](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-2-multi-region-stack/)
- [Static stability using Availability Zones](https://aws.amazon.com/builders-library/static-stability-using-availability-zones/)

**Related tools:**

- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [AWS X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/security-logging-monitoring.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_avoid_control_plane.html*

---

# REL11-BP05 Use static stability to prevent bimodal behavior

Workloads should be statically stable and only operate in a single
normal mode. Bimodal behavior is when your workload exhibits
different behavior under normal and failure modes.

For example, you might try and recover from an Availability Zone
failure by launching new instances in a different Availability Zone.
This can result in a bimodal response during a failure mode. You
should instead build workloads that are statically stable and
operate within only one mode. In this example, those instances
should have been provisioned in the second Availability Zone before
the failure. This static stability design verifies that the workload
only operates in a single mode.

**Desired outcome:** Workloads do not exhibit bimodal behavior during normal and failure
modes.

**Common anti-patterns:**

- Assuming resources can always be provisioned regardless of the
failure scope.
- Trying to dynamically acquire resources during a failure.
- Not provisioning adequate resources across zones or Regions until a
failure occurs.
- Considering static stable designs for compute resources only.

**Benefits of establishing this best
practice:** Workloads running with statically stable designs are capable of
having predictable outcomes during normal and failure events.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Bimodal behavior occurs when your workload exhibits different
behavior under normal and failure modes (for example, relying on
launching new instances if an Availability Zone fails). An example
of bimodal behavior is when stable Amazon EC2 designs provision enough
instances in each Availability Zone to handle the workload load if
one AZ were removed. Elastic Load Balancing or Amazon Route 53
health would check to shift a load away from the impaired
instances. After traffic has shifted, use AWS Auto Scaling to
asynchronously replace instances from the failed zone and launch
them in the healthy zones. Static stability for compute deployment
(such as EC2 instances or containers) results in the highest
reliability.

*Static stability of EC2 instances across
Availability Zones*

This must be weighed against the cost for this model and the
business value of maintaining the workload under all resilience
cases. It's less expensive to provision less compute capacity and
rely on launching new instances in the case of a failure, but for
large-scale failures (such as an Availability Zone or Regional
impairment), this approach is less effective because it relies on
both an operational plane, and sufficient resources being
available in the unaffected zones or Regions.

Your solution should also weigh reliability against the costs
needs for your workload. Static stability architectures apply to a
variety of architectures including compute instances spread across
Availability Zones, database read replica designs, Kubernetes
(Amazon EKS) cluster designs, and multi-Region failover architectures.

It is also possible to implement a more statically stable design
by using more resources in each zone. By adding more zones, you
reduce the amount of additional compute you need for static
stability.

An example of bimodal behavior would be a network timeout that
could cause a system to attempt to refresh the configuration state
of the entire system. This would add an unexpected load to another
component and might cause it to fail, resulting in other
unexpected consequences. This negative feedback loop impacts the
availability of your workload. Instead, you can build systems that
are statically stable and operate in only one mode. A statically
stable design would do constant work and always refresh the
configuration state on a fixed cadence. When a call fails, the
workload would use the previously cached value and initiate an
alarm.

Another example of bimodal behavior is allowing clients to bypass
your workload cache when failures occur. This might seem to be a
solution that accommodates client needs but it can significantly
change the demands on your workload and is likely to result in
failures.

Assess critical workloads to determine what workloads require
this type of resilience design. For those that are deemed
critical, each application component must be reviewed. Example
types of services that require static stability evaluations are:

- **Compute**: Amazon EC2, EKS-EC2,
ECS-EC2, EMR-EC2
- **Databases**: Amazon Redshift, Amazon RDS,
Amazon Aurora
- **Storage**: Amazon S3 (Single Zone),
Amazon EFS (mounts), Amazon FSx (mounts)
- **Load balancers:** Under certain
designs

### Implementation steps

- Build systems that are statically stable and operate in
only one mode. In this case, provision enough instances in
each Availability Zone or Region to handle the workload
capacity if one Availability Zone or Region were removed.
A variety of services can be used for routing to healthy
resources, such as:

[Cross
Region DNS Routing](https://docs.aws.amazon.com/whitepapers/latest/real-time-communication-on-aws/cross-region-dns-based-load-balancing-and-failover.html)
- [MRAP
Amazon S3 MultiRegion Routing](https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRequestRouting.html)
- [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/)
- [Amazon Application Recovery Controller](https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html)

- Configure
[database
read replicas](https://aws.amazon.com/rds/features/multi-az/) to account for the loss of a single
primary instance or a read replica. If traffic is being
served by read replicas, the quantity in each Availability
Zone and each Region should equate to the overall need in
case of the zone or Region failure.
- Configure critical data in Amazon S3 storage that is designed to
be statically stable for data stored in case of an
Availability Zone failure. If
[Amazon S3
One Zone-IA](https://aws.amazon.com/about-aws/whats-new/2018/04/announcing-s3-one-zone-infrequent-access-a-new-amazon-s3-storage-class/) storage class is used, this should not
be considered statically stable, as the loss of that zone
minimizes access to this stored data.
- [Load
balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/disable-cross-zone.html) are sometimes configured incorrectly or
by design to service a specific Availability Zone. In this
case, the statically stable design might be to spread a
workload across multiple AZs in a more complex design. The
original design may be used to reduce interzone traffic
for security, latency, or cost reasons.

## Resources

**Related Well-Architected best
practices:**

- [Availability
Definition](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [REL11-BP01
Monitor all components of the workload to detect
failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_notifications_sent_system.html)
- [REL11-BP04
Rely on the data plane and not the control plane during
recovery](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_avoid_control_plane.html)

**Related documents:**

- [Minimizing
Dependencies in a Disaster Recovery Plan](https://aws.amazon.com/blogs/architecture/minimizing-dependencies-in-a-disaster-recovery-plan/)
- [The
Amazon Builders' Library: Static stability using Availability
Zones](https://aws.amazon.com/builders-library/static-stability-using-availability-zones)
- [Fault
Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/appendix-a---partitional-service-guidance.html)
- [Static
stability using Availability Zones](https://aws.amazon.com/builders-library/static-stability-using-availability-zones)
- [Multi-Zone RDS](https://aws.amazon.com/rds/features/multi-az/)
- [Minimizing
Dependencies in a Disaster Recovery Plan](https://aws.amazon.com/blogs/architecture/minimizing-dependencies-in-a-disaster-recovery-plan/)
- [Cross
Region DNS Routing](https://docs.aws.amazon.com/whitepapers/latest/real-time-communication-on-aws/cross-region-dns-based-load-balancing-and-failover.html)
- [MRAP
Amazon S3 MultiRegion Routing](https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRequestRouting.html)
- [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/)
- [Amazon Application Recovery Controller](https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html)
- [Single
Zone Amazon S3](https://aws.amazon.com/about-aws/whats-new/2018/04/announcing-s3-one-zone-infrequent-access-a-new-amazon-s3-storage-class/)
- [Cross
Zone Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/disable-cross-zone.html)

**Related videos:**

- [Static
stability in AWS: AWS re:Invent 2019: Introducing The Amazon
Builders' Library (DOP328)](https://youtu.be/sKRdemSirDM?t=704)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_static_stability.html*

---

# REL11-BP06 Send notifications when events impact availability

Notifications are sent upon the detection of thresholds breached,
even if the event causing the issue was automatically resolved.

Automated healing allows your workload to be reliable. However, it
can also obscure underlying problems that need to be addressed.
Implement appropriate monitoring and events so that you can detect
patterns of problems, including those addressed by auto healing, so
that you can resolve root cause issues.

Resilient systems are designed so that degradation events are
immediately communicated to the appropriate teams. These
notifications should be sent through one or many communication
channels.

**Desired outcome:**Alerts are
immediately sent to operations teams when thresholds are breached,
such as error rates, latency, or other critical key performance
indicator (KPI) metrics, so that these issues are resolved as soon as
possible and user impact is avoided or minimized.

**Common anti-patterns:**

- Sending too many alarms.
- Sending alarms that are not actionable.
- Setting alarm thresholds too high (over sensitive) or too low
(under sensitive).
- Not sending alarms for external dependencies.
- Not considering
[gray
failures](https://docs.aws.amazon.com/whitepapers/latest/advanced-multi-az-resilience-patterns/gray-failures.html) when designing monitoring and alarms.
- Performing healing automation, but not notifying the appropriate
team that healing was needed.

**Benefits of establishing this best
practice:** Notifications of recovery make operational and
business teams aware of service degradations so that they can react
immediately to minimize both mean time to detect (MTTD) and mean
time to repair (MTTR). Notifications of recovery events also assure
that you don't ignore problems that occur infrequently.

**Level of risk exposed if this best practice
is not established:** Medium. Failure to implement
appropriate monitoring and events notification mechanisms can result
in failure to detect patterns of problems, including those addressed
by auto healing. A team will only be made aware of system
degradation when users contact customer service or by chance.

## Implementation guidance

When defining a monitoring strategy, a triggered alarm is a common
event. This event would likely contain an identifier for the
alarm, the alarm state (such as `IN ALARM` or `OK`), and details of
what triggered it. In many cases, an alarm event should be
detected and an email notification sent. This is an example of an
action on an alarm. Alarm notification is critical in
observability, as it informs the right people that there is an
issue. However, when action on events mature in your observability
solution, it can automatically remediate the issue without the
need for human intervention.

Once KPI-monitoring alarms have been established, alerts should be
sent to appropriate teams when thresholds are exceeded. Those
alerts may also be used to trigger automated processes that will
attempt to remediate the degradation.

For more complex threshold monitoring, composite alarms should be
considered. Composite alarms use a number of KPI-monitoring alarms
to create an alert based on operational business logic. CloudWatch
Alarms can be configured to send emails, or to log incidents in
third-party incident tracking systems using Amazon SNS integration
or Amazon EventBridge.

### Implementation steps

Create various types of alarms based on how the workloads are
monitored, such as:

- Application alarms are used to detect when
any part of your workload is not working properly.
- [Infrastructure
alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) indicate when to scale resources. Alarms
can be visually displayed on dashboards, send alerts
through Amazon SNS or email, and work with Auto Scaling to
scale workload resources in or out.
- Simple
[static
alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ConsoleAlarms.html) can be created to monitor when a
metric breaches a static threshold for a specified number
of evaluation periods.
- [Composite
alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html) can account for complex alarms from multiple sources.
- Once the alarm has been created,
create appropriate notification events. You can directly
invoke an
[Amazon SNS
API](https://docs.aws.amazon.com/sns/latest/dg/welcome.html) to send notifications and link any automation
for remediation or communication.
- Stay informed about service degradations with [AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/). [Create purpose-fit AWS Health event notifications](https://docs.aws.amazon.com/health/latest/ug/user-notifications.html) to e-mail and chat channels through [AWS User Notifications](https://docs.aws.amazon.com/notifications/latest/userguide/what-is-service.html) and integrate programmatically with [your monitoring and alerting tools through Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html).

## Resources

**Related Well-Architected best
practices:**

- [Availability
Definition](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)

**Related documents:**

- [Creating
a CloudWatch Alarm Based on a Static Threshold](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ConsoleAlarms.html)
- [What
Is Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [What
is Amazon Simple Notification Service?](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)
- [Publishing
Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
- [Using
Amazon CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Setup
CloudWatch Composite alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html)
- [What's
new in AWS Observability at re:Invent 2022](https://aws.amazon.com/blogs/mt/whats-new-in-aws-observability-at-reinvent-2022/)

**Related tools:**

- [CloudWatch](https://aws.amazon.com/cloudwatch/)
- [CloudWatch
X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/security-logging-monitoring.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_notifications_sent_system.html*

---

# REL11-BP07 Architect your product to meet availability targets and uptime service level agreements (SLAs)

Architect your product to meet availability targets and uptime service level agreements (SLAs). If you publish or privately agree to availability targets or uptime SLAs, verify that your architecture and operational processes are designed to support them.

**Desired outcome:** Each application has a defined target for availability and SLA for performance metrics, which can be monitored and maintained in order to meet business outcomes.

**Common anti-patterns:**

- Designing and deploying workload’s without setting any SLAs.
- SLA metrics are set too high without rationale or business requirements.
- Setting SLAs without taking into account for dependencies and their underlying SLA.
- Application designs are created without considering the Shared Responsibility Model for Resilience.

**Benefits of establishing this best practice:** Designing applications based on key resiliency targets helps you meet business objectives and customer expectations. These objectives help drive the application design process that evaluates different technologies and considers various tradeoffs.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Application designs have to account for a diverse set of requirements that are derived from business, operational, and financial objectives. Within the operational requirements, workloads need to have specific resilience metric targets so they can be properly monitored and supported. Resilience metrics should not be set or derived after deploying the workload. They should be defined during the design phase and help guide various decisions and tradeoffs.

- Every workload should have its own set of resilience metrics. Those metrics may be different from other business applications.
- Reducing dependencies can have a positive impact on availability. Each workload should consider its dependencies and their SLAs. In general, select dependencies with availability goals equal to or greater than the goals of your workload.
- Consider loosely coupled designs so your workload can operate correctly despite dependency impairment, where possible.
- Reduce control plane dependencies, especially during recovery or a degradation. Evaluate designs that are statically stable for mission critical workloads. Use resource sparing to increase the availability of those dependencies in a workload.
- Observability and instrumentation are critical for achieving SLAs by reducing Mean Time to Detection (MTTD) and Mean Time to Repair (MTTR).
- Less frequent failure (longer MTBF), shorter failure detection times (shorter MTTD), and shorter repair times (shorter MTTR) are the three factors that are used to improve availability in distributed systems.
- Establishing and meeting resilience metrics for a workload is foundational to any effective design. Those designs must factor in tradeoffs of design complexity, service dependencies, performance, scaling, and costs.

**Implementation steps**

- Review and document the workload design considering the following questions:

Where are control planes used in the workload?
- How does the workload implement fault tolerance?
- What are the design patterns for scaling, automatic scaling, redundancy, and highly available components?
- What are the requirements for data consistency and availability?
- Are there considerations for resource sparing or resource static stability?
- What are the service dependencies?

- Define SLA metrics based on the workload architecture while working with stakeholders. Consider the SLAs of all dependencies used by the workload.
- Once the SLA target has been set, optimize the architecture to meet the SLA.
- Once the design is set that will meet the SLA, implement operational changes, process automation, and runbooks that also will have focus on reducing MTTD and MTTR.
- Once deployed, monitor and report on the SLA.

## Resources

**Related best practices:**

- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)
- [REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html)
- [Understanding workload health](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/understanding-workload-health.html)

**Related documents:**

- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [Reliability pillar - Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [Measuring availability](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/measuring-availability.html)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Shared Responsibility Model for Resiliency](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/shared-responsibility-model-for-resiliency.html)
- [Static stability using Availability Zones](https://aws.amazon.com/builders-library/static-stability-using-availability-zones/)
- [AWS Service Level Agreements (SLAs)](https://aws.amazon.com/legal/service-level-agreements/)
- [Guidance for Cell-based Architecture on AWS](https://aws.amazon.com/solutions/guidance/cell-based-architecture-on-aws/)
- [AWS infrastructure](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/aws-infrastructure.html)
- [Advanced Multi-AZ Resilience Patterns whitepaper](https://docs.aws.amazon.com/whitepapers/latest/advanced-multi-az-resilience-patterns/advanced-multi-az-resilience-patterns.html)

**Related services:**

- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_service_level_agreements.html*

---
