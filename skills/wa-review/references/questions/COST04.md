# COST 4 — How do you decommission resources?

**Pillar**: Cost Optimization  
**Best Practices**: 5

---

# COST04-BP01 Track resources over their lifetime

Define and implement a method to track resources and their
associations with systems over their lifetime. You can use tagging
to identify the workload or function of the resource.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Decommission workload resources that are no longer required. A common example is resources
used for testing: after testing has been completed, the resources can be removed. Tracking
resources with tags (and running reports on those tags) can help you identify assets for
decommission, as they will not be in use or the license on them will expire. Using tags is an effective way to track resources, by labeling the resource with
its function, or a known date when it can be decommissioned. Reporting can then be run on
these tags. Example values for feature tagging are `feature-X testing` to identify the purpose
of the resource in terms of the workload lifecycle. Another example is using `LifeSpan` or `TTL` for the resources,
such as to-be-deleted tag key name and value to define the time period or specific time for decommissioning.

**Implementation steps**

- **Implement a tagging scheme:**Implement a tagging
scheme that identifies the workload the resource belongs to, verifying that all resources
within the workload are tagged accordingly. Tagging helps you categorize resources by purpose,
team, environment, or other criteria relevant to your business. For more detail on tagging
uses cases, strategies, and techniques, see [AWS Tagging Best Practices](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html).
- **Implement workload throughput or output monitoring:**Implement workload throughput monitoring or alarming, initiating on either
input requests or output completions. Configure it to provide notifications when workload
requests or outputs drop to zero, indicating the workload resources are no longer used.
Incorporate a time factor if the workload periodically drops to zero under normal
conditions. For more detail on unused or underutilized resources, see
[AWS Trusted Advisor Cost Optimization checks](https://docs.aws.amazon.com/awssupport/latest/user/cost-optimization-checks.html).
- **Group AWS resources:** Create groups for AWS resources.
You can use [AWS Resource Groups](https://docs.aws.amazon.com/ARG/latest/userguide/resource-groups.html) to organize and manage your AWS resources that are in the
same AWS Region. You can add tags to most of your resources to help identify and sort your
resources within your organization. Use [Tag Editor](https://docs.aws.amazon.com/ARG/latest/userguide/tag-editor.html) add tags to supported resources in bulk.
Consider using [AWS Service Catalog](https://docs.aws.amazon.com/servicecatalog/index.html) to create, manage, and distribute portfolios of approved
products to end users and manage the product lifecycle.

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [AWS Trusted Advisor Cost Optimization Checks](https://docs.aws.amazon.com/awssupport/latest/user/cost-optimization-checks.html)
- [Tagging AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [Publishing
Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)

**Related videos:**

- [How to optimize costs using AWS Trusted Advisor](https://youtu.be/zcQPufNFhgg)

**Related examples:**

- [Organize AWS resources](https://aws.amazon.com/premiumsupport/knowledge-center/resource-groups/)
- [Optimize cost using AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/knowledge-center/trusted-advisor-cost-optimization/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_track.html*

---

# COST04-BP02 Implement a decommissioning process

Implement a process to identify and decommission unused resources.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implement a standardized process across your organization to identify and remove unused
resources. The process should define the frequency searches are performed and the
processes to remove the resource to verify that all organization requirements are met.

**Implementation steps**

- **Create and implement a decommissioning process:** Work with the workload
developers and owners to build a decommissioning process for the workload and its resources. The process
should cover the method to verify if the workload is in use, and also if each of the workload resources
are in use. Detail the steps necessary to decommission the resource, removing them from service while
ensuring compliance with any regulatory requirements. Any associated resources should be included, such
as licenses or attached storage. Notify the workload owners that the decommissioning process has been
started.

Use the following decommission steps to guide you on what should be checked as part of your process:

**Identify resources to be decommissioned:** Identify resources that are eligible
for decommissioning in your AWS Cloud. Record all necessary information and schedule the decommission. In your
timeline, be sure to account for if (and when) unexpected issues arise during the process.
- **Coordinate and communicate:** Work with workload owners to confirm the resource to be decommissioned
- **Record metadata and create backups:** Record metadata (such as public IPs, Region,
AZ, VPC, Subnet, and Security Groups) and create backups (such as Amazon Elastic Block Store snapshots or taking AMI, keys export, and
Certificate export) if it is required for the resources in the production environment or if they are critical resources.
- **Validate infrastructure-as-code:** Determine whether resources were deployed
with CloudFormation, Terraform, AWS Cloud Development Kit (AWS CDK), or any other infrastructure-as-code deployment tool so they can be re-deployed if necessary.
- **Prevent access:** Apply restrictive controls for a period of time, to prevent
the use of resources while you determine if the resource is required. Verify that the resource environment
can be reverted to its original state if required.
- **Follow your internal decommissioning process:** Follow the administrative tasks and
decommissioning process of your organization, like removing the resource from your organization domain, removing the
DNS record, and removing the resource from your configuration management tool, monitoring tool, automation tool and
security tools.

If the resource is an Amazon EC2 instance, consult the following list.
[For more detail, see How do I delete or terminate my Amazon EC2 resources?](https://aws.amazon.com/premiumsupport/knowledge-center/delete-terminate-ec2/)

- Stop or terminate all your Amazon EC2 instances and load balancers.
Amazon EC2 instances are visible in the console for a short time after
they're terminated. You aren't billed for any instances that aren't
in the running state
- Delete your Auto Scaling infrastructure.
- Release all Dedicated Hosts.
- Delete all Amazon EBS volumes and Amazon EBS snapshots.
- Release all Elastic IP addresses.
- Deregister all Amazon Machine Images (AMIs).
- Terminate all AWS Elastic Beanstalk environments.

If the resource is an object in Amazon Glacier storage and if you delete an archive before meeting the minimum
storage duration, you will be charged a prorated early deletion fee. Amazon Glacier minimum storage duration
depends on the storage class used. For a summary of minimum storage duration for each storage class, see
[Performance
across the Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/?nc=sn&loc=3#Performance_across_the_S3_Storage_Classes). For detail on how early deletion fees are calculated, see [Amazon S3 pricing](https://aws.amazon.com/s3/pricing/).

The following simple decommissioning process flowchart outlines the decommissioning steps.
Before decommissioning resources, verify that resources you have identified for decommissioning
are not being used by the organization.

*Resource decommissioning flow.*

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)

**Related videos:**

- [Delete CloudFormation stack but retain some resources](https://www.youtube.com/watch?v=bVmsS8rjuwk)
- [Find out which user launched Amazon EC2 instance](https://www.youtube.com/watch?v=SlyAHc5Mv2A)

**Related examples:**

- [Delete or terminate Amazon EC2 resources](https://aws.amazon.com/premiumsupport/knowledge-center/delete-terminate-ec2/)
- [Find out which user launched an Amazon EC2 instance](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-user-launched-instance/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_implement_process.html*

---

# COST04-BP03 Decommission resources

Decommission resources initiated by events such as periodic audits,
or changes in usage. Decommissioning is typically performed
periodically and can be manual or automated.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The frequency and effort to search for unused resources should reflect the potential savings,
so an account with a small cost should be analyzed less frequently than an account with
larger costs. Searches and decommission events can be initiated by state changes in the
workload, such as a product going end of life or being replaced. Searches and decommission
events may also be initiated by external events, such as changes in market conditions or
product termination.

**Implementation steps**

- **Decommission resources:**This is the depreciation stage of
AWS resources that are no longer needed or ending of a licensing agreement. Complete all
final checks completed before moving to the disposal stage and decommissioning resources
to prevent any unwanted disruptions like taking snapshots or backups. Using the
decommissioning process, decommission each of the resources that have been identified
as unused.

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_decommission.html*

---

# COST04-BP04 Decommission resources automatically

Design your workload to gracefully handle resource termination as
you identify and decommission non-critical resources, resources that
are not required, or resources with low utilization.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Use automation to reduce or remove the associated costs of the decommissioning process.
Designing your workload to perform automated decommissioning will reduce the overall workload
costs during its lifetime. You can use [Amazon EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/) or [Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide) to perform the decommissioning process. You can also implement custom code
using the [API or SDK](https://aws.amazon.com/developer/tools/) to decommission
workload resources automatically.

[Modern applications](https://aws.amazon.com/modern-apps/) are built serverless-first, a strategy that prioritizes the adoption of
serverless services. AWS developed [serverless services](https://aws.amazon.com/serverless/) for all three layers of your stack:
compute, integration, and data stores. Using serverless architecture will allow you to save
costs during low-traffic periods with scaling up and down automatically.

**Implementation steps**

- **Implement Amazon EC2 Auto Scaling or Application Auto Scaling:** For resources that
are supported, configure them with Amazon EC2 Auto Scaling or Application Auto Scaling. These services can help you
optimize your utilization and cost efficiencies when consuming AWS services. When demand
drops, these services will automatically remove any excess resource capacity so you avoid
overspending.
- **Configure CloudWatch to terminate instances:** Instances can
be configured to terminate using [CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html#AddingTerminateActions). Using the metrics from the decommissioning
process, implement an alarm with an Amazon Elastic Compute Cloud action. Verify the operation in a
non-production environment before rolling out.
- **Implement code within the workload:** You can use the AWS
SDK or AWS CLI to decommission workload resources. Implement code within the application
that integrates with AWS and terminates or removes resources that are no longer used.
- **Use serverless services:** Prioritize building [serverless
architectures](https://aws.amazon.com/serverless/) and [event-driven architecture](https://aws.amazon.com/event-driven-architecture/) on AWS to build and run your applications.
AWS offers multiple serverless technology services that inherently provide automatically
optimized resource utilization and automated decommissioning (scale in and scale out).
With serverless applications, resource utilization is automatically optimized and you
never pay for over-provisioning.

## Resources

**Related documents:**

- [Amazon EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/)
- [Getting Started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html)
- [Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [Serverless on AWS](https://aws.amazon.com/serverless/)
- [Create
Alarms to Stop, Terminate, Reboot, or Recover an
Instance](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html)
- [Adding terminate actions to Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html#AddingTerminateActions)

**Related examples:**

- [Scheduling automatic deletion of AWS CloudFormation stacks](https://aws.amazon.com/blogs/infrastructure-and-automation/scheduling-automatic-deletion-of-aws-cloudformation-stacks/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_decomm_automated.html*

---

# COST04-BP05 Enforce data retention policies

Define data retention policies on supported resources to handle object deletion
per your organizations’ requirements. Identify and delete unnecessary or orphaned
resources and objects that are no longer required.

**Level of risk exposed if this best practice
is not established:** Medium

Use data retention policies and lifecycle policies to reduce the associated costs of the
decommissioning process and storage costs for the identified resources. Defining your data
retention policies and lifecycle policies to perform automated storage class migration and
deletion will reduce the overall storage costs during its lifetime. You can use Amazon Data Lifecycle Manager
to automate the creation and deletion of Amazon Elastic Block Store snapshots and Amazon EBS-backed Amazon Machine Images (AMIs), and use
Amazon S3 Intelligent-Tiering or an Amazon S3 lifecycle configuration to manage the lifecycle of your Amazon S3 objects.
You can also implement custom code using the [API or SDK](https://aws.amazon.com/tools/) to
create lifecycle policies and policy rules for objects to be deleted automatically.

**Implementation steps**

- **Use Amazon Data Lifecycle Manager:** Use lifecycle policies on Amazon Data Lifecycle Manager to automate deletion of Amazon EBS snapshots and Amazon EBS-backed AMIs.
- **Set up lifecycle configuration on a bucket:** Use Amazon S3 lifecycle configuration on a bucket to define actions for
Amazon S3 to take during an object's lifecycle, as well as deletion at the end of the object's lifecycle, based on your business requirements.

## Resources

**Related documents:**

- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [Amazon Data Lifecycle Manager](https://docs.aws.amazon.com/dlm/?icmpid=docs_homepage_mgmtgov)
- [How to set lifecycle configuration on Amazon S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/how-to-set-lifecycle-configuration-intro.html)

**Related videos:**

- [Automate Amazon EBS Snapshots with Amazon Data Lifecycle Manager](https://www.youtube.com/watch?v=RJpEjnVSdi4)
- [Empty an Amazon S3 bucket using a lifecycle configuration rule](https://www.youtube.com/watch?v=JfK9vamen9I)

**Related examples:**

- [Empty an Amazon S3 bucket using a lifecycle configuration rule](https://aws.amazon.com/premiumsupport/knowledge-center/s3-empty-bucket-lifecycle-rule/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_data_retention.html*

---
