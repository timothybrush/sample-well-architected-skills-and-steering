# OPS 9 — How do you understand the health of your operations?

**Pillar**: Operational Excellence  
**Best Practices**: 3

---

# OPS09-BP01 Measure operations goals and KPIs with metrics

Obtain goals and KPIs that define operations success from your organization and determine that metrics reflect these. Set baselines as a point of reference and reevaluate regularly. Develop mechanisms to collect these metrics from teams for evaluation. The [DevOps Research and Assessment (DORA)](https://dora.dev/guides/dora-metrics-four-keys/) metrics provide a popular method to measure progress towards DevOps practices of software delivery.

**Desired outcome:**

- The organization publishes and shares the goals and KPIs for the operations teams.
- You establish metrics that reflect these KPIs. Examples may include:

Ticket queue depth or average age of ticket
- Ticket count grouped by type of issue
- Time spent working issues with or without a standardized operating procedure (SOP)
- Amount of time spent recovering from a failed code push
- Call volume

**Common anti-patterns:**

- Deployment deadlines are missed because developers are pulled away to perform troubleshooting tasks. Development teams argue for more personnel, but cannot quantify how many they need because the time taken away cannot be measured.
- A Tier 1 desk was set up to handle user calls. Over time, more workloads were added, but no headcount was allocated to the Tier 1 desk. Customer satisfaction suffers as call times increase and issues go longer without resolution, but management sees no indicators of such, preventing any action.
- A problematic workload has been handed off to a separate operations team for upkeep. Unlike other workloads, this new one was not supplied with proper documentation and runbooks. As such, teams spend longer troubleshooting and addressing failures. However, there are no metrics documenting this, which makes accountability difficult.

**Benefits of establishing this best
practice:** Where workload monitoring shows the state of our applications and services, monitoring operations teams provides owners insight into changes among the consumers of those workloads, such as shifting business needs. Measure the effectiveness of these teams and evaluate them against business goals by creating metrics that can reflect the state of operations. Metrics can highlight support issues or identify when drifts occur away from a service level target.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Schedule time with business leaders and stakeholders to determine what the overall goals of the service will be. Determine what the tasks of various operations teams should be and what challenges they could be approached with. Using these, brainstorm key performance indicators (KPIs) that might reflect these operations goals. These might be customer satisfaction, time from feature conception to deployment, average issue resolution time, or cost efficiencies.

Working from KPIs, identify the metrics and sources of data that might reflect these goals best. Customer satisfaction may be an combination of various metrics such as call wait or response times, satisfaction scores, and types of issues raised. Deployment times may be the sum of time needed for testing and deployment, plus any post-deployment fixes that needed to be added. Statistics showing the time spent on different types of issues (or the counts of those issues) can provide a window into where targeted effort is needed.

## Resources

**Related documents:**

- [Quick - Using KPIs](https://docs.aws.amazon.com/quicksight/latest/user/kpi.html)
- [Amazon CloudWatch - Using Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)
- [Building Dashboards](https://aws.amazon.com/builders-library/building-dashboards-for-operational-visibility/)
- [How to track your cost optimization KPIs with KPI Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-track-your-cost-optimization-kpis-with-the-kpi-dashboard/)
- [AWS DevOps Guidance](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/devops-guidance.html)

**Related examples:**

- [Monitor the performance of your software delivery using native AWS monitoring and observability tools](https://catalog.us-east-1.prod.workshops.aws/workshops/3b7f3d77-c6ef-44b2-aa29-d2719b8be897/en-US)
- [Balance deployment speed and stability with DORA metrics](https://aws.amazon.com/blogs/devops/balance-deployment-speed-and-stability-with-dora-metrics/)
- [Example MLOps operational metrics in the financial services industry](https://docs.aws.amazon.com/prescriptive-guidance/latest/strategy-unlock-value-data-financial-services/operational-metrics.html)
- [How to track your cost optimization KPIs with the KPI Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-track-your-cost-optimization-kpis-with-the-kpi-dashboard/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_measure_ops_goals_kpis.html*

---

# OPS09-BP02 Communicate status and trends to ensure visibility into operation

Knowing the state of your operations and its trending direction is necessary to identify when outcomes may be at risk, whether or not added work can be supported, or the effects that changes have had to your teams. During operations events, having status pages that users and operations teams can refer to for information can reduce pressure on communication channels and disseminate information proactively.

**Desired outcome:**

- Operations leaders have insight at a glance to see what sort of call volumes their teams are operating under and what efforts may be under way, such as deployments.
- Alerts are disseminated to stakeholders and user communities when impacts to normal operations occur.
- Organization leadership and stakeholders can check a status page in response to an alert or impact, and obtain information surrounding an operational event, such as points of contact, ticket information, and estimated recovery times.
- Reports are made available to leadership and other stakeholders to show operations statistics such as call volumes over a period of time, user satisfaction scores, numbers of outstanding tickets and their ages.

**Common anti-patterns:**

- A workload goes down, leaving a service unavailable. Call volumes spike as users request to know what's going on. Managers add to the volume requesting to know who's working an issue. Various operations teams duplicate efforts in trying to investigate.
- A desire for a new capability leads to several personnel being reassigned to an engineering effort. No backfill is provided, and issue resolution times spike. This information is not captured, and only after several weeks and dissatisfied user feedback does leadership become aware of the issue.

**Benefits of establishing this best
practice:** During operational events where the business is impacted, much time and energy can be wasted querying information from various teams attempting to understand the situation. By establishing widely-disseminated status pages and dashboards, stakeholders can quickly obtain information such as whether or not an issue was detected, who has lead on the issue, or when a return to normal operations may be expected. This frees team members from spending too much time communicating status to others and more time addressing issues.

In addition, dashboards and reports can provide insights to decision-makers and stakeholders to see how operations teams are able to respond to business needs and how their resources are being allocated. This is crucial for determining if adequate resources are in place to support the business.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Build dashboards that show the current key metrics for your ops teams, and make them readily accessible both to operations leaders and management.

Build status pages that can be updated quickly to show when an incident or event is unfolding, who has ownership and who is coordinating the response. Share any steps or workarounds that users should consider on this page, and disseminate the location widely. Encourage users to check this location first when confronted with an unknown issue.

Collect and provide reports that show the health of operations over time, and distribute this to leaders and decision makers to illustrate the work of operations along with challenges and needs.

Share between teams these metrics and reports that best reflect goals and KPIs and where they have been influential in driving change. Dedicate time to these activities to elevate the importance of operations inside of and between teams.

Use [AWS Health](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html) alongside your own dashboards, or integrate AWS Health events into them, so that your teams can correlate application issues to AWS service status.

## Resources

**Related best practices:**

- [OPS09-BP01 Measure operations goals and KPIs with metrics](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_measure_ops_goals_kpis.html)

**Related documents:**

- [Measure Progress](https://docs.aws.amazon.com/prescriptive-guidance/latest/strategy-cloud-operating-model/measure-progress.html)
- [Building dashboards for operation visibility](https://aws.amazon.com/builders-library/building-dashboards-for-operational-visibility/)

**Related examples:**

- [Data Operations](https://aws.amazon.com/solutions/app-development/data-operations)
- [How to track your cost optimization KPIs with KPI Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-track-your-cost-optimization-kpis-with-the-kpi-dashboard/)
- [The Importance of Key Performance Indicators (KPIs) for Large-Scale Cloud Migrations](https://aws.amazon.com/blogs/mt/the-importance-of-key-performance-indicators-kpis-for-large-scale-cloud-migrations/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_communicate_status_trends.html*

---

# OPS09-BP03 Review operations metrics and prioritize improvement

Setting aside dedicated time and resources for reviewing the state of operations ensures that serving the day-to-day line of business remains a priority. Pull together operations leaders and stakeholders to regularly review metrics, reaffirm or modify goals and objectives, and prioritize improvements.

**Desired outcome:**

- Operations leaders and staff regularly meet to review metrics over a given reporting period. Challenges are communicated, wins are celebrated, and lessons learned are shared.
- Stakeholders and business leaders are regularly briefed on the state of operations and solicited for input regarding goals, KPIs, and future initiatives. Tradeoffs between service delivery, operations, and maintenance are discussed and placed into context.

**Common anti-patterns:**

- A new product is launched, but the Tier 1 and Tier 2 operations teams are not adequately trained to support or given additional staff. Metrics that show the decrease in ticket resolution times and increase in incident volumes are not seen by leaders. Action is taken weeks later when subscription numbers start to fall as discontent users move off the platform.
- A manual process for performing maintenance on a workload has been in place for a long time. While a desire to automate has been present, this was a low priority given the low importance of the system. Over time however, the system has grown in importance and now these manual processes consume a majority of operations' time. No resources are scheduled for providing increased tooling to operations, leading to staff burnout as workloads increase. Leadership becomes aware once it's reported that staff are leaving for other competitors.

**Benefits of establishing this best
practice:** In some organizations, it can become a challenge to allocate the same time and attention that is afforded to service delivery and new products or offerings. When this occurs, the line of business can suffer as the level of service expected slowly deteriorates. This is because operations does not change and evolve with the growing business, and can soon be left behind. Without regular review into the insights operations collects, the risk to the business may become visible only when it's too late. By allocating time to review metrics and procedures both among the operations staff and with leadership, the crucial role operations plays remains visible, and risks can be identified long before they reach critical levels. Operations teams get better insight into impending business changes and initiatives, allowing for proactive efforts to be undertaken. Leadership visibility into operations metrics showcases the role that these teams play in customer satisfaction, both internal and external, and let them better weigh choices for priorities, or ensure that operations has the time and resources to change and evolve with new business and workload initiatives.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Dedicate time to review operations metrics between stakeholders and operations teams and review report data. Place these reports in the contexts of the organizations goals and objectives to determine if they're being met. Identify sources of ambiguity where goals are not clear, or where there may be conflicts between what is asked for and what is given.

Identify where time, people, and tools can aid in operations outcomes. Determine which KPIs this would impact and what targets for success should be. Revisit regularly to ensure operations is resourced sufficiently to support the line of business.

## Resources

**Related documents:**

- [Amazon Athena](https://aws.amazon.com/athena/)
- [Amazon CloudWatch metrics and dimensions reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
- [Amazon Quick](https://aws.amazon.com/quicksight/)
- [AWS Glue](https://aws.amazon.com/glue/)
- [AWS Glue Data Catalog](https://docs.aws.amazon.com/glue/latest/dg/populate-data-catalog.html)
- [Collect metrics and logs from Amazon EC2 instances and on-premises servers with the Amazon CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
- [Using Amazon CloudWatch metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_review_ops_metrics_prioritize_improvement.html*

---
