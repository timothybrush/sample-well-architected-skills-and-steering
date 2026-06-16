# OPS 4 — How do you implement observability in your workload?

**Pillar**: Operational Excellence  
**Best Practices**: 5

---

# OPS04-BP01 Identify key performance indicators

Implementing observability in your workload starts with understanding its state and making data-driven decisions based on business requirements. One of the most effective ways to ensure alignment between monitoring activities and business objectives is by defining and monitoring key performance indicators (KPIs).

**Desired outcome:** Efficient observability practices that are tightly aligned with business objectives, ensuring that monitoring efforts are always in service of tangible business outcomes.

**Common anti-patterns:**

- Undefined KPIs: Working without clear KPIs can lead to monitoring too much or too little, missing vital signals.
- Static KPIs: Not revisiting or refining KPIs as the workload or business objectives evolve.
- Misalignment: Focusing on technical metrics that don’t correlate directly with business outcomes or are harder to correlate with real-world issues.

**Benefits of establishing this best
practice:**

- Ease of issue identification: Business KPIs often surface issues more clearly than technical metrics. A dip in a business KPI can pinpoint a problem more effectively than sifting through numerous technical metrics.
- Business alignment: Ensures that monitoring activities directly support business objectives.
- Efficiency: Prioritize monitoring resources and attention on metrics that matter.
- Proactivity: Recognize and address issues before they have broader business implications.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To effectively define workload KPIs:

- **Start with business outcomes:** Before diving into metrics, understand the desired business outcomes. Is it increased sales, higher user engagement, or faster response times?
- **Correlate technical metrics with business objectives:** Not all technical metrics have a direct impact on business outcomes. Identify those that do, but it's often more straightforward to identify an issue using a business KPI.
- **Use [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html):** Employ CloudWatch to define and monitor metrics that represent your KPIs.
- **Regularly review and update KPIs:** As your workload and business evolve, keep your KPIs relevant.
- **Involve stakeholders:** Involve both technical and business teams in defining and reviewing KPIs.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS04-BP03 Implement user experience telemetry](./ops_observability_customer_telemetry.html)
- [OPS04-BP04 Implement dependency telemetry](./ops_observability_dependency_telemetry.html)
- [OPS04-BP05 Implement distributed tracing](./ops_observability_dist_trace.html)

**Related documents:**

- [AWS Observability Best Practices](https://aws-observability.github.io/observability-best-practices/)
- [CloudWatch User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [AWS Observability Skill Builder Course](https://explore.skillbuilder.aws/learn/course/external/view/elearning/14688/aws-observability)

**Related videos:**

- [Developing an observability strategy](https://www.youtube.com/watch?v=Ub3ATriFapQ)

**Related examples:**

- [One
Observability Workshop](https://catalog.workshops.aws/observability/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_identify_kpis.html*

---

# OPS04-BP02 Implement application telemetry

Application telemetry serves as the foundation for observability of
your workload. It's crucial to emit telemetry that offers actionable
insights into the state of your application and the achievement of
both technical and business outcomes. From troubleshooting to
measuring the impact of a new feature or ensuring alignment with
business key performance indicators (KPIs), application telemetry
informs the way you build, operate, and evolve your workload.

Metrics, logs, and traces form the three primary pillars of
observability. These serve as diagnostic tools that describe the
state of your application. Over time, they assist in creating
baselines and identifying anomalies. However, to ensure alignment
between monitoring activities and business objectives, it's pivotal
to define and monitor KPIs. Business KPIs often make it easier to
identify issues compared to technical metrics alone.

Other telemetry types, like real user monitoring (RUM) and synthetic
transactions, complement these primary data sources. RUM offers
insights into real-time user interactions, whereas synthetic
transactions simulate potential user behaviors, helping detect
bottlenecks before real users encounter them.

**Desired outcome:** Derive
actionable insights into the performance of your workload. These
insights allow you to make proactive decisions about performance
optimization, achieve increased workload stability, streamline CI/CD
processes, and utilize resources effectively.

**Common anti-patterns:**

- **Incomplete observability:** Neglecting to incorporate
observability at every layer of the workload, resulting in blind
spots that can obscure vital system performance and behavior
insights.
- **Fragmented data view:** When data is scattered across multiple
tools and systems, it becomes challenging to maintain a holistic
view of your workload's health and performance.
- **User-reported issues:** A sign that proactive issue detection
through telemetry and business KPI monitoring is lacking.

**Benefits of establishing this best
practice:**

- **Informed decision-making:** With insights from telemetry and
business KPIs, you can make data-driven decisions.
- **Improved operational efficiency:** Data-driven resource
utilization leads to cost-effectiveness.
- **Enhanced workload stability:** Faster detection and resolution of
issues leading to improved uptime.
- **Streamlined CI/CD processes:** Insights from telemetry data
facilitate refinement of processes and reliable code delivery.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To implement application telemetry for your workload, use AWS
services like
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and
[AWS X-Ray](https://aws.amazon.com/xray/).
Amazon CloudWatch provides a comprehensive suite of monitoring
tools, allowing you to observe your resources and applications in
AWS and on-premises environments. It collects, tracks, and
analyzes metrics, consolidates and monitors log data, and responds
to changes in your resources, enhancing your understanding of how
your workload operates. In tandem, AWS X-Ray lets you trace,
analyze, and debug your applications, giving you a deep
understanding of your workload's behavior. With features like
service maps, latency distributions, and trace timelines, AWS X-Ray provides insights into your workload's performance and the
bottlenecks affecting it.

### Implementation steps

- **Identify what data to
collect:** Ascertain the essential metrics, logs,
and traces that would offer substantial insights into your
workload's health, performance, and behavior.
- **Deploy the
[CloudWatch
agent](https://aws.amazon.com/cloudwatch/):** The CloudWatch agent is
instrumental in procuring system and application metrics and
logs from your workload and its underlying infrastructure.
The CloudWatch agent can also be used to collect
OpenTelemetry or X-Ray traces and send them to X-Ray.
- **Implement anomaly detection for logs
and metrics:** Use
[CloudWatch Logs anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection.html) and
[CloudWatch
Metrics anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html) to automatically identify
unusual activities in your application's operations. These
tools use machine learning algorithms to detect and alert on
anomalies, which enanhces your monitoring capabilities and
speeds up response time to potential disruptions or security
threats. Set up these features to proactively manage
application health and security.
- **Secure sensitive log
data:** Use
[Amazon CloudWatch Logs data protection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html) to mask sensitive
information within your logs. This feature helps maintain
privacy and compliance through automatic detection and
masking of sensitive data before it is accessed. Implement
data masking to securely handle and protect sensitive
details such as personally identifiable information (PII).
- **Define and monitor business
KPIs:** Establish
[custom
metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html) that align with your
[business
outcomes](https://aws-observability.github.io/observability-best-practices/guides/operational/business/monitoring-for-business-outcomes/).
- **Instrument your application with AWS X-Ray:** In addition to deploying the CloudWatch
agent, it's crucial to
[instrument
your application](https://docs.aws.amazon.com/xray/latest/devguide/xray-instrumenting-your-app.html) to emit trace data. This process can
provide further insights into your workload's behavior and
performance.
- **Standardize data collection across
your application:** Standardize data collection
practices across your entire application. Uniformity aids in
correlating and analyzing data, providing a comprehensive
view of your application's behavior.
- **Implement cross-account
observability:** Enhance monitoring efficiency
across multiple AWS accounts with
[Amazon CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html). With this
feature, you can consolidate metrics, logs, and alarms from
different accounts into a single view, which simplifies
management and improves response times for identified issues
across your organization's AWS environment.
- **Analyze and act on the
data:** Once data collection and normalization are
in place, use
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/features/) for metrics and logs analysis, and
[AWS X-Ray](https://aws.amazon.com/xray/features/) for trace analysis. Such analysis can yield
crucial insights into your workload's health, performance,
and behavior, guiding your decision-making process.

**Level of effort for the implementation
plan:** High

## Resources

**Related best practices:**

- [OPS04-BP01
Define workload KPIs](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_identify_kpis.html)
- [OPS04-BP03
Implement user activity telemetry](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_customer_telemetry.html)
- [OPS04-BP04
Implement dependency telemetry](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_dependency_telemetry.html)
- [OPS04-BP05
Implement transaction traceability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_dist_trace.html)

**Related documents:**

- [AWS Observability Best Practices](https://aws-observability.github.io/observability-best-practices/)
- [CloudWatch
User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [AWS X-Ray Developer Guide](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Instrumenting
distributed systems for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility)
- [AWS Observability Skill Builder Course](https://explore.skillbuilder.aws/learn/course/external/view/elearning/14688/aws-observability)
- [What's
New with Amazon CloudWatch](https://aws.amazon.com/about-aws/whats-new/management-and-governance/?whats-new-content.sort-by=item.additionalFields.postDateTime&whats-new-content.sort-order=desc&awsf.whats-new-products=general-products%23amazon-cloudwatch)
- [What's
new with AWS X-Ray](https://aws.amazon.com/about-aws/whats-new/developer-tools/?whats-new-content.sort-by=item.additionalFields.postDateTime&whats-new-content.sort-order=desc&awsf.whats-new-products=general-products%23aws-x-ray)

**Related videos:**

- [AWS re:Invent
2022 - Observability best practices at Amazon](https://youtu.be/zZPzXEBW4P8)
- [AWS re:Invent
2022 - Developing an observability strategy](https://youtu.be/Ub3ATriFapQ)

**Related examples:**

- [One
Observability Workshop](https://catalog.workshops.aws/observability)
- [AWS Solutions Library: Application Monitoring with Amazon CloudWatch](https://aws.amazon.com/solutions/implementations/application-monitoring-with-cloudwatch)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_application_telemetry.html*

---

# OPS04-BP03 Implement user experience telemetry

Gaining deep insights into customer experiences and interactions with your application is crucial. Real user monitoring (RUM) and synthetic transactions serve as powerful tools for this purpose. RUM provides data about real user interactions granting an unfiltered perspective of user satisfaction, while synthetic transactions simulate user interactions, helping in detecting potential issues even before they impact real users.

**Desired outcome:** A holistic view of the customer experience, proactive detection of issues, and optimization of user interactions to deliver seamless digital experiences.

**Common anti-patterns:**

- Applications without real user monitoring (RUM):

Delayed issue detection: Without RUM, you might not become aware of performance bottlenecks or issues until users complain. This reactive approach can lead to customer dissatisfaction.
- Lack of user experience insights: Not using RUM means you lose out on crucial data that shows how real users interact with your application, limiting your ability to optimize the user experience.

- Applications without synthetic transactions:

Missed edge cases: Synthetic transactions help you test paths and functions that might not be frequently used by typical users but are critical to certain business functions. Without them, these paths could malfunction and go unnoticed.
- Checking for issues when the application is not being used: Regular synthetic testing can simulate times when real users aren't actively interacting with your application, ensuring the system always functions correctly.

**Benefits of establishing this best
practice:**

- Proactive issue detection: Identify and address potential issues before they impact real users.
- Optimized user experience: Continuous feedback from RUM aids in refining and enhancing the overall user experience.
- Insights on device and browser performance: Understand how your application performs across various devices and browsers, enabling further optimization.
- Validated business workflows: Regular synthetic transactions ensure that core functionalities and critical paths remain operational and efficient.
- Enhanced application performance: Leverage insights gathered from real user data to improve application responsiveness and reliability.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To leverage RUM and synthetic transactions for user activity telemetry, AWS offers services like [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html) and [Amazon CloudWatch Synthetics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html). Metrics, logs, and traces, coupled with user activity data, provide a comprehensive view of both the application's operational state and the user experience.

### Implementation steps

- **Deploy Amazon CloudWatch RUM:** Integrate your application with CloudWatch RUM to collect, analyze, and present real user data.

Use the [CloudWatch RUM JavaScript library](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html) to integrate RUM with your application.
- Set up dashboards to visualize and monitor real user data.

- **Configure CloudWatch Synthetics:** Create canaries, or scripted routines, that simulate user interactions with your application.

Define critical application workflows and paths.
- Design canaries using [CloudWatch Synthetics scripts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html) to simulate user interactions for these paths.
- Schedule and monitor canaries to run at specified intervals, ensuring consistent performance checks.

- **Analyze and act on data:** Utilize data from RUM and synthetic transactions to gain insights and take corrective measures when anomalies are detected. Use CloudWatch dashboards and alarms to stay informed.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS04-BP04 Implement dependency telemetry](./ops_observability_dependency_telemetry.html)
- [OPS04-BP05 Implement distributed tracing](./ops_observability_dist_trace.html)

**Related documents:**

- [Amazon CloudWatch RUM Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)
- [Amazon CloudWatch Synthetics Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)

**Related videos:**

- [Optimize applications through end user insights with Amazon CloudWatch RUM](https://www.youtube.com/watch?v=NMaeujY9A9Y)
- [AWS on Air ft. Real-User Monitoring for Amazon CloudWatch](https://www.youtube.com/watch?v=r6wFtozsiVE)

**Related examples:**

- [One Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)
- [Git Repository for Amazon CloudWatch RUM Web Client](https://github.com/aws-observability/aws-rum-web)
- [Using Amazon CloudWatch Synthetics to measure page load time](https://github.com/aws-samples/amazon-cloudwatch-synthetics-page-performance)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_customer_telemetry.html*

---

# OPS04-BP04 Implement dependency telemetry

Dependency telemetry is essential for monitoring the health and
performance of the external services and components your workload
relies on. It provides valuable insights into reachability,
timeouts, and other critical events related to dependencies such as
DNS, databases, or third-party APIs. When you instrument your
application to emit metrics, logs, and traces about these
dependencies, you gain a clearer understanding of potential
bottlenecks, performance issues, or failures that might impact your
workload.

**Desired outcome:** Ensure that the
dependencies your workload relies on are performing as expected,
allowing you to proactively address issues and ensure optimal
workload performance.

**Common anti-patterns:**

- **Overlooking external dependencies:** Focusing only on internal
application metrics while neglecting metrics related to external
dependencies.
- **Lack of proactive monitoring:** Waiting for issues to arise
instead of continuously monitoring dependency health and
performance.
- **Siloed monitoring:** Using multiple, disparate monitoring tools
which can result in fragmented and inconsistent views of
dependency health.

**Benefits of establishing this best
practice:**

- **Improved workload reliability:** By ensuring that external
dependencies are consistently available and performing
optimally.
- **Faster issue detection and resolution:** Proactively identifying
and addressing issues with dependencies before they impact the
workload.
- **Comprehensive view:** Gaining a holistic view of both internal and
external components that influence workload health.
- **Enhanced workload scalability:** By understanding the scalability
limits and performance characteristics of external dependencies.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implement dependency telemetry by starting with identifying the
services, infrastructure, and processes that your workload depends
on. Quantify what good conditions look like when those
dependencies are functioning as expected, and then determine what
data will be needed to measure those. With that information you
can craft dashboards and alerts that provide insights to your
operations teams on the state of those dependencies. Use AWS tools
to discover and quantify the impacts when dependencies cannot
deliver as needed. Continually revisit your strategy to account
for changes in priorities, goals, and gained insights.

### Implementation steps

To implement dependency telemetry effectively:

- **Identify external
dependencies:** Collaborate with stakeholders to
pinpoint the external dependencies your workload relies on.
External dependencies can encompass services like external
databases, third-party APIs, network connectivity routes to
other environments, and DNS services. The first step towards
effective dependency telemetry is being comprehensive in
understanding what those dependencies are.
- **Develop a monitoring
strategy:** Once you have a clear picture of your
external dependencies, architect a monitoring strategy
tailored to them. This involves understanding the
criticality of each dependency, its expected behavior, and
any associated service-level agreements or targets (SLA or
SLTs). Set up proactive alerts to notify you of status
changes or performance deviations.
- **Use
[network
monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Network-Monitoring-Sections.html):** Use
[Internet
Monitor](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html) and
[Network
Monitor](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/what-is-network-monitor.html), which provide comprehensive insights into
global internet and network conditions. These tools help you
understand and respond to outages, disruptions, or
performance degradations that affect your external
dependencies.
- **Stay informed with
[AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/):** AWS Health is the authoritative source of information about the health of your AWS Cloud resources. Use AWS Health to visualize and receive notifications about any current service events and upcoming changes, such as planned lifecycle events, so you can take steps to mitigate impacts.

[Create purpose-fit AWS Health event notifications](https://docs.aws.amazon.com/health/latest/ug/user-notifications.html) to e-mail and chat channels through [AWS User Notifications](https://docs.aws.amazon.com/notifications/latest/userguide/what-is-service.html), and integrate programatically with [your monitoring and alerting tools through Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html) or the [AWS Health API](https://docs.aws.amazon.com/health/latest/APIReference/Welcome.html).
- Plan and track progress on health events that require action by integrating with change management or ITSM tools (like [Jira](https://docs.aws.amazon.com/smc/latest/ag/cloud-sys-health.html) or [ServiceNow](https://docs.aws.amazon.com/smc/latest/ag/sn-aws-health.html)) that you may already use through Amazon EventBridge or the AWS Health API.
- If you use AWS Organizations, enable
[organization view for
AWS Health](https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html) to aggregate AWS Health events across accounts.

- **Instrument your application with
[AWS X-Ray](https://aws.amazon.com/xray/):** AWS X-Ray provides insights into
how applications and their underlying dependencies are
performing. By tracing requests from start to end, you can
identify bottlenecks or failures in the external services or
components your application relies on.
- **Use
[Amazon DevOps Guru](https://aws.amazon.com/devops-guru/):** This machine learning-driven
service identifies operational issues, predicts when
critical issues might occur, and recommends specific actions
to take. It's invaluable for gaining insights into
dependencies and ensuring they're not the source of
operational problems.
- **Monitor regularly:**
Continually monitor metrics and logs related to external
dependencies. Set up alerts for unexpected behavior or
degraded performance.
- **Validate after changes:**
Whenever there's an update or change in any of the external
dependencies, validate their performance and check their
alignment with your application's requirements.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01
Define workload KPIs](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_identify_kpis.html)
- [OPS04-BP02
Implement application telemetry](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_application_telemetry.html)
- [OPS04-BP03
Implement user activity telemetry](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_customer_telemetry.html)
- [OPS04-BP05
Implement transaction traceability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_dist_trace.html)
- [OP08-BP04
Create actionable alerts](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_create_alerts.html)

**Related documents:**

- [Amazon
Personal Health Dashboard User Guide](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html)
- [AWS Internet Monitor User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html)
- [AWS X-Ray Developer Guide](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [AWS DevOps Guru User Guide](https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html)

**Related videos:**

- [Visibility
into how internet issues impact app performance](https://www.youtube.com/watch?v=Kuc_SG_aBgQ)
- [Introduction
to Amazon DevOps Guru](https://www.youtube.com/watch?v=2uA8q-8mTZY)
- [Manage
resource lifecycle events at scale with AWS Health](https://www.youtube.com/watch?v=VoLLNL5j9NA)

**Related examples:**

- [AWS Health Aware](https://github.com/aws-samples/aws-health-aware/)
- [Using
Tag-Based Filtering to Manage AWS Health Monitoring and
Alerting at Scale](https://aws.amazon.com/blogs/mt/using-tag-based-filtering-to-manage-health-monitoring-and-alerting-at-scale/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_dependency_telemetry.html*

---

# OPS04-BP05 Implement distributed tracing

Distributed tracing offers a way to monitor and visualize requests as they traverse through various components of a distributed system. By capturing trace data from multiple sources and analyzing it in a unified view, teams can better understand how requests flow, where bottlenecks exist, and where optimization efforts should focus.

**Desired outcome:** Achieve a holistic view of requests flowing through your distributed system, allowing for precise debugging, optimized performance, and improved user experiences.

**Common anti-patterns:**

- Inconsistent instrumentation: Not all services in a distributed system are instrumented for tracing.
- Ignoring latency: Only focusing on errors and not considering the latency or gradual performance degradations.

**Benefits of establishing this best
practice:**

- Comprehensive system overview: Visualizing the entire path of requests, from entry to exit.
- Enhanced debugging: Quickly identifying where failures or performance issues occur.
- Improved user experience: Monitoring and optimizing based on actual user data, ensuring the system meets real-world demands.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Begin by identifying all of the elements of your workload that require instrumentation. Once all components are accounted for, leverage tools such as AWS X-Ray and OpenTelemetry to gather trace data for analysis with tools like X-Ray and Amazon CloudWatch ServiceLens Map. Engage in regular reviews with developers, and supplement these discussions with tools like Amazon DevOps Guru, X-Ray Analytics and X-Ray Insights to help uncover deeper findings. Establish alerts from trace data to notify when outcomes, as defined in the workload monitoring plan, are at risk.

### Implementation steps

To implement distributed tracing effectively:

- **Adopt [AWS X-Ray](https://aws.amazon.com/xray/):** Integrate X-Ray into your application to gain insights into its behavior, understand its performance, and pinpoint bottlenecks. Utilize X-Ray Insights for automatic trace analysis.
- **Instrument your services:** Verify that every service, from an [AWS Lambda](https://aws.amazon.com/lambda/) function to an [EC2 instance](https://aws.amazon.com/ec2/), sends trace data. The more services you instrument, the clearer the end-to-end view.
- **Incorporate [CloudWatch Real User Monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html) and [synthetic monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html):** Integrate Real User Monitoring (RUM) and synthetic monitoring with X-Ray. This allows for capturing real-world user experiences and simulating user interactions to identify potential issues.
- **Use the [CloudWatch agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html):** The agent can send traces from either X-Ray or OpenTelemetry, enhancing the depth of insights obtained.
- **Use [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/):** DevOps Guru uses data from X-Ray, CloudWatch, AWS Config, and AWS CloudTrail to provide actionable recommendations.
- **Analyze traces:** Regularly review the trace data to discern patterns, anomalies, or bottlenecks that might impact your application's performance.
- **Set up alerts:** Configure alarms in [CloudWatch](https://aws.amazon.com/cloudwatch/) for unusual patterns or extended latencies, allowing proactive issue addressing.
- **Continuous improvement:** Revisit your tracing strategy as services are added or modified to capture all relevant data points.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS04-BP03 Implement user experience telemetry](./ops_observability_customer_telemetry.html)
- [OPS04-BP04 Implement dependency telemetry](./ops_observability_dependency_telemetry.html)

**Related documents:**

- [AWS X-Ray Developer Guide](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Amazon CloudWatch agent User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
- [Amazon DevOps Guru User Guide](https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html)

**Related videos:**

- [Use AWS X-Ray Insights](https://www.youtube.com/watch?v=tl8OWHl6jxw)
- [AWS on Air ft. Observability: Amazon CloudWatch and AWS X-Ray](https://www.youtube.com/watch?v=qBDBnPkZ-KI)

**Related examples:**

- [Instrumenting your application for AWS X-Ray](https://aws.amazon.com/xray/latest/devguide/xray-instrumenting-your-app.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_dist_trace.html*

---
