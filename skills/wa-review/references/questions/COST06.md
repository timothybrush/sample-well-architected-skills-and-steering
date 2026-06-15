# COST 6 — How do you meet cost targets when you select resource type, size and number?

**Pillar**: Cost Optimization  
**Best Practices**: 4

---

# COST06-BP01 Perform cost modeling

Identify organization requirements (such as business needs and existing commitments)
and perform cost modeling (overall costs) of the workload and each of its components.
Perform benchmark activities for the workload under different predicted loads and compare
the costs. The modeling effort should reflect the potential benefit. For example, time
spent is proportional to component cost.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Perform cost modeling for your workload and each of its components to understand the balance
between resources, and find the correct size for each resource in the workload, given a specific
level of performance. Understanding cost considerations can inform your organizational business
case and decision-making process when evaluating the value realization outcomes for planned
workload deployment.

Perform benchmark activities for the workload under different predicted loads and compare the costs.
The modeling effort should reflect potential benefit; for example, time spent is proportional to
component cost or predicted saving. For best practices, refer to the
[Review section of the
Performance Efficiency Pillar of the AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/review.html).

As an example, to create cost modeling for a workload consisting of compute resources,
[AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) can assist with cost modeling for running workloads. It provides
right-sizing recommendations for compute resources based on historical usage. Make sure
CloudWatch Agents are deployed to the Amazon EC2 instances to collect memory metrics which help
you with more accurate recommendations within AWS Compute Optimizer. This is the ideal
data source for compute resources because it is a free service that uses machine learning
to make multiple recommendations depending on levels of risk.

There are [multiple services](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/identifying-opportunities-to-right-size.html) you can use with custom logs as data sources for rightsizing
operations for other services and workload components, such as [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/),
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and
[Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html). AWS Trusted Advisor checks resources and flags
resources with low utilization which can help you rightsize your resources and create
cost modeling.

The following are recommendations for cost modeling data and metrics:

- The monitoring must accurately reflect the user experience. Select the correct
granularity for the time period and thoughtfully choose the maximum or 99th
percentile instead of the average.
- Select the correct granularity for the time period of
analysis that is required to cover any workload cycles.
For example, if a two-week analysis is performed, you
might be overlooking a monthly cycle of high utilization,
which could lead to under-provisioning.
- Choose the right AWS services for your planned workload by
considering your existing commitments, selected pricing models
for other workloads, and ability to innovate faster and focus
on your core business value.

**Implementation steps**

- **Perform cost modeling for resources:** Deploy the
workload or a proof of concept into a separate account with the specific resource types
and sizes to test. Run the workload with the test data and record the output results,
along with the cost data for the time the test was run. Afterwards, redeploy the workload
or change the resource types and sizes and run the test again. Include license fees of
any products you may use with these resources and estimated operations (labor or engineer)
costs for deploying and managing these resources while creating cost modeling. Consider
cost modeling for a period (hourly, daily, monthly, yearly or three years).

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [Identifying Opportunities to Right Size](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/identifying-opportunities-to-right-size.html)
- [Amazon CloudWatch features](https://aws.amazon.com/cloudwatch/features/)
- [Cost
Optimization: Amazon EC2 Right Sizing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html)
- [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/)
- [AWS Pricing Calculator](https://calculator.aws/#/)

**Related examples:**

- [Perform a Data-Driven Cost modeling](https://aws.amazon.com/blogs/mt/how-to-use-aws-well-architected-with-aws-trusted-advisor-to-achieve-data-driven-cost-optimization/)
- [Estimate the cost of planned AWS resource configurations](https://aws.amazon.com/premiumsupport/knowledge-center/estimating-aws-resource-costs/)
- [Choose the right AWS tools](https://www.learnaws.org/2019/09/27/choose-right-aws-tools/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_cost_modeling.html*

---

# COST06-BP02 Select resource type, size, and number based on data

Select resource size or type based on data about the workload and resource characteristics.
For example, compute, memory, throughput, or write intensive. This selection is typically made
using a previous (on-premises) version of the workload, using documentation, or using other
sources of information about the workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Amazon EC2 provides a wide selection of instance types with different levels of CPU, memory, storage, and networking capacity to fit different use cases. These instance types feature different blends of CPU, memory, storage, and networking capabilities, giving you versatility when selecting the right resource combination for your projects. Every instance type comes in multiple sizes, so that you can adjust your resources based on your workload’s demands. To determine which instance type you need, gather details about the system requirements of the application or software that you plan to run on your instance. These details should include the following:

- Operating system
- Number of CPU cores
- GPU cores
- Amount of system memory (RAM)
- Storage type and space
- Network bandwidth requirement

Identify the purpose of compute requirements and which instance is needed, and then explore the various Amazon EC2 instance families. Amazon offers the following instance type families:

- General Purpose
- Compute Optimized
- Memory Optimized
- Storage Optimized
- Accelerated Computing
- HPC Optimized

For a deeper understanding of the specific purposes and use cases that a particular Amazon EC2 instance family can fulfill, see [AWS Instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).

System requirements gathering is critical for you to select the specific instance family and instance type that best serves your needs. Instance type names are comprised of the family name and the instance size. For example, the t2.micro instance is from the T2 family and is micro-sized.

Select resource size or type based on workload and resource characteristics (for example, compute, memory, throughput, or write intensive). This selection is typically made using cost modeling, a previous version of the workload (such as an on-premises version), using documentation, or using other sources of information about the workload (whitepapers or published solutions). Using AWS pricing calculators or cost management tools can assist in making informed decisions about instance types, sizes, and configurations.

### Implementation steps

- **Select resources based on data:** Use your cost modeling data to select the anticipated workload usage level, and choose the specified resource type and size. Relying on the cost modeling data, determine the number of virtual CPUs, total memory (GiB), the local instance store volume (GB), Amazon EBS volumes, and the network performance level, taking into account the data transfer rate required for the instance. Always make selections based on detailed analysis and accurate data to optimize performance while managing costs effectively.

## Resources

**Related documents:**

- [AWS Instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html)
- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [Amazon CloudWatch features](https://aws.amazon.com/cloudwatch/features/)
- [Cost
Optimization: EC2 Right Sizing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html)

**Related videos:**

- [Selecting the right Amazon EC2 instance for your workloads](https://www.youtube.com/watch?v=q5Dn9gcmpJg)
- [Right size your service](https://youtu.be/wcp1inFS78A)

**Related examples:**

- [It just got easier to discover and compare Amazon EC2 instance types](https://aws.amazon.com/blogs/compute/it-just-got-easier-to-discover-and-compare-ec2-instance-types/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_data.html*

---

# COST06-BP03 Select resource type, size, and number automatically based on metrics

Use metrics from the currently running workload to select the right size and type to optimize for cost.
Appropriately provision throughput, sizing, and storage for compute, storage, data, and networking services.
This can be done with a feedback loop such as automatic scaling or by custom code in the workload.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Create a feedback loop within the workload that uses active metrics from the running
workload to make changes to that workload. You can use a managed service, such as [AWS Auto Scaling](https://aws.amazon.com/autoscaling/), which you configure to perform
the right sizing operations for you. AWS also provides [APIs, SDKs](https://aws.amazon.com/developer/tools/), and features that allow
resources to be modified with minimal effort. You can program a workload to stop-and-start an
Amazon EC2 instance to allow a change of instance size or instance type. This
provides the benefits of right-sizing while removing almost all the operational cost required
to make the change.

Some AWS services have built in automatic type or size selection, such as [Amazon Simple Storage Service Intelligent-Tiering](https://aws.amazon.com/about-aws/whats-new/2018/11/s3-intelligent-tiering/). Amazon S3
Intelligent-Tiering automatically moves your data between two access tiers, frequent access
and infrequent access, based on your usage patterns.

**Implementation steps**

- **Increase your observability by configuring workload metrics:** Capture key
metrics for the workload. These metrics provide an indication of the customer experience, such as workload output,
and align to the differences between resource types and sizes, such as CPU and memory usage. For compute resource,
analyze performance data to right size your Amazon EC2 instances. Identify idle instances and ones that are underutilized.
Key metrics to look for are CPU usage and memory utilization (for example, 40% CPU utilization at 90% of the time
as explained in [Rightsizing with AWS Compute Optimizer and Memory Utilization Enabled](https://www.wellarchitectedlabs.com/cost/200_labs/200_aws_resource_optimization/5_ec2_computer_opt/)). Identify instances with a
maximum CPU usage and memory utilization of less than 40% over a four-week period. These are the instances to
right size to reduce costs. For storage resources such as Amazon S3, you can use [Amazon S3 Storage Lens](https://aws.amazon.com/getting-started/hands-on/amazon-s3-storage-lens/), which
allows you to see 28 metrics across various categories at the bucket level, and 14 days of historical data in
the dashboard by default. You can filter your Amazon S3 Storage Lens dashboard by summary and cost optimization or
events to analyze specific metrics.
- **View rightsizing recommendations:** Use the rightsizing recommendations in
AWS Compute Optimizer and the Amazon EC2 rightsizing tool in the Cost Management console, or review AWS Trusted Advisor
right-sizing your resources to make adjustments on your workload. It is important to use the [right tools](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/identifying-opportunities-to-right-size.html) when
right-sizing different resources and follow [right-sizing guidelines](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/identifying-opportunities-to-right-size.html) whether it is an Amazon EC2 instance,
AWS storage classes, or Amazon RDS instance types. For storage resources, you can use Amazon S3 Storage Lens, which
gives you visibility into object storage usage, activity trends, and makes actionable recommendations to optimize
costs and apply data protection best practices. Using the contextual recommendations that [Amazon S3 Storage Lens](https://aws.amazon.com/getting-started/hands-on/amazon-s3-storage-lens/) derives
from analysis of metrics across your organization, you can take immediate steps to optimize your storage.
- **Select resource type and size automatically based on metrics:** Using the workload
metrics, manually or automatically select your workload resources. For compute resources, configuring AWS Auto Scaling
or implementing code within your application can reduce the effort required if frequent changes are needed, and it can
potentially implement changes sooner than a manual process. You can launch and automatically scale a fleet of On-Demand
Instances and Spot Instances within a single Auto Scaling group. In addition to receiving discounts for using Spot
Instances, you can use Reserved Instances or a Savings Plan to receive discounted rates of the regular On-Demand Instance
pricing. All of these factors combined help you optimize your cost savings for Amazon EC2 instances and determine the desired
scale and performance for your application. You can also use an [attribute-based instance type selection (ABS)](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html) strategy
in [Auto Scaling Groups (ASG)](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html), which lets you express your instance requirements as a set of attributes, such as vCPU,
memory, and storage. You can automatically use newer generation instance types when they are released and access a
broader range of capacity with Amazon EC2 Spot Instances. Amazon EC2 Fleet and Amazon EC2 Auto Scaling select and launch instances that fit
the specified attributes, removing the need to manually pick instance types. For storage resources, you can use the
[Amazon S3 Intelligent Tiering](https://aws.amazon.com/s3/storage-classes/intelligent-tiering/) and [Amazon EFS Infrequent Access](https://aws.amazon.com/efs/features/infrequent-access/) features, which allow you to select storage classes automatically
that deliver automatic storage cost savings when data access patterns change, without performance impact or operational overhead.

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Right-Sizing](https://aws.amazon.com/aws-cost-management/aws-cost-optimization/right-sizing/)
- [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/)
- [Amazon CloudWatch features](https://aws.amazon.com/cloudwatch/features/)
- [CloudWatch
Getting Set Up](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/GettingSetup.html)
- [CloudWatch
Publishing Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
- [Getting
Started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html)
- [Amazon S3 Storage Lens](https://aws.amazon.com/getting-started/hands-on/amazon-s3-storage-lens/)
- [Amazon S3 Intelligent-Tiering](https://aws.amazon.com/about-aws/whats-new/2018/11/s3-intelligent-tiering/)
- [Amazon EFS Infrequent Access](https://aws.amazon.com/efs/features/infrequent-access/)
- [Launch
an Amazon EC2 Instance Using the SDK](https://docs.aws.amazon.com/sdk-for-net/v2/developer-guide/run-instance.html)

**Related videos:**

- [Right Size Your Services](https://www.youtube.com/watch?v=wcp1inFS78A)

**Related examples:**

- [Attribute based Instance Type Selection for Auto Scaling for Amazon EC2 Fleet](https://aws.amazon.com/blogs/aws/new-attribute-based-instance-type-selection-for-ec2-auto-scaling-and-ec2-fleet/)
- [Optimizing Amazon Elastic Container Service for cost using scheduled scaling](https://aws.amazon.com/blogs/containers/optimizing-amazon-elastic-container-service-for-cost-using-scheduled-scaling/)
- [Predictive scaling with Amazon EC2 Auto Scaling](https://aws.amazon.com/blogs/compute/introducing-native-support-for-predictive-scaling-with-amazon-ec2-auto-scaling/)
- [Optimize Costs and Gain Visibility into Usage with Amazon S3 Storage Lens](https://aws.amazon.com/getting-started/hands-on/amazon-s3-storage-lens/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_metrics.html*

---

# COST06-BP04 Consider using shared resources

For already-deployed services at the organization level for multiple business units, consider using shared resources to increase utilization and reduce total cost of ownership (TCO). Using shared resources can be a cost-effective option to centralize the management and costs by using existing solutions, sharing components, or both. Manage common functions like monitoring, backups, and connectivity either within an account boundary or in a dedicated account. You can also reduce cost by implementing standardization, reducing duplication, and reducing complexity.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Where multiple workloads cause the same function, use existing solutions and shared components to improve management and optimize costs. Consider using existing resources (especially shared ones), such as non-production database servers or directory services, to mitigate cloud costs by following security best practices and organizational regulations. For optimal value realization and efficiency, it is crucial to allocate costs back (using showback and chargeback) to the pertinent areas of the business driving consumption.

*Showback* refers to reports that break down cloud costs into attributable categories, such as consumers, business units, general ledger accounts, or other responsible entities. The goal of showback is to show teams, business units, or individuals the cost of their consumed cloud resources.

*Chargeback* means to allocate central service spend to cost units based on a strategy suitable for a specific financial management process. For customers, chargeback charges the cost incurred from one shared services account to different financial cost categories suitable for a customer reporting process. By establishing chargeback mechanisms, you can report costs incurred by different business units, products, and teams.

Workloads can be categorized as critical and non-critical. Based on this classification, use shared resources with general configurations for less critical workloads. To further optimize costs, reserve dedicated servers solely for critical workloads. Share resources or provision them across several accounts to manage them efficiently. Even with distinct development, testing, and production environments, secure sharing is feasible and does not compromise organizational structure.

To improve your understanding and optimize cost and usage for containerized applications, use split cost allocation data which helps you allocate costs to individual business entities based on how the application consumes shared compute and memory resources. Split cost allocation data helps you achieve task-level showback and chargeback in container workloads running on Amazon Elastic Container Service (Amazon ECS) or Amazon Elastic Kubernetes Service (Amazon EKS).

For distributed architectures, build a shared services VPC, which provides centralized access to shared services required by workloads in each of the VPCs. These shared services can include resources such as directory services or VPC endpoints. To reduce administrative overhead and cost, share resources from a central location instead of building them in each VPC.

When you use shared resources, you can save on operational costs, maximize resource utilization, and improve consistency. In a multi-account design, you can host some AWS services centrally and access them using several applications and accounts in a hub to save cost. You can use [AWS Resource Access Manager (AWS RAM)](https://aws.amazon.com/ram/) to share other common resources, such as [VPC subnets and AWS Transit Gateway attachments](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-vpc), [AWS Network Firewall](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-network-firewall), or [Amazon SageMaker AI pipelines](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-sagemaker). In a multi-account environment, use AWS RAM to create a resource once and share it with other accounts.

Organizations should tag shared costs effectively and verify that they do not have a significant portion of their costs untagged or unallocated. If you do not allocate shared costs effectively and no one takes accountability for shared costs management, shared cloud costs can spiral. You should know where you have incurred costs at the resource, workload, team, or organization level, as this knowledge enhances your understanding of the value delivered at the applicable level when compared to the business outcomes achieved. Ultimately, organizations benefit from cost savings as a result of sharing cloud infrastructure. Encourage cost allocation on shared cloud resources to optimize cloud spend.

### Implementation steps

- **Evaluate existing resources:** Review existing workloads that use similar services for your workload. Depending on the workload’s components, consider existing platforms if business logic or technical requirement allow.
- **Use resource sharing in AWS RAM and restrict accordingly:** Use AWS RAM to share resources with other AWS accounts within your organization. When you share resources, you don’t need to duplicate resources in multiple accounts, which minimizes the operational burden of resource maintenance. This process also helps you securely share the resources that you have created with roles and users in your account, as well as with other AWS accounts.
- **Tag resources:** Tag resources that are candidates for cost reporting and categorize them within cost categories. Activate these cost related resource tags for cost allocation to provide visibility of AWS resources usage. Focus on creating an appropriate level of granularity with respect to cost and usage visibility, and inﬂuence cloud consumption behaviors through cost allocation reporting and KPI tracking.

## Resources

**Related best practices:**

- [SEC03-BP08 Share resources securely within your organization](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_share_securely.html)

**Related documents:**

- [What is AWS Resource Access Manager?](https://docs.aws.amazon.com/ram/latest/userguide/what-is.html)
- [AWS services that you can use with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
- [Shareable AWS resources](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html)
- [AWS Cost and Usage (CUR) Queries](https://catalog.workshops.aws/cur-query-library/en-US)

**Related videos:**

- [AWS Resource Access Manager - granular access control with managed permissions](https://www.youtube.com/watch?v=X3HskbPqR2s)
- [How to design your AWS cost allocation strategy](https://pages.awscloud.com/aws-cfm-talks-how-to-design-your-AWS-cost-allocation-strategy-01122022.html)
- [AWS Cost Categories](https://www.youtube.com/watch?v=84GYnBBM0Cg)

**Related examples:**

- [How-to chargeback shared services: An AWS Transit Gateway example](https://aws.amazon.com/blogs/aws-cloud-financial-management/gs-chargeback-shared-services-an-aws-transit-gateway-example/)
- [How to build a chargeback/showback model for Savings Plans using the CUR](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-build-a-chargeback-showback-model-for-savings-plans-using-the-cur/)
- [Using VPC Sharing for a Cost-Effective Multi-Account Microservice Architecture](https://aws.amazon.com/blogs/architecture/using-vpc-sharing-for-a-cost-effective-multi-account-microservice-architecture/)
- [Improve cost visibility of Amazon EKS with AWS Split Cost Allocation Data](https://aws.amazon.com/blogs/aws-cloud-financial-management/improve-cost-visibility-of-amazon-eks-with-aws-split-cost-allocation-data/)
- [Improve cost visibility of Amazon ECS and AWS Batch with AWS Split Cost Allocation Data](https://aws.amazon.com/blogs/aws-cloud-financial-management/la-improve-cost-visibility-of-containerized-applications-with-aws-split-cost-allocation-data-for-ecs-and-batch-jobs/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_shared.html*

---
