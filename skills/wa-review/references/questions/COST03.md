# COST 3 — How do you monitor usage and cost?

**Pillar**: Cost Optimization  
**Best Practices**: 6

---

# COST03-BP01 Configure detailed information sources

Set up cost management and reporting tools for enhanced analysis and transparency of cost and usage data. Configure your workload to create log entries that facilitate the tracking and segregation of costs and usage.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Detailed billing information such as hourly granularity in cost management tools allow organizations to track their consumptions with further details and help them to identify some of the cost increase reasons. These data sources provide the most accurate view of cost and usage across your entire organization.

You can use AWS Data Exports to create exports of the AWS Cost and Usage Report (CUR) 2.0. This is the new and recommended way to receive your detailed cost and usage data from AWS. It provides daily or hourly usage granularity, rates, costs, and usage attributes for all chargeable AWS services (the same information as CUR), along with some improvements. All possible dimensions are in the CUR such as tagging, location, resource attributes, and account IDs.

There are three export types based on the type of export you want to create: a standard data export, an export to a cost and usage dashboard with Quick integration, or a legacy data export.

- **Standard data export:** A customized export of a table that delivers to Amazon S3 on a recurring basis.
- **Cost and usage dashboard:** An export and integration to Quick to deploy a pre-built cost and usage dashboard.
- **Legacy data export:** An export of the legacy AWS Cost and Usage Report (CUR).

You can create data exports with the following customizations:

- Include resource IDs
- Split cost allocation data
- Hourly granularity
- Versioning
- Compression type and file format

For your workloads that run containers on Amazon ECS or Amazon EKS, enable split cost allocation data so that you can allocate your container costs to individual business units and teams, based on how your container workloads consume shared compute and memory resources. Split cost allocation data introduces cost and usage data for new container-level resources to AWS Cost and Usage Report. Split cost allocation data is calculated by computing the cost of individual ECS services and tasks running on the cluster.

A cost and usage dashboard exports the cost and usage dashboard table to an S3 bucket on a recurring basis and deploys a prebuilt cost and usage dashboard to Quick. Use this option if you want to quickly deploy a dashboard of your cost and usage data without the ability for customization.

If desired, you can still export CUR in legacy mode, where you can integrate other processing services such as [AWS Glue](https://aws.amazon.com/glue/) to prepare the data for analysis and perform data analysis with [Amazon Athena](https://aws.amazon.com/athena/) using SQL to query the data.

### Implementation steps

- **Create data exports:** Create customized exports with the data you want and control the schema of your exports. Create billing and cost management data exports using basic SQL, and visualize your billing and cost management data by integrating with Quick. You can also export your data in standard mode to analyze your data with other processing tools like Amazon Athena.
- **Configure the cost and usage
report:** Using the billing console, configure at
least one cost and usage report. Configure a report with
hourly granularity that includes all identifiers and
resource IDs. You can also create other reports with
different granularities to provide higher-level summary
information.
- **Configure hourly granularity in Cost Explorer:** To access cost and usage data with hourly granularity for the past 14 days, consider enabling hourly and resource level data in the billing console.
- **Configure application
logging:** Verify that your application logs each
business outcome that it delivers so it can be tracked and
measured. Ensure that the granularity of this data is at
least hourly so it matches with the cost and usage data. For
more details on logging and monitoring,
see [Well-Architected
Operational Excellence Pillar](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html).

## Resources

**Related documents:**

- [AWS Data Exports](https://docs.aws.amazon.com/cur/latest/userguide/what-is-data-exports.html)
- [AWS Glue](https://aws.amazon.com/glue/)
- [Quick](https://aws.amazon.com/quicksight/)
- [AWS Cost Management Pricing](https://aws.amazon.com/aws-cost-management/pricing/)
- [Tagging
AWS resources](https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html)
- [Analyzing
your costs with Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [Managing
AWS Cost and Usage Reports](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-reports-costusage-managing.html)

**Related examples:**

- [AWS Account Setup](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/100_1_AWS_Account_Setup/README.html)
- [Data Exports for AWS Billing and Cost Management](https://aws.amazon.com/blogs/aws-cloud-financial-management/introducing-data-exports-for-billing-and-cost-management/)
- [AWS Cost Explorer Common Use Cases](https://aws.amazon.com/blogs/aws-cloud-financial-management/aws-cost-explorers-new-ui-and-common-use-cases/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_detailed_source.html*

---

# COST03-BP02 Add organization information to cost and usage

Define a tagging schema based on your organization, workload attributes, and cost allocation categories
so that you can filter and search for resources or monitor cost and usage in cost management tools. Implement
consistent tagging across all resources where possible by purpose, team, environment, or other criteria
relevant to your business.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Implement [tagging in AWS](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html) to add organization information to your resources, which will then
be added to your cost and usage information. A tag is a key-value pair — the key is defined and
must be unique across your organization, and the value is unique to a group of resources. An
example of a key-value pair is the key is `Environment`, with a value of `Production`. All
resources in the production environment will have this key-value pair. Tagging allows you
categorize and track your costs with meaningful, relevant organization information. You can
apply tags that represent organization categories (such as cost centers, application names,
projects, or owners), and identify workloads and characteristics of workloads (such as test
or production) to attribute your costs and usage throughout your organization.

When you apply tags to your AWS resources (such as Amazon Elastic Compute Cloud instances or Amazon Simple Storage Service buckets)
and activate the tags, AWS adds this information to your Cost and Usage Reports. You can
run reports and perform analysis on tagged and untagged resources to allow greater
compliance with internal cost management policies and ensure accurate attribution.

Creating and implementing an AWS tagging standard across your organization’s accounts
helps you manage and govern your AWS environments in a consistent and uniform manner.
Use [Tag Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html)
in AWS Organizations to define rules for how tags can be used on AWS resources in your accounts in AWS Organizations.
Tag Policies allow you to easily adopt a standardized approach for tagging AWS resources

[AWS Tag
Editor](https://docs.aws.amazon.com/ARG/latest/userguide/tag-editor.html) allows you to add, delete, and manage tags of multiple resources.
With Tag Editor, you search for the resources that you want to tag, and then manage tags
for the resources in your search results.

[AWS Cost
Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/) allows you to assign organization meaning to your costs, without
requiring tags on resources. You can map your cost and usage information to unique internal
organization structures. You define category rules to map and categorize costs using billing
dimensions, such as accounts and tags. This provides another level of management capability in
addition to tagging. You can also map specific accounts and tags to multiple projects.

**Implementation steps**

- **Define a tagging schema:** Gather all stakeholders from
across your business to define a schema. This typically includes people in technical,
financial, and management roles. Define a list of tags that all resources must have, as
well as a list of tags that resources should have. Verify that the tag names and values
are consistent across your organization.
- **Tag resources:**Using your defined cost attribution
categories, [place tags](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html) on all resources in your workloads according to the categories. Use
tools such as the CLI, Tag Editor, or AWS Systems Manager to increase efficiency.
- **Implement AWS Cost Categories:**You can create [Cost Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/)
without implementing tagging. Cost categories use the existing cost and usage dimensions.
Create category rules from your schema and implement them into cost categories.
- **Automate tagging:** To verify that you maintain high levels
of tagging across all resources, automate tagging so that resources are automatically
tagged when they are created. Use services such as [AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html) to verify that resources
are tagged when created. You can also create a custom solution to tag automatically using
Lambda functions or use a microservice that scans the workload periodically and removes any
resources that are not tagged, which is ideal for test and development environments.
- **Monitor and report on tagging:**To verify that you
maintain high levels of tagging across your organization, report and monitor the tags
across your workloads. You can use [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) to view the cost of tagged and untagged
resources, or use services such as [Tag Editor](https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html). Regularly review the number of untagged
resources and take action to add tags until you reach the desired level of tagging.

## Resources

**Related documents:**

- [Tagging Best Practices](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [AWS CloudFormation Resource Tag](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html)
- [AWS Cost Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/)
- [Tagging AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [Analyzing
your costs with AWS Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html)
- [Analyzing
your costs with Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [Managing
AWS Cost and Usage Reports](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-reports-costusage-managing.html)

**Related videos:**

- [How can I tag my AWS resources to divide up my bill by cost center or project](https://www.youtube.com/watch?v=3j9xyyKIg6w)
- [Tagging AWS Resources](https://www.youtube.com/watch?v=MX9DaAQS15I)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_org_information.html*

---

# COST03-BP03 Identify cost attribution categories

Identify organization categories such as business units, departments
or projects that could be used to allocate cost within your
organization to the internal consuming entities. Use those
categories to enforce spend accountability, create cost awareness
and drive effective consumption behaviors.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

The process of categorizing costs is crucial in budgeting,
accounting, financial reporting, decision making, benchmarking,
and project management. By classifying and categorizing expenses,
teams can gain a better understanding of the types of costs they
incur throughout their cloud journey helping teams make
informed decisions and manage budgets effectively.

Cloud spend accountability establishes a strong incentive for
disciplined demand and cost management. The result is
significantly greater cloud cost savings for organizations that
allocate most of their cloud spend to consuming business units or
teams. Moreover, allocating cloud spend helps organizations
adopt more best practices of centralized cloud governance.

Work with your finance team and other relevant stakeholders to
understand the requirements of how costs must be allocated within
your organization during your regular cadence calls. Workload
costs must be allocated throughout the entire lifecycle, including
development, testing, production, and decommissioning. Understand
how the costs incurred for learning, staff development, and idea
creation are attributed in the organization. This can be helpful
to correctly allocate accounts used for this purpose to training
and development budgets instead of generic IT cost budgets.

After defining your cost attribution categories with stakeholders
in your organization, use
[AWS Cost Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/) to group your cost and usage information
into meaningful categories in the AWS Cloud, such as cost for
a specific project, or AWS accounts for departments or business
units. You can create custom categories and map your cost and
usage information into these categories based on rules you define
using various dimensions such as account, tag, service, or charge
type. Once cost categories are set up, you can view your cost and
usage information by these categories, which allows your organization
to make better strategic and purchasing decisions. These
categories are visible in AWS Cost Explorer, AWS Budgets, and AWS Cost and Usage Report as well.

For example, create cost categories for your business units
(DevOps team), and under each category create multiple rules
(rules for each sub category) with multiple dimensions (AWS accounts, cost allocation tags, services or charge type) based on
your defined groupings. With cost categories, you can organize
your costs using a rule-based engine. The rules that you configure
organize your costs into categories. Within these rules, you can
filter by using multiple dimensions for each category such as
specific AWS accounts, AWS services, or charge types. You can then
use these categories across multiple products in the
[AWS Billing and Cost Management and Cost Management](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html)
[console](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/view-billing-dashboard.html).
This includes AWS Cost Explorer, AWS Budgets, AWS Cost and Usage Report, and AWS Cost Anomaly Detection.

As an example, the following diagram displays how to group
your costs and usage information in your organization by having
multiple teams (cost category), multiple environments (rules), and
each environment having multiple resources or assets (dimensions).

*Cost and usage organization chart*

You can create groupings of costs using cost categories as well.
After you create the cost categories (allowing up to 24 hours
after creating a cost category for your usage records to be
updated with values), they appear in
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/),
[AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html),
[AWS Cost and Usage Report](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html), and
[AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/). In AWS Cost Explorer and
AWS Budgets, a cost category appears as an additional billing
dimension. You can use this to filter for the specific cost
category value, or group by the cost category.

### Implementation steps

- **Define your organization
categories:** Meet with internal stakeholders and
business units to define categories that reflect your
organization's structure and requirements. These categories
should directly map to the structure of existing financial
categories, such as business unit, budget, cost center, or
department. Look at the outcomes the cloud delivers for your
business such as training or education, as these are also
organization categories.
- **Define your functional
categories:** Meet with internal stakeholders and
business units to define categories that reflect the
functions that you have within your business. This may be
the workload or application names, and the type of
environment, such as production, testing, or development.
- **Define AWS Cost
Categories:** Create cost categories to organize
your cost and usage information by using
[AWS Cost Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/) and map your AWS cost and
usage into
[meaningful
categories](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/create-cost-categories.html). Multiple categories can be assigned to a
resource, and a resource can be in multiple different
categories, so define as many categories as needed so that
you can
[manage
your costs](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html) within the categorized structure using AWS
Cost Categories.

## Resources

**Related documents:**

- [Tagging
AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [Using
Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
- [Analyzing
your costs with AWS Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html)
- [Analyzing
your costs with Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [Managing
AWS Cost and Usage Reports](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-reports-costusage-managing.html)
- [AWS Cost Categories](https://docs.aws.amazon.com/wellarchitected/latest/framework/aws-cost-management/aws-cost-categories/)
- [Managing
your costs with AWS Cost Categories](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html)
- [Creating
cost categories](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/create-cost-categories.html)
- [Tagging
cost categories](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tag-cost-categories.html)
- [Splitting
charges within cost categories](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/splitcharge-cost-categories.html)
- [AWS Cost Categories Features](https://aws.amazon.com/aws-cost-management/aws-cost-categories/features/)

**Related examples:**

- [Organize
your cost and usage data with AWS Cost Categories](https://aws.amazon.com/blogs/aws-cloud-financial-management/organize-your-cost-and-usage-data-with-aws-cost-categories/)
- [Managing
your costs with AWS Cost Categories](https://aws.amazon.com/aws-cost-management/resources/managing-your-costs-with-aws-cost-categories/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_define_attribution.html*

---

# COST03-BP04 Establish organization metrics

Establish the organization metrics that are required for this
workload. Example metrics of a workload are customer reports
produced, or web pages served to customers.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Understand how your workload’s output is measured against business success. Each
workload typically has a small set of major outputs that indicate performance. If you have a
complex workload with many components, then you can prioritize the list, or define and
track metrics for each component. Work with your teams to understand which metrics to
use. This unit will be used to understand the efficiency of the workload, or the cost for each
business output.

**Implementation steps**

- **Define workload outcomes:**Meet with the stakeholders in
the business and define the outcomes for the workload. These are a primary measure of
customer usage and must be business metrics and not technical metrics. There should be a
small number of high-level metrics (less than five) per workload. If the workload produces
multiple outcomes for different use cases, then group them into a single metric.
- **Define workload component outcomes:**Optionally, if you
have a large and complex workload, or can easily break your workload into components (such
as microservices) with well-defined inputs and outputs, define metrics for each component.
The effort should reflect the value and cost of the component. Start with the largest
components and work towards the smaller components.

## Resources

**Related documents:**

- [Tagging AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [Analyzing
your costs with AWS Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html)
- [Analyzing
your costs with Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [Managing
AWS Cost and Usage Reports](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-reports-costusage-managing.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_define_kpi.html*

---

# COST03-BP05 Configure billing and cost management tools

Configure cost management tools that meet your
organization's policies to manage and optimize cloud spending.
This includes services, tools, and resources to organize and track
cost and usage data, enhance control through consolidated billing
and access permission, improve planning through budgeting and
forecasts, receive notifications or alerts, and lower cost with
resources and pricing optimizations.

**Level of risk exposed if this best
practice is not established**: High

## Implementation guidance

To establish strong accountability, consider your account strategy
first as part of your cost allocation strategy. Get this right,
and you may not need to go any further. Otherwise, there can be
unawareness and further pain points.

To encourage accountability of cloud spend, grant users access to
tools that provide visibility into their costs and usage. AWS
recommends that you configure all workloads and teams for the
following purposes:

- **Organize:** Establish your
cost allocation and governance baseline with your own tagging
strategy and taxonomy. Create multiple AWS Accounts with tools
such as AWS Control Tower or AWS Organization. Tag the
supported AWS resources and categorize them meaningfully based
on your organization structure (business units, departments,
or projects). Tag account names for specific cost centers and
map them with AWS Cost Categories to group accounts for
business units to their cost centers so that business unit
owner can see multiple accounts' consumption in one place.
- **Access:** Track
organization-wide billing information in consolidated billing.
Verify the right stakeholders and business owners have access.
- **Control:** Build effective
governance mechanisms with the right guardrails to prevent
unexpected scenarios when using Service Control Policies
(SCP), tag policies, IAM policies and budget alerts. For
example, you can allow teams to create specific resources in
preferred regions only by using effective control mechanisms
and prevent resource creations without specific tag (such as
cost-center).
- **Current state:** Configure a
dashboard that shows current levels of cost and usage. The
dashboard should be available in a highly visible place within
the work environment like an operations dashboard. You can
export data and use the Cost and Usage Dashboard from the AWS
Cost Optimization Hub or any supported product to create this
visibility. You may need to create different dashboards for
different personas. For example, manager dashboard may differ
from an engineering dashboard.
- **Notifications:** Provide
notifications when cost or usage exceeds defined limits and
anomalies occur with AWS Budgets or AWS Cost Anomaly
Detection.
- **Reports:** Summarize all cost
and usage information. Raise awareness and accountability of
your cloud spend with detailed, attributable cost data. Create
reports that are relevant to the team consuming them and
contain recommendations.
- **Tracking:** Show the current
cost and usage against configured goals or targets.
- **Analysis:** Allow team
members to perform custom and deep analysis down to the
hourly, daily or monthly granularity with different filters
(resource, account, tag, etc.).
- **Inspect:** Stay up to date
with your resource deployment and cost optimization
opportunities. Get notifications using Amazon CloudWatch,
Amazon SNS, or Amazon SES for resource deployments at the
organization level. Review cost optimization recommendations
with AWS Trusted Advisor or AWS Compute Optimizer.
- **Trend reports:** Display the
variability in cost and usage over the required period with
the required granularity.
- **Forecasts:** Show estimated
future costs, estimate your resource usage, and spend with
forecast dashboards you create.

You can use
[AWS Cost Optimization Hub](https://aws.amazon.com/aws-cost-management/cost-optimization-hub/) to understand potential cost-saving
opportunities consolidated from a centralized location and create
data exports for integration with Amazon Athena. You can also use
the AWS Cost Optimization Hub to deploy the Cost and Usage
Dashboard, which utilizes Quick for interactive cost
analysis and secure cost insight sharing.

If you don't have essential skills or bandwidth in your
organization, you can work with
[AWS ProServ](https://aws.amazon.com/professional-services/),
[AWS Managed Services (AMS)](https://aws.amazon.com/managed-services/), or
[AWS Partners](https://aws.amazon.com/partners/). You can also use third-party tools but
ensure you validate the value proposition.

### Implementation steps

- **Allow team-based access to
tools:** Configure your accounts and create groups
that have access to the required cost and usage reports for
their consumptions and use
[AWS Identity and Access Management](https://aws.amazon.com/iam/) to
[control
access](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-access.html) to the tools such as AWS Cost Explorer. These groups must include representatives from all
teams that own or manage an application. This certifies that
every team has access to their cost and usage information to
track their consumption.
- **Organize Costs Tags and
Categories:** organize your costs across teams,
business units, applications, environments, and projects.
Use resource tags to organize costs, by cost allocation
tags. Create Cost Categories based on the dimensions by using tags, accounts, services, etc. to map your costs.
- **Configure AWS Budgets:**
[Configure
AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html) on all accounts for your
workloads. Set budgets for the overall account spend, and
budgets for the workloads by using tags and cost categories.
Configure notifications in AWS Budgets to receive alerts for
when you exceed your budgeted amounts, or when your
estimated costs exceed your budgets.
- **Configure AWS Cost Anomaly
Detection:** Use
[AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/) for your accounts,
core services or cost categories you created to monitor your
cost and usage and detect unusual spends. You can receive
alerts individually in aggregated reports and receive alerts
in an email or an Amazon SNS topic which allows you to
analyze and determine the root cause of the anomaly and
identify the factor that is driving the cost increase.
- **Use cost analysis tools:**
Configure
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) for your workload and
accounts to visualize your cost data for further analysis.
Create a dashboard for the workload that tracks overall
spend, key usage metrics for the workload, and forecast of
future costs based on your historical cost data.
- **Use cost-saving analysis
tools:** Use AWS Cost Optimization Hub to identify
savings opportunities with tailored recommendations
including deleting unused resources, rightsizing, savings
Plans, reservations and compute optimizer recommendations.
- **Configure advanced tools:**
You can optionally create visuals to facilitate interactive
analysis and sharing of cost insights. With Data Exports on
AWS Cost Optimization Hub, you can create cost and usage
dashboard powered by Quick for your organization that
provides additional detail and granularity. You can also
implement advanced analysis capability by using data
exports in
[Amazon Athena](https://docs.aws.amazon.com/athena/?id=docs_gateway) for advanced queries, and create
dashboards on
[Quick](https://docs.aws.amazon.com/quicksight/?id=docs_gateway). Work with
[AWS Partners](https://aws.amazon.com/marketplace/solutions/business-applications/cloud-cost-management) to adopt cloud management
solutions for consolidated cloud bill monitoring and
optimization.

## Resources

**Related documents:**

- [What
is AWS Billing and Cost Management and Cost Management](https://docs.aws.amazon.com/cost-management/latest/userguide/what-is-costmanagement.html)?
- [Establishing
your best practice AWS environment](https://aws.amazon.com/organizations/getting-started/best-practices/)
- [Best
Practices for Tagging AWS Resources](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [Tagging
your AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [AWS Cost Categories](https://aws.amazon.com/aws-cost-management/aws-cost-categories/)
- [Analyzing
your costs with AWS Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html)
- [Analyzing
your costs with AWS Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [What
is AWS Data Exports](https://docs.aws.amazon.com/cur/latest/userguide/what-is-data-exports.html)?

**Related videos:**

- [Deploying
Cloud Intelligence Dashboards](https://www.youtube.com/watch?v=FhGZwfNJTnc)
- [Get
Alerts on any FinOps or Cost Optimization Metric or
KPI](https://www.youtube.com/watch?v=dzRKDSXCtAs)

**Related examples:**

- [Cost
and Usage Dashboard powered](https://aws.amazon.com/blogs/aws-cloud-financial-management/new-cost-and-usage-dashboard-powered-by-amazon-quicksight/) by Quick
- [AWS Cost and Usage Governance Workshop](https://catalog.workshops.aws/well-architected-cost-optimization/en-US/2-expenditure-and-usage-awareness/20-cost-and-usage-governance)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_config_tools.html*

---

# COST03-BP06 Allocate costs based on workload metrics

Allocate the workload's costs based on usage metrics or business outcomes to measure workload cost efficiency. Implement a process to analyze the cost and usage data with analytics services, which can provide insight and charge back capability.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Cost optimization means delivering business outcomes at the lowest price point, which can only be achieved by allocating workload costs based on workload metrics (measured by workload efficiency). Monitor the defined workload metrics through log files or other application monitoring. Combine this data with the workload’s costs, which can be obtained by looking at costs with a specific tag value or account ID. Perform this analysis at the hourly level. Your efficiency typically changes if you have static cost components (for example, a backend database running permanently) with a varying request rate (for example, usage peaks at nine in the morning to five in the evening, with few requests at night). Understanding the relationship between the static and variable costs helps you focus your optimization activities.

Creating workload metrics for shared resources may be challenging compared to resources like containerized applications on Amazon Elastic Container Service (Amazon ECS) and Amazon API Gateway. However, there are certain ways you can categorize usage and track cost. If you need to track Amazon ECS and AWS Batch shared resources, you can enable split cost allocation data in AWS Cost Explorer. With split cost allocation data, you can understand and optimize the cost and usage of your containerized applications and allocate application costs back to individual business entities based on how shared compute and memory resources are consumed.

### Implementation steps

- **Allocate costs to workload metrics:** Using the defined metrics and configured tags, create a metric that combines the workload output and workload cost. Use analytics services such as Amazon Athena and Amazon Quick to create an efficiency dashboard for the overall workload and any components.

## Resources

**Related documents:**

- [Tagging AWS resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
- [Analyzing
your costs with AWS Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html)
- [Analyzing
your costs with Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-explorer-what-is.html)
- [Managing
AWS Cost and Usage Reports](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-reports-costusage-managing.html)

**Related examples:**

- [Improve cost visibility of Amazon ECS and AWS Batch with AWS Split Cost Allocation Data](https://aws.amazon.com/blogs/aws-cloud-financial-management/la-improve-cost-visibility-of-containerized-applications-with-aws-split-cost-allocation-data-for-ecs-and-batch-jobs/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_allocate_outcome.html*

---
