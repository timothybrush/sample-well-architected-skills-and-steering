# REL 13 — How do you plan for disaster recovery (DR)?

**Pillar**: Reliability  
**Best Practices**: 5

---

# REL13-BP01 Define recovery objectives for downtime and data loss

Failures can impact your business in several ways. First, failures
can cause service interruption (downtime). Second, failures can
cause data to become lost, inconsistent, or stale. In order to guide
how you respond and recover from failures, define a Recovery Time
Objective (RTO) and Recovery Point Objective (RPO) for each
workload. *Recovery Time Objective (RTO)* is the
maximum acceptable delay between the interruption of service and
restoration of service. *Recovery Point Objective
(RPO)*  is the maximum acceptable time after the last data
recovery point.

**Desired outcome:** Every workload has a designated RTO and RPO based on technical
considerations and business impact.

**Common anti-patterns:**

- You haven't designated recovery objectives.
- You select arbitrary recovery objectives.
- You select recovery objectives that are too lenient and do not
meet business objectives.
- You have not evaluated the impact of downtime and data loss.
- You select unrealistic recovery objectives, such as zero time to
recover or zero data loss, which may not be achievable for your
workload configuration.
- You select recovery objectives that are more stringent than
actual business objectives. This forces recovery implementations
that are costlier and more complicated than what the workload
needs.
- You select recovery objectives that are incompatible with those
of a dependent workload.
- You fail to consider regulatory and compliance requirements.

**Benefits of establishing this best
practice:** When you set RTOs and RPOs for your workloads,
you establish clear and measurable goals for recovery based on your
business needs. Once you've set those goals, you can create disaster
recovery (DR) plans that are tailored to meet them.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Construct a matrix or worksheet to help guide your disaster
recovery planning. In your matrix, create different workload
categories or tiers based on their business impact (such as
critical, high, medium, and low) and the associated RTOs and RPOs
to target for each one. The following matrix provides an example
(note that your RTO and RPO values may differ) you can follow:

*Example disaster recovery matrix*

For each workload, investigate and understand the impact of
downtime and lost data on your business. The impact typically
grows with downtime and data loss, but the shape of the impact can
differ based on the workload type. For example, downtime for up to
an hour might have low impact, but after that, the impact could
quickly intensify. Impact can take many forms, including financial
impact (such as lost revenue), reputational impact (including loss
of customer trust), operational impact (such as a missed payroll
or decreased productivity), and regulatory risk. Once completed,
assign the workload to the appropriate tier.

Consider the following questions when you analyze the impact of
failure:

- What is the maximum time the workload can be unavailable
before unacceptable impact to the business is incurred?
- How much impact, and what kind, will be incurred by the
business by a workload disruption? Consider all kinds of
impact, including financial, reputational, operational, and
regulatory.
- What is the maximum amount of data that can be lost or
unrecoverable before unacceptable impact to the business is
incurred?
- Can lost data be recreated from other sources (also known as
*derived* data)? If so, also consider the
RPOs of all source data used to recreate the workload data.
- What are the recovery objectives and availability expectations
of workloads that this one depends on (downstream)? Your
workload's objectives must be achievable given the recovery
capabilities of its downstream dependencies. Consider possible
downstream dependency workarounds or mitigations that can
improve this workload's recovery capability.
- What are the recovery objectives and availability expectations
of workloads that depend on this one (upstream)? Upstream
workload objectives may require this workload to have more
stringent recovery capabilities than it first appears.
- Are there different recovery objectives based on the type of
incident? For example, you might have different RTOs and RPOs
depending on whether the incident impacts an Availability Zone
or an entire Region.
- Do your recovery objectives change during certain events or
times of the year? For example, you might have different RTOs
and RPOs around holiday shopping seasons, sporting events,
special sales, and new product launches.
- How do the recovery objectives align with any line of business
and organizational disaster recovery strategy you might have?
- Are there legal or contractual ramifications to consider? For
example, are you contractually obligated to provide a service
with a given RTO or RPO? What penalties might you incur for
not meeting them?
- Are you required to maintain data integrity to meet regulatory
or compliance requirements?

The following worksheet can aid your evaluation of each workload.
You may modify this worksheet to suit your specific needs, such as
adding additional questions.

*Worksheet*

### Implementation steps

- Identify the business stakeholders and technical teams
responsible for each workload, and engage with them.
- Create categories or tiers of criticality for workload
impact in your organization. Example categories include
critical, high, medium, and low. For each category, choose
an RTO and RPO that reflects your business objectives and
requirements.
- Assign one of the impact categories you created in the
previous step to each workload. To decide how a workload
maps to a category, consider the workload's importance to
the business and the impact of interruption or data loss,
and use the questions above to guide you. This results in an
RTO and RPO for each workload.
- Consider the RTO and RPO for each workload determined in the
previous step. Involve the workload's business and technical
teams to determine whether the objectives should be
adjusted. For example, business stakeholders could determine
that more stringent targets are required. Alternatively,
technical teams could determine that targets should be
modified to make them achievable with available resources
and technological constraints.

## Resources

**Related best practices:**

- [REL09-BP04
Perform periodic recovery of the data to verify backup
integrity and processes](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_periodic_recovery_testing_data.html)
- [REL12-BP01
Use playbooks to investigate failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_playbook_resiliency.html)
- [REL13-BP02
Use defined recovery strategies to meet the recovery
objectives](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_disaster_recovery.html)
- [REL13-BP03
Test disaster recovery implementation to validate the
implementation](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_dr_tested.html)

**Related documents:**

- [AWS Architecture Blog: Disaster Recovery Series](https://aws.amazon.com/blogs/architecture/tag/disaster-recovery-series/)
- [Disaster
Recovery of Workloads on AWS: Recovery in the Cloud (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [Managing
resiliency policies with AWS Resilience Hub](https://docs.aws.amazon.com/resilience-hub/latest/userguide/resiliency-policies.html)
- [APN
Partner: partners that can help with disaster recovery](https://aws.amazon.com/partners/find/results/?keyword=Disaster+Recovery)
- [AWS Marketplace: products that can be used for disaster
recovery](https://aws.amazon.com/marketplace/search/results?searchTerms=Disaster+recovery)

**Related videos:**

- [AWS re:Invent
2018: Architecture Patterns for Multi-Region Active-Active
Applications](https://youtu.be/2e29I3dA8o4)
- [Disaster
Recovery of Workloads on AWS](https://www.youtube.com/watch?v=cJZw5mrxryA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_objective_defined_recovery.html*

---

# REL13-BP02 Use defined recovery strategies to meet the recovery objectives

Define a disaster recovery (DR) strategy that meets your workload's recovery objectives. Choose a strategy such as backup and restore, standby (active/passive), or active/active.

**Desired outcome:** For each workload, there is a defined and implemented DR strategy
that allows the workload to achieve DR objectives. DR strategies
between workloads make use of reusable patterns (such as the
strategies previously described),

**Common anti-patterns:**

- Implementing inconsistent recovery procedures for workloads with
similar DR objectives.
- Leaving the DR strategy to be implemented ad-hoc when a disaster
occurs.
- Having no plan for disaster recovery.
- Dependency on control plane operations during recovery.

**Benefits of establishing this best
practice:**

- Using defined recovery strategies allows you to use common
tooling and test procedures.
- Using defined recovery strategies improves knowledge sharing between teams and implementation of DR on
the workloads they own.

**Level of risk exposed if this best practice
is not established:** High. Without a planned, implemented, and tested DR strategy, you are
unlikely to achieve recovery objectives in the event of a
disaster.

## Implementation guidance

A DR strategy relies on the ability to stand up your workload in a
recovery site if your primary location becomes unable to run the
workload. The most common recovery objectives are RTO and RPO, as
discussed in [REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html).

A DR strategy across multiple Availability Zones (AZs) within a
single AWS Region, can provide mitigation against disaster events
like fires, floods, and major power outages. If it is a requirement
to implement protection against an unlikely event that prevents your
workload from being able to run in a given AWS Region, you can use a
DR strategy that uses multiple Regions.

When architecting a DR strategy across multiple Regions, you should
choose one of the following strategies. They are listed in
increasing order of cost and complexity, and decreasing order of RTO
and RPO. *Recovery Region* refers to an AWS Region other than the primary one used for your workload.

*Figure 17: Disaster recovery (DR) strategies*

- **Backup and restore** (RPO in
hours, RTO in 24 hours or less): Back up your data and
applications into the recovery Region. Using automated or
continuous backups will permit point in time recovery (PITR), which can
lower RPO to as low as 5 minutes in some cases. In the event of
a disaster, you will deploy your infrastructure (using
infrastructure as code to reduce RTO), deploy your code, and
restore the backed-up data to recover from a disaster in the
recovery Region.
- **Pilot light** (RPO in minutes,
RTO in tens of minutes): Provision a copy of your core workload
infrastructure in the recovery Region. Replicate your data into
the recovery Region and create backups of it there. Resources
required to support data replication and backup, such as
databases and object storage, are always on. Other elements such
as application servers or serverless compute are not deployed,
but can be created when needed with the necessary configuration
and application code.
- **Warm standby** (RPO in seconds,
RTO in minutes): Maintain a scaled-down but fully functional
version of your workload always running in the recovery Region.
Business-critical systems are fully duplicated and are always
on, but with a scaled down fleet. Data is replicated and live in
the recovery Region. When the time comes for recovery, the
system is scaled up quickly to handle the production load. The
more scaled-up the warm standby is, the lower RTO and control
plane reliance will be. When fully scales this is known as
*hot standby*.
- **Multi-Region (multi-site)
active-active** (RPO near zero, RTO potentially zero):
Your workload is deployed to, and actively serving traffic from,
multiple AWS Regions. This strategy requires you to synchronize
data across Regions. Possible conflicts caused by writes to the
same record in two different regional replicas must be avoided
or handled, which can be complex. Data replication is useful for
data synchronization and will protect you against some types of
disaster, but it will not protect you against data corruption or
destruction unless your solution also includes options for
point-in-time recovery.

Note
The difference between pilot light and warm standby can sometimes be difficult to
understand. Both include an environment in your recovery Region with copies of your primary
region assets. The distinction is that pilot light cannot process requests without additional
action taken first, while warm standby can handle traffic (at reduced capacity levels)
immediately. Pilot light will require you to turn on servers, possibly deploy additional
(non-core) infrastructure, and scale up, while warm standby only requires you to scale up
(everything is already deployed and running). Choose between these based on your RTO and RPO
needs.

When cost is a concern, and you wish to achieve a similar RPO and RTO objectives as defined in the warm standby strategy, you could consider cloud native solutions, like AWS Elastic Disaster Recovery, that take the pilot light approach and offer improved RPO and RTO targets.

**Implementation steps**

- **Determine a DR strategy that will
satisfy recovery requirements for this workload.**

Choosing a DR strategy is a trade-off between reducing downtime and data loss (RTO
and RPO) and the cost and complexity of implementing the strategy. You should avoid
implementing a strategy that is more stringent than it needs to be, as this incurs
unnecessary costs.
For example, in the following diagram, the business has determined their maximum
permissible RTO as well as the limit of what they can spend on their service restoration
strategy. Given the business’ objectives, the DR strategies pilot light or warm standby
will satisfy both the RTO and the cost criteria.

*Figure 18: Choosing a DR strategy based on RTO and
cost*

To learn more, see [Business Continuity Plan (BCP)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/business-continuity-plan-bcp.html).
- **Review the patterns for how the selected DR strategy can be
implemented.**

This step is to understand how you will implement the selected strategy. The
strategies are explained using AWS Regions as the primary and recovery sites. However,
you can also choose to use Availability Zones within a single Region as your DR strategy,
which makes use of elements of multiple of these strategies.
In the following steps, you can apply the strategy to your specific workload.

**Backup and restore**

*Backup and restore* is the least complex strategy to implement, but
will require more time and effort to restore the workload, leading to higher RTO and RPO.
It is a good practice to always make backups of your data, and copy these to another site
(such as another AWS Region).

*Figure 19: Backup and restore architecture*

For more details on this strategy see [Disaster Recovery (DR) Architecture on AWS, Part II: Backup and Restore with Rapid
Recovery](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-ii-backup-and-restore-with-rapid-recovery/).

**Pilot light**

With the *pilot light* approach, you replicate your data from your
primary Region to your recovery Region. Core resources used for the workload
infrastructure are deployed in the recovery Region, however additional resources and any
dependencies are still needed to make this a functional stack. For example, in Figure 20,
no compute instances are deployed.

*Figure 20: Pilot light architecture*

For more details on this strategy, see [Disaster Recovery (DR) Architecture on AWS, Part III: Pilot Light and Warm
Standby](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-iii-pilot-light-and-warm-standby/).

**Warm standby**

The *warm standby* approach involves ensuring that there is a
scaled down, but fully functional, copy of your production environment in another Region.
This approach extends the pilot light concept and decreases the time to recovery because
your workload is always-on in another Region. If the recovery Region is deployed at full
capacity, then this is known as *hot standby*.

*Figure 21: Warm standby architecture*

Using warm standby or pilot light requires scaling up resources in the recovery
Region. To verify capacity is available when needed, consider the use for [capacity reservations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html) for EC2 instances. If using AWS Lambda, then [provisioned
concurrency](https://docs.aws.amazon.com/lambda/latest/dg/provisioned-concurrency.html) can provide runtime environments so that they are prepared to
respond immediately to your function's invocations.
For more details on this strategy, see [Disaster Recovery (DR) Architecture on AWS, Part III: Pilot Light and Warm
Standby](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-iii-pilot-light-and-warm-standby/).

**Multi-site active/active**

You can run your workload simultaneously in multiple Regions as part of
a *multi-site active/active* strategy. Multi-site active/active
serves traffic from all regions to which it is deployed. Customers may select this
strategy for reasons other than DR. It can be used to increase availability, or when
deploying a workload to a global audience (to put the endpoint closer to users and/or to
deploy stacks localized to the audience in that region). As a DR strategy, if the workload
cannot be supported in one of the AWS Regions to which it is deployed, then that Region
is evacuated, and the remaining Regions are used to maintain availability. Multi-site
active/active is the most operationally complex of the DR strategies, and should only be
selected when business requirements necessitate it.

*Figure 22: Multi-site active/active architecture*

For more details on this strategy, see [Disaster Recovery (DR) Architecture on AWS, Part IV: Multi-site
Active/Active](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-iv-multi-site-active-active/).

**AWS Elastic Disaster Recovery**

If you are considering the pilot light or warm standby strategy for disaster
recovery, AWS Elastic Disaster Recovery could provide an alternative approach with improved benefits. Elastic Disaster Recovery
can offer an RPO and RTO target similar to warm standby, but maintain the low-cost
approach of pilot light. Elastic Disaster Recovery replicates your data from your primary region to your
recovery Region, using continual data protection to achieve an RPO measured in seconds and
an RTO that can be measured in minutes. Only the resources required to replicate the data
are deployed in the recovery region, which keeps costs down, similar to the pilot light
strategy. When using Elastic Disaster Recovery, the service coordinates and orchestrates the recovery of
compute resources when initiated as part of failover or drill.

*Figure 23: AWS Elastic Disaster Recovery architecture*

**Additional practices for protecting data**

With all strategies, you must also mitigate against a data disaster. Continuous data
replication protects you against some types of disaster, but it may not protect you
against data corruption or destruction unless your strategy also includes versioning of
stored data or options for point-in-time recovery. You must also back up the replicated
data in the recovery site to create point-in-time backups in addition to the replicas.

**Using multiple Availability Zones (AZs) within a single
AWS Region**

When using multiple AZs within a single Region, your DR implementation uses multiple
elements of the above strategies. First you must create a high-availability (HA)
architecture, using multiple AZs as shown in Figure 23. This architecture makes use of a
multi-site active/active approach, as the [Amazon EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones) and the [Elastic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#availability-zones) have resources deployed in multiple AZs, actively handing
requests. The architecture also demonstrates hot standby, where if the primary [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html) instance fails (or the AZ itself fails), then the standby instance is
promoted to primary.

*Figure 24: Multi-AZ architecture*

In addition to this HA architecture, you need to add backups of all data required to
run your workload. This is especially important for data that is constrained to a single
zone such as [Amazon EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html) or [Amazon Redshift clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html). If an
AZ fails, you will need to restore this data to another AZ. Where possible, you should
also copy data backups to another AWS Region as an additional layer of protection.
An less common alternative approach to single Region, multi-AZ DR is illustrated in
the blog post, [Building highly resilient applications using Amazon Application Recovery Controller,
Part 1: Single-Region stack](https://aws.amazon.com/blogs/networking-and-content-delivery/building-highly-resilient-applications-using-amazon-route-53-application-recovery-controller-part-1-single-region-stack/). Here, the strategy is to maintain as much isolation
between the AZs as possible, like how Regions operate. Using this alternative strategy,
you can choose an active/active or active/passive approach.
NoteSome workloads have regulatory data residency requirements. If this applies to your
workload in a locality that currently has only one AWS Region, then multi-Region will
not suit your business needs. Multi-AZ strategies provide good protection against most
disasters.
- **Assess the resources of your workload, and what their configuration
will be in the recovery Region prior to failover (during normal operation).**

For infrastructure and AWS resources use infrastructure as code such as [AWS CloudFormation](https://aws.amazon.com/cloudformation) or third-party tools like
Hashicorp Terraform. To deploy across multiple accounts and Regions with a single
operation you can use [AWS CloudFormation
StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/what-is-cfnstacksets.html). For Multi-site active/active and Hot Standby strategies, the deployed
infrastructure in your recovery Region has the same resources as your primary Region. For
Pilot Light and Warm Standby strategies, the deployed infrastructure will require
additional actions to become production ready. Using CloudFormation [parameters](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html) and [conditional logic](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html), you can control whether a deployed stack is active or
standby with [a single template](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-iii-pilot-light-and-warm-standby/). When using Elastic Disaster Recovery, the service will replicate and orchestrate
the restoration of application configurations and compute resources.
All DR strategies require that data sources are backed up within the AWS Region,
and then those backups are copied to the recovery Region. [AWS Backup](https://aws.amazon.com/backup/) provides a centralized view where you can configure,
schedule, and monitor backups for these resources. For Pilot Light, Warm Standby, and
Multi-site active/active, you should also replicate data from the primary Region to data
resources in the recovery Region, such as [Amazon Relational Database Service
(Amazon RDS)](https://aws.amazon.com/rds) DB instances or [Amazon DynamoDB](https://aws.amazon.com/dynamodb) tables. These data resources are therefore live and ready to serve
requests in the recovery Region.
To learn more about how AWS services operate across Regions, see this blog series
on [Creating a Multi-Region Application with AWS Services](https://aws.amazon.com/blogs/architecture/tag/creating-a-multi-region-application-with-aws-services-series/).
- **Determine and implement how you will make your recovery Region ready
for failover when needed (during a disaster event).**

For multi-site active/active, failover means evacuating a Region, and relying on the
remaining active Regions. In general, those Regions are ready to accept traffic. For Pilot
Light and Warm Standby strategies, your recovery actions will need to deploy the missing
resources, such as the EC2 instances in Figure 20, plus any other missing resources.
For all of the above strategies you may need to promote read-only instances of
databases to become the primary read/write instance.
For backup and restore, restoring data from backup creates resources for that data
such as EBS volumes, RDS DB instances, and DynamoDB tables. You also need to restore the
infrastructure and deploy code. You can use AWS Backup to restore data in the recovery
Region. See [REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources](./rel_backing_up_data_identified_backups_data.html) for more details.
Rebuilding the infrastructure includes creating resources like EC2 instances in addition
to the [Amazon Virtual Private Cloud (Amazon VPC)](https://aws.amazon.com/vpc), subnets, and security
groups needed. You can automate much of the restoration process. To learn how, see [this blog post](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-ii-backup-and-restore-with-rapid-recovery/).
- **Determine and implement how you will reroute traffic to failover
when needed (during a disaster event).**

This failover operation can be initiated either automatically or manually.
Automatically initiated failover based on health checks or alarms should be used with
caution since an unnecessary failover (false alarm) incurs costs such as non-availability
and data loss. Manually initiated failover is therefore often used. In this case, you
should still automate the steps for failover, so that the manual initiation is like the
push of a button.
There are several traffic management options to consider when using AWS services.
One option is to use [Amazon Route 53](https://aws.amazon.com/route53). Using
Amazon Route 53, you can associate multiple IP endpoints in one or more AWS Regions with
a Route 53 domain name. To implement manually initiated failover you can use [Amazon
Application Recovery Controller](https://aws.amazon.com/application-recovery-controller/), which provides a highly available data plane
API to reroute traffic to the recovery Region. When implementing failover, use data plane
operations and avoid control plane ones as described in [REL11-BP04 Rely on the data plane and not the control plane during recovery](./rel_withstand_component_failures_avoid_control_plane.html).
To learn more about this and other options see [this section of the Disaster Recovery Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html#pilot-light).
- **Design a plan for how your workload will fail back.**

Failback is when you return workload operation to the primary Region, after a
disaster event has abated. Provisioning infrastructure and code to the primary Region
generally follows the same steps as were initially used, relying on infrastructure as code
and code deployment pipelines. The challenge with failback is restoring data stores, and
ensuring their consistency with the recovery Region in operation.
In the failed over state, the databases in the recovery Region are live and have the
up-to-date data. The goal then is to re-synchronize from the recovery Region to the
primary Region, ensuring it is up-to-date.
Some AWS services will do this automatically. If using [Amazon DynamoDB global tables](https://aws.amazon.com/dynamodb/global-tables/), even if the table in the
primary Region had become not available, when it comes back online, DynamoDB resumes
propagating any pending writes. If using [Amazon Aurora Global Database](https://aws.amazon.com/rds/aurora/global-database/) and using [managed planned failover](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html#aurora-global-database-disaster-recovery.managed-failover), then Aurora global database's existing replication
topology is maintained. Therefore, the former read/write instance in the primary Region
will become a replica and receive updates from the recovery Region.
In cases where this is not automatic, you will need to re-establish the database in
the primary Region as a replica of the database in the recovery Region. In many cases this
will involve deleting the old primary database, and creating new replicas.
After a failover, if you can continue running in your recovery Region, consider
making this the new primary Region. You would still do all the above steps to make the
former primary Region into a recovery Region. Some organizations do a scheduled rotation,
swapping their primary and recovery Regions periodically (for example every three months).
All of the steps required to fail over and fail back should be maintained in a
playbook that is available to all members of the team, and is periodically reviewed.
When using Elastic Disaster Recovery, the service will assist in orchestrating and automating the
failback process. For more details, see [Performing a failback](https://docs.aws.amazon.com/drs/latest/userguide/failback-performing-main.html).

**Level of effort for the Implementation Plan:** High

## Resources

**Related best practices:**

- [REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources](./rel_backing_up_data_identified_backups_data.html)
- [REL11-BP04 Rely on the data plane and not the control plane during recovery](./rel_withstand_component_failures_avoid_control_plane.html)
- [REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html)

**Related documents:**

- [AWS Architecture Blog: Disaster Recovery Series](https://aws.amazon.com/blogs/architecture/tag/disaster-recovery-series/)
- [Disaster
Recovery of Workloads on AWS: Recovery in the Cloud (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [Disaster
recovery options in the cloud](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html)
- [Build
a serverless multi-region, active-active backend solution in
an hour](https://read.acloud.guru/building-a-serverless-multi-region-active-active-backend-36f28bed4ecf)
- [Multi-region
serverless backend — reloaded](https://medium.com/@adhorn/multi-region-serverless-backend-reloaded-1b887bc615c0)
- [RDS:
Replicating a Read Replica Across Regions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html#USER_ReadRepl.XRgn)
- [Route 53: Configuring DNS Failover](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring.html)
- [S3:
Cross-Region Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html)
- [What
Is AWS Backup?](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- [What
is Amazon Application Recovery Controller?](https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html)
- [AWS Elastic Disaster Recovery](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html)
- [HashiCorp
Terraform: Get Started - AWS](https://learn.hashicorp.com/collections/terraform/aws-get-started)
- [APN
Partner: partners that can help with disaster recovery](https://aws.amazon.com/partners/find/results/?keyword=Disaster+Recovery)
- [AWS Marketplace: products that can be used for disaster
recovery](https://aws.amazon.com/marketplace/search/results?searchTerms=Disaster+recovery)

**Related videos:**

- [Disaster
Recovery of Workloads on AWS](https://www.youtube.com/watch?v=cJZw5mrxryA)
- [AWS re:Invent
2018: Architecture Patterns for Multi-Region Active-Active
Applications (ARC209-R2)](https://youtu.be/2e29I3dA8o4)
- [Get
Started with AWS Elastic Disaster Recovery | Amazon Web Services](https://www.youtube.com/watch?v=GAMUCIJR5as)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_disaster_recovery.html*

---

# REL13-BP03 Test disaster recovery implementation to validate the implementation

Regularly test failover to your recovery site to verify that it operates properly and that RTO and RPO are met.

**Common anti-patterns:**

- Never exercise failovers in production.

**Benefits of establishing this best
practice:** Regularly testing you disaster recovery plan
verifies that it will work when it needs to, and that your team knows
how to perform the strategy.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

A pattern to avoid is developing recovery paths that are rarely
exercised. For example, you might have a secondary data store that
is used for read-only queries. When you write to a data store and
the primary fails, you might want to fail over to the secondary data
store. If you don’t frequently test this failover, you might find
that your assumptions about the capabilities of the secondary data
store are incorrect. The capacity of the secondary, which might have
been sufficient when you last tested, might be no longer be able to
tolerate the load under this scenario. Our experience has shown that
the only error recovery that works is the path you test frequently.
This is why having a small number of recovery paths is best. You can
establish recovery patterns and regularly test them. If you have a
complex or critical recovery path, you still need to regularly
exercise that failure in production to convince yourself that the
recovery path works. In the example we just discussed, you should
fail over to the standby regularly, regardless of need.

**Implementation steps**

- Engineer your workloads for recovery. Regularly test your recovery
paths. Recovery-oriented computing identifies the
characteristics in systems that enhance recovery: isolation and redundancy, system-wide ability
to roll back changes, ability to monitor and determine health,
ability to provide diagnostics, automated recovery, modular
design, and ability to restart. Exercise the recovery path to
verify that you can accomplish the recovery in the specified time
to the specified state. Use your runbooks during this recovery to
document problems and find solutions for them before the next
test.
- For Amazon EC2-based workloads, use [AWS Elastic Disaster Recovery](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html) to implement and launch drill instances for your DR strategy. AWS Elastic Disaster Recovery provides the ability to efficiently run drills, which helps you prepare for a failover event. You can also frequently launch of your instances using Elastic Disaster Recovery for test and drill purposes without redirecting the traffic.

## Resources

**Related documents:**

- [APN
Partner: partners that can help with disaster recovery](https://aws.amazon.com/partners/find/results/?keyword=Disaster+Recovery)
- [AWS Architecture Blog: Disaster Recovery Series](https://aws.amazon.com/blogs/architecture/tag/disaster-recovery-series/)
- [AWS Marketplace: products that can be used for disaster
recovery](https://aws.amazon.com/marketplace/search/results?searchTerms=Disaster+recovery)
- [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/)
- [Disaster
Recovery of Workloads on AWS: Recovery in the Cloud (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [AWS Elastic Disaster Recovery Preparing for Failover](https://docs.aws.amazon.com/drs/latest/userguide/failback-preparing.html)
- [The
Berkeley/Stanford recovery-oriented computing project](http://roc.cs.berkeley.edu/)
- [What
is AWS Fault Injection Simulator?](https://docs.aws.amazon.com/fis/latest/userguide/what-is.html)

**Related videos:**

- [AWS re:Invent
2018: Architecture Patterns for Multi-Region Active-Active
Applications](https://youtu.be/2e29I3dA8o4)
- [AWS re:Invent
2019: Backup-and-restore and disaster-recovery solutions with
AWS](https://youtu.be/7gNXfo5HZN8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_dr_tested.html*

---

# REL13-BP04 Manage configuration drift at the DR site or Region

To perform a successful disaster recovery (DR) procedure, your
workload must be able to resume normal operations in a timely manner
with no relevant loss of functionality or data once the DR
environment has been brought online. To achieve this goal, it's
essential to maintain consistent infrastructure, data, and
configurations between your DR environment and the primary
environment.

**Desired outcome:** Your disaster
recovery site's configuration and data are in parity with the
primary site, which facilitates rapid and complete recovery when
needed.

**Common anti-patterns:**

- You fail to update recovery locations when changes are made to
the primary locations, which results in outdated configurations
that could hinder recovery efforts.
- You do not consider potential limitations such as service
differences between primary and recovery locations, which can
lead to unexpected failures during failover.
- You rely on manual processes to update and synchronize the DR
environment, which increases the risk of human error and
inconsistency.
- You fail to detect configuration drift, which leads to a false
sense of DR site readiness prior to an incident.

**Benefits of establishing this best
practice:** Consistency between the DR environment and the
primary environment significantly improves the likelihood of a
successful recovery after an incident and reduces the risk of a
failed recovery procedure.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

A comprehensive approach to configuration management and failover
readiness can help you verify that the DR site is consistently
updated and prepared to take over in the event of a primary site
failure.

To achieve consistency between your primary and disaster recovery
(DR) environments, validate that your delivery pipelines
distribute applications to both your primary and DR sites. Roll
out changes to the DR sites after an appropriate evaluation period
(also known as *staggered deployments*) to
detect problems at the primary site and halt the deployment before
they spread. Implement monitoring to detect configuration drift,
and track changes and compliance across your environments. Perform
automated remediation in the DR site to keep it fully consistent
and ready to take over in the event of an incident.

### Implementation steps

- Validate that the DR region contains the AWS services and
features required for a successful execution of your DR
plan.
- Use infrastructure as code (IaC). Keep your production
infrastructure and application configuration templates
accurate, and regularly apply them to your disaster recovery
environment.
[AWS CloudFormation](https://aws.amazon.com/cloudformation/) can detect drift between what your
CloudFormation templates specify and what is actually
deployed.
- Configure CI/CD pipelines to deploy applications and
infrastructure updates to all environments, including
primary and DR sites. CI/CD solutions such as
[AWS CodePipeline](https://aws.amazon.com/codepipeline/) can automate the deployment process,
which reduces the risk of configuration drift.
- Stagger deployments between the primary and DR environments.
This approach allows updates to be initially deployed and
tested in the primary environment, which isolates issues in
the primary site before they are propagated to the DR site.
This approach prevents defects from being simultaneously
pushed to production and the DR site at the same time and
maintains the integrity of the DR environment.
- Continually monitor resource configurations in both primary
and DR environments. Solutions such as
[AWS Config](https://aws.amazon.com/config/) can help to enforce configuration compliance
and detect drift, which helps maintain the consistent
configurations across environments.
- Implement alerting mechanisms to track and notify upon any
configuration drift or data replication interruption or lag.
- Automate the remediation of detected configuration drift.
- Schedule regular audits and compliance checks to verify
ongoing alignment between primary and DR configurations.
Periodic reviews help you maintain compliance with defined
rules and identify any discrepancies that need to be
addressed.
- Check for mismatches in AWS provisioned capacity, service
quotas, throttle limits, and configuration and version
discrepancies.

## Resources

**Related best practices:**

- [REL01-BP01
Aware of service quotas and constraints](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_aware_quotas_and_constraints.html)
- [REL01-BP02
Manage service quotas across accounts and regions](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_limits_considered.html)
- [REL01-BP04
Monitor and manage quotas](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_monitor_manage_limits.html)
- [REL13-BP03
Test disaster recovery implementation to validate the
implementation](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_dr_tested.html)

**Related documents:**

- [Remediating
Noncompliant AWS Resources by AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html)
- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [AWS CloudFormation: Detecting unmanaged configuration changes to
stacks and resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- [AWS CloudFormation: Detect Drift on an Entire CloudFormation
Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/detect-drift-stack.html)
- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [Disaster
Recovery of Workloads on AWS: Recovery in the Cloud (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [How
do I implement an Infrastructure Configuration Management
solution on AWS?](https://aws.amazon.com/answers/configuration-management/aws-infrastructure-configuration-management/?ref=wellarchitected)
- [Remediating
Noncompliant AWS Resources by AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html)

**Related videos:**

- [AWS re:Invent
2018: Architecture Patterns for Multi-Region Active-Active
Applications (ARC209-R2)](https://youtu.be/2e29I3dA8o4)

**Related examples:**

- [CloudFormation
Registry](https://aws.amazon.com/blogs/devops/identify-regional-feature-parity-using-the-aws-cloudformation-registry/)
- [Quota
Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [Implement
automatic drift remediation for AWS CloudFormation using
Amazon CloudWatch and AWS Lambda](https://aws.amazon.com/blogs/mt/implement-automatic-drift-remediation-for-aws-cloudformation-using-amazon-cloudwatch-and-aws-lambda/)
- [AWS Architecture Blog: Disaster Recovery Series](https://aws.amazon.com/blogs/architecture/tag/disaster-recovery-series/)
- [AWS Marketplace: products that can be used for disaster
recovery](https://aws.amazon.com/marketplace/search/results?searchTerms=Disaster+recovery)
- [Automating
safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_config_drift.html*

---

# REL13-BP05 Automate recovery

Implement tested and automated recovery mechanisms that are
reliable, observable, and reproducible to reduce the risk and
business impact of failure.

**Desired outcome:** You have
implemented a well-documented, standardized, and thoroughly-tested
automation workflow for recovery processes. Your recovery automation
automatically corrects minor issues that pose low risk of data loss
or unavailability. You are able to quickly invoke recovery processes
for serious incidents, observe the remediation behavior while they
operate, and end the processes if you observe dangerous situations
or failures.

**Common anti-patterns:**

- You depend on components or mechanisms that are in a failed or
degraded state as part of your recovery plan.
- Your recovery processes require manual intervention, such as
console access (also known as *click ops*).
- You automatically initiate recovery procedures in situations
that present a high risk of data loss or unavailability.
- You fail to include a mechanism to abort a recovery procedure
(like an *Andon cord* or *big red
stop button*) that is not working or that poses
additional risks.

**Benefits of establishing this best
practice:**

- Increased reliability, predictability, and consistency of
recovery operations.
- Ability to meet more stringent recovery objectives, including
Recovery Time Objective (RTO) and Recovery Point Objective
(RPO).
- Reduced likelihood of recovery failing during an incident.
- Reduced risk of failures associated with manual recovery
processes that are prone to human error.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To implement automated recovery, you need a comprehensive approach
that uses AWS services and best practices. To start, identify
critical components and potential failure points in your workload.
Develop automated processes that can recover your workloads and
data from failures without human intervention.

Develop your recovery automation using infrastructure as code
(IaC) principles. This makes your recovery environment consistent
with the source environment and allows for version control of your
recovery processes. To orchestrate complex recovery workflows,
consider solutions such as
[AWS Systems Manager Automations](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html) or
[AWS Step Functions](https://aws.amazon.com/step-functions/).

Automation of recovery processes provides significant benefits and
can help you more easily achieve your Recovery Time Objective
(RTO) and Recovery Point Objective (RPO). However, they can
encounter unexpected situations that may cause them to fail or
create new risks of their own such as additional downtime and data
loss. To mitigate this risk, provide the ability to quickly halt a
recovery automation in progress. Once halted, you can investigate
and take corrective steps.

For supported workloads, consider solutions such as AWS Elastic
Disaster Recovery (AWS DRS) to provide automated failover. AWS DRS
continually replicates your machines (including operating system,
system state configuration, databases, applications, and files)
into a staging area in your target AWS account and preferred
Region. If an incident occurs, AWS DRS automates the conversion of
your replicated servers into fully-provisioned workloads in your
recovery Region on AWS.

Maintenance and improvement of automated recovery is an ongoing
process. Continually test and refine your recovery procedures
based on lessons learned, and stay updated on new AWS services and
features that can enhance your recovery capabilities.

### Implementation steps

- **Plan for automated
recovery**

Conduct a thorough review of your workload architecture,
components, and dependencies to identify and plan
automated recovery mechanisms. Categorize your
workload's dependencies into *hard*
and *soft* dependencies. Hard
dependencies are those that the workload cannot operate
without and for which no substitute can be provided.
Soft dependencies are those that the workload ordinarily
uses but are replaceable with temporary substitute
systems or processes or can be handled by
[graceful
degradation](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_graceful_degradation).
- Establish processes to identify and recover missing or
corrupted data.
- Define steps to confirm a recovered steady state after
recovery actions have been completed.
- Consider any actions required to make the recovered
system ready for full service, such as pre-warming and
populating caches.
- Consider problems that could be encountered during the
recovery process and how to detect and remediate them.
- Consider scenarios where the primary site and its
control plane are inaccessible. Verify that recovery
actions can be performed independently without reliance
on the primary site. Consider solutions such as
[Amazon Application Recovery Controller (ARC)](https://aws.amazon.com/application-recovery-controller/) to
redirect traffic without the need to manually mutate DNS
records.

- **Develop automated recovery
process**

Implement automated fault detection and failover
mechanisms for hands-free recovery. Build dashboards
such as with
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to report the progress and health of
automated recovery procedures. Include procedures to
validate successful recovery. Provide a mechanism to
abort a recovery in process.
- Build
[playbooks](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_playbook_resiliency)
as a fallback process for faults that cannot be
automatically recovered from, and take into
consideration your
[disaster
recovery plan](https://aws.amazon.com/disaster-recovery/faqs/#Core_concepts).
- Test recovery processes as discussed in
[REL13-BP03](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_planning_for_recovery_dr_tested.html).

- **Prepare for recovery**

Evaluate the state of your recovery site and deploy
critical components to it in advance. For more detail,
see
[REL13-BP04](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_config_drift.html).
- Define clear roles, responsibilities, and
decision-making processes for recovery operations,
involving relevant stakeholders and teams across the
organization.
- Define the conditions to initiate your recovery
processes.
- Create a plan to revert the recovery process and fall
back to your primary site if required or after it's
considered safe.

## Resources

**Related best practices:**

- [REL07-BP01
Use automation when obtaining or scaling resources](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_adapt_to_changes_autoscale_adapt.html)
- [REL11-BP01
Monitor all components of the workload to detect
failures](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_withstand_component_failures_monitoring_health.html)
- [REL13-BP02
Use defined recovery strategies to meet the recovery
objectives](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_disaster_recovery.html)
- [REL13-BP03
Test disaster recovery implementation to validate the
implementation](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_planning_for_recovery_dr_tested.html)
- [REL13-BP04
Manage configuration drift at the DR site or Region](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_config_drift.html)

**Related documents:**

- [AWS Architecture Blog: Disaster Recovery Series](https://aws.amazon.com/blogs/architecture/tag/disaster-recovery-series/)
- [Disaster
Recovery of Workloads on AWS: Recovery in the Cloud (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [Orchestrate
Disaster Recovery Automation using Amazon Route 53 ARC and AWS Step Functions](https://aws.amazon.com/blogs/networking-and-content-delivery/orchestrate-disaster-recovery-automation-using-amazon-route-53-arc-and-aws-step-functions/)
- [Build
AWS Systems Manager Automation runbooks using AWS CDK](https://aws.amazon.com/blogs/mtbuild-aws-systems-manager-automation-runbooks-using-aws-cdk/)
- [AWS Marketplace: Products That Can Be Used for Disaster
Recovery](https://aws.amazon.com/marketplace/search/results?searchTerms=Disaster+recovery)
- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/)
- [Using
Elastic Disaster Recovery for Failover and Failback](https://docs.aws.amazon.com/drs/latest/userguide/failback.html)
- [AWS Elastic Disaster Recovery Resources](https://aws.amazon.com/disaster-recovery/resources/)
- [APN
Partner: Partners That Can Help with Disaster Recovery](https://aws.amazon.com/partners/find/results/?keyword=Disaster+Recovery)

**Related videos:**

- [AWS re:Invent
2018: Architecture Patterns for Multi-Region Active-Active
Applications (ARC209-R2)](https://youtu.be/2e29I3dA8o4)
- [AWS re:Invent
2022: AWS On Air ft. AWS Failback for AWS Elastic Disaster
Recovery](https://youtu.be/Ok-vpV8b1Hs)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_auto_recovery.html*

---
