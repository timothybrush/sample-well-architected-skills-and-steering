# OPS 8 — How do you utilize workload observability in your organization?

**Pillar**: Operational Excellence  
**Best Practices**: 5

---

# OPS08-BP01 Analyze workload metrics

After implementing application telemetry, regularly analyze the collected metrics. While latency, requests, errors, and capacity (or quotas) provide insights into system performance, it's vital to prioritize the review of business outcome metrics. This ensures you're making data-driven decisions aligned with your business objectives.

**Desired outcome:** Accurate insights into workload performance that drive data-informed decisions, ensuring alignment with business objectives.

**Common anti-patterns:**

- Analyzing metrics in isolation without considering their impact on business outcomes.
- Over-reliance on technical metrics while sidelining business metrics.
- Infrequent review of metrics, missing out on real-time decision-making opportunities.

**Benefits of establishing this best
practice:**

- Enhanced understanding of the correlation between technical performance and business outcomes.
- Improved decision-making process informed by real-time data.
- Proactive identification and mitigation of issues before they affect business outcomes.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Leverage tools like Amazon CloudWatch to perform metric analysis. AWS services such as CloudWatch anomaly detection and Amazon DevOps Guru can be used to detect anomalies, especially when static thresholds are unknown or when patterns of behavior are more suited for anomaly detection.

### Implementation steps

- **Analyze and review:** Regularly review and interpret your
workload metrics.

Prioritize business outcome metrics over purely technical metrics.
- Understand the significance of spikes, drops, or patterns in your data.

- **Utilize Amazon CloudWatch:** Use Amazon CloudWatch for a centralized view and deep-dive analysis.

Configure CloudWatch dashboards to visualize your metrics and compare them over time.
- Use [percentiles in CloudWatch](https://aws-observability.github.io/observability-best-practices/guides/operational/business/sla-percentile/) to get a clear view of metric distribution, which can help in defining SLAs and understanding outliers.
- Set up [CloudWatch anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html) to identify unusual patterns without relying on static thresholds.
- Implement [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html) to monitor and troubleshoot applications that span multiple accounts within a Region.
- Use [CloudWatch Metric Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html) to query and analyze metric data across accounts and Regions, identifying trends and anomalies.
- Apply [CloudWatch Metric Math](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html) to transform, aggregate, or perform calculations on your metrics for deeper insights.

- **Employ Amazon DevOps Guru:** Incorporate [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/) for its machine learning-enhanced anomaly detection to identify early signs of operational issues for your serverless applications and remediate them before they impact your customers.
- **Optimize based on insights:** Make informed decisions based on your metric analysis to adjust and improve your workloads.

**Level of effort for the Implementation Plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)

**Related documents:**

- [The Wheel Blog - Emphasizing the importance of continually reviewing metrics](https://aws.amazon.com/blogs/opensource/the-wheel/)
- [Percentile are important](https://aws-observability.github.io/observability-best-practices/guides/operational/business/sla-percentile/)
- [Using AWS Cost Anomaly Detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html)
- [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html)
- [Query your metrics with CloudWatch Metrics Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html)

**Related videos:**

- [Enable Cross-Account Observability in Amazon CloudWatch](https://www.youtube.com/watch?v=lUaDO9dqISc)
- [Introduction to Amazon DevOps Guru](https://www.youtube.com/watch?v=2uA8q-8mTZY)
- [Continuously Analyze Metrics using AWS Cost Anomaly Detection](https://www.youtube.com/watch?v=IpQYBuay5OE)

**Related examples:**

- [One Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)
- [Gaining operation insights with AIOps using Amazon DevOps Guru](https://catalog.us-east-1.prod.workshops.aws/workshops/f92df379-6add-4101-8b4b-38b788e1222b/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_analyze_workload_metrics.html*

---

# OPS08-BP02 Analyze workload logs

Regularly analyzing workload logs is essential for gaining a deeper
understanding of the operational aspects of your application. By
efficiently sifting through, visualizing, and interpreting log data,
you can continually optimize application performance and security.

**Desired outcome:** Rich insights
into application behavior and operations derived from thorough log
analysis, ensuring proactive issue detection and mitigation.

**Common anti-patterns:**

- Neglecting the analysis of logs until a critical issue arises.
- Not using the full suite of tools available for log analysis,
missing out on critical insights.
- Solely relying on manual review of logs without leveraging
automation and querying capabilities.

**Benefits of establishing this best
practice:**

- Proactive identification of operational bottlenecks, security
threats, and other potential issues.
- Efficient utilization of log data for continuous application
optimization.
- Enhanced understanding of application behavior, aiding in
debugging and troubleshooting.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

[Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html) is a powerful tool for log analysis.
Integrated features like CloudWatch Logs Insights and Contributor
Insights make the process of deriving meaningful information from
logs intuitive and efficient.

### Implementation steps

- **Set up CloudWatch Logs**:
Configure applications and services to send logs to
CloudWatch Logs.
- **Use log anomaly
detection:** Utilize
[Amazon CloudWatch Logs anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection.html) to automatically
identify and alert on unusual log patterns. This tool helps
you proactively manage anomalies in your logs and detect
potential issues early.
- **Set up CloudWatch Logs
Insights**: Use
[CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html) to interactively search and analyze
your log data.

Craft queries to extract patterns, visualize log data,
and derive actionable insights.
- Use
[CloudWatch Logs Insights pattern analysis](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Patterns.html) to analyze and
visualize frequent log patterns. This feature helps you
understand common operational trends and potential
outliers in your log data.
- Use
[CloudWatch Logs compare (diff)](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Compare.html) to perform differential
analysis between different time periods or across
different log groups. Use this capability to pinpoint
changes and assess their impacts on your system's
performance or behavior.

- **Monitor logs in real-time with Live
Tail:** Use
[Amazon CloudWatch Logs Live Tail](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html) to view log data in
real-time. You can actively monitor your application's
operational activities as they occur, which provides
immediate visibility into system performance and potential
issues.
- **Leverage Contributor
Insights**: Use
[CloudWatch
Contributor Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html) to identify top talkers in high
cardinality dimensions like IP addresses or user-agents.
- **Implement CloudWatch Logs metric
filters**: Configure
[CloudWatch Logs metric filters](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html) to convert log data into
actionable metrics. This allows you to set alarms or further
analyze patterns.
- **Implement
[CloudWatch
cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html):** Monitor and
troubleshoot applications that span multiple accounts within
a Region.
- **Regular review and
refinement**: Periodically review your log analysis
strategies to capture all relevant information and
continually optimize application performance.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS08-BP01 Analyze workload metrics](./ops_workload_observability_analyze_workload_metrics.html)

**Related documents:**

- [Analyzing
Log Data with CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)
- [Using
CloudWatch Contributor Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html)
- [Creating
and Managing CloudWatch Log Metric Filters](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html)

**Related videos:**

- [Analyze
Log Data with CloudWatch Logs Insights](https://www.youtube.com/watch?v=2s2xcwm8QrM)
- [Use
CloudWatch Contributor Insights to Analyze High-Cardinality
Data](https://www.youtube.com/watch?v=ErWRBLFkjGI)

**Related examples:**

- [CloudWatch Logs Sample Queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html)
- [One
Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_analyze_workload_logs.html*

---

# OPS08-BP03 Analyze workload traces

Analyzing trace data is crucial for achieving a comprehensive view
of an application's operational journey. By visualizing and
understanding the interactions between various components,
performance can be fine-tuned, bottlenecks identified, and user
experiences enhanced.

**Desired outcome:** Achieve clear
visibility into your application's distributed operations, enabling
quicker issue resolution and an enhanced user experience.

**Common anti-patterns:**

- Overlooking trace data, relying solely on logs and metrics.
- Not correlating trace data with associated logs.
- Ignoring the metrics derived from traces, such as latency and
fault rates.

**Benefits of establishing this best
practice:**

- Improve troubleshooting and reduce mean time to resolution
(MTTR).
- Gain insights into dependencies and their impact.
- Swift identification and rectification of performance issues.
- Leveraging trace-derived metrics for informed decision-making.
- Improved user experiences through optimized component
interactions.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

[AWS X-Ray](https://www.docs.aws.com/xray/latest/devguide/aws-xray.html) offers a comprehensive suite for trace data analysis,
providing a holistic view of service interactions, monitoring user
activities, and detecting performance issues. Features like
ServiceLens, X-Ray Insights, X-Ray Analytics, and Amazon DevOps Guru enhance the depth of actionable insights derived from trace
data.

### Implementation steps

The following steps offer a structured approach to effectively
implementing trace data analysis using AWS services:

- **Integrate AWS X-Ray**:
Ensure X-Ray is integrated with your applications to capture
trace data.
- **Analyze X-Ray metrics**:
Delve into metrics derived from X-Ray traces, such as
latency, request rates, fault rates, and response time
distributions, using the
[service
map](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-servicemap.html#xray-console-servicemap-view) to monitor application health.
- **Use ServiceLens**: Leverage
the
[ServiceLens
map](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_service_map.html) for enhanced observability of your services and
applications. This allows for integrated viewing of traces,
metrics, logs, alarms, and other health information.
- **Enable X-Ray Insights**:

Turn on
[X-Ray
Insights](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-insights.html) for automated anomaly detection in
traces.
- Examine insights to pinpoint patterns and ascertain root
causes, such as increased fault rates or latencies.
- Consult the insights timeline for a chronological
analysis of detected issues.

- **Use X-Ray Analytics**:
[X-Ray
Analytics](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-analytics.html) allows you to thoroughly explore trace
data, pinpoint patterns, and extract insights.
- **Use groups in X-Ray**:
Create groups in X-Ray to filter traces based on criteria
such as high latency, allowing for more targeted analysis.
- **Incorporate Amazon DevOps Guru**: Engage
[Amazon DevOps Guru](https://aws.amazon.com/devops-guru/) to benefit from machine learning models
pinpointing operational anomalies in traces.
- **Use CloudWatch
Synthetics**: Use
[CloudWatch
Synthetics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_tracing.html) to create canaries for continually
monitoring your endpoints and workflows. These canaries can
integrate with X-Ray to provide trace data for in-depth
analysis of the applications being tested.
- **Use Real User Monitoring
(RUM)**: With
[AWS X-Ray and CloudWatch RUM](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-RUM.html), you can analyze and debug
the request path starting from end users of your application
through downstream AWS managed services. This helps you
identify latency trends and errors that impact your end
users.
- **Correlate with logs**:
Correlate
[trace
data with related logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_troubleshooting.html#servicelens_troubleshooting_Nologs) within the X-Ray trace view
for a granular perspective on application behavior. This
allows you to view log events directly associated with
traced transactions.
- **Implement
[CloudWatch
cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html):** Monitor and
troubleshoot applications that span multiple accounts within
a Region.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS08-BP01 Analyze workload metrics](./ops_workload_observability_analyze_workload_metrics.html)
- [OPS08-BP02 Analyze workload logs](./ops_workload_observability_analyze_workload_logs.html)

**Related documents:**

- [Using
ServiceLens to Monitor Application Health](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ServiceLens.html)
- [Exploring
Trace Data with X-Ray Analytics](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-analytics.html)
- [Detecting
Anomalies in Traces with X-Ray Insights](https://docs.aws.amazon.com/xray/latest/devguide/xray-insights.html)
- [Continuous
Monitoring with CloudWatch Synthetics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)

**Related videos:**

- [Analyze
and Debug Applications Using Amazon CloudWatch Synthetics
& AWS X-Ray](https://www.youtube.com/watch?v=s2WvaV2eDO4)
- [Use
AWS X-Ray Insights](https://www.youtube.com/watch?v=tl8OWHl6jxw)

**Related examples:**

- [One
Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)
- [Implementing
X-Ray with AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html)
- [CloudWatch
Synthetics Canary Templates](https://github.com/aws-samples/cloudwatch-synthetics-canary-terraform)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_analyze_workload_traces.html*

---

# OPS08-BP04 Create actionable alerts

Promptly detecting and responding to deviations in your
application's behavior is crucial. Especially vital is recognizing
when outcomes based on key performance indicators (KPIs) are at risk
or when unexpected anomalies arise. Basing alerts on KPIs ensures
that the signals you receive are directly tied to business or
operational impact. This approach to actionable alerts promotes
proactive responses and helps maintain system performance and
reliability.

**Desired outcome:** Receive timely,
relevant, and actionable alerts for rapid identification and
mitigation of potential issues, especially when KPI outcomes are at
risk.

**Common anti-patterns:**

- Setting up too many non-critical alerts, leading to alert
fatigue.
- Not prioritizing alerts based on KPIs, making it hard to
understand the business impact of issues.
- Neglecting to address root causes, leading to repetitive alerts
for the same issue.

**Benefits of establishing this best
practice:**

- Reduced alert fatigue by focusing on actionable and relevant
alerts.
- Improved system uptime and reliability through proactive issue
detection and mitigation.
- Enhanced team collaboration and quicker issue resolution by
integrating with popular alerting and communication tools.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To create an effective alerting mechanism, it's vital to use
metrics, logs, and trace data that flag when outcomes based on
KPIs are at risk or anomalies are detected.

### Implementation steps

- **Determine key performance indicators
(KPIs)**: Identify your application's KPIs. Alerts
should be tied to these KPIs to reflect the business impact
accurately.
- **Implement anomaly
detection**:

**Use Amazon CloudWatch anomaly
detection**: Set up
[Amazon CloudWatch anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html) to automatically
detect unusual patterns, which helps you only generate
alerts for genuine anomalies.
- **Use AWS X-Ray Insights**:

Set up
[X-Ray
Insights](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-insights.html) to detect anomalies in trace data.
- Configure
[notifications
for X-Ray Insights](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-insights.html#xray-console-insight-notifications) to be alerted on detected
issues.

- **Integrate with Amazon DevOps Guru**:

Leverage
[Amazon DevOps Guru](https://aws.amazon.com/devops-guru/) for its machine learning
capabilities in detecting operational anomalies with
existing data.
- Navigate to the
[notification
settings](https://docs.aws.amazon.com/devops-guru/latest/userguide/update-notifications.html#navigate-to-notification-settings) in DevOps Guru to set up anomaly
alerts.

- **Implement actionable
alerts**: Design alerts that provide adequate
information for immediate action.

Monitor
[AWS Health events with Amazon EventBridge rules](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html), or
integrate programatically with the AWS Health API to
automate actions when you receive AWS Health events.
These can be general actions, such as sending all
planned lifecycle event messages to a chat interface, or
specific actions, such as the initiation of a workflow
in an IT service management tool.

- **Reduce alert fatigue**:
Minimize non-critical alerts. When teams are overwhelmed
with numerous insignificant alerts, they can lose oversight
of critical issues, which diminishes the overall
effectiveness of the alert mechanism.
- **Set up composite alarms**:
Use
[Amazon CloudWatch composite alarms](https://aws.amazon.com/bloprove-monitoring-efficiency-using-amazon-cloudwatch-composite-alarms-2/) to consolidate multiple
alarms.
- **Integrate with alert
tools**: Incorporate tools like
[Ops
Genie](https://www.atlassian.com/software/opsgenie) and
[PagerDuty](https://www.pagerduty.com/).
- **Engage Amazon Q Developer in chat applications**:
Integrate
[Amazon Q Developer in chat applications](https://aws.amazon.com/chatbot/) to relay alerts to Amazon Chime, Microsoft Teams,
and Slack.
- **Alert based on logs**: Use
[log
metric filters](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html) in CloudWatch to create alarms based
on specific log events.
- **Review and iterate**:
Regularly revisit and refine alert configurations.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS04-BP03 Implement user experience telemetry](./ops_observability_customer_telemetry.html)
- [OPS04-BP04 Implement dependency telemetry](./ops_observability_dependency_telemetry.html)
- [OPS04-BP05 Implement distributed tracing](./ops_observability_dist_trace.html)
- [OPS08-BP01 Analyze workload metrics](./ops_workload_observability_analyze_workload_metrics.html)
- [OPS08-BP02 Analyze workload logs](./ops_workload_observability_analyze_workload_logs.html)
- [OPS08-BP03 Analyze workload traces](./ops_workload_observability_analyze_workload_traces.html)

**Related documents:**

- [Using
Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Create
a composite alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html)
- [Create
a CloudWatch alarm based on anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Anomaly_Detection_Alarm.html)
- [DevOps Guru Notifications](https://docs.aws.amazon.com/devops-guru/latest/userguide/update-notifications.html)
- [X-ray
insights notifications](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-insights.html#xray-console-insight-notifications)
- [Monitor,
operate, and troubleshoot your AWS resources with interactive
ChatOps](https://aws.amazon.com/chatbot/)
- [Amazon CloudWatch Integration Guide | PagerDuty](https://support.pagerduty.com/docs/amazon-cloudwatch-integration-guide)
- [Integrate
Opsgenie with Amazon CloudWatch](https://support.atlassian.com/opsgenie/docs/integrate-opsgenie-with-amazon-cloudwatch/)

**Related videos:**

- [Create
Composite Alarms in Amazon CloudWatch](https://www.youtube.com/watch?v=0LMQ-Mu-ZCY)
- [Amazon Q Developer in chat applications Overview](https://www.youtube.com/watch?v=0jUSEfHbTYk)
- [AWS On Air ft. Mutative Commands in Amazon Q Developer in chat applications](https://www.youtube.com/watch?v=u2pkw2vxrtk)

**Related examples:**

- [Alarms,
incident management, and remediation in the cloud with Amazon CloudWatch](https://aws.amazon.com/bloarms-incident-management-and-remediation-in-the-cloud-with-amazon-cloudwatch/)
- [Tutorial:
Creating an Amazon EventBridge rule that sends notifications
to Amazon Q Developer in chat applications](https://docs.aws.amazon.com/chatbot/latest/adminguide/create-eventbridge-rule.html)
- [One
Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_create_alerts.html*

---

# OPS08-BP05 Create dashboards

Dashboards are the human-centric view into the telemetry data of
your workloads. While they provide a vital visual interface, they
should not replace alerting mechanisms, but complement them. When
crafted with care, not only can they offer rapid insights into
system health and performance, but they can also present
stakeholders with real-time information on business outcomes and the
impact of issues.

**Desired outcome:**

Clear, actionable insights into system and business health using
visual representations.

**Common anti-patterns:**

- Overcomplicating dashboards with too many metrics.
- Relying on dashboards without alerts for anomaly detection.
- Not updating dashboards as workloads evolve.

**Benefits of this best practice:**

- Immediate visibility into critical system metrics and KPIs.
- Enhanced stakeholder communication and understanding.
- Rapid insight into the impact of operational issues.

**Level of risk if this best practice isn't
established:** Medium

## Implementation guidance

**Business-centric dashboards**

Dashboards tailored to business KPIs engage a wider array of
stakeholders. While these individuals might not be interested in
system metrics, they are keen on understanding the business
implications of these numbers. A business-centric dashboard
ensures that all technical and operational metrics being monitored
and analyzed are in sync with overarching business goals. This
alignment provides clarity, ensuring everyone is on the same page
regarding what's essential and what's not. Additionally,
dashboards that highlight business KPIs tend to be more
actionable. Stakeholders can quickly understand the health of
operations, areas that need attention, and the potential impact on
business outcomes.

With this in mind, when creating your dashboards, ensure that
there's a balance between technical metrics and business KPIs.
Both are vital, but they cater to different audiences. Ideally,
you should have dashboards that provide a holistic view of the
system's health and performance while also emphasizing key
business outcomes and their implications.

Amazon CloudWatch Dashboards are customizable home pages in the
CloudWatch console that you can use to monitor your resources in a
single view, even those resources that are spread across different
AWS Regions and accounts.

### Implementation steps

- **Create a basic dashboard:**
[Create
a new dashboard in CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/create_dashboard.html), giving it a
descriptive name.
- **Use Markdown widgets:**
Before diving into the metrics,
[use
Markdown widgets](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/add_remove_text_dashboard.html) to add textual context at the top of
your dashboard. This should explain what the dashboard
covers, the significance of the represented metrics, and can
also contain links to other dashboards and troubleshooting
tools.
- **Create dashboard
variables:**
[Incorporate
dashboard variables](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_dashboard_variables.html) where appropriate to allow for
dynamic and flexible dashboard views.
- **Create metrics widgets:**
[Add
metric widgets](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/create-and-work-with-widgets.html) to visualize various metrics your
application emits, tailoring these widgets to effectively
represent system health and business outcomes.
- **Log Insights queries:**
Utilize
[CloudWatch
Log Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_ExportQueryResults.html) to derive actionable metrics from your
logs and display these insights on your dashboard.
- **Set up alarms:** Integrate
[CloudWatch
Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/add_remove_alarm_dashboard.html) into your dashboard for a quick view of any
metrics breaching their thresholds.
- **Use Contributor Insights:**
Incorporate
[CloudWatch
Contributor Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-ViewReports.html) to analyze high-cardinality
fields and get a clearer understanding of your resource's
top contributors.
- **Design custom widgets:**
For specific needs not met by standard widgets, consider
creating
[custom
widgets](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/add_custom_widget_dashboard.html). These can pull from various data sources or
represent data in unique ways.
- **Use AWS Health:** AWS Health is the authoritative source of information about the health of your AWS Cloud resources. Use [AWS Health Dashboard](https://health.aws.amazon.com/health/status) out of the box, or use AWS Health data in your own dashboards and tools so you have the right information available to make informed decisions.
- **Iterate and refine:** As
your application evolves, regularly revisit your dashboard
to ensure its relevance.

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS08-BP01 Analyze workload metrics](./ops_workload_observability_analyze_workload_metrics.html)
- [OPS08-BP02 Analyze workload logs](./ops_workload_observability_analyze_workload_logs.html)
- [OPS08-BP03 Analyze workload traces](./ops_workload_observability_analyze_workload_traces.html)
- [OPS08-BP04 Create actionable alerts](./ops_workload_observability_create_alerts.html)

**Related documents:**

- [Building
Dashboards for Operational Visibility](https://aws.amazon.com/builders-library/building-dashboards-for-operational-visibility/)
- [Using
Amazon CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)

**Related videos:**

- [Create
Cross Account & Cross Region CloudWatch Dashboards](https://www.youtube.com/watch?v=eIUZdaqColg)
- [AWS re:Invent 2021 - Gain enterprise visibility with AWS Cloud
operation dashboards)](https://www.youtube.com/watch?v=NfMpYiGwPGo)

**Related examples:**

- [One
Observability Workshop](https://catalog.workshops.aws/observability/en-US/intro)
- [Application
Monitoring with Amazon CloudWatch](https://aws.amazon.com/solutions/implementations/application-monitoring-with-cloudwatch/)
- [AWS Health Events Intelligence Dashboards and Insights](https://aws.amazon.com/blogs/mt/aws-health-events-intelligence-dashboards-insights/)
- [Visualize
AWS Health events using Amazon Managed Grafana](https://aws.amazon.com/blogs/mt/visualize-aws-health-events-using-amazon-managed-grafana/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_create_dashboards.html*

---
