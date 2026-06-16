# COST 1 — How do you implement cloud financial management?

**Pillar**: Cost Optimization  
**Best Practices**: 9

---

# COST01-BP01 Establish ownership of cost optimization

Create a team (Cloud Business Office, Cloud Center of Excellence, or FinOps team) that is responsible for establishing and maintaining cost awareness across your organization. The owner of cost optimization can be an individual or a team (requires people from finance, technology, and business teams) that understands the entire organization and cloud finance.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

This is the introduction of a Cloud Business Office (CBO) or Cloud Center of Excellence (CCOE) function or team that is responsible for establishing and maintaining a culture of cost awareness in cloud computing. This function can be an existing individual, a team within your organization, or a new team of key finance, technology, and organization stakeholders from across the organization.

The function (individual or team) prioritizes and spends the required percentage of their
time on cost management and cost optimization activities. For a small organization, the
function might spend a smaller percentage of time compared to a full-time function for a
larger enterprise.

The function requires a multi-disciplinary approach, with capabilities in project management, data science, financial analysis, and software or infrastructure development. They can improve workload efficiency by running cost optimizations within three different ownerships:

- **Centralized:** Through designated teams such as FinOps team, Cloud Financial Management (CFM) team, Cloud Business Office (CBO), or Cloud Center of Excellence (CCoE), customers can design and implement governance mechanisms and drive best practices company-wide.
- **Decentralized:** Influencing technology teams to run cost optimizations.
- **Hybrid:** Combination of both centralized and decentralized teams can work together to run cost optimizations.

The function may be measured against their ability to run and deliver against cost optimization goals (for example, workload efficiency metrics).

You must secure executive sponsorship for this function, which is a key success factor. The sponsor is regarded as a champion for cost efficient cloud consumption, and provides escalation support for the team to ensure that cost optimization activities are treated with the level of priority defined by the organization. Otherwise, guidance can be ignored and cost saving opportunities will not be prioritized. Together, the sponsor and team help your organization consume the cloud efficiently and deliver business value.

If you have the Business, Enterprise-On-Ramp or Enterprise [support plan](https://aws.amazon.com/premiumsupport/plans/) and need help building this team or function, reach out to your Cloud Financial Management (CFM) experts through your account team.

### Implementation steps

- **Define key members:** All relevant parts of your organization must contribute and be interested in cost management. Common teams within organizations typically include: finance, application or product owners, management, and technical teams (DevOps). Some are engaged full time (finance or technical), while others are engaged periodically as required. Individuals or teams performing CFM need the following set of skills:

**Software development:** in the case where scripts and
automation are being built out.
- **Infrastructure engineering:** to deploy scripts,
automate processes, and understand how services or resources are provisioned.
- **Operations acumen:** CFM is about operating on the
cloud efficiently by measuring, monitoring, modifying, planning, and scaling
efficient use of the cloud.

- **Define goals and metrics:**The function needs to deliver value to the organization in different ways. These goals are defined and continually evolve as the organization evolves. Common activities include: creating and running education programs on cost optimization across the organization, developing organization-wide standards, such as monitoring and reporting for cost optimization, and setting workload goals on optimization. This function also needs to regularly report to the organization on their cost optimization capability.

You can define value- or cost-based key performance indicators (KPIs). When you define the KPIs, you can calculate expected cost in terms of efficiency and expected business outcome. Value-based KPIs tie cost and usage metrics to business value drivers and help rationalize changes in AWS spend. The first step to deriving value-based KPIs is working together, cross-organizationally, to select and agree upon a standard set of KPIs.
- **Establish regular cadence:** The group (finance, technology and business teams) should come together regularly to review their goals and metrics. A typical cadence involves reviewing the state of the organization, reviewing any programs currently running, and reviewing overall financial and optimization metrics. Afterwards, key workloads are reported on in greater detail.

During these regular reviews, you can review workload efficiency (cost) and business outcome. For example, a 20% cost increase for a workload may align with increased customer usage. In this case, this 20% cost increase can be interpreted as an investment. These regular cadence calls can help teams to identify value KPIs that provide meaning to the entire organization.

## Resources

**Related documents:**

- [AWS CCOE Blog](https://aws.amazon.com/blogs/enterprise-strategy/tag/ccoe/)
- [Creating Cloud Business Office](https://aws.amazon.com/blogs/enterprise-strategy/creating-the-cloud-business-office/)
- [CCOE - Cloud Center of Excellence](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-laying-the-foundation/cloud-center-of-excellence.html)

**Related videos:**

- [Vanguard CCOE Success
Story](https://www.youtube.com/watch?v=0XA08hhRVFQ)

**Related examples:**

- [Using a Cloud Center of Excellence (CCOE) to Transform the Entire
Enterprise](https://aws.amazon.com/blogs/enterprise-strategy/using-a-cloud-center-of-excellence-ccoe-to-transform-the-entire-enterprise/)
- [Building a CCOE to transform the entire enterprise](https://docs.aws.amazon.com/whitepapers/latest/public-sector-cloud-transformation/building-a-cloud-center-of-excellence-ccoe-to-transform-the-entire-enterprise.html)
- [7 Pitfalls to Avoid When Building CCOE](https://aws.amazon.com/blogs/enterprise-strategy/7-pitfalls-to-avoid-when-building-a-ccoe/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_function.html*

---

# COST01-BP02 Establish a partnership between finance and technology

Involve finance and technology teams in cost and usage discussions at all stages of your
cloud journey. Teams regularly meet and discuss topics such as organizational goals and targets,
current state of cost and usage, and financial and accounting practices.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Technology teams innovate faster in the cloud due to shortened approval, procurement, and
infrastructure deployment cycles. This can be an adjustment for finance organizations
previously used to running time-consuming and resource-intensive processes for procuring and
deploying capital in data center and on-premises environments, and cost allocation only at
project approval.

From a finance and procurement organization perspective, the process for capital
budgeting, capital requests, approvals, procurement, and installing physical infrastructure is
one that has been learned and standardized over decades:

- Engineering or IT teams are typically the requesters
- Various finance teams act as approvers and procurers
- Operations teams rack, stack, and hand off ready-to-use infrastructure

With the adoption of cloud, infrastructure procurement and consumption are no longer
beholden to a chain of dependencies. In the cloud model, technology and product teams are no
longer just builders, but operators and owners of their products, responsible for most of the
activities historically associated with finance and operations teams, including procurement
and deployment.

All it really takes to provision cloud resources is an account, and the right set of
permissions. This is also what reduces IT and finance risk; which means teams are always a
just few clicks or API calls away from terminating idle or unnecessary cloud resources. This
is also what allows technology teams to innovate faster – the agility and ability to spin up
and then tear down experiments. While the variable nature of cloud consumption may impact
predictability from a capital budgeting and forecasting perspective, cloud provides
organizations with the ability to reduce the cost of over-provisioning, as well as reduce the
opportunity cost associated with conservative under-provisioning.

Establish a partnership between key finance and technology stakeholders to create a shared understanding of organizational goals and develop mechanisms to succeed financially in the variable spend model of cloud computing. Relevant teams within your organization must be involved in cost and usage discussions at all stages of your cloud journey, including:

- **Financial leads:** CFOs, financial controllers,
financial planners, business analysts, procurement, sourcing, and accounts payable must
understand the cloud model of consumption, purchasing options, and the monthly invoicing
process. Finance needs to partner with technology teams to create and socialize an IT
value story, helping business teams understand how technology spend is linked to business
outcomes. This way, technology expenditures are viewed not as costs, but rather as
investments. Due to the fundamental differences between the cloud (such as the rate of
change in usage, pay as you go pricing, tiered pricing, pricing models, and detailed
billing and usage information) compared to on-premises operation, it is essential that the
finance organization understands how cloud usage can impact business aspects including
procurement processes, incentive tracking, cost allocation and financial
statements.
- **Technology leads:** Technology leads (including product and
application owners) must be aware of the financial requirements (for example, budget
constraints) as well as business requirements (for example, service level agreements).
This allows the workload to be implemented to achieve the desired goals of the
organization.

The partnership of finance and technology provides the following benefits:

- Finance and technology teams have near real-time visibility into cost and usage.
- Finance and technology teams establish a standard operating procedure to handle cloud spend variance.
- Finance stakeholders act as strategic advisors with respect to how capital is used to purchase commitment discounts (for example, Reserved Instances or AWS Savings Plans), and how the cloud is used to grow the organization.
- Existing accounts payable and procurement processes are used with the cloud.
- Finance and technology teams collaborate on forecasting future AWS cost and usage to align and build organizational budgets.
- Better cross-organizational communication through a shared language, and common understanding of financial concepts.

Additional stakeholders within your organization that should be involved in cost and usage discussions include:

- **Business unit owners:** Business unit owners must understand
the cloud business model so that they can provide direction to both the business units and
the entire company. This cloud knowledge is critical when there is a need to forecast
growth and workload usage, and when assessing longer-term purchasing options, such as
Reserved Instances or Savings Plans.
- **Engineering team:**Establishing a partnership between finance
and technology teams is essential for building a cost-aware culture that encourages
engineers to take action on Cloud Financial Management (CFM). One of the common problems
of CFM or finance operations practitioners and finance teams is getting engineers to
understand the whole business on cloud, follow best practices, and take recommended
actions.
- **Third parties:**If your organization uses third parties (for
example, consultants or tools), ensure that they are aligned to your financial goals and
can demonstrate both alignment through their engagement models and a return on investment
(ROI). Typically, third parties will contribute to reporting and analysis of any workloads
that they manage, and they will provide cost analysis of any workloads that they
design.

Implementing CFM and achieving success requires collaboration across finance, technology,
and business teams, and a shift in how cloud spend is communicated and evaluated across the
organization. Include engineering teams so that they can be part of these cost and usage
discussions at all stages, and encourage them to follow best practices and take agreed-upon
actions accordingly.

**Implementation steps**

- **Define key members:**Verify that all relevant members of your
finance and technology teams participate in the partnership. Relevant finance members will
be those having interaction with the cloud bill. This will typically be CFOs, financial
controllers, financial planners, business analysts, procurement, and sourcing. Technology
members will typically be product and application owners, technical managers and
representatives from all teams that build on the cloud. Other members may include business
unit owners, such as marketing, that will influence usage of products, and third parties
such as consultants, to achieve alignment to your goals and mechanisms, and to assist with
reporting.
- **Define topics for discussion:** Define the topics that are
common across the teams, or will need a shared understanding. Follow cost from that time
it is created, until the bill is paid. Note any members involved, and organizational
processes that are required to be applied. Understand each step or process it goes through
and the associated information, such as pricing models available, tiered pricing, discount
models, budgeting, and financial requirements.
- **Establish regular cadence:**To create a finance and technology
partnership, establish a regular communication cadence to create and maintain alignment.
The group needs to come together regularly against their goals and metrics. A typical
cadence involves reviewing the state of the organization, reviewing any programs currently
running, and reviewing overall financial and optimization metrics. Then key workloads are
reported on in greater detail.

## Resources

**Related documents:**

- [AWS News Blog](https://aws.amazon.com/blogs/aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_partnership.html*

---

# COST01-BP03 Establish cloud budgets and forecasts

Adjust existing organizational budgeting and forecasting processes
to be compatible with the highly variable nature of cloud costs and
usage. Processes must be dynamic, using trend-based or business
driver-based algorithms or a combination of both.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

In traditional on-premises IT setups, customers often face the
challenge of planning for fixed costs that change only
occasionally, typically with the purchase of new IT hardware and
services to meet peak demand. In contrast, AWS Cloud adopts a
different approach, where customers pay for the resources they use
as dictated by their actual IT and business needs. In the cloud
environment, demand can fluctuate on a monthly, daily, or even
hourly basis.

Using the cloud brings efficiency, speed, and agility, which
results in a highly-variable cost and usage pattern. Costs can
decrease or sometimes increase in response to greater workload
efficiency or the deployment of new workloads and features. As
workloads scale to serve an expanding customer base, cloud usage
and costs correspondingly rise due to the increased accessibility
of resources. This flexibility in cloud services extends to the
costs and forecasts, which creates a degree of elasticity.

It's essential to align closely with these shifting business needs
and demand drivers, and aim for the most accurate planning
possible. Traditional organizational budget processes need to
adapt to accommodate this variability.

Consider cost modeling while you forecast the cost for new
workloads. Cost modeling creates a baseline understanding of
expected cloud costs, which helps you perform total cost of
ownership (TCO), return on investment (ROI), and other financial
analysis, set targets and expectations with stakeholders, and
identify opportunities for cost optimization.

Your organization should understand the cost definitions and
accepted groupings. The level of detail at which you forecast can
vary based on your organization's structure and internal
workflows. Select a granularity that suits your specific
requirements and organizational setup. It is important to
understand at what level the forecast is performed:

- **Management account or AWS Organizations
level:** The management account is the account that
you use to create AWS Organizations. Organizations have one
management account by default.
- **Linked or
member account:** An account in
Organizations is a standard AWS account that contains your AWS
resources and the identities that can access those resources.
- **Environment:** An environment
is a collection of AWS resources that runs an application
version. An environment can be made with multiple linked or
member accounts.
- **Project:** A project is a
combination of set objectives or tasks to be accomplished
within a fixed period. It is important to consider the project
lifecycle during your forecast.
- **AWS services:** Groups or
categories such as compute or storage services where you can
group AWS services for your forecast.
- **Custom grouping:** You can
create custom groups based on your organization's needs, such
as business units, cost centers, teams, cost allocation tags,
cost categories, linked accounts, or combination of these.

Identify the business drivers that can impact your usage cost, and
forecast for each of them separately to calculate expected usage
in advance. Some of the drivers might be linked to IT and product
teams within the organization. Other business drivers, such as
marketing events, promotions, geographic expansions, mergers, and
acquisitions, are known by your sales, marketing, and business
leaders, and it's important to collaborate and account for all
those demand drivers as well.

You can
use [AWS Cost Explorer](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-forecast.html) for trend-based forecasting in a defined
future time range based on your past spend. AWS Cost Explorer's
forecasting engine segments your historical data based on charge
types (for example, Reserved Instances) and uses a combination of
machine learning and rule-based models to predict spend across all
charge types individually.

Once you've established your forecast process and built models,
you can
use [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/) to set custom budgets at a granular level by
specifying the time period, recurrence, or amount (fixed or
variable) and add filters such as service, AWS Region, and tags.
The budget is usually prepared for a single year and remains
fixed, which requires strict adherence from everyone involved. In
contrast, forecasts are more flexible, which allows for
readjustments throughout the year and provides dynamic projections
over a period of one, two, or three years. Both budgets and
forecasts play a crucial role when you establish financial
expectations among various technology and business stakeholders.
Accurate forecasts and implementation also provides accountability
to stakeholders who are directly responsible for provisioning cost
in the first place, and it can also raise their overall cost
awareness.

To stay informed on the performance of your existing budgets, you
can create and schedule AWS Budgets reports to email you and your
stakeholders on a regular cadence. You can also create AWS Budgets
alerts based on actual costs, which are reactive in nature, or on
forecasted costs, which provides time to implement mitigations
against potential cost overruns. You can be alerted when your cost
or usage actually exceeds a certain level or if they are
forecasted to exceed your budgeted amount.

Adjust existing budget and forecast processes to be more dynamic
using trend-based algorithms (with historical costs as inputs) and
driver-based algorithms (for example, new product launches,
Regional expansion, or new environments for workloads), which are
ideal for a dynamic and variable spending environment. Once you've
determined your trend-based forecast using Cost Explorer or any
other tools, use
the [AWS Pricing Calculator](https://calculator.aws/#/) to estimate your AWS use case and future costs
based on the expected usage (traffic, requests-per-second, or
required Amazon EC2 instances).

Track the accuracy of that forecast, as budgets should be set
based on these forecast calculations and estimations. Monitor the
accuracy and effectiveness of the integrated cloud cost forecasts.
Regularly review actual spend compared to your forecast, and
adjust as needed to improve forecast precision. Track forecast
variance, and perform root cause analysis on reported variance to
act and adjust forecasts.

As mentioned in
the [COST01-BP02 Establish a partnership between finance and technology](./cost_cloud_financial_management_partnership.html), it is important to foster a
partnership and cadence between IT, finance, and other
stakeholders to verify that they are all using the same tools or
processes for consistency. In cases where budgets may need to
change, increase cadence touch points to react to those changes
more quickly.

### Implementation steps

- **Define the cost language within the
organization:** Create a common AWS cost language
within the Organization with multiple dimension and
grouping. Make sure stakeholders understand forecast
granularity, pricing models, and the level of your cost
forecasts.
- **Analyze trend-based
forecasts:** Use trend-based forecast tools such as
AWS Cost Explorer and Amazon Forecast. Analyze your usage
cost on multiple dimensions like service, account, tags, and
cost categories.
- **Analyze driver-based forecasts:** Identify the
impact of business drivers on your cloud usage, and forecast
for each of them separately to calculate expected usage cost
in advance. Work closely with business unit owners and
stakeholders to understand the impact on new drivers, and
calculate expected cost changes to define accurate budgets.
- **Update existing forecast and budget
processes:** Based on adopted forecast methods such
as trend-based, business driver-based, or a combination of
both forecasting methods, define your forecast and budget
processes. Budgets should be calculated, realistic, and
based on your forecasts.
- **Configure alerts and
notifications:** Use AWS Budgets alerts and cost
anomaly detection to get alerts and notifications.
- **Perform regular reviews with key
stakeholders:** For example, align on changes in
business direction and usage with stakeholders in IT,
finance, platform teams, and other areas of the business.

## Resources

**Related documents:**

- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
- [AWS Cost and Usage Report](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html)
- [Forecasting
with Cost Explorer](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-forecast.html)
- [Quick Forecasting](https://docs.aws.amazon.com/quicksight/latest/user/forecasts-and-whatifs.html)
- [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)

**Related videos:**

- [How
can I use AWS Budgets to track my spending and usage](https://www.youtube.com/watch?v=Ris23gKc7s0)
- [AWS Cost Optimization Series: AWS Budgets](https://www.youtube.com/watch?v=5vYEVQzoMeM)

**Related examples:**

- [Understand
and build driver-based forecasting](https://aws.amazon.com/blogs/aws-cloud-financial-management/understand-and-build-driver-based-forecasting/)
- [How
to establish and drive a forecasting culture](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-establish-and-drive-a-forecasting-culture/)
- [How
to improve your cloud cost forecasting](https://aws.amazon.com/blogs/aws-cloud-financial-management/forecasting-blog-series-1-3-ways-to-more-effectively-forecast-cloud-spend/)
- [Using
the right tools for your cloud cost forecasting](https://aws.amazon.com/blogs/aws-cloud-financial-management/using-the-right-tools-for-your-cloud-cost-forecasting/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_budget_forecast.html*

---

# COST01-BP04 Implement cost awareness in your organizational processes

Implement cost awareness, create transparency, and accountability of costs into new or
existing processes that impact usage, and leverage existing processes for cost awareness.
Implement cost awareness into employee training.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Cost awareness must be implemented in new and existing organizational processes. It is one
of the foundational, prerequisite capabilities for other best practices. It is recommended to
reuse and modify existing processes where possible — this minimizes the impact to agility and
velocity. Report cloud costs to the technology teams and the decision makers in the business
and finance teams to raise cost awareness, and establish efficiency key performance indicators
(KPIs) for finance and business stakeholders. The following recommendations will help
implement cost awareness in your workload:

- Verify that change management includes a cost measurement to quantify the financial impact of
your changes. This helps proactively address cost-related concerns and highlight cost
savings.
- Verify that cost optimization is a core component of your operating capabilities. For example,
you can leverage existing incident management processes to investigate and identify root
causes for cost and usage anomalies or cost overruns.
- Accelerate cost savings and business value realization through automation or tooling. When
thinking about the cost of implementing, frame the conversation to include an return on
investment (ROI) component to justify the investment of time or money.
- Allocate cloud costs by implementing showbacks or chargebacks for cloud spend, including spend
on commitment-based purchase options, shared services and marketplace purchases to drive
most cost-aware cloud consumption.
- Extend existing training and development programs to include cost-awareness training
throughout your organization. It is recommended that this includes continuous training and
certification. This will build an organization that is capable of self-managing cost and
usage.
- Take advantage of free AWS native tools such as [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/), [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/), and
[AWS Budgets
Reports](https://aws.amazon.com/about-aws/whats-new/2019/07/introducing-aws-budgets-reports/).

When organizations consistently adopt [Cloud Financial Management](https://aws.amazon.com/aws-cost-management/) (CFM)
practices, those behaviours become ingrained in the way of working and decision-making. The
result is a culture that is more cost-aware, from developers architecting a new
born-in-the-cloud application, to finance managers analyzing the ROI on these new cloud
investments.

**Implementation steps**

- **Identify relevant organizational processes:**Each
organizational unit reviews their processes and identifies processes that impact cost and
usage. Any processes that result in the creation or termination of a resource need to be
included for review. Look for processes that can support cost awareness in your business,
such as incident management and training.
- **Establish self-sustaining cost-aware culture:** Make
sure all the relevant stakeholders align with cause-of-change and impact as a cost so that
they understand cloud cost. This will allow your organization to establish a
self-sustaining cost-aware culture of innovation.
- **Update processes with cost awareness:** Each process
is modified to be made cost aware. The process may require additional pre-checks, such as
assessing the impact of cost, or post-checks validating that the expected changes in cost
and usage occurred. Supporting processes such as training and incident management can be
extended to include items for cost and usage.

To get help, reach out to CFM experts through your Account team, or explore the resources
and related documents below.

## Resources

**Related documents:**

- [AWS Cloud Financial Management](https://aws.amazon.com/aws-cost-management/)

**Related examples:**

- [Strategy for Efficient Cloud Cost Management](https://aws.amazon.com/blogs/enterprise-strategy/strategy-for-efficient-cloud-cost-management/)
- [Cost Control Blog Series #3: How to Handle Cost Shock](https://aws.amazon.com/blogs/aws-cloud-financial-management/cost-control-blog-series-3-how-to-handle-cost-shock/)
- [A Beginner’s Guide to AWS Cost Management](https://aws.amazon.com/blogs/aws-cloud-financial-management/beginners-guide-to-aws-cost-management/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_cost_awareness.html*

---

# COST01-BP05 Report and notify on cost optimization

Set up cloud budgets and configure mechanisms to detect anomalies in
usage. Configure related tools for cost and usage alerts against
pre-defined targets and receive notifications when any usage exceeds
those targets. Have regular meetings to analyze the
cost-effectiveness of your workloads and promote cost awareness.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

You must regularly report on cost and usage optimization within
your organization. You can implement dedicated sessions to discuss
cost performance, or include cost optimization in your regular
operational reporting cycles for your workloads. Use services and
tools to monitor your cost performances regularly and implement
cost savings opportunities.

View your cost and usage with multiple filters and granularity by
using
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/), which provides dashboards and reports such as
costs by service or by account, daily costs, or marketplace costs.
Track your progress of cost and usage against configured budgets
with [AWS Budgets Reports](https://aws.amazon.com/about-aws/whats-new/2019/07/introducing-aws-budgets-reports/).

Use [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/) to set custom budgets to track your costs and usage
and respond quickly to alerts received from email or Amazon Simple Notification Service (Amazon SNS) notifications if you exceed your
threshold. [Set
your preferred budget](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-create.html) period to daily, monthly, quarterly,
or annually, and create specific budget limits to stay informed on
how actual or forecasted costs and usage progress toward your
budget threshold. You can also set
up [alerts](https://docs.aws.amazon.com/cost-management/latest/userguide/sns-alert-chime.html) and [actions](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-controls.html) against
those alerts to run automatically or through an approval process
when a budget target is exceeded.

Implement notifications on cost and usage to ensure that changes
in cost and usage can be acted upon quickly if they are
unexpected. [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/) allows you to reduce cost surprises
and enhance control without slowing innovation. AWS Cost Anomaly Detection identifies anomalous spend and root causes, which helps
to reduce the risk of billing surprises. With three simple steps,
you can create your own contextualized monitor and receive alerts
when any anomalous spend is detected.

You can also
use [Quick](https://aws.amazon.com/quicksight/) with AWS Cost and Usage Report (CUR) data, to
provide highly customized reporting with more granular data.
Quick allows you to schedule reports and receive
periodic Cost Report emails for historical cost and usage or
cost-saving opportunities. Check our
[Cost
Intelligence Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/a-detailed-overview-of-the-cost-intelligence-dashboard/) (CID) solution built on Quick, which gives you advanced visibility.

Use [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/), which provides guidance to verify whether
provisioned resources are aligned with AWS best practices for cost
optimization.

Check your Savings Plans recommendations through visual graphs
against your granular cost and usage. Hourly graphs show On-Demand
spend alongside the recommended Savings Plans commitment,
providing insight into estimated savings, Savings Plans coverage,
and Savings Plans utilization. This helps organizations to
understand how their Savings Plans apply to each hour of spend
without having to invest time and resources into building models to
analyze their spend.

Periodically create reports containing a highlight of Savings Plans, Reserved Instances, and Amazon EC2 rightsizing
recommendations from AWS Cost Explorer to start reducing the cost
associated with steady-state workloads, idle, and underutilized
resources. Identify and recoup spend associated with cloud waste
for resources that are deployed. Cloud waste occurs when
incorrectly-sized resources are created or different usage
patterns are observed instead what is expected. Follow AWS best
practices to reduce your waste or ask your account team and
partner to help you
to [optimize
and save](https://aws.amazon.com/aws-cost-management/aws-cost-optimization/) your cloud costs.

Generate reports regularly for better purchasing options for your
resources to drive down unit costs for your workloads. Purchasing
options such as Savings Plans, Reserved Instances, or Amazon EC2
Spot Instances offer the deepest cost savings for fault-tolerant
workloads and allow stakeholders (business owners, finance, and
tech teams) to be part of these commitment discussions.

Share the reports that contain opportunities or new release
announcements that may help you to reduce total cost of ownership
(TCO) of the cloud. Adopt new services, Regions, features,
solutions, or new ways to achieve further cost reductions.

### Implementation steps

- **Configure AWS Budgets:**
Configure AWS Budgets on all accounts for your workload. Set
a budget for the overall account spend, and a budget for the
workload by using tags.

[Well-Architected
Labs: Cost and Governance Usage](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/100_2_Cost_and_Usage_Governance/README.html)

- **Report on cost
optimization:** Set up a regular cycle to discuss
and analyze the efficiency of the workload. Using the
metrics established, report on the metrics achieved and the
cost of achieving them. Identify and fix any negative
trends, as well as positive trends that you can promote
across your organization. Reporting should involve
representatives from the application teams and owners,
finance, and key decision makers with respect to cloud
expenditure.

## Resources

**Related documents:**

- [AWS Cost Explorer](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-what-is.html)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)
- [AWS Cost and Usage Report](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html)
- [AWS Budgets Best Practices](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-best-practices.html#budgets-best-practices-setting-budgets%3Fsc_channel=ba%26sc_campaign=aws-budgets%26sc_medium=manage-and-control%26sc_content=web_pdp%26sc_detail=how-do-I%26sc_outcome=aw%26trk=how-do-I_web_pdp_aws-budgets)
- [Amazon S3 Analytics](https://docs.aws.amazon.com/AmazonS3/latest/userguide/analytics-storage-class.html)

**Related examples:**

- [Key
ways to start optimizing your AWS cloud costs](https://aws.amazon.com/blogs/aws-cloud-financial-management/key-ways-to-start-optimizing-your-aws-cloud-costs/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_usage_report.html*

---

# COST01-BP06 Monitor cost proactively

Implement tooling and dashboards to monitor cost proactively for the workload. Regularly
review the costs with configured tools or out of the box tools, do not just look at costs and
categories when you receive notifications. Monitoring and analyzing costs proactively helps to
identify positive trends and allows you to promote them throughout your organization.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

It is recommended to monitor cost and usage proactively within your organization, not just
when there are exceptions or anomalies. Highly visible dashboards throughout your office
or work environment ensure that key people have access to the information they need, and
indicate the organization’s focus on cost optimization. Visible dashboards allow you to
actively promote successful outcomes and implement them throughout your organization.

Create a daily or frequent routine to use [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) or any other dashboard such
as [Amazon Quick](https://aws.amazon.com/quicksight/) to see the costs and analyze
proactively. Analyze AWS service usage and costs at the AWS account-level, workload-level,
or specific AWS service-level with grouping and filtering, and validate whether they are
expected or not. Use the hourly- and resource-level granularity and tags to filter and
identify incurring costs for the top resources. You can also build your own reports with the
[Cost
Intelligence Dashboard](https://wellarchitectedlabs.com/cost/200_labs/200_cloud_intelligence/), an [Amazon Quick](https://aws.amazon.com/quicksight/) solution built by AWS Solutions Architects, and compare your budgets
with the actual cost and usage.

**Implementation steps**

- **Report on cost optimization:** Set up a regular cycle to
discuss and analyze the efficiency of the workload. Using the metrics established, report
on the metrics achieved and the cost of achieving them. Identify and fix any negative
trends, and identify positive trends to promote across your organization. Reporting should
involve representatives from the application teams and owners, finance, and management.
- **Create and activate daily granularity [AWS Budgets](https://aws.amazon.com/blogs/aws-cloud-financial-management/launch-daily-cost-and-usage-budgets/) for the cost and usage to take timely actions to prevent any
potential cost overruns:** AWS Budgets allow you to configure alert
notifications, so you stay informed if any of your budget types fall out of your
pre-configured thresholds. The best way to leverage AWS Budgets is to set your expected
cost and usage as your limits, so that anything above your budgets can be considered
overspend.
- **Create AWS Cost Anomaly Detection for cost monitor:**
[AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/) uses advanced Machine Learning technology to identify anomalous
spend and root causes, so you can quickly take action. It allows you to configure cost
monitors that define spend segments you want to evaluate (for example, individual AWS
services, member accounts, cost allocation tags, and cost categories), and lets you set
when, where, and how you receive your alert notifications. For each monitor, attach
multiple alert subscriptions for business owners and technology teams, including a name, a
cost impact threshold, and alerting frequency (individual alerts, daily summary, weekly
summary) for each subscription.
- **Use AWS Cost Explorer or integrate your AWS Cost and Usage Report (CUR) data with Amazon Quick
dashboards to visualize your organization’s costs:** AWS Cost Explorer has an
easy-to-use interface that lets you visualize, understand, and manage your AWS costs and
usage over time. The [Cost
Intelligence Dashboard](https://wellarchitectedlabs.com/cost/200_labs/200_cloud_intelligence/) is a customizable and accessible dashboard to help create
the foundation of your own cost management and optimization tool.

## Resources

**Related documents:**

- [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)
- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
- [Daily Cost and Usage Budgets](https://aws.amazon.com/blogs/aws-cloud-financial-management/launch-daily-cost-and-usage-budgets/)
- [AWS Cost Anomaly Detection](https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/)

**Related examples:**

- [AWS Cost Anomaly Detection Alert with Slack](https://aws.amazon.com/aws-cost-management/resources/slack-integrations-for-aws-cost-anomaly-detection-using-aws-chatbot/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_proactive_process.html*

---

# COST01-BP07 Keep up-to-date with new service releases

Consult regularly with experts or AWS Partners to consider which services and features
provide lower cost. Review AWS blogs and other information sources.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

AWS is constantly adding new capabilities so you can leverage the latest technologies to
experiment and innovate more quickly. You may be able to implement new AWS services and
features to increase cost efficiency in your workload. Regularly review [AWS Cost Management](https://aws.amazon.com/aws-cost-management/), the [AWS News Blog](https://aws.amazon.com/blogs/aws/), the [AWS Cost Management blog](https://aws.amazon.com/blogs/aws-cloud-financial-management/), and [What’s New with AWS](https://aws.amazon.com/new/) for
information on new service and feature releases. What's New posts provide a brief overview of
all AWS service, feature, and Region expansion announcements as they are released.

**Implementation steps**

- **Subscribe to blogs:** Go to the AWS blogs pages and
subscribe to the What's New Blog and other relevant blogs. You can sign up on the [communication preference](https://pages.awscloud.com/communication-preferences?languages=english) page with your email address.
- **Subscribe to AWS News:**Regularly review the [AWS News Blog](https://aws.amazon.com/blogs/aws/) and [What’s New with AWS](https://aws.amazon.com/new/) for information on new
service and feature releases. Subscribe to the RSS feed, or with your email to follow
announcements and releases.
- **Follow AWS Price Reductions:** Regular price cuts on all our
services has been a standard way for AWS to pass on the economic efficiencies to our
customers gained from our scale. As of September 20, 2023, AWS has reduced prices 134 times since 2006. If you have any pending business decisions due to price
concerns, you can review them again after price reductions and new service integrations.
You can learn about the previous price reductions efforts, including Amazon Elastic Compute Cloud (Amazon EC2)
instances, in the [price-reduction category of the AWS News Blog](https://aws.amazon.com/blogs/aws/category/price-reduction/).
- **AWS events and meetups:**Attend your local AWS
summit, and any local meetups with other organizations from your local area. If you cannot
attend in person, try to attend virtual events to hear more from AWS experts and other
customers’ business cases.
- **Meet with your account team:**Schedule a regular
cadence with your account team, meet with them and discuss industry trends and AWS
services. Speak with your account manager, Solutions Architect, and support team.

## Resources

**Related documents:**

- [AWS Cost Management](https://aws.amazon.com/aws-cost-management/)
- [What’s New with AWS](https://aws.amazon.com/new/)
- [AWS News Blog](https://aws.amazon.com/blogs/aws/)

**Related examples:**

- [Amazon EC2 – 15 Years of Optimizing and Saving Your IT Costs](https://aws.amazon.com/blogs/aws-cost-management/amazon-ec2-15th-years-of-optimizing-and-saving-your-it-costs/)
- [AWS News Blog - Price Reduction](https://aws.amazon.com/blogs/aws/category/price-reduction/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_scheduled.html*

---

# COST01-BP08 Create a cost-aware culture

Implement changes or programs across your organization to create a cost-aware culture. It
is recommended to start small, then as your capabilities increase and your organization’s
use of the cloud increases, implement large and wide ranging programs.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

A cost-aware culture allows you to scale cost optimization and Cloud Financial Management
(financial operations, cloud center of excellence, cloud operations teams, and so on) through
best practices that are performed in an organic and decentralized manner across your
organization. Cost awareness allows you to create high levels of capability across your
organization with minimal effort, compared to a strict top-down, centralized approach.

Creating cost awareness in cloud computing, especially for primary cost drivers in cloud
computing, allows teams to understand expected outcomes of any changes in cost perspective.
Teams who access the cloud environments should be aware of pricing models and the
difference between traditional on-premesis datacenters and cloud computing.

The main benefit of a cost-aware culture is that technology teams optimize costs
proactively and continually (for example, they are considered a non-functional requirement
when architecting new workloads, or making changes to existing workloads) rather than
performing reactive cost optimizations as needed.

Small changes in culture can have large impacts on the efficiency of your current and future
workloads. Examples of this include:

- Giving visibility and creating awareness in engineering teams to understand what they do, and
what they impact in terms of cost.
- Gamifying cost and usage across your organization. This can be done through a publicly visible
dashboard, or a report that compares normalized costs and usage across teams (for example,
cost-per-workload and cost-per-transaction).
- Recognizing cost efficiency. Reward voluntary or unsolicited cost optimization
accomplishments publicly or privately, and learn from mistakes to avoid repeating
them in the future.
- Creating top-down organizational requirements for workloads to run at pre-defined
budgets.
- Questioning business requirements of changes, and the cost impact of requested changes to the
architecture infrastructure or workload configuration to make sure you pay only what you
need.
- Making sure the change planner is aware of expected changes that have a cost impact, and that
they are confirmed by the stakeholders to deliver business outcomes
cost-effectively.

**Implementation steps**

- **Report cloud costs to technology teams:** To raise cost
awareness, and establish efficiency KPIs for finance and business stakeholders.
- **Inform stakeholders or team members about planned changes:** Create an agenda item to discuss planned changes and the cost-benefit impact on the
workload during weekly change meetings.
- **Meet with your account team:**Establish a regular
meeting cadence with your account team, and discuss industry trends and AWS
services. Speak with your account manager, architect, and support team.
- **Share success stories:** Share success stories about cost
reduction for any workload, AWS account, or organization to create a positive attitude
and encouragement around cost optimization.
- **Training:**Ensure technical teams or team members are trained
for awareness of resource costs on AWS Cloud.
- **AWS events and meetups:**Attend local AWS
summits, and any local meetups with other organizations from your local area.
- **Subscribe to blogs:** Go to the AWS blogs pages and
subscribe to the [What's New Blog](https://aws.amazon.com/new/) and other relevant
blogs to follow new releases, implementations, examples, and changes shared by AWS.

## Resources

**Related documents:**

- [AWS Blog](https://aws.amazon.com/blogs/)
- [AWS Cost Management](https://aws.amazon.com/blogs/aws-cost-management/)
- [AWS News Blog](https://aws.amazon.com/blogs/aws/)

**Related examples:**

- [AWS Cloud Financial Management](https://aws.amazon.com/blogs/aws-cloud-financial-management/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_culture.html*

---

# COST01-BP09 Quantify business value from cost optimization

Quantifying business value from cost optimization allows you to understand the entire set
of benefits to your organization. Because cost optimization is a necessary investment,
quantifying business value allows you to explain the return on investment to stakeholders.
Quantifying business value can help you gain more buy-in from stakeholders on future cost
optimization investments, and provides a framework to measure the outcomes for your
organization’s cost optimization activities.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Quantifying the business value means measuring the benefits that businesses gain from the actions and decisions they take. Business value can be tangible (like reduced expenses or increased profits) or intangible (like improved brand reputation or increased customer satisfaction).

To quantify business value from cost optimization means determining how much value or benefit you’re getting from your efforts to spend more efficiently. For example, if a company spends $100,000 to deploy a workload on AWS and later optimizes it, the new cost becomes only $80,000 without sacrificing the quality or output. In this scenario, the quantified business value from cost optimization would be a savings of $20,000. But beyond just savings, the business might also quantify value in terms of faster delivery times, improved customer satisfaction, or other metrics that result from the cost optimization efforts. Stakeholders need to make decisions about the potential value of cost optimization, the cost of optimizing the workload, and return value.

In addition to reporting savings from cost optimization, it is recommended that you
quantify the additional value delivered. Cost optimization benefits are typically quantified in terms of lower costs per business outcome. For example, you can quantify
Amazon Elastic Compute Cloud(Amazon EC2) cost savings when you purchase Savings Plans, which reduce cost and maintain workload output levels. You can quantify cost
reductions in AWS spending when idle Amazon EC2 instances are removed, or
unattached Amazon Elastic Block Store (Amazon EBS) volumes are deleted.

The benefits from cost optimization, however, go above and beyond cost reduction or
avoidance. Consider capturing additional data to measure efficiency improvements and
business value.

### Implementation steps

- **Evaluate business benefits:** This is the process of analyzing and adjusting AWS Cloud cost in ways that maximize the benefit received from each dollar spent. Instead of focusing on cost reduction without business value, consider business benefits and return on investments for cost optimization, which may bring more value out of the money you spend. It's about spending wisely and making investments and expenditures in areas that yield the best return.
- **Analyze forecasting AWS costs:** Forecasting helps finance stakeholders set expectations with other internal and external organization stakeholders, and can improve your organization’s financial predictability. [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) can be used to perform forecasting for your cost and usage.

## Resources

**Related documents:**

- [AWS Cloud Economics](https://aws.amazon.com/economics/)
- [AWS Blog](https://aws.amazon.com/blogs/)
- [AWS Cost Management](https://aws.amazon.com/blogs/aws-cost-management/)
- [AWS News Blog](https://aws.amazon.com/blogs/aws/)
- [Well-Architected Reliability Pillar whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html)
- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)

**Related videos:**

- [Unlock Business Value with Windows on AWS](https://aws.amazon.com/windows/tco/)

**Related examples:**

- [Measuring and Maximizing the Business Value of Customer 360](https://pages.awscloud.com/measuring-and-maximizing-the-business-value-of-customer-360-062022.html)
- [The Business Value of Adopting Amazon Web Services Managed Databases](https://pages.awscloud.com/rs/112-TZM-766/images/The Business Value of Adopting Amazon Web Services Managed Databases.pdf)
- [The Business Value of Amazon Web Services for Independent Software Vendors](https://pages.awscloud.com/rs/112-TZM-766/images/The Business Value of Amazon Web Services %28AWS%29 for Independent Software Vendors %28ISVs%29.pdf)
- [Business Value of Cloud Modernization](https://pages.awscloud.com/aws-cfm-known-business-value-of-cloud-modernization-2022.html)
- [The Business Value of Migration to Amazon Web Services](https://pages.awscloud.com/global-in-gc-500-business-value-of-migration-whitepaper-learn.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_quantify_value.html*

---
