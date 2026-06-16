# COST 5 — How do you evaluate cost when you select services?

**Pillar**: Cost Optimization  
**Best Practices**: 6

---

# COST05-BP01 Identify organization requirements for cost

Work with team members to define the balance between cost
optimization and other pillars, such as performance and reliability,
for this workload.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

In most organizations, the information technology (IT) department is comprised of multiple small teams, each with its own agenda and focus area, that reflects the specialisies and skills of its team members. You need to understand your organization’s overall objectives, priorities, goals and how each department or project contributes to these objectives. Categorizing all essential resources, including personnel, equipment, technology, materials, and external services, is crucial for achieving organizational objectives and comprehensive budget planning. Adopting this systematic approach to cost identification and understanding is fundamental for establishing a realistic and robust cost plan for the organization.

When selecting services for your workload, it is key that you understand your organization priorities. Create a balance between cost optimization and other AWS Well-Architected Framework pillars, such as performance and reliability. This process should be conducted systematically and regularly to reflect changes in the organization's objectives, market conditions, and operational dynamics. A fully cost-optimized workload is the solution that is most aligned to your organization’s requirements, not necessarily the lowest cost. Meet with all teams in your organization, such as product, business, technical, and finance to collect information. Evaluate the impact of tradeoffs between competing interests or alternative approaches to help make informed decisions when determining where to focus efforts or choosing a course of action.

For example, accelerating speed to market for new features may be emphasized over cost optimization, or you may choose a relational database for non-relational data to simplify the effort to migrate a system, rather than migrating to a database optimized for your data type and updating your application.

### Implementation steps

- **Identify organization requirements for cost:** Meet with team members from your organization, including those in product management, application owners, development and operational teams, management, and financial roles. Prioritize the Well-Architected pillars for this workload and its components. The output should be a list of the pillars in order. You can also add a weight to each pillar to indicate how much additional focus it has, or how similar the focus is between two pillars.
- **Address the technical debt and document it:** During the workload review, address the technical debt. Document a backlog item to revisit the workload in the future, with the goal of refactoring or re-architecting to optimize it further. It's essential to clearly communicate the trade-offs that were made to other stakeholders.

## Resources

**Related best practices:**

- [REL11-BP07 Architect your product to meet availability targets and uptime service level agreements (SLAs)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_service_level_agreements.html)
- [OPS01-BP06 Evaluate tradeoffs](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_tradeoffs.html)

**Related documents:**

- [AWS Total Cost of Ownership (TCO) Calculator](https://aws.amazon.com/tco-calculator/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [Cloud
products](https://aws.amazon.com/products/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_requirements.html*

---

# COST05-BP02 Analyze all components of the workload

Verify every workload component is analyzed, regardless of current
size or current costs. The review effort should reflect the
potential benefit, such as current and projected costs.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Workload components, which are designed to deliver business value
to the organization, may encompass various services. For each
component, one might choose specific AWS Cloud services to address
business needs. This selection could be influenced by factors such
as familiarity with or prior experience using these services.

After identifying your organization's requirements as mentioned in
[COST05-BP01
Identify organization requirements for cost](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_requirements.html), perform a
thorough analysis on all components in your workload. Analyze each
component considering current and projected costs and sizes.
Consider the cost of analysis against any potential workload
savings over its lifecycle. The effort expended on the analysis of
all components of this workload should correspond to the potential
savings or improvements anticipated from optimization of that
specific component. For example, if the cost of the proposed
resource is $10 per month, and under forecasted loads would not
exceed $15 per month, spending a day of effort to reduce costs by
50% (five dollars per month) could exceed the potential benefit
over the life of the system. Use a faster and more efficient
data-based estimation to create the best overall outcome for this
component.

Workloads can change over time, and the right set of services may
not be optimal if the workload architecture or usage changes.
Analysis for selection of services must incorporate current and
future workload states and usage levels. Implementing a service
for future workload state or usage may reduce overall costs by
reducing or removing the effort required to make future changes.
For example, using EMR Serverless might be the appropriate choice
initially. However, as consumption for that service increases,
transitioning to EMR on EC2 could reduce costs for that component
of the workload.

[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) and the AWS Cost and Usage Reports ([CUR](https://aws.amazon.com/aws-cost-management/aws-cost-and-usage-reporting/))
can analyze the cost of a proof of concept (PoC) or running
environment. You can also use [AWS Pricing Calculator](https://calculator.aws/#/) to estimate workload costs.

Write a workflow to be followed by technical teams to review their
workloads. Keep this workflow simple, but also cover all the
necessary steps to make sure the teams understand each component
of the workload and its pricing. Your organization can then follow
and customize this workflow based on the specific needs of each
team.

- **List each service in use for your
workload:** This is a good starting point. Identify
all of the services currently in use and where costs are
originate from.
- **Understand how pricing works for those
services:** Understand the
[pricing
model](https://aws.amazon.com/pricing/) of each service. Different AWS services have
different pricing models based on factors like usage volume,
data transfer, and feature-specific pricing.
- **Focus on the services that have
unexpected workload costs and that do not align with your
expected usage and business outcome:** Identify
outliers or services where the cost is not proportional to the
value or usage by using AWS Cost Explorer or AWS Cost and Usage Reports. It's important to correlate costs with business
outcomes to prioritize optimization efforts.
- **AWS Cost Explorer, CloudWatch Logs,
VPC Flow Logs, and Amazon S3 Storage Lens to understand the
root cause of those high costs:** These tools are
instrumental in the diagnosis of high costs. Each service
offers a different lens to view and analyze usage and costs.
For instance, Cost Explorer helps determine overall cost
trends, CloudWatch Logs provides operational insights, VPC
Flow Logs displays IP traffic, and Amazon S3 Storage Lens is
useful for storage analytics.
- **Use AWS Budgets to set budgets for
certain amounts for services or accounts:** Setting
budgets is a proactive way to manage costs. Use AWS Budgets to
set custom budget thresholds and receive alerts when costs
exceed those thresholds.
- **Configure Amazon CloudWatch alarms to
send billing and usage alerts:** Set up monitoring
and alerts for cost and usage metrics. CloudWatch alarms can
notify you when certain thresholds are breached, which
improves intervention response time.

Facilitate notable enhancement and financial savings over time
through strategic review of all workload components and
irrespective of their present attributes. The effort invested in
this review process should be deliberate, with careful
consideration of the potential advantages that might be realized.

### Implementation steps

- **List the workload
components:** Build a list of your workload's
components. Use this list to verify that each component was
analyzed. The effort spent should reflect the criticality to
the workload as defined by your organization's priorities.
Group together resources functionally to improve efficiency
(for example, production database storage, if there are
multiple databases).
- **Prioritize the component
list:** Take the component list and prioritize it
in order of effort. This is typically in order of the cost
of the component, from most expensive to least expensive or
the criticality as defined by your organization's
priorities.
- **Perform the analysis:** For
each component on the list, review the options and services
available, and choose the option that aligns best with your
organizational priorities.

## Resources

**Related documents:**

- [AWS Pricing Calculator](https://calculator.aws/#/)
- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [AWS Cloud
products](https://aws.amazon.com/products/)

**Related videos:**

- [AWS Cost Optimization Series: CloudWatch](https://www.youtube.com/watch?v=6imTJUGEzjU)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_analyze_all.html*

---

# COST05-BP03 Perform a thorough analysis of each component

Look at overall cost to the organization of each component.
Calculate the total cost of ownership by factoring in cost
of operations and management, especially when using managed
services by cloud provider. The review effort should reflect
potential benefit (for example, time spent analyzing is
proportional to component cost).

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Consider the time savings that will allow your team to focus on retiring technical
debt, innovation, value-adding features and building what differentiates the business.
For example, you might need to lift and shift (also known as rehost) your databases
from your on-premises environment to the cloud as rapidly as possible and optimize later.
It is worth exploring the possible savings attained by using managed services on AWS
that may remove or reduce license costs. Managed services on AWS remove the operational
and administrative burden of maintaining a service, such as patching or upgrading the
OS, and allow you to focus on innovation and business.

Since managed services operate at cloud scale, they can offer a lower cost per transaction
or service. You can make potential optimizations in order to achieve some tangible benefit,
without changing the core architecture of the application. For example, you may be looking
to reduce the amount of time you spend managing database instances by migrating to a
database-as-a-service platform like [Amazon Relational Database Service (Amazon RDS)](https://aws.amazon.com/rds/) or
migrating your application to a fully managed platform like [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/).

Usually, managed services have attributes that you can set to ensure sufficient capacity. You
must set and monitor these attributes so that your excess capacity is kept to a minimum and
performance is maximized. You can modify the attributes of AWS Managed Services using
the AWS Management Console or AWS APIs and SDKs to align resource needs with changing
demand. For example, you can increase or decrease the number of nodes on an Amazon EMR cluster (or an Amazon Redshift cluster) to scale out or in.

You can also pack multiple instances on an AWS resource to activate higher density usage.
For example, you can provision multiple small databases on a single Amazon Relational Database Service (Amazon RDS) database instance. As usage grows, you can migrate one of the
databases to a dedicated Amazon RDS database instance using a snapshot and restore process.

When provisioning workloads on managed services, you must understand the requirements
of adjusting the service capacity. These requirements are typically time, effort, and any
impact to normal workload operation. The provisioned resource must allow time for any
changes to occur, provision the required overhead to allow this. The ongoing effort required
to modify services can be reduced to virtually zero by using APIs and SDKs that are
integrated with system and monitoring tools, such as Amazon CloudWatch.

[Amazon RDS](https://aws.amazon.com/rds/), [Amazon Redshift](https://aws.amazon.com/redshift/), and [Amazon ElastiCache](https://aws.amazon.com/elasticache/) provide a managed database
service. [Amazon Athena](https://aws.amazon.com/athena/), [Amazon EMR](https://aws.amazon.com/emr/), and [Amazon OpenSearch Service](https://aws.amazon.com/opensearch-service/) provide a managed
analytics service.

[AMS](https://aws.amazon.com/managed-services/) is a service that
operates AWS infrastructure on behalf of enterprise customers and partners. It provides a
secure and compliant environment that you can deploy your workloads onto. AMS uses
enterprise cloud operating models with automation to allow you to meet your organization
requirements, move into the cloud faster, and reduce your on-going management costs.

**Implementation steps**

- **Perform a thorough analysis:**Using the component
list, work through each component from the highest priority to the lowest priority. For
the higher priority and more costly components, perform additional analysis and assess all
available options and their long term impact. For lower priority components, assess if
changes in usage would change the priority of the component, and then perform an analysis
of appropriate effort.
- **Compare managed and unmanaged resources:** Consider the
operational cost for the resources you manage and compare them with AWS managed resources.
For example, review your databases running on Amazon EC2 instances and compare with Amazon RDS options
(an AWS managed service) or Amazon EMR compared to running Apache Spark on Amazon EC2. When moving from a
self-managed workload to a AWS fully managed workload, research your options carefully. The
three most important factors to consider are the [type of managed service](https://aws.amazon.com/products/?&aws-products-all.q=managed) you want to use,
the process you will use to [migrate your data](https://aws.amazon.com/big-data/datalakes-and-analytics/migrations/) and understand the
[AWS shared responsibility model](https://aws.amazon.com/compliance/shared-responsibility-model/).

## Resources

**Related documents:**

- [AWS Total Cost of Ownership (TCO) Calculator](https://aws.amazon.com/tco-calculator/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [AWS Cloud
products](https://aws.amazon.com/products/)
- [AWS Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/)

**Related videos:**

- [Why move to a managed database?](https://www.youtube.com/watch?v=VRFdc-MVa4I)
- [What is Amazon EMR and how can I use it for processing data?](https://www.youtube.com/watch?v=jylp2atrZjc)

**Related examples:**

- [Why to move to a managed database](https://aws.amazon.com/getting-started/hands-on/move-to-managed/why-move-to-a-managed-database/)
- [Consolidate data from identical SQL Server databases into a single Amazon RDS for SQL Server database using AWS DMS](https://aws.amazon.com/blogs/database/consolidate-data-from-identical-sql-server-databases-into-a-single-amazon-rds-for-sql-server-database-using-aws-dms/)
- [Deliver data at scale to Amazon Managed Streaming for Apache Kafka (Amazon MSK)](https://aws.amazon.com/getting-started/hands-on/deliver-data-at-scale-to-amazon-msk-with-iot-core/?ref=gsrchandson)
- [Migrate an ASP.NET web application to AWS Elastic Beanstalk](https://aws.amazon.com/getting-started/hands-on/migrate-aspnet-web-application-elastic-beanstalk/?ref=gsrchandson&id=itprohandson)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_thorough_analysis.html*

---

# COST05-BP04 Select software with cost-effective licensing

Open-source software eliminates software licensing costs, which can
contribute significant costs to workloads. Where licensed software
is required, avoid licenses bound to arbitrary attributes such as
CPUs, look for licenses that are bound to output or outcomes. The
cost of these licenses scales more closely to the benefit they
provide.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Open source originated in the context of software development to indicate that the software complies with certain free distribution criteria. Open source software is composed of source code that anyone can inspect, modify, and enhance. Based on business requirements, skill of engineers, forecasted usage, or other technology dependencies, organizations can consider using open source software on AWS to minimize their license costs. In other words, the cost of software licenses can be reduced through the use of [open source software](https://aws.amazon.com/what-is/open-source/). This can have significant impact on workload costs as the size of the workload scales.

Measure the benefits of licensed software against the total cost to optimize your workload. Model any changes in licensing and how they would impact your workload costs. If a vendor changes the cost of your database license, investigate how that impacts the overall efficiency of your workload. Consider historical pricing announcements from your vendors for trends of licensing changes across their products. Licensing costs may also scale independently of throughput or usage, such as licenses that scale by hardware (CPU bound licenses). These licenses should be avoided because costs can rapidly increase without corresponding outcomes.

For instance, operating an Amazon EC2 instance in us-east-1 with a Linux operating system allows you to cut costs by approximately 45%, compared to running another Amazon EC2 instance that runs on Windows.

The [AWS Pricing Calculator](https://calculator.aws/) offers a comprehensive way to compare the costs of various resources with different license options, such as Amazon RDS instances and different database engines. Additionally, the AWS Cost Explorer provides an invaluable perspective for the costs of existing workloads, especially those that come with different licenses. For license management, [AWS License Manager](https://aws.amazon.com/license-manager) offers a streamlined method to oversee and handle software licenses. Customers can deploy and operationalize their preferred open source software in the AWS Cloud.

### Implementation steps

- **Analyze license options:** Review the licensing terms of available software. Look for open source versions that have the required functionality, and whether the benefits of licensed software outweigh the cost. Favorable terms align the cost of the software to the benefits it provides.
- **Analyze the software provider:** Review any historical pricing or licensing changes from the vendor. Look for any changes that do not align to outcomes, such as punitive terms for running on specific vendors hardware or platforms. Additionally, look for how they perform audits, and penalties that could be imposed.

## Resources

**Related documents:**

- [Open Source at AWS](https://aws.amazon.com/opensource/)
- [AWS Total Cost of Ownership (TCO) Calculator](https://aws.amazon.com/tco-calculator/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [Cloud
products](https://aws.amazon.com/products/)

**Related examples:**

- [Open Source Blogs](https://aws.amazon.com/blogs/opensource/)
- [AWS Open Source Blogs](https://aws.github.io/)
- [Optimization and Licensing Assessment](https://aws.amazon.com/optimization-and-licensing-assessment/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_licensing.html*

---

# COST05-BP05 Select components of this workload to optimize cost in line with organization priorities

Factor in cost when selecting all components for your workload. This
includes using application-level and managed services or serverless,
containers, or event-driven architecture to reduce overall cost.
Minimize license costs by using open-source software, software that
does not have license fees, or alternatives to reduce spending.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Consider the cost of services and options when selecting all
components. This includes using application level and managed
services, such as
[Amazon Relational Database Service](https://aws.amazon.com/rds/) (Amazon RDS),
[Amazon DynamoDB](https://aws.amazon.com/dynamodb/),
[Amazon Simple Notification Service](https://aws.amazon.com/sns/) (Amazon SNS), and
[Amazon Simple Email Service](https://aws.amazon.com/ses/) (Amazon SES) to reduce overall organization cost.

Use serverless and containers for compute, such as
[AWS Lambda](https://aws.amazon.com/lambda/) and
[Amazon Simple Storage Service](https://aws.amazon.com/s3/) (Amazon S3) for static websites.
Containerize your application if possible and use AWS Managed
Container Services such as
[Amazon Elastic Container Service](https://aws.amazon.com/ecs/) (Amazon ECS) or
[Amazon Elastic Kubernetes Service](https://aws.amazon.com/eks/) (Amazon EKS).

Minimize license costs by using open-source software, or software
that does not have license fees (for example, Amazon Linux for
compute workloads or migrate databases to Amazon Aurora).

You can use serverless or application-level services such as
[Lambda](https://aws.amazon.com/lambda/),
[Amazon Simple Queue Service (Amazon SQS)](https://aws.amazon.com/sqs/),
[Amazon SNS](https://aws.amazon.com/sqs/), and
[Amazon SES](https://aws.amazon.com/ses/). These services remove the need for
you to manage a resource and provide the function of code
execution, queuing services, and message delivery. The other
benefit is that they scale in performance and cost in line with
usage, allowing efficient cost allocation and attribution.

Using
[event-driven
architecture](https://aws.amazon.com/what-is/eda/) is also possible with serverless services.
Event-driven architectures are push-based, so everything happens
on demand as the event presents itself in the router. This way,
you’re not paying for continuous polling to check for an event.
This means less network bandwidth consumption, less CPU
utilization, less idle fleet capacity, and fewer SSL/TLS
handshakes.

For more information on serverless, see
[Well-Architected
Serverless Application lens whitepaper.](https://docs.aws.amazon.com/wellarchitected/latest/serverless-applications-lens/welcome.html)

### Implementation steps

- **Select each service to optimize
cost:** Using your prioritized list and analysis,
select each option that provides the best match with your
organizational priorities. Instead of increasing the
capacity to meet the demand, consider other options which
may give you better performance with lower cost. For
example, if you need to review expected traffic for your
databases on AWS, consider either increasing the instance
size or using Amazon ElastiCache services (Redis or Memcached)
to provide cached mechanisms for your databases.
- **Evaluate event-driven
architecture:** Using serverless architecture also
allows you to build event-driven architecture for
distributed microservice-based applications, which helps you
build scalable, resilient, agile and cost-effective
solutions.

## Resources

**Related documents:**

- [AWS Total Cost of Ownership (TCO) Calculator](https://aws.amazon.com/tco-calculator/)
- [AWS Serverless](https://aws.amazon.com/serverless/)
- [What is
Event-Driven Architecture](https://aws.amazon.com/what-is/eda/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [Cloud
products](https://aws.amazon.com/products/)
- [Amazon ElastiCache (Redis OSS)](https://aws.amazon.com/elasticache/redis)

**Related examples:**

- [Getting
started with event-driven architecture](https://aws.amazon.com/blogs/compute/getting-started-with-event-driven-architecture/)
- [Event-driven
architecture](https://aws.amazon.com/event-driven-architecture/)
- [How
Statsig runs 100x more cost-effectively using Amazon ElastiCache (Redis OSS)](https://aws.amazon.com/blogs/database/how-statsig-runs-100x-more-cost-effectively-using-amazon-elasticache-for-redis/)
- [Best
practices for working with AWS Lambda functions](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_select_for_cost.html*

---

# COST05-BP06 Perform cost analysis for different usage over time

Workloads can change over time. Some services or features are more
cost effective at different usage levels. By performing the analysis
on each component over time and at projected usage, the workload
remains cost-effective over its lifetime.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

As AWS releases new services and features, the optimal services for your workload may
change. Effort required should reflect potential benefits. Workload review frequency
depends on your organization requirements. If it is a workload of significant cost,
implementing new services sooner will maximize cost savings, so more frequent review can
be advantageous. Another initiation for review is change in usage patterns. Significant changes
in usage can indicate that alternate services would be more optimal.

If you need to move data into AWS Cloud, you can select any wide variety of services AWS
offers and partner tools to help you migrate your data sets, whether they are files,
databases, machine images, block volumes, or even tape backups. For example, to move a
large amount of data to and from AWS or process data at the edge, you can use one of
the AWS purpose-built devices to cost effectively move petabytes of data offline.
Another example is for higher data transfer rates, a direct connect service may be
cheaper than a VPN which provides the required consistent connectivity for your
business.

Based on the cost analysis for different usage over time, review your scaling activity.
Analyze the result to see if the scaling policy can be tuned to add instances with multiple
instance types and purchase options. Review your settings to see if the minimum can be
reduced to serve user requests but with a smaller fleet size, and add more resources to
meet the expected high demand.

Perform cost analysis for different usage over time by discussing with stakeholders in
your organization and use [AWS Cost Explorer’s](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-forecast.html) forecast feature to predict the potential
impact of service changes. Monitor usage level launches using AWS Budgets, CloudWatch
billing alarms and AWS Cost Anomaly Detection to identify and implement the most cost-effective
services sooner.

**Implementation steps**

- **Define predicted usage patterns:**Working with your
organization, such as marketing and product owners, document what the expected and
predicted usage patterns will be for the workload. Discuss with business stakeholders
about both historical and forecasted cost and usage increases and make sure increases
align with business requirements. Identify calendar days, weeks, or months where you
expect more users to use your AWS resources, which indicate that you should increase
the capacity of the existing resources or adopt additional services to reduce the cost
and increase performance.
- **Perform cost analysis at predicted usage:** Using the usage
patterns defined, perform analysis at each of these points. The analysis effort should reflect
the potential outcome. For example, if the change in usage is large, a thorough analysis should
be performed to verify any costs and changes. In other words, when cost increases, usage should
increase for business as well.

## Resources

**Related documents:**

- [AWS Total Cost of Ownership (TCO) Calculator](https://aws.amazon.com/tco-calculator/)
- [Amazon S3 storage classes](https://aws.amazon.com/s3/storage-classes/)
- [Cloud
products](https://aws.amazon.com/products/)
- [Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [Cloud Data Migration](https://aws.amazon.com/cloud-data-migration/)
- [AWS Snow Family](https://aws.amazon.com/snow/)

**Related videos:**

- [AWS OpsHub for Snow Family](https://www.youtube.com/watch?v=0Q7s7JiBCf0)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_analyze_over_time.html*

---
