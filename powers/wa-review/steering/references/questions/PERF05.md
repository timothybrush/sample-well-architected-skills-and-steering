# PERF 5 — What process do you use to support more performance efficiency?

**Pillar**: Performance Efficiency  
**Best Practices**: 7

---

# PERF05-BP01 Establish key performance indicators (KPIs) to measure workload health and performance

Identify the KPIs that quantitatively and qualitatively measure
workload performance. KPIs help you measure the health and
performance of a workload related to a business goal.

**Common anti-patterns:**

- You only monitor system-level metrics to gain insight into your
workload and don’t understand business impacts to those metrics.
- You assume that your KPIs are already being published and shared
as standard metric data.
- You do not define a quantitative, measurable KPI.
- You do not align KPIs with business goals or strategies.

**Benefits of establishing this best
practice:** Identifying specific KPIs that represent
workload health and performance helps align teams on their
priorities and define successful business outcomes. Sharing those
metrics with all departments provides visibility and alignment on
thresholds, expectations, and business impact.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

KPIs allow business and engineering teams to align on the
measurement of goals and strategies and how these factors combine
to produce business outcomes. For example, a website workload
might use page load time as an indication of overall performance.
This metric would be one of multiple data points that measures user experience. In addition to identifying the page load time
thresholds, you should document the expected outcome or business
risk if ideal performance is not met. A long page load time
affects your end users directly, decreases their user experience
rating, and can lead to a loss of customers. When you define your
KPI thresholds, combine both industry benchmarks and your end user
expectations. For example, if the current industry benchmark is a
webpage loading within a two-second time period, but your end
users expect a webpage to load within a one-second time period,
then you should take both of these data points into consideration
when establishing the KPI.

Your team must evaluate your workload KPIs using real-time
granular data and historical data for reference and create
dashboards that perform metric math on your KPI data to derive
operational and utilization insights. KPIs should be documented
and include thresholds that support business goals and strategies,
and should be mapped to metrics being monitored. KPIs should be
revisited when business goals, strategies, or end user
requirements change.

## Implementation steps

- **Identify stakeholders:** Identify and document key business stakeholders, including development and operation teams.
- **Define objectives:**
Work with these stakeholders to define and document objectives
of your workload. Consider the critical performance aspects of your workloads, such as throughput, response time, and cost, as well as business goals, such as user satisfaction.
- **Review industry best practices:**
Review industry best practices to identify relevant KPIs
aligned with your workload objectives.
- **Identify metrics:** Identify metrics that are aligned with your workload objectives and can help you measure performance and business goals. Establish KPIs based on these metrics. Example metrics are measurements like average response time or number of concurrent users.
- **Define and document KPIs:**
Use industry best practices and your workload objectives to
set targets for your workload KPI. Use this information to set
KPI thresholds for severity or alarm level. Identify and document the risk and impact of a KPI is not met.
- **Implement monitoring:**
Use monitoring tools such as
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) or
[AWS Config](https://aws.amazon.com/config/) to collect metrics and measure KPIs.
- **Visually communicate KPIs:**
Use dashboard tools like [Amazon Quick](https://aws.amazon.com/pm/quicksight/) to visualize and communicate KPIs with
stakeholders.
- **Analyze and optimize:**
Regularly review and analyze KPIs to identify areas of your
workload that need to be improved. Work with stakeholders to implement these improvements.
- **Revisit and refine:**
Regularly review metrics and KPIs to assess their effectiveness, especially when business goals or workload performance change.

## Resources

**Related documents:**

- [CloudWatch
documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [Monitoring,
Logging, and Performance AWS Partners](https://aws.amazon.com/devops/partner-solutions/#_Monitoring.2C_Logging.2C_and_Performance)
- [AWS observability tools](https://docs.aws.amazon.com/wellarchitected/latest/management-and-governance-guide/aws-observability-tools.html)
- [The Importance of Key Performance Indicators (KPIs) for Large-Scale Cloud Migrations](https://aws.amazon.com/blogs/mt/the-importance-of-key-performance-indicators-kpis-for-large-scale-cloud-migrations/)
- [How to track your cost optimization KPIs with the KPI Dashboard](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-to-track-your-cost-optimization-kpis-with-the-kpi-dashboard/)
- [X-Ray
Documentation](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Using
Amazon CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html?ref=wellarchitected)
- [Quick KPIs](https://docs.aws.amazon.com/quicksight/latest/user/kpi.html)

**Related videos:**

- [AWS re:Invent 2023 - Optimize cost and performance and track progress toward mitigation](https://www.youtube.com/watch?v=keAfy8f84E0)
- [AWS re:Invent 2023 - Manage resource lifecycle events at scale with AWS Health](https://www.youtube.com/watch?v=VoLLNL5j9NA)
- [AWS re:Invent 2023 - Performance & efficiency at Pinterest: Optimizing the latest instances](https://www.youtube.com/watch?v=QSudpowE_Hs)
- [AWS re:Invent 2022 - AWS optimization: Actionable steps for immediate results](https://www.youtube.com/watch?v=0ifvNf2Tx3w)
- [AWS re:Invent 2023 - Building an effective observability strategy](https://www.youtube.com/watch?v=7PQv9eYCJW8)
- [AWS Summit SF 2022 - Full-stack observability and application monitoring with AWS](https://www.youtube.com/watch?v=or7uFFyHIX0)
- [AWS re:Invent 2023 - Scaling on AWS for the first 10 million users](https://www.youtube.com/watch?v=JzuNJ8OUht0)
- [AWS re:Invent 2022 - How Amazon uses better metrics for improved website performance](https://www.youtube.com/watch?v=_uaaCiyJCFA)
- [Creating an Effective Metrics Strategy for Your Business | AWS Events](https://www.youtube.com/watch?v=zBO-K4RvbtM)

**Related examples:**

- [Creating
a dashboard with Quick](https://github.com/aws-samples/amazon-quicksight-sdk-proserve)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_establish_key_performance_indicators.html*

---

# PERF05-BP02 Use monitoring solutions to understand the areas where performance is most critical

Understand and identify areas where increasing the performance of
your workload will have a positive impact on efficiency or customer
experience. For example, a website that has a large amount of
customer interaction can benefit from using edge services to move
content delivery closer to customers.

**Common anti-patterns:**

- You assume that standard compute metrics such as CPU utilization
or memory pressure are enough to catch performance issues.
- You only use the default metrics recorded by your selected
monitoring software.
- You only review metrics when there is an issue.

**Benefits of establishing this best
practice:** Understanding critical areas of performance
helps workload owners monitor KPIs and prioritize high-impact
improvements.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Set up end-to-end tracing to identify traffic patterns, latency,
and critical performance areas. Monitor your data access patterns
for slow queries or poorly fragmented and partitioned data.
Identify the constrained areas of the workload using load testing
or monitoring.

Increase performance efficiency by understanding your
architecture, traffic patterns, and data access patterns, and
identify your latency and processing times. Identify the potential
bottlenecks that might affect the customer experience as the
workload grows. After investigating these areas, look at which
solution you could deploy to remove those performance concerns.

### Implementation steps

- Set up end-to-end monitoring to capture all workload
components and metrics. Here are examples of monitoring
solutions on AWS.

Service

Where to use

[Amazon CloudWatch Real-User Monitoring (RUM)](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)

To capture application performance metrics from real
user client-side and frontend sessions.

[AWS X-Ray](https://aws.amazon.com/xray/)

To trace traffic through the application layers and
identify latency between components and dependencies.
Use X-Ray service maps to see relationships and latency
between workload components.

[Amazon Relational Database Service Performance Insights](https://aws.amazon.com/rds/performance-insights/)

To view database performance metrics and identify
performance improvements.

[Amazon RDS Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html)

To view database OS performance metrics.

[Amazon
DevOps Guru](https://aws.amazon.com/devops-guru/)

To detect abnormal operating patterns so you can
identify operational issues before they impact your
customers.
- Perform tests to generate metrics, identify traffic
patterns, bottlenecks, and critical performance areas. Here
are some examples of how to perform testing:

Set
up [CloudWatch
Synthetic Canaries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html) to mimic browser-based user
activities programmatically using Linux cron jobs or
rate expressions to generate consistent metrics over
time.
- Use the [AWS Distributed Load Testing](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/) solution to generate
peak traffic or test the workload at the expected growth
rate.

- Evaluate the metrics and telemetry to identify your critical
performance areas. Review these areas with your team to
discuss monitoring and solutions to avoid bottlenecks.
- Experiment with performance improvements and measure those
changes with data. As an example, you can
use [CloudWatch
Evidently](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently.html) to test new improvements and performance
impacts to your workload.

## Resources

**Related documents:**

- [What's new in AWS Observability at re:Invent 2023](https://aws.amazon.com/blogs/mt/whats-new-in-aws-observability-at-reinvent-2023/)
- [Amazon
Builders’ Library](https://aws.amazon.com/builders-library)
- [X-Ray
Documentation](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)

**Related videos:**

- [AWS re:Invent 2023 - [LAUNCH] Application monitoring for modern workloads](https://www.youtube.com/watch?v=T2TovTLje8w)
- [AWS re:Invent 2023 - Implementing application observability](https://www.youtube.com/watch?v=IcTcwUSwIs4)
- [AWS re:Invent 2023 - Building an effective observability strategy](https://www.youtube.com/watch?v=7PQv9eYCJW8)
- [AWS Summit SF 2022 - Full-stack observability and application monitoring with AWS](https://www.youtube.com/watch?v=or7uFFyHIX0)
- [AWS re:Invent 2022 - AWS optimization: Actionable steps for immediate results](https://www.youtube.com/watch?v=0ifvNf2Tx3w)
- [AWS re:Invent 2022 - The
Amazon Builders’ Library: 25 years of Amazon operational
excellence](https://www.youtube.com/watch?v=DSRhgBd_gtw)
- [AWS re:Invent 2022 - How Amazon uses better metrics for improved website performance](https://www.youtube.com/watch?v=_uaaCiyJCFA)
- [Visual
Monitoring of Applications with Amazon CloudWatch
Synthetics](https://www.youtube.com/watch?v=_PCs-ucZz7E)

**Related examples:**

- [Measure
page load time with Amazon CloudWatch Synthetics](https://github.com/aws-samples/amazon-cloudwatch-synthetics-page-performance)
- [Amazon CloudWatch RUM Web Client](https://github.com/aws-observability/aws-rum-web)
- [X-Ray
SDK for Python](https://github.com/aws/aws-xray-sdk-python)
- [Distributed
Load Testing on AWS](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_use_monitoring_solutions.html*

---

# PERF05-BP03 Define a process to improve workload performance

Define a process to evaluate new services, design patterns, resource
types, and configurations as they become available. For example, run
existing performance tests on new instance offerings to determine
their potential to improve your workload.

**Common anti-patterns:**

- You assume your current architecture is static and won’t be
updated over time.
- You introduce architecture changes over time with no metric
justification.

**Benefits of establishing this best
practice:** By defining your process for making
architectural changes, you can use gathered data to influence your
workload design over time.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Your workload's performance has a few key constraints. Document
these so that you know what kinds of innovation might improve the
performance of your workload. Use this information when learning
about new services or technology as it becomes available to
identify ways to alleviate constraints or bottlenecks.

Identify the key performance constraints for your workload.
Document your workload’s performance constraints so that you know
what kinds of innovation might improve the performance of your
workload.

### Implementation steps

- **Identify KPIs:**
Identify your workload performance KPIs as outlined in [PERF05-BP01 Establish key performance indicators (KPIs) to measure workload health and performance](./perf_process_culture_establish_key_performance_indicators.html) to
baseline your workload.
- **Implement monitoring:**
Use
[AWS observability tools](https://docs.aws.amazon.com/wellarchitected/latest/management-and-governance-guide/aws-observability-tools.html) to collect performance metrics
and measure KPIs.
- **Conduct analysis:**
Conduct in-depth analysis to identify the areas (like
configuration and application code) in your workload that is
under-performing as outlined in
[PERF05-BP02 Use monitoring solutions to understand the areas where performance is most critical](./perf_process_culture_use_monitoring_solutions.html). Use your analysis and performance tools to identify the performance improvement strategies.
- **Validate improvements:**
Use sandbox or pre-production environments to validate the
effectiveness of improvement strategies.
- **Implement changes:**
Implement the changes in production and continually monitor
the workload’s performance. Document the improvements, and communicate the changes to stakeholders.
- **Revisit and refine:** Regularly review your performance improvement process to identify areas for enhancement.

## Resources

**Related documents:**

- [AWS Blog](https://aws.amazon.com/blogs/)
- [What's
New with AWS](https://aws.amazon.com/new/?ref=wellarchitected)
- [AWS Skill Builder](https://explore.skillbuilder.aws/learn)

**Related videos:**

- [AWS re:Invent 2022 - Delivering sustainable, high-performing architectures](https://www.youtube.com/watch?v=FBc9hXQfat0)
- [AWS re:Invent 2023 - Optimize cost and performance and track progress toward mitigation](https://www.youtube.com/watch?v=keAfy8f84E0)
- [AWS re:Invent 2022 - AWS optimization: Actionable steps for immediate results](https://www.youtube.com/watch?v=0ifvNf2Tx3w)
- [AWS re:Invent 2022 - Optimize your AWS workloads with best-practice guidance](https://www.youtube.com/watch?v=t8yl1TrnuIk)

**Related examples:**

- [AWS Github](https://github.com/aws)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_workload_performance.html*

---

# PERF05-BP04 Load test your workload

Load test your workload to verify it can handle production load and
identify any performance bottleneck.

**Common anti-patterns:**

- You load test individual parts of your workload but not your
entire workload.
- You load test on infrastructure that is not the same as your
production environment.
- You only conduct load testing to your expected load and not
beyond, to help foresee where you may have future problems.
- You perform load testing without consulting the [Amazon EC2 Testing Policy](https://aws.amazon.com/ec2/testing/) and submitting a Simulated Event Submissions Form. This results in your test failing to run, as it looks like a denial-of-service event.

**Benefits of establishing this best
practice:** Measuring your performance under a load test
will show you where you will be impacted as load increases. This can
provide you with the capability of anticipating needed changes
before they impact your workload.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Load testing in the cloud is a process to measure the performance
of cloud workload under realistic conditions with expected user
load. This process involves provisioning a production-like cloud
environment, using load testing tools to generate load, and
analyzing metrics to assess the ability of your workload handling
a realistic load. Load tests must be run using synthetic or
sanitized versions of production data (remove sensitive or
identifying information). Automatically carry out load tests as
part of your delivery pipeline, and compare the results against
pre-defined KPIs and thresholds. This process helps you continue
to achieve required performance.

### Implementation steps

- **Define your testing objectives:** Identify the performance aspects of your workload that you want to evaluate, such as throughput and response time.
- **Select a testing tool:** Choose and configure the load testing tool that suits your workload.
- **Set up your environment:**
Set up the test environment based on your production
environment. You can use AWS services to run
production-scale environments to test your architecture.
- **Implement monitoring:** Use monitoring tools such as [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to collect metrics across the resources in your architecture. You can also collect and publish custom metrics.
- **Define scenarios:**
Define the load testing scenarios and parameters (like test
duration and number of users).
- **Conduct load testing:**
Perform test scenarios at scale. Take advantage of the AWS Cloud to test your workload to discover where it fails to
scale, or if it scales in a non-linear way. For example, use
Spot Instances to generate loads at low cost and discover
bottlenecks before they are experienced in production.
- **Analyze test results:**
Analyze the results to identify performance bottlenecks and
areas for improvements.
- **Document and share findings:**
Document and report on findings and recommendations. Share this information with stakeholders to help them make informed decision regarding performance optimization strategies.
- **Continually iterate:** Load testing should be performed at regular cadence, especially after a system change of update.

## Resources

**Related documents:**

- [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)
- [Amazon CloudWatch Synthetics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
- [Distributed
Load Testing on AWS](https://docs.aws.amazon.com/solutions/latest/distributed-load-testing-on-aws/welcome.html)

**Related videos:**

- [AWS Summit ANZ 2023: Accelerate with confidence through AWS Distributed Load Testing](https://www.youtube.com/watch?v=4J6lVqa6Yh8)
- [AWS re:Invent 2022 - Scaling on AWS for your first 10 million users](https://www.youtube.com/watch?v=yrP3M4_13QM)
- [Solving
with AWS Solutions: Distributed Load Testing](https://www.youtube.com/watch?v=Y-2rk0sSyOM)

- [AWS re:Invent 2021 - Optimize applications through end user insights with Amazon CloudWatch RUM](https://www.youtube.com/watch?v=NMaeujY9A9Y)
- [Demo
of Amazon CloudWatch Synthetics](https://www.youtube.com/watch?v=hF3NM9j-u7I)

**Related examples:**

- [Distributed
Load Testing on AWS](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_load_test.html*

---

# PERF05-BP05 Use automation to proactively remediate performance-related issues

Use key performance indicators (KPIs), combined with monitoring and
alerting systems, to proactively address performance-related issues.

**Common anti-patterns:**

- You only allow operations staff the ability to make operational
changes to the workload.
- You let all alarms filter to the operations team with no
proactive remediation.

**Benefits of establishing this best
practice:** Proactive remediation of alarm actions allows
support staff to concentrate on those items that are not
automatically actionable. This helps operations staff handle all
alarms without being overwhelmed and instead focus only on critical
alarms.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Use alarms to trigger automated actions to remediate issues where
possible. Escalate the alarm to those able to respond if automated
response is not possible. For example, you may have a system that
can predict expected key performance indicator (KPI) values and
alarm when they breach certain thresholds, or a tool that can
automatically halt or roll back deployments if KPIs are outside of
expected values.

Implement processes that provide visibility into performance as
your workload is running. Build monitoring dashboards and
establish baseline norms for performance expectations to determine
if the workload is performing optimally.

### Implementation steps

- **Identify remediation workflow:**
Identify and understand the performance issue that can be
remediated automatically. Use AWS monitoring solutions such
as
[Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) or AWS X-Ray to help you better understand
the root cause of the issue.
- **Define the automation process:**
Create a step-by-step remediation process that can
be used to automatically fix the issue.
- **Configure the initiation event:**
Configure the event to automatically initiate the
remediation process. For example, you can define a trigger
to automatically restart an instance when it reaches a
certain threshold of CPU utilization.
- **Automate the remediation:**
Use AWS services and technologies to automate the
remediation process. For example,
[AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html) provides a secure and
scalable way to automate the remediation process. Make sure to use self-healing logic to revert changes if they do not successfully resolve the issue.
- **Test the workflow**
Test the automated remediation process in a pre-production
environment.
- **Implement the workflow:** Implement the automated remediation in the production environment.
- **Develop a playbook:** Develop and document a playbook that outlines the steps for the remediation plan, including the initiation events, remediation logic, and actions taken. Make sure to train stakeholders to help them effectively respond to automated remediation events.
- **Review and refine:** Regularly assess the effectiveness of the automated remediation workflow. Adjust initiation events and remediation logic if necessary.

## Resources

**Related documents:**

- [CloudWatch
Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [Monitoring,
Logging, and Performance AWS Partner Network Partners](https://aws.amazon.com/devops/partner-solutions/#_Monitoring.2C_Logging.2C_and_Performance)
- [X-Ray
Documentation](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Using
Alarms and Alarm Actions in CloudWatch](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/cw-example-using-alarm-actions.html)
- [Build a Cloud Automation Practice for Operational Excellence: Best Practices from AWS Managed Services](https://aws.amazon.com/blogs/mt/build-a-cloud-automation-practice-for-operational-excellence-best-practices-from-aws-managed-services/)
- [Automate your Amazon Redshift performance tuning with automatic table optimization](https://aws.amazon.com/blogs/big-data/automate-your-amazon-redshift-performance-tuning-with-automatic-table-optimization/)

**Related videos:**

- [AWS re:Invent 2023 - Strategies for automated scaling, remediation, and smart self-healing](https://www.youtube.com/watch?v=nlGyIa3UQYU)
- [AWS re:Invent 2023 - [LAUNCH] Application monitoring for modern workloads](https://www.youtube.com/watch?v=T2TovTLje8w)
- [AWS re:Invent 2023 - Implementing application observability](https://www.youtube.com/watch?v=IcTcwUSwIs4)
- [AWS re:Invent 2021 - Intelligently
automating cloud operations](https://www.youtube.com/watch?v=m0S8eAF0l54)
- [AWS re:Invent 2022 - Setting
up controls at scale in your AWS environment](https://www.youtube.com/watch?v=NkE9_okfPG8)
- [AWS re:Invent 2022 - Automating
patch management and compliance using AWS](https://www.youtube.com/watch?v=gL3baXQJvc0)
- [AWS re:Invent 2022 - How
Amazon uses better metrics for improved website
performance](https://www.youtube.com/watch?v=_uaaCiyJCFA&ab_channel=AWSEvents)
- [AWS re:Invent 2023 - Take a load off: Diagnose & resolve performance issues with Amazon RDS](https://www.youtube.com/watch?v=Ulj88e5Aqzg)
- [AWS re:Invent 2021 -{New Launch} Automatically detect and resolve issues with Amazon DevOps Guru](https://www.youtube.com/watch?v=iwQNQHwoXfk)
- [AWS re:Invent 2023 - Centralize your operations](https://www.youtube.com/watch?v=9-RBjmhDdaM)

**Related examples:**

- [CloudWatch Logs Customize Alarms](https://github.com/awslabs/cloudwatch-logs-customize-alarms)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_automation_remediate_issues.html*

---

# PERF05-BP06 Keep your workload and services up-to-date

Stay up-to-date on new cloud services and features to adopt
efficient features, remove issues, and improve the overall
performance efficiency of your workload.

**Common anti-patterns:**

- You assume your current architecture is static and will not be
updated over time.
- You do not have any systems or a regular cadence to evaluate if
updated software and packages are compatible with your workload.

**Benefits of establishing this best
practice:** By establishing a process to stay up-to-date on
new services and offerings, you can adopt new features and
capabilities, resolve issues, and improve workload performance.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Evaluate ways to improve performance as new services, design
patterns, and product features become available. Determine which
of these could improve performance or increase the efficiency of
the workload through evaluation, internal discussion, or external
analysis. Define a process to evaluate updates, new features, and
services relevant to your workload. For example, build a proof of
concept that uses new technologies or consult with an internal
group. When trying new ideas or services, run performance tests to
measure the impact that they have on the performance of the
workload.

## Implementation steps

- **Inventory your workload:**
Inventory your workload software and architecture and identify
components that need to be updated.
- **Identify update sources:**
Identify news and update sources related to your workload
components. As an example, you can subscribe to
the [What’s New
at AWS blog](https://aws.amazon.com/new/) for the products that match your workload
component. You can subscribe to the RSS feed or manage
your [email
subscriptions](https://pages.awscloud.com/communication-preferences.html).
- **Define an update schedule:**
Define a schedule to evaluate new services and features for
your workload.

You can
use [AWS Systems Manager Inventory](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-inventory.html) to collect operating
system (OS), application, and instance metadata from your
Amazon EC2 instances and quickly understand which
instances are running the software and configurations
required by your software policy and which instances need
to be updated.

- **Assess the new update:**
Understand how to update the components of your workload. Take
advantage of agility in the cloud to quickly test how new
features can improve your workload to gain performance
efficiency.
- **Use automation:**
Use automation for the update process to reduce the level of
effort to deploy new features and limit errors caused by
manual processes.

You can
use [CI/CD](https://aws.amazon.com/blogs/devops/complete-ci-cd-with-aws-codecommit-aws-codebuild-aws-codedeploy-and-aws-codepipeline/) to
automatically update AMIs, container images, and other
artifacts related to your cloud application.
- You can use tools such
as [AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html) to automate the
process of system updates, and schedule the activity
using [AWS Systems Manager Maintenance Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-maintenance.html).

- **Document the process:**
Document your process for evaluating updates and new services.
Provide your owners the time and space needed to research,
test, experiment, and validate updates and new services. Refer
back to the documented business requirements and KPIs to help
prioritize which update will make a positive business impact.

## Resources

**Related documents:**

- [AWS Blog](https://aws.amazon.com/blogs/)
- [What's
New with AWS](https://aws.amazon.com/new/?ref=wellarchitected)
- [Implementing up-to-date images with automated EC2 Image Builder pipelines](https://aws.amazon.com/blogs/compute/implementing-up-to-date-images-with-automated-ec2-image-builder-pipelines/)

**Related videos:**

- [AWS re:Inforce 2022 - Automating patch management and compliance using AWS](https://www.youtube.com/watch?v=gL3baXQJvc0)
- [All Things Patch: AWS Systems Manager | AWS Events](https://www.youtube.com/watch?v=PhIiVsCEBu8)

**Related examples:**

- [Inventory and Patch Management](https://mng.workshop.aws/ssm/use-case-labs/inventory_patch_management.html)
- [One Observability Workshop](https://catalog.workshops.aws/observability/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_keep_workload_and_services_up_to_date.html*

---

# PERF05-BP07 Review metrics at regular intervals

As part of routine maintenance or in response to events or
incidents, review which metrics are collected. Use these reviews to
identify which metrics were essential in addressing issues and which
additional metrics, if they were being tracked, could help identify,
address, or prevent issues.

**Common anti-patterns:**

- You allow metrics to stay in an alarm state for an extended
period of time.
- You create alarms that are not actionable by an automation
system.

**Benefits of establishing this best
practice:** Continually review metrics that are being
collected to verify that they properly identify, address, or prevent
issues. Metrics can also become stale if you let them stay in an
alarm state for an extended period of time.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Constantly improve metric collection and monitoring. As part of
responding to incidents or events, evaluate which metrics were
helpful in addressing the issue and which metrics could have
helped that are not currently being tracked. Use this method to
improve the quality of metrics you collect so that you can prevent,
or more quickly resolve future incidents.

As part of responding to incidents or events, evaluate which
metrics were helpful in addressing the issue and which metrics
could have helped that are not currently being tracked. Use this
to improve the quality of metrics you collect so that you can
prevent or more quickly resolve future incidents.

### Implementation steps

- **Define metrics:** Define critical performance metrics to monitor that are aligned to your workload
objective, including metrics such as response time and resource utilization.
- **Establish baselines:** Set a baseline and desirable value for each metric. The baseline should provide reference points to identify deviation or anomalies.
- **Set up a cadence:** Set a cadence (like weekly or monthly) to review critical metrics.
- **Identify performance issues:** During each review, assess trends and deviation from the baseline values. Look for
any performance bottlenecks or anomalies. For identified issues, conduct in-depth root cause analysis to understand the main
reason behind the issue.
- **Identify corrective actions:** Use your analysis to identify corrective actions. This may include parameter tuning, fixing bugs, and scaling resources.
- **Document findings:** Document your findings, including identified issues, root causes, and corrective actions.
- **Iterate and improve:** Continually assess and improve the metrics review process. Use the lesson learned from previous review to enhance the process over time.

## Resources

**Related documents:**

- [CloudWatch
Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [Collect
metrics and logs from Amazon EC2 Instances and on-premises
servers with the CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html?ref=wellarchitected)
- [Query your metrics with CloudWatch Metrics Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html)
- [Monitoring,
Logging, and Performance AWS Partner Network Partners](https://aws.amazon.com/devops/partner-solutions/#_Monitoring.2C_Logging.2C_and_Performance)
- [X-Ray
Documentation](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)

**Related videos:**

- [AWS re:Invent 2022 - Setting
up controls at scale in your AWS environment](https://www.youtube.com/watch?v=NkE9_okfPG8)
- [AWS re:Invent 2022 - How
Amazon uses better metrics for improved website
performance](https://www.youtube.com/watch?v=_uaaCiyJCFA&ab_channel=AWSEvents)
- [AWS re:Invent 2023 - Building an effective observability strategy](https://www.youtube.com/watch?v=7PQv9eYCJW8)
- [AWS Summit SF 2022 - Full-stack observability and application monitoring with AWS](https://www.youtube.com/watch?v=or7uFFyHIX0)
- [AWS re:Invent 2023 - Take a load off: Diagnose & resolve performance issues with Amazon RDS](https://www.youtube.com/watch?v=Ulj88e5Aqzg)

**Related examples:**

- [Creating
a dashboard with Quick](https://github.com/aws-samples/amazon-quicksight-sdk-proserve)
- [CloudWatch Dashboards](https://catalog.us-east-1.prod.workshops.aws/workshops/a8e9c6a6-0ba9-48a7-a90d-378a440ab8ba/en-US/300-cloudwatch/340-cloudwatch-dashboards)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_process_culture_review_metrics.html*

---
