# COST 2 — How do you govern usage?

**Pillar**: Cost Optimization  
**Best Practices**: 6

---

# COST02-BP01 Develop policies based on your organization requirements

Develop policies that define how resources are managed by your organization and inspect them periodically. Policies should cover the cost aspects of resources and workloads, including creation, modification, and decommissioning over a resource’s lifetime.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Understanding your organization’s costs and drivers is critical for managing your cost and usage effectively and identifying cost reduction opportunities. Organizations typically operate multiple workloads run by multiple teams. These teams can be in different organization units, each with its own revenue stream. The capability to attribute resource costs to the workloads, individual organization, or product owners drives efficient usage behaviour and helps reduce waste. Accurate cost and usage monitoring helps you understand how optimized a workload is, as well as how profitable organization units and products are. This knowledge allows for more informed decision making about where to allocate resources within your organization. Awareness of usage at all levels in the organization is key to driving change, as change in usage drives changes in cost. Consider taking a multi-faceted approach to becoming aware of your usage and expenditures.

The first step in performing governance is to use your organization’s requirements to develop policies for your cloud usage. These policies define how your organization uses the cloud and how resources are managed. Policies should cover all aspects of resources and workloads that relate to cost or usage, including creation, modification, and decommissioning over a resource’s lifetime. Verify that policies and procedures are followed and implemented for any change in a cloud environment. During your IT change management meetings, raise questions to find out the cost impact of planned changes, whether increasing or decreasing, the business justification, and the expected outcome.

Policies should be simple so that they are easily understood and can be implemented effectively throughout the organization. Policies also need to be easy to follow and interpret (so they are used) and specific (no misinterpretation between teams). Moreover, they need to be inspected periodically (like our mechanisms) and updated as customers business conditions or priorities change, which would make the policy outdated.

Start with broad, high-level policies, such as which geographic Region to use or times of the day that resources should be running. Gradually refine the policies for the various organizational units and workloads. Common policies include which services and features can be used (for example, lower performance storage in test and development environments), which types of resources can be used by different groups (for example, the largest size of resource in a development account is medium) and how long these resources will be in use (whether temporary, short term, or for a specific period of time).

**Policy example**

The following is a sample policy you can review to create your own cloud governance policies, which focus on cost optimization. Make sure you adjust policy based on your organization’s requirements and your stakeholders’ requests.

- **Policy name:** Define a clear policy name, such as Resource Optimization and Cost Reduction Policy.
- **Purpose:** Explain why this policy should be used and what is the expected outcome. The objective of this policy is to verify that there is a minimum cost required to deploy and run the desired workload to meet business requirements.
- **Scope:** Clearly define who should use this policy and when it should be used, such as DevOps X Team to use this policy in us-east customers for X environment (production or non-production).

**Policy statement**

- Select us-east-1or multiple us-east regions based on your workload’s environment and business requirement (development, user acceptance testing, pre-production, or production).
- Schedule Amazon EC2 and Amazon RDS instances to run between six in the morning and eight at night (Eastern Standard Time (EST)).
- Stop all unused Amazon EC2 instances after eight hours and unused Amazon RDS instances after 24 hours of inactivity.
- Terminate all unused Amazon EC2 instances after 24 hours of inactivity in non-production environments. Remind Amazon EC2 instance owner (based on tags) to review their stopped Amazon EC2 instances in production and inform them that their Amazon EC2 instances will be terminated within 72 hours if they are not in use.
- Use generic instance family and size such as m5.large and then resize the instance based on CPU and memory utilization using AWS Compute Optimizer.
- Prioritize using auto scaling to dynamically adjust the number of running instances based on traffic.
- Use spot instances for non-critical workloads.
- Review capacity requirements to commit saving plans or reserved instances for predictable workloads and inform Cloud Financial Management Team.
- Use Amazon S3 lifecycle policies to move infrequently accessed data to cheaper storage tiers. If no retention policy defined, use Amazon S3 Intelligent Tiering to move objects to archived tier automatically.
- Monitor resource utilization and set alarms to trigger scaling events using Amazon CloudWatch.
- For each AWS account, use AWS Budgets to set cost and usage budgets for your account based on cost center and business units.
- Using AWS Budgets to set cost and usage budgets for your account can help you stay on top of your spending and avoid unexpected bills, allowing you to better control your costs.

**Procedure:** Provide detailed procedures for implementing this policy or refer to other documents that describe how to implement each policy statement. This section should provide step-by-step instructions for carrying out the policy requirements.

To implement this policy, you can use various third-party tools or AWS Config rules to check for compliance with the policy statement and trigger automated remediation actions using AWS Lambda functions. You can also use AWS Organizations to enforce the policy. Additionally, you should regularly review your resource usage and adjust the policy as necessary to verify that it continues to meet your business needs.

## Implementation steps

- **Meet with stakeholders:** To develop policies, ask stakeholders (cloud business office, engineers, or functional decision makers for policy enforcement) within your organization to specify their requirements and document them. Take an iterative approach by starting broadly and continually refine down to the smallest units at each step. Team members include those with direct interest in the workload, such as organization units or application owners, as well as supporting groups, such as security and finance teams.
- **Get confirmation:** Make sure teams agree on policies who
can access and deploy to the AWS Cloud. Make sure they follow your organization’s policies
and confirm that their resource creations align with the agreed policies and procedures.
- **Create onboarding training sessions:** Ask new organization
members to complete onboarding training courses to create cost awareness and organization
requirements. They may assume different policies from their previous experience or not think
of them at all.
- **Define locations for your workload:**Define where
your workload operates, including the country and the area within the country. This
information is used for mapping to AWS Regions and Availability Zones.
- **Define and group services and resources:**Define the
services that the workloads require. For each service, specify the types, the size, and
the number of resources required. Define groups for the resources by function, such as
application servers or database storage. Resources can belong to multiple groups.
- **Define and group the users by function:**Define the users
that interact with the workload, focusing on what they do and how they use the workload,
not on who they are or their position in the organization. Group similar users or
functions together. You can use the AWS managed policies as a guide.
- **Define the actions:** Using the locations, resources,
and users identified previously, define the actions that are required by each to achieve
the workload outcomes over its life time (development, operation, and decommission).
Identify the actions based on the groups, not the individual elements in the groups, in
each location. Start broadly with read or write, then refine down to specific actions to
each service.
- **Define the review period:** Workloads and
organizational requirements can change over time. Define the workload review schedule to
ensure it remains aligned with organizational priorities.
- **Document the policies:**Verify the policies that have been
defined are accessible as required by your organization. These policies are used to
implement, maintain, and audit access of your environments.

## Resources

**Related documents:**

- [Change Management in the Cloud](https://docs.aws.amazon.com/whitepapers/latest/change-management-in-the-cloud/change-management-in-cloud.html)
- [AWS Managed Policies for Job Functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)
- [AWS multiple account billing strategy](https://aws.amazon.com/answers/account-management/aws-multi-account-billing-strategy/)
- [Actions,
Resources, and Condition Keys for AWS Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
- [AWS Management and Governance](https://aws.amazon.com/products/management-and-governance/)
- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)
- [Global
Infrastructures Regions and AZs](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/)

**Related videos:**

- [AWS Management and Governance at Scale](https://www.youtube.com/watch?v=xdJSUnPcPPI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_policies.html*

---

# COST02-BP02 Implement goals and targets

Implement both cost and usage goals and targets for your workload.
Goals provide direction to your organization on expected outcomes,
and targets provide specific measurable outcomes to be achieved for
your workloads.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Develop cost and usage goals and targets for your organization. As
a growing organization on AWS, it is important to set and track
goals for cost optimization. These goals or
[key
performance indicators (KPIs)](https://aws.amazon.com/blogs/aws-cloud-financial-management/unit-metric-the-touchstone-of-your-it-planning-and-evaluation/) can include things like
percent of spend on-demand or adoption of certain optimized
services such as AWS Graviton instances or gp3 EBS volume types.
Set measurable and achievable goals to help you measure efficiency
improvements, which is important for your business operations.
Goals provide guidance and direction to your organization on
expected outcomes.

Targets provide specific, measurable outcomes to be achieved. In
short, a goal is the direction you want to go, and a target is how
far in that direction and when that goal should be achieved (use
guidance of specific, measurable, assignable, realistic and
timely, or SMART). An example of a goal is that platform usage
should increase significantly, with only a minor (non-linear)
increase in cost. An example target is a 20% increase in platform
usage, with less than a five percent increase in costs. Another
common goal is that workloads need to be more efficient every six
months. The accompanying target would be that the cost per
business metrics needs to decrease by five percent every six
months. Use the right metrics, and set calculated KPIs for your
organization. You can start with basic KPIs and evolve later based
on business needs.

A goal for cost optimization is to increase workload efficiency,
which corresponds to a decrease in the cost per business outcome
of the workload over time. Implement this goal for all workloads,
and set a target like a five percent increase in efficiency every
six months to a year. In the cloud, you can achieve this through
the establishment of capability in cost optimization, as well as
new service and feature releases.

Targets are the quantifiable benchmarks you want to reach to meet
your goals and benchmarks compare your actual results against a
target. Establish benchmarks
with KPIs for the cost per unit of compute services (such as Spot
adoption, Graviton adoption, latest instance types, and On-Demands
coverage), storage services (such as EBS GP3 adoption, obsolete
EBS snapshots, and Amazon S3 standard storage), or database
service usage (such as RDS open-source engines, Graviton adoption,
and On-demand coverage). These benchmarks and KPIs can help you
verify that you use AWS services in the most cost-effective
manner.

The following table provides a list of standard AWS metrics for
reference. Each organization can have different target values for
these KPIs.

Category

KPI (%)

Description

Compute

EC2 usage Coverage

EC2 instances (in cost or hours) using SP+RI+Spot compared
to total (in cost or hours) of EC2 instances

Compute

Compute SP/RI utilization

Utilized SP or RI hours compared to total available SP or
RI hours

Compute

EC2/Hour cost

EC2 cost divided by the number of EC2 instances running in
that hour

Compute

vCPU cost

Cost per vCPU for all instances

Compute

Latest Instance Generation

Percentage of instances on Graviton (or other modern
generation instance types)

Database

RDS coverage

RDS instances (in cost or hours) using RI compared to
total (in cost or hours) of RDS instances

Database

RDS utilization

Utilized RI hours compared to total available RI hours

Database

RDS uptime

RDS cost divided by the number of RDS instances running in
that hour

Database

Latest Instance Generation

Percentage of instances on Graviton (or other modern
instance types)

Storage

Storage utilization

Optimized storage cost (for example Glacier, deep archive,
or Infrequent Access) divided by total storage cost

Tagging

Untagged resources

Cost Explorer:

1. Filter out credits, discounts, taxes, refunds,
marketplace, and copy the latest monthly cost

2. Select **Show only untagged
resources** in Cost Explorer

3. Divide the amount in **untagged
resources** with your monthly cost.

Using this table, include target or benchmark values, which should
be calculated based on your organizational goals. You need to
measure certain metrics for your business and understand business
outcome for that workload to define accurate and realistic KPIs.
When you evaluate performance metrics within an organization,
distinguish between different types of metrics that serve distinct
purposes. These metrics primarily measure the performance and
efficiency of the technical infrastructure rather than directly
the overall business impact. For instance, they might track server
response times, network latency, or system uptime. These metrics
are crucial to assess how well the infrastructure supports the
organization's technical operations. However, they don't provide
direct insight into broader business objectives like customer
satisfaction, revenue growth, or market share. To gain a
comprehensive understanding of business performance, complement
these efficiency metrics with strategic business metrics that
directly correlate with business outcomes.

Establish near real-time visibility over your KPIs and related
savings opportunities and track your progress over time. To get
started with the definition and tracking of KPI goals, we
recommend the KPI dashboard from
[Cloud
Intelligence Dashboards](https://wellarchitectedlabs.com/cloud-intelligence-dashboards/) (CID). Based on the data from Cost
and Usage Report (CUR), the KPI dashboard provides a series of
recommended cost optimization KPIs, with the ability to set custom
goals and track progress over time.

If you have other solutions to set and track KPI goals, make sure
these methods are adopted by all cloud financial management
stakeholders in your organization.

### Implementation steps

- **Define expected usage
levels:** To begin, focus on usage levels. Engage
with the application owners, marketing, and greater business
teams to understand what the expected usage levels are for the
workload. How might customer demand change over time, and what
can change due to seasonal increases or marketing campaigns?
- **Define workload resourcing and
costs:** With usage levels defined, quantify the
changes in workload resources required to meet those usage
levels. You may need to increase the size or number of
resources for a workload component, increase data transfer, or
change workload components to a different service at a
specific level. Specify the costs at each of these major
points, and predict the change in cost when there is a change
in usage.
- **Define business goals:** Take
the output from the expected changes in usage and cost,
combine this with expected changes in technology, or any
programs that you are running, and develop goals for the
workload. Goals must address usage and cost, as well as the
relationship between the two. Goals must be simple,
high-level, and help people understand what the business
expects in terms of outcomes (such as making sure unused
resources are kept below certain cost level). You don't need
to define goals for each unused resource type or define costs
that can cause losses in goals and targets. Verify that there
are organizational programs (for example, capability building
like training and education) if there are expected changes in
cost without changes in usage.
- **Define targets:** For each of
the defined goals, specify a measurable target. If the goal is
to increase efficiency in the workload, the target should
quantify the amount of improvement (typically in business
outputs for each dollar spent) and when it should be
delivered. For example, you could set a goal to minimize waste
due to over-provisioning. With this goal, your target can be
that waste due to compute over-provisioning in the first tier
of production workloads should not exceed ten percent of tier
compute cost. Additionally, a second target could be that
waste due to compute over-provisioning in the second tier of
production workloads should not exceed five percent of tier
compute cost.

## Resources

**Related documents:**

- [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)
- [AWS multiple account billing strategy](https://aws.amazon.com/answers/account-management/aws-multi-account-billing-strategy/)
- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)
- [S.M.A.R.T.
Goals](https://en.wikipedia.org/wiki/SMART_criteria)
- [How
to track your cost optimization KPIs with the CID KPI
Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-track-your-cost-optimization-kpis-with-the-kpi-dashboard/)

**Related videos:**

- [Well-Architected
Labs: Goals and Targets (Level 100)](https://catalog.workshops.aws/well-architected-cost-optimization/en-US/2-expenditure-and-usage-awareness/150-goals-and-targets)

**Related examples:**

- [What
is a unit metric](https://aws.amazon.com/blogs/aws-cloud-financial-management/what-is-a-unit-metric/)?
- [Selecting
a unit metric to support your business](https://aws.amazon.com/blogs/aws-cost-management/selecting-a-unit-metric-to-support-your-business/)
- [Unit
metrics in practice – lessons learned](https://aws.amazon.com/blogs/aws-cost-management/unit-metrics-in-practice-lessons-learned/)
- [How
unit metrics help create alignment between business
functions](https://aws.amazon.com/blogs/aws-cost-management/unit-metrics-help-create-alignment-between-business-functions/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_goal_target.html*

---

# COST02-BP03 Implement an account structure

Implement a structure of accounts that maps to your organization.
This assists in allocating and managing costs throughout your
organization.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS Organizations allows you to create multiple AWS accounts which can help you centrally
govern your environment as you scale your workloads on AWS. You can model your organizational
hierarchy by grouping AWS accounts in organizational unit (OU) structure and creating multiple
AWS accounts under each OU. To create an account structure, you need to decide which of your AWS accounts
will be the management account first. After that, you can create
new AWS accounts or select existing accounts as member accounts based on your designed account
structure by following [management account best practices](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices_mgmt-acct.html)
and [member account best practices](https://docs.aws.amazon.com/organizations/latest/userguide/best-practices_member-acct.html).

It is advised to always have at least one management account with one member account linked to it,
regardless of your organization size or usage. All workload resources should reside only within member
accounts and no resource should be created in management account. There is no one size fits all answer
for how many AWS accounts you should have. Assess your current and future operational and cost models
to ensure that the structure of your AWS accounts reflects your organization’s goals. Some companies
create multiple AWS accounts for business reasons, for example:

- Administrative or fiscal and billing isolation is required between organization
units, cost centers, or specific workloads.
- AWS service limits are set to be specific to particular workloads.
- There is a requirement for isolation and separation between workloads and
resources.

Within [AWS Organizations](https://aws.amazon.com/organizations/),
[consolidated billing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html)
creates the construct between one or more member accounts and
the management account. Member accounts allow you to isolate and distinguish your cost and
usage by groups. A common practice is to have separate member accounts for each organization
unit (such as finance, marketing, and sales), or for each environment lifecycle (such as
development, testing and production), or for each workload (workload a, b, and c), and then
aggregate these linked accounts using consolidated billing.

Consolidated billing allows you to consolidate payment for multiple member AWS accounts
under a single management account, while still providing visibility for each linked account’s
activity. As costs and usage are aggregated in the management account, this allows you to
maximize your service volume discounts, and maximize the use of your commitment
discounts (Savings Plans and Reserved Instances) to achieve the highest discounts.

The following diagram shows how you can use AWS Organizations with organizational units (OU)
to group multiple accounts, and place multiple AWS accounts under each OU. It is recommended
to use OUs for various use cases and workloads which provides patterns for organizing accounts.

*Example of grouping multiple AWS accounts under organizational units.*

[AWS Control Tower](https://aws.amazon.com/controltower/)
can quickly set up and configure multiple AWS accounts, ensuring that governance is aligned
with your organization’s requirements.

**Implementation steps**

- **Define separation requirements:**Requirements for separation
are a combination of multiple factors, including security, reliability, and financial constructs.
Work through each factor in order and specify whether the workload or workload environment
should be separate from other workloads. Security promotes adhesion to access and data
requirements. Reliability manages limits so that environments and workloads do not impact
others. Review the security and reliability pillars of the Well-Architected Framework
periodically and follow the provided best practices. Financial constructs create strict
financial separation (different cost center, workload ownerships and accountability).
Common examples of separation are production and test workloads being run in separate
accounts, or using a separate account so that the invoice and billing data can be provided
to the individual business units or departments in the organization or stakeholder who
owns the account.
- **Define grouping requirements:** Requirements for grouping
do not override the separation requirements, but are used to assist management. Group
together similar environments or workloads that do not require separation. An example
of this is grouping multiple test or development environments from one or more workloads
together.
- **Define account structure:**Using these separations and
groupings, specify an account for each group and maintain separation requirements.
These accounts are your member or linked accounts. By grouping these member accounts
under a single management or payer account, you combine usage, which allows for greater
volume discounts across all accounts, which provides a single bill for all accounts.
It's possible to separate billing data and provide each member account with an individual
view of their billing data. If a member account must not have its usage or billing data
visible to any other account, or if a separate bill from AWS is required, define multiple
management or payer accounts. In this case, each member account has its own management or
payer account. Resources should always be placed in member or linked accounts. The management
or payer accounts should only be used for management.

## Resources

**Related documents:**

- [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
- [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)
- [AWS multiple account billing strategy](https://aws.amazon.com/answers/account-management/aws-multi-account-billing-strategy/)
- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)
- [AWS Control Tower](https://aws.amazon.com/controltower/)
- [AWS Organizations](https://aws.amazon.com/organizations/)
- Best practices for [management accounts](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices_mgmt-acct.html)
and [member accounts](https://docs.aws.amazon.com/organizations/latest/userguide/best-practices_member-acct.html)
- [Organizing Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)
- [Turning on shared reserved instances and Savings Plans discounts](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-turn-on-process.html)
- [Consolidated billing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html)
- [Consolidated billing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html)

**Related examples:**

- [Splitting
the CUR and Sharing Access](https://wellarchitectedlabs.com/Cost/Cost_and_Usage_Analysis/300_Splitting_Sharing_CUR_Access/README.html)

**Related videos:**

- [Introducing AWS Organizations](https://www.youtube.com/watch?v=T4NK8fv8YdI)
- [Set Up a Multi-Account AWS
Environment that Uses Best Practices for AWS Organizations](https://www.youtube.com/watch?v=uOrq8ZUuaAQ)

**Related examples:**

- [Defining an AWS Multi-Account Strategy for telecommunications companies](https://aws.amazon.com/blogs/industries/defining-an-aws-multi-account-strategy-for-telecommunications-companies/)
- [Best Practices for Optimizing AWS accounts](https://aws.amazon.com/blogs/architecture/new-whitepaper-provides-best-practices-for-optimizing-aws-accounts/)
- [Best Practices for Organizational Units with AWS Organizations](https://aws.amazon.com/blogs/mt/best-practices-for-organizational-units-with-aws-organizations/?org_product_gs_bp_OUBlog)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_account_structure.html*

---

# COST02-BP04 Implement groups and roles

Implement groups and roles that align to your policies and control
who can create, modify, or decommission instances and resources in
each group. For example, implement development, test, and production
groups. This applies to AWS services and third-party solutions.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

User roles and groups are fundamental building blocks in the design and implementation of secure and efficient systems. Roles and groups help organizations balance the need for control with the requirement for flexibility and productivity, ultimately supporting organizational objectives and user needs. As recommended in [Identity and access management](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/identity-and-access-management.html) section of AWS Well-Architected Framework Security Pillar, you need robust identity management and permissions in place to provide access to the right resources for the right people under the right conditions. Users receive only the access necessary to complete their tasks. This minimizes the risk associated with unauthorized access or misuse.

After you develop policies, you can create logical groups and user roles within your organization. This allows you to assign permissions, control usage, and help implement robust access control mechanisms, preventing unauthorized access to sensitive information. Begin with high-level groupings of people. Typically, this aligns with organizational units and job roles (for example, a systems administrator in the IT Department, financial controller, or business analysts). The groups categorize people that do similar tasks and need similar access. Roles define what a group must do. It is easier to manage permissions for groups and roles than for individual users. Roles and groups assign permissions consistently and systematically across all users, preventing errors and inconsistencies.

When a user’s role changes, administrators can adjust access at the role or group level, rather than reconfiguring individual user accounts. For example, a systems administrator in IT requires access to create all resources, but an analytics team member only needs to create analytics resources.

### Implementation steps

- **Implement groups:**Using the groups of users defined
in your organizational policies, implement the corresponding groups, if necessary. For best practices on users, groups and authentication, see the [Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html) of the AWS Well-Architected Framework.
- **Implement roles and policies:**Using the actions
defined in your organizational policies, create the required roles and access policies.
For best practices on roles and policies, see the [Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html) of the AWS Well-Architected Framework.

## Resources

**Related documents:**

- [AWS managed policies for job functions](https://docs.aws.amazon.com/iam/latest/UserGuide/access_policies_job-functions.html)
- [AWS multiple account billing strategy](https://aws.amazon.com/answers/account-management/aws-multi-account-billing-strategy/)
- [AWS Well-Architected Framework
Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Identity and Access Management (IAM)](https://aws.amazon.com/iam/)
- [AWS Identity and Access Management policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)

**Related videos:**

- [Why use Identity and Access Management](https://www.youtube.com/watch?v=SXSqhTn2DuE)

**Related examples:**

- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)
- [Starting your Cloud Financial Management journey: Cloud cost operations](https://aws.amazon.com/blogs/aws-cloud-financial-management/op-starting-your-cloud-financial-management-journey/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_groups_roles.html*

---

# COST02-BP05 Implement cost controls

Implement controls based on organization policies and defined groups and roles.
These certify that costs are only incurred as defined by organization requirements
such as control access to regions or resource types.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

A common first step in implementing cost controls is to set up notifications when cost or
usage events occur outside of policies. You can act quickly and
verify if corrective action is required without restricting or negatively impacting workloads
or new activity. After you know the workload and environment limits, you can enforce
governance. [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/) allows you to set notifications and define monthly budgets for your AWS costs, usage, and commitment discounts (Savings Plans
and Reserved Instances). You can create budgets at an aggregate cost level (for example, all
costs), or at a more granular level where you include only specific dimensions such as linked
accounts, services, tags, or Availability Zones.

Once you set up your budget limits with AWS Budgets, use [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/) to reduce your unexpected
cost. AWS Cost Anomaly Detection is a cost management service that uses machine learning to continually monitor
your cost and usage to detect unusual spends. It helps you identify anomalous spend and root causes, so you
can quickly take action. First, create a cost monitor in AWS Cost Anomaly Detection, then choose your
alerting preference by setting up a dollar threshold (such as an alert on anomalies with impact greater
than $1,000). Once you receive alerts, you can analyze the root cause behind the anomaly and impact on
your costs. You can also monitor and perform your own anomaly analysis in AWS Cost Explorer.

Enforce governance policies in AWS through [AWS Identity and Access Management](https://aws.amazon.com/iam/) and [AWS Organizations Service Control Policies (SCP)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html).
IAM allows you to securely manage access to AWS services and resources. Using IAM, you can control who can create or manage AWS resources,
the type of resources that can be created, and where they can be created. This minimizes the possibility of resources being created outside
of the defined policy. Use the roles and groups created previously and assign [IAM policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) to enforce the correct usage. SCP offers central
control over the maximum available permissions for all accounts in your organization, keeping your accounts stay within your access control
guidelines. SCPs are available only in an organization that has all features turned on, and you can configure the SCPs to either deny or allow
actions for member accounts by default. For more details on implementing access management, see the [Well-Architected Security Pillar whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html).

Governance can also be implemented through management of [AWS service quotas](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html). By ensuring
service quotas are set with minimum overhead and accurately maintained, you can minimize
resource creation outside of your organization’s requirements. To achieve this, you must
understand how quickly your requirements can change, understand projects in progress (both
creation and decommission of resources), and factor in how fast quota changes can be
implemented. [Service
quotas](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html) can be used to increase your quotas when required.

**Implementation steps**

- **Implement notifications on spend:** Using your defined
organization policies, create [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/) to notify you when spending is
outside of your policies. Configure multiple cost budgets, one for each account, which
notify you about overall account spending. Configure additional cost budgets within
each account for smaller units within the account. These units vary depending on your
account structure. Some common examples are AWS Regions, workloads (using tags), or
AWS services. Configure an email distribution list as the recipient for
notifications, and not an individual's email account. You can configure an actual budget
for when an amount is exceeded, or use a forecasted budget for notifying on forecasted
usage. You can also preconfigure AWS Budget Actions that can enforce specific IAM or SCP
policies, or stop target Amazon EC2 or Amazon RDS instances. Budget Actions can be started automatically
or require workflow approval.
- **Implement notifications on anomalous spend:** Use [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/)
to reduce your surprise costs in your organization and analyze root cause of potential anomalous spend.
Once you create cost monitor to identify unusual spend at your specified granularity and configure
notifications in AWS Cost Anomaly Detection, it sends you alert when unusual spend is detected.
This will allow you to analyze root cause behind the anomaly and understand the impact on your cost.
Use AWS Cost Categories while configuring AWS Cost Anomaly Detection to identify which project
team or business unit team can analyze the root cause of the unexpected cost and take timely necessary actions.
- **Implement controls on usage:**Using your defined
organization policies, implement IAM policies and roles to specify which actions users
can perform and which actions they cannot. Multiple organizational policies may be
included in an AWS policy. In the same way that you defined policies, start broadly and
then apply more granular controls at each step. Service limits are also an effective
control on usage. Implement the correct service limits on all your accounts.

## Resources

**Related documents:**

- [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)
- [AWS multiple account billing strategy](https://aws.amazon.com/answers/account-management/aws-multi-account-billing-strategy/)
- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)
- [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)
- [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/)
- [Control Your AWS Costs](https://aws.amazon.com/getting-started/hands-on/control-your-costs-free-tier-budgets/)

**Related videos:**

- [How can I use AWS Budgets to track my spending and usage](https://www.youtube.com/watch?v=Ris23gKc7s0)

**Related examples:**

- [Example IAM access management policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_examples.html)
- [Example service control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html)
- [AWS Budgets Actions](https://aws.amazon.com/blogs/aws-cloud-financial-management/get-started-with-aws-budgets-actions/)
- [Create IAM Policy to control access to Amazon EC2 resources using Tags](https://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/)
- [Restrict the access of IAM Identity to specific Amazon EC2 resources](https://aws.amazon.com/premiumsupport/knowledge-center/restrict-ec2-iam/)
- [Slack integrations for Cost Anomaly Detection using Amazon Q Developer in chat applications](https://aws.amazon.com/aws-cost-management/resources/slack-integrations-for-aws-cost-anomaly-detection-using-aws-chatbot/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_controls.html*

---

# COST02-BP06 Track project lifecycle

Track, measure, and audit the lifecycle of projects, teams, and
environments to avoid using and paying for unnecessary resources.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

By effectively tracking the project lifecycle, organizations can
achieve better cost control through enhanced planning, management,
and resource optimization. The insights gained through tracking
are invaluable for making informed decisions that contribute to
the cost-effectiveness and overall success of the project.

Tracking the entire lifecycle of the workload helps you understand
when workloads or workload components are no longer required. The
existing workloads and components may appear to be in use, but
when AWS releases new services or features, they can be
decommissioned or adopted. Check the previous stages of workloads.
After a workload is in production, previous environments can be
decommissioned or greatly reduced in capacity until they are
required again.

You can tag resources with a timeframe or reminder to pin the time
that the workload was reviewed. For example, if the development
environment was last reviewed months ago, it could be a good time
to review it again to explore if new services can be adopted or if
the environment is in use. You can group and tag your applications
with
[myApplications](https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/aws-myApplications.html)
on AWS to manage and track metadata such as criticality,
environment, last reviewed, and cost center. You can both track
your workload's lifecycle and monitor and manage the cost, health,
security posture, and performance of your applications.

AWS provides various management and governance services you can
use for entity lifecycle tracking. You can use
[AWS Config](https://aws.amazon.com/config/) or
[AWS Systems Manager](https://aws.amazon.com/systems-manager/) to provide a detailed inventory
of your AWS resources and configuration. It is recommended that
you integrate with your existing project or asset management
systems to keep track of active projects and products within your
organization. Combining your current system with the rich set of
events and metrics provided by AWS allows you to build a view of
significant lifecycle events and proactively manage resources to
reduce unnecessary costs.

Similar to
[Application
Lifecycle Management (ALM)](https://aws.amazon.com/what-is/application-lifecycle-management/), tracking project lifecycle
should involve multiple processes, tools, and teams working
together, such as design and development, testing, production,
support, and workload redundancy.

By carefully monitoring each phase of a project's lifecycle,
organizations gain crucial insights and enhanced control,
facilitating successful project planning, implementation, and
completion. This careful oversight verifies that projects not only
meet quality standards, but are delivered on time and within
budget, promoting overall cost efficiency.

For more details on implementing entity lifecycle tracking, see
[AWS Well-Architected Operational Excellence Pillar
whitepaper](https://aws.amazon.com/architecture/well-architected/).

### Implementation steps

- **Establish project lifecycle
monitoring process:**
[The
Cloud Center of Excellence team](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_function.html) must establish
project lifecycle monitoring process. Establish a structured
and systematic approach to monitoring workloads in order to
improve control, visibility, and performance of the
projects. Make the monitoring process transparent,
collaborative, and focused on continuous improvement to
maximize its effectiveness and value.
- **Perform workload reviews:**
As defined by your organizational policies, set up a regular
cadence to audit your existing projects and perform workload
reviews. The amount of effort spent in the audit should be
proportional to the approximate risk, value, or cost to the
organization. Key areas to include in the audit would be
risk to the organization of an incident or outage, value, or
contribution to the organization (measured in revenue or
brand reputation), cost of the workload (measured as total
cost of resources and operational costs), and usage of the
workload (measured in number of organization outcomes per
unit of time). If these areas change over the lifecycle,
adjustments to the workload are required, such as full or
partial decommissioning.

## Resources

**Related documents:**

- [Guidance
for Tagging on AWS](https://aws.amazon.com/solutions/guidance/tagging-on-aws/)
- [What
Is ALM (Application Lifecycle Management)?](https://aws.amazon.com/what-is/application-lifecycle-management/)
- [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)

**Related examples:**

- [Control
access to AWS Regions using IAM policies](https://aws.amazon.com/blogs/security/easier-way-to-control-access-to-aws-regions-using-iam-policies/)

**Related Tools**

- [AWS Config](https://aws.amazon.com/config/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)
- [AWS Organizations](https://aws.amazon.com/organizations/)
- [AWS CloudFormation](https://aws.amazon.com/cloudformation/?c=mg&sec=srv)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_track_lifecycle.html*

---
