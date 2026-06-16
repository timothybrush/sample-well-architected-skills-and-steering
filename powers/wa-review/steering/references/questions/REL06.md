# REL 6 — How do you monitor workload resources?

**Pillar**: Reliability  
**Best Practices**: 7

---

# REL06-BP01 Monitor all components for the workload (Generation)

Monitor the components of the workload with Amazon CloudWatch or
third-party tools. Monitor AWS services with AWS Health Dashboard.

All components of your workload should be monitored, including the
front-end, business logic, and storage tiers. Define key metrics,
describe how to extract them from logs (if necessary), and set
thresholds for invoking corresponding alarm events. Ensure metrics
are relevant to the key performance indicators (KPIs) of your
workload, and use metrics and logs to identify early warning signs
of service degradation. For example, a metric related to business
outcomes such as the number of orders successfully processed per
minute, can indicate workload issues faster than technical metric,
such as CPU Utilization. Use AWS Health Dashboard for a personalized
view into the performance and availability of the AWS services
underlying your AWS resources.

Monitoring in the cloud offers new opportunities. Most cloud
providers have developed customizable hooks and can deliver insights
to help you monitor multiple layers of your workload. AWS services
such as Amazon CloudWatch apply statistical and machine learning
algorithms to continually analyze metrics of systems and
applications, determine normal baselines, and surface anomalies with
minimal user intervention. Anomaly detection algorithms account for
the seasonality and trend changes of metrics.

AWS makes an abundance of monitoring and log information available
for consumption that can be used to define workload-specific
metrics, change-in-demand processes, and adopt machine learning
techniques regardless of ML expertise.

In addition, monitor all of your external endpoints to ensure that
they are independent of your base implementation. This active
monitoring can be done with synthetic transactions (sometimes
referred to as *user canaries*, but not to be
confused with canary deployments) which periodically run a number of
common tasks matching actions performed by clients of the workload.
Keep these tasks short in duration and be sure not to overload your
workload during testing. Amazon CloudWatch Synthetics allows you
to [create
synthetic canaries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html) to monitor your endpoints and APIs. You
can also combine the synthetic canary client nodes with AWS X-Ray
console to pinpoint which synthetic canaries are experiencing issues
with errors, faults, or throttling rates for the selected time
frame.

**Desired Outcome:**

Collect and use critical metrics from all components of the workload
to ensure workload reliability and optimal user experience.
Detecting that a workload is not achieving business outcomes allows
you to quickly declare a disaster and recover from an incident.

**Common anti-patterns:**

- Only monitoring external interfaces to your workload.
- Not generating any workload-specific metrics and only relying on
metrics provided to you by the AWS services your workload uses.
- Only using technical metrics in your workload and not monitoring
any metrics related to non-technical KPIs the workload
contributes to.
- Relying on production traffic and simple health checks to
monitor and evaluate workload state.

**Benefits of establishing this best
practice:** Monitoring at all tiers in your workload
allows you to more rapidly anticipate and resolve problems in the
components that comprise the workload.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

- **Turn on logging where
available.** Monitoring data should be obtained from
all components of the workloads. Turn on additional logging,
such as S3 Access Logs, and permit your workload to log
workload specific data. Collect metrics for CPU, network I/O,
and disk I/O averages from services such as Amazon ECS, Amazon EKS, Amazon EC2, Elastic Load Balancing, AWS Auto Scaling, and
Amazon EMR. See
[AWS Services That Publish CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html) for a list of
AWS services that publish metrics to CloudWatch.
- **Review all default metrics and explore
any data collection gaps.** Every service generates
default metrics. Collecting default metrics allows you to
better understand the dependencies between workload
components, and how component reliability and performance
affect the workload. You can also create and
[publish
your own metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html) to CloudWatch using the AWS CLI or an
API.
- **Evaluate all the metrics to decide
which ones to alert on for each AWS service in your
workload.** You may choose to select a subset of
metrics that have a major impact on workload reliability.
Focusing on critical metrics and threshold allows you to
refine the number of
[alerts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
and can help minimize false-positives.
- **Define alerts and the recovery process
for your workload after the alert is invoked.**
Defining alerts allows you to quickly notify, escalate, and
follow steps necessary to recover from an incident and meet
your prescribed Recovery Time Objective (RTO). You can use
[Amazon CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-actions) to invoke automated
workflows and initiate recovery procedures based on defined
thresholds.
- **Explore use of synthetic transactions
to collect relevant data about workloads state.**
Synthetic monitoring follows the same routes and perform the
same actions as a customer, which makes it possible for you to
continually verify your customer experience even when you
don't have any customer traffic on your workloads. By using
[synthetic
transactions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html), you can discover issues before your
customers do.

## Resources

**Related best practices:**

- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)

**Related documents:**

- [Getting
started with your AWS Health Dashboard – Your account
health](https://docs.aws.amazon.com/health/latest/ug/getting-started-health-dashboard.html)
- [AWS Services That Publish CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
- [Access
Logs for Your Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-access-logs.html)
- [Access
logs for your application load balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html)
- [Accessing
Amazon CloudWatch Logs for AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-logs.html)
- [Amazon S3 Server Access Logging](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerLogs.html)
- [Enable
Access Logs for Your Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html)
- [Exporting
log data to Amazon S3](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/S3Export.html)
- [Install
the CloudWatch agent on an Amazon EC2 instance](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-on-EC2-Instance.html)
- [Publishing
Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
- [Using
Amazon CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [Using
Amazon CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)
- [Using
Canaries (Amazon CloudWatch Synthetics)](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
- [What
are Amazon CloudWatch Logs?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)

**User guides:**
- [Creating
a trail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-a-trail-using-the-console-first-time.html)
- [Monitoring
memory and disk metrics for Amazon EC2 Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html)
- [Using
CloudWatch Logs with container instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_cloudwatch_logs.html)
- [VPC
Flow Logs](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html)
- [What
is Amazon DevOps Guru?](https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html)
- [What
is AWS X-Ray?](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)

**Related blogs:**

- [Debugging
with Amazon CloudWatch Synthetics and AWS X-Ray](https://aws.amazon.com/blogs/devops/debugging-with-amazon-cloudwatch-synthetics-and-aws-x-ray/)

**Related examples:**

- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)
- [Observability
workshop](https://catalog.workshops.aws/observability/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_monitor_resources.html*

---

# REL06-BP02 Define and calculate metrics (Aggregation)

Collect metrics and logs from your workload components and calculate
relevant aggregate metrics from them. These metrics provide broad
and deep observability of your workload and can significantly
improve your resilience posture.

Observability is more than just collecting metrics from workload
components and being able to view and alert on them. It's about
having a holistic understanding about your workload's behavior. This
behavioral information comes from all components in your workloads,
which includes the cloud services on which they depend, well-crafted
logs, and metrics. This data gives you oversight on your workload's
behavior as a whole, as well as an understanding of every
component's interaction with every unit of work at a fine level of
detail.

**Desired outcome:**

- You collect logs from your workload components and AWS service
dependencies, and you publish them to a central location where
they can be easily accessed and processed.
- Your logs contain high-fidelity and accurate timestamps.
- Your logs contain relevant information about the processing
context, such as a trace identifier, user or account identifier,
and remote IP address.
- You create aggregate metrics from your logs that represent your
workload's behavior from a high-level perspective.
- You are able to query your aggregated logs to gain deep and
relevant insights about your workload and identify actual and
potential problems.

**Common anti-patterns:**

- You don't collect relevant logs or metrics from the compute
instances your workloads run on or the cloud services they use.
- You overlook the collection of logs and metrics related to your
business key performance indicators (KPIs).
- You analyze workload-related telemetry in isolation without
aggregation and correlation.
- You allow metrics and logs to expire too quickly, which hinders
trend analysis and recurring issue identification.

**Benefits of establishing these best
practices:** You can detect more anomalies and correlate
events and metrics between different components of your workload.
You can create insights from your workload components based on
information contained in logs that frequently aren't available in
metrics alone. You can determine causes of failure more quickly by
querying your logs at scale.

**Level of risk exposed if these best
practices are not established:** High

## Implementation guidance

Identify the sources of telemetry data that are relevant for your
workloads and their components. This data comes not only from
components that publish metrics, such as your operating system
(OS) and application runtimes such as Java, but also from
application and cloud service logs. For example, web servers
typically log each request with detailed information such as the
timestamp, processing latency, user ID, remote IP address, path,
and query string. The level of detail in these logs helps you
perform detailed queries and generate metrics that may not have
been otherwise available.

Collect the metrics and logs using appropriate tools and
processes. Logs generated by applications running on Amazon EC2
instance can be collected by an agent such as the
[Amazon CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html) and published to a central storage service
such as
[Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html). AWS-managed compute services such as
[AWS Lambda](https://aws.amazon.com/lambda/) and
[Amazon Elastic Container Service](https://aws.amazon.com/ecs/) publish logs to CloudWatch Logs for you
automatically. Enable log collection for AWS storage and
processing services used by your workloads such as
[Amazon CloudFront](https://aws.amazon.com/cloudfront/),
[Amazon S3](https://aws.amazon.com/s3/),
[Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/), and
[Amazon API Gateway](https://aws.amazon.com/api-gateway/).

Enrich your telemetry data with
*[dimensions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension)*
that can help you see behavioral patterns more clearly and isolate
correlated problems to groups of related components. Once added,
you can observe component behavior at a finer level of detail,
detect correlated failures, and take appropriate remedial steps.
Examples of useful dimensions include Availability Zone, EC2
instance ID, and container task or Pod ID.

Once you have collected the metrics and logs, you can write
queries and generate aggregate metrics from them that provide
useful insights into both normal and anomalous behavior. For
example, you can use
[Amazon CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html) to derive custom metrics from your
application logs,
[Amazon CloudWatch Metrics Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html) to query your metrics at scale,
[Amazon CloudWatch Container Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html) to collect, aggregate and
summarize metrics and logs from your containerized applications
and microservices, or
[Amazon CloudWatch Lambda Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Lambda-Insights.html) if you're using AWS Lambda
functions. To create an aggregate error rate metric, you can
increment a counter each time an error response or message is
found in your component logs or calculate the aggregate value of
an existing error rate metric. You can use this data to generate
histograms that show *tail behavior*, such as
the worst-performing requests or processes. You can also scan this
data in real time for anomalous patterns using solutions such as
CloudWatch Logs
[anomaly
detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection.html). These insights can be placed on dashboards to
keep them organized according to your needs and preferences.

Querying logs can help you understand how specific requests were
handled by your workload components and reveal request patterns or
other context that has an impact on your workload's resilience. It
can be useful to research and prepare queries in advance, based on
your knowledge of how your applications and other components
behave, so you can more easily run them as needed. For example,
with
[CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html), you can interactively search and analyze
your log data stored in CloudWatch Logs. You can also use
[Amazon Athena](https://aws.amazon.com/athena/) to query logs from multiple sources, including
[many
AWS services](https://docs.aws.amazon.com/athena/latest/ug/querying-aws-service-logs.html), at petabyte scale.

When you define a log retention policy, consider the value of
historical logs. Historical logs can help identify long-term usage
and behavioral patterns, regressions, and improvements in your
workload's performance. Permanently deleted logs cannot be
analyzed later. However, the value of historical logs tends to
diminish over long periods of time. Choose a policy that balances
your needs as appropriate and is compliant with any legal or
contractual requirements you might be subject to.

### Implementation steps

- Choose collection, storage, analysis, and display mechanisms
for your observability data.
- Install and configure metric and log collectors on the
appropriate components of your workload (for example, on
Amazon EC2 instances and in
[sidecar
containers](https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/)). Configure these collectors to restart
automatically if they unexpectedly stop. Enable disk or
memory buffering for the collectors so that temporary
publication failures don't impact your applications or
result in lost data.
- Enable logging on AWS services you use as a part of your
workloads, and forward those logs to the storage service you
selected if needed. Refer to the respective services' user
or developer guides for detailed instructions.
- Define the operational metrics relevant to your workloads
that are based on your telemetry data. These could be based
on direct metrics emitted from your workload components,
which can include business KPI related metrics, or the
results of aggregated calculations such as sums, rates,
percentiles, or histograms. Calculate these metrics using
your log analyzer, and place them on dashboards as
appropriate.
- Prepare appropriate log queries to analyze workload
components, requests, or transaction behavior as needed.
- Define and enable a log retention policy for your component
logs. Periodically delete logs when they become older than
the policy permits.

## Resources

**Related best practices:**

- [REL06-BP01
Monitor all components for the workload (Generation)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP03
Send notifications (Real-time processing and alarming)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_monitor.html)
- [REL06-BP04
Automate responses (Real-time processing and alarming)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_automate_response_monitor.html)
- [REL06-BP05
Analyze logs](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_storage_analytics.html)
- [REL06-BP06
Regularly review monitoring scope and metrics](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_review_monitoring.html)
- [REL06-BP07
Monitor end-to-end tracing of requests through your
system](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_end_to_end.html)

**Related documentation:**

- [How
Amazon CloudWatch works](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_architecture.html)
- [Amazon
Managed Prometheus](https://docs.aws.amazon.com/prometheus/latest/userguide/what-is-Amazon-Managed-Service-Prometheus.html)
- [Amazon Managed Grafana](https://docs.aws.amazon.com/grafana/latest/userguide/what-is-Amazon-Managed-Service-Grafana.html)
- [Analyzing
log data with CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)
- [Amazon CloudWatch Lambda Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Lambda-Insights.html)
- [Amazon CloudWatch Container Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html)
- [Query
your metrics with CloudWatch Metrics Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html)
- [AWS Distro for
OpenTelemetry](https://aws.amazon.com/otel/)
- [Amazon CloudWatch Logs Insights Sample Queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html)
- [Debugging
with Amazon CloudWatch Synthetics and AWS X-Ray](https://aws.amazon.com/blogs/devops/debugging-with-amazon-cloudwatch-synthetics-and-aws-x-ray/)
- [Searching
and Filtering Log Data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html)
- [Sending
Logs Directly to Amazon S3](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Sending-Logs-Directly-To-S3.html)
- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)

**Related workshops:**

- [One
Observability Workshop](https://observability.workshop.aws/)

**Related tools:**

- [AWS Distro for
OpenTelemetry (GitHub)](https://aws-otel.github.io/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_aggregation.html*

---

# REL06-BP03 Send notifications (Real-time processing and alarming)

When organizations detect potential issues, they send real-time notifications and alerts to the appropriate personnel and systems in order to respond quickly and effectively to these issues.

**Desired outcome:** Rapid responses to operational events are possible through configuration of relevant alarms based on service and application metrics. When alarm thresholds are breached, the appropriate personnel and systems are notified so they can address underlying issues.

**Common anti-patterns:**

- Configuring alarms with an excessively high threshold, resulting in the failure to send vital notifications.
- Configuring alarms with a threshold that is too low, resulting in inaction on important alerts due to the noise of excessive notifications.
- Not updating alarms and their threshold when usage changes.
- For alarms best addressed through automated actions, sending the notification to personnel instead of generating the automated action results in excessive notifications being sent.

**Benefits of establishing this best
practice:** Sending real-time notifications and alerts to the appropriate personnel and systems allows for early detection of issues and rapid responses to operational incidents.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Workloads should be equipped with real-time processing and alarming to improve the detectability of issues that could impact the availability of the application and serve as triggers for automated response. Organizations can perform real-time processing and alarming by creating alerts with defined metrics in order to receive notifications whenever significant events occur or a metric exceeds a threshold.

[Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) allows you to create [metric](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html) and composite alarms using CloudWatch alarms based on static threshold, anomaly detection, and other criteria. For more detail on the types of alarms you can configure using CloudWatch, see the [alarms section of the CloudWatch documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html).

You can construct customized views of metrics and alerts of your AWS resources for your teams using [CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html). The customizable home pages in the CloudWatch console allow you to monitor your resources in a single view across multiple Regions.

Alarms can perform one or more actions, like sending a notification to an [Amazon SNS topic](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html), performing an [Amazon EC2](https://aws.amazon.com/ec2/) action or an [Amazon EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/) action, or [creating an OpsItem](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-create-OpsItems-from-CloudWatch-Alarms.html) or [incident](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html) in AWS Systems Manager.

Amazon CloudWatch uses [Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html) to send notifications when the alarm changes state, providing message delivery from the publishers (producers) to the subscribers (consumers).
For more detail on setting up Amazon SNS notifications, see [Configuring Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-configuring.html).

CloudWatch sends [EventBridge](https://aws.amazon.com/eventbridge/) [events](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-and-eventbridge.html) whenever a CloudWatch alarm is created, updated, deleted, or its state changes. You can use EventBridge with these events to create rules that perform actions, such as notifying you whenever the state of an alarm changes or
automatically triggering events in your account using [Systems Manager automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html).

Stay informed with [AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/). AWS Health is the authoritative source of information about the health of your AWS Cloud resources. Use AWS Health to get notified of any confirmed service events so you can quickly take steps to mitigate any impact. Create purpose-fit AWS Health event notifications to e-mail and chat channels through [AWS User Notifications](https://docs.aws.amazon.com/notifications/latest/userguide/what-is-service.html) and integrate programmatically with [your monitoring and alerting tools through Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html). If you use AWS Organizations, aggregate AWS Health events across accounts.

**When should you use EventBridge or Amazon SNS?**

Both EventBridge and Amazon SNS can be used to develop event-driven applications, and your choice will depend on your specific needs.

Amazon EventBridge is recommended when you want to build an application that reacts to events from your own applications, SaaS applications, and AWS services. EventBridge is the only event-based service that integrates directly with third-party SaaS partners. EventBridge also automatically ingests events from over 200 AWS services without requiring developers to create any resources in their account.

EventBridge uses a defined JSON-based structure for events, and helps you create rules that are applied across the entire event body to select events to forward to a [target](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html). EventBridge currently supports over 20 AWS services as targets, including [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html), [Amazon SQS](https://aws.amazon.com/sqs/), Amazon SNS, [Amazon Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/), and [Amazon Data Firehose](https://aws.amazon.com/kinesis/data-firehose/).

Amazon SNS is recommended for applications that need high fan out (thousands or millions of endpoints). A common pattern we see is that customers use Amazon SNS as a target for their rule to filter the events that they need, and fan out to multiple endpoints.

Messages are unstructured and can be in any format. Amazon SNS supports forwarding messages to six different types of targets, including Lambda, Amazon SQS, HTTP/S endpoints, SMS, mobile push, and email. Amazon SNS [typical latency is under 30 milliseconds](https://aws.amazon.com/sns/faqs/). A wide range of AWS services send Amazon SNS messages by configuring the service to do so (more than 30, including Amazon EC2, [Amazon S3](https://aws.amazon.com/s3/), and [Amazon RDS](https://aws.amazon.com/rds/)).

### Implementation steps

- Create an alarm using [Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html).

A metric alarm monitors a single CloudWatch metric or an expression dependent on CloudWatch metrics. The alarm initiates one or more actions based on the value of the metric or expression in comparison to a threshold over a number of time intervals. The action may consist of sending a notification to an [Amazon SNS topic](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html), performing an [Amazon EC2](https://aws.amazon.com/ec2/) action or an [Amazon EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/) action, or [creating an OpsItem](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-create-OpsItems-from-CloudWatch-Alarms.html) or [incident](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html) in AWS Systems Manager.
- A composite alarm consists of a rule expression that considers the alarm conditions of other alarms you've created. The composite alarm only enters alarm state if all rule conditions are met. The alarms specified in the rule expression of a composite alarm can include metric alarms and additional composite alarms. Composite alarms can send Amazon SNS notifications when their state changes and can create Systems Manager [OpsItems](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-create-OpsItems-from-CloudWatch-Alarms.html) or [incidents](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html) when they enter the alarm state, but they cannot perform Amazon EC2 or Auto Scaling actions.

- Set up [Amazon SNS notifications](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html). When creating a CloudWatch alarm, you can include an Amazon SNS topic to send a notification when the alarm changes state.
- [Create rules in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-get-started.html) that matches specified CloudWatch alarms. Each rule supports multiple targets, including Lambda functions. For example, you can define an alarm that initiates when available disk space is running low, which triggers a Lambda function through an EventBridge rule, to clean up the space. For more detail on EventBridge targets, see [EventBridge targets](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html).

## Resources

**Related Well-Architected best practices:**

- [REL06-BP01 Monitor all components for the workload (Generation)](./rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP02 Define and calculate metrics (Aggregation)](./rel_monitor_aws_resources_notification_aggregation.html)
- [REL12-BP01 Use playbooks to investigate failures](./rel_testing_resiliency_playbook_resiliency.html)

**Related documents:**

- [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [CloudWatch Logs insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)
- [Using
Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Using
Amazon CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [Using
Amazon CloudWatch metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)
- [Setting up Amazon SNS notifications](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html)
- [CloudWatch anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html)
- [CloudWatch Logs data protection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/protect-sensitive-log-data-types.html)
- [Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html)
- [Amazon Simple Notification Service](https://aws.amazon.com/sns/)

**Related videos:**

- [reinvent 2022 observability videos](https://www.youtube.com/results?search_query=reinvent+2022+observability)
- [AWS re:Invent 2022 - Observability best practices at Amazon](https://www.youtube.com/watch?v=zZPzXEBW4P8)

**Related examples:**

- [One
Observability Workshop](https://observability.workshop.aws/)
- [Amazon EventBridge to AWS Lambda with feedback control by Amazon CloudWatch Alarms](https://serverlessland.com/patterns/cdk-closed-loop-serverless-control-pattern)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_monitor.html*

---

# REL06-BP04 Automate responses (Real-time processing and alarming)

Use automation to take action when an event is detected, for
example, to replace failed components.

Automated real-time processing of alarms is implemented so that systems can take quick corrective action and attempt to prevent failures or degraded service when alarms are triggered. Automated responses to alarms could include the replacement of failing components, the adjustment of compute capacity, the redirection of traffic to healthy hosts, availability zones, or other regions, and the notification of operators.

**Desired outcome:** Real-time alarms are identified, and automated processing of alarms is set up to invoke the appropriate actions taken to maintain service level objectives and service-level agreements (SLAs). Automation can range from self-healing activities of single components to full-site failover.

**Common anti-patterns:**

- Not having a clear inventory or catalog of key real-time alarms.
- No automated responses on critical alarms (for example, when compute is nearing exhaustion, autoscaling occurs).
- Contradictory alarm response actions.
- No standard operating procedures (SOPs) for operators to follow when they receive alert notifications.
- Not monitoring configuration changes, as undetected configuration changes can cause downtime for workloads.
- Not having a strategy to undo unintended configuration changes.

**Benefits of establishing this best practice:** Automating alarm processing can improve system resiliency. The system takes corrective actions automatically, reducing manual activities that allow for human, error-prone interventions. Workload operates meet availability goals, and reduces service disruption.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To effectively manage alerts and automate their response, categorize alerts based on their criticality and impact, document response procedures, and plan responses before ranking tasks.

Identify tasks requiring specific actions (often detailed in runbooks), and examine all runbooks and playbooks to determine which tasks can be automated. If actions can be defined, often they can be automated. If actions cannot be automated, document manual steps in an SOP and train operators on them. Continually challenge manual processes for automation opportunities where you can establish and maintain a plan to automate alert responses.

### Implementation steps

- **Create an inventory of alarms:** To obtain a list of all alarms, you can use the [AWS CLI](https://aws.amazon.com/cli/) using the [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) command `[describe-alarms](https://docs.aws.amazon.com/cli/latest/reference/cloudwatch/describe-alarms.html)`. Depending upon how many alarms you have set up, you might have to use pagination to retrieve a subset of alarms for each call, or alternatively you can use the AWS SDK to obtain the alarms [using an API call](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/cw-example-describing-alarms.html).
- **Document all alarm actions:** Update a runbook with all alarms and their actions, irrespective if they are manual or automated. [AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/APIReference/Welcome.html) provides predefined runbooks. For more information about runbooks, see [Working with runbooks](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html). For detail on how to view runbook content, see [View runbook content](https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-runbook-reference.html#view-automation-json).
- **Set up and manage alarm actions:** For any of the alarms that require an action, specify the [automated action using the CloudWatch SDK](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/cw-example-using-alarm-actions.html). For example, you can change the state of your Amazon EC2 instances automatically based on a CloudWatch alarm by creating and enabling actions on an alarm or disabling actions on an alarm.

You can also use [Amazon EventBridge](https://aws.amazon.com/eventbridge/) to respond automatically to system events, such as application availability issues or resource changes. You can create rules to indicate which events you're interested in, and the actions to take when an event matches a rule. The actions that can be automatically initiated include invoking an [AWS Lambda](https://aws.amazon.com/lambda/) function, invoking [Amazon EC2](https://aws.amazon.com/ec2/) `Run Command`, relaying the event to [Amazon Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/), and seeing [Automate Amazon EC2 using EventBridge](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/automating_with_eventbridge.html).
- **Standard Operating Procedures (SOPs):** Based on your application components, [AWS Resilience Hub](https://docs.aws.amazon.com/resilience-hub/latest/userguide/what-is.html) recommends multiple [SOP templates](https://docs.aws.amazon.com/resilience-hub/latest/userguide/sops.html). You can use these SOPs to document all the processes an operator should follow in case an alert is raised. You can also [construct a SOP](https://docs.aws.amazon.com/resilience-hub/latest/userguide/building-sops.html) based on Resilience Hub recommendations, where you need an Resilience Hub application with an associated resiliency policy, as well as a historic resiliency assessment against that application. The recommendations for your SOP are produced by the resiliency assessment.

Resilience Hub works with Systems Manager to automate the steps of your SOPs by providing a number of [SSM documents](https://docs.aws.amazon.com/resilience-hub/latest/userguide/create-custom-ssm-doc.html) you can use as the basis for those SOPs. For example, Resilience Hub may recommend an SOP for adding disk space based on an existing SSM automation document.
- **Perform automated actions using Amazon DevOps Guru:**
You can use [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/) to automatically monitor application resources for anomalous behavior and deliver targeted recommendations to speed up problem identification and remediation times. With DevOps Guru, you can monitor streams of operational data in near real time from multiple sources including Amazon CloudWatch metrics, [AWS Config](https://aws.amazon.com/config/), [AWS CloudFormation](https://aws.amazon.com/cloudformation/), and [AWS X-Ray](https://aws.amazon.com/xray/). You can also use DevOps Guru to automatically create [OpsItems](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-create-OpsItems-from-CloudWatch-Alarms.html) in OpsCenter and send events to [EventBridge for additional automation](https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-eventbridge.html).

## Resources

**Related best practices:**

- [REL06-BP01 Monitor all components for the workload (Generation)](./rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP02 Define and calculate metrics (Aggregation)](./rel_monitor_aws_resources_notification_aggregation.html)
- [REL06-BP03 Send notifications (Real-time processing and alarming)](./rel_monitor_aws_resources_notification_monitor.html)
- [REL08-BP01 Use runbooks for standard activities such as deployment](./rel_tracking_change_management_planned_changemgmt.html)

**Related documents:**

- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [Creating
an EventBridge Rule That Triggers on an Event from an AWS
Resource](https://docs.aws.amazon.com/eventbridge/latest/userguide/create-eventbridge-rule.html)
- [One
Observability Workshop](https://observability.workshop.aws/)
- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)
- [What
is Amazon DevOps Guru?](https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html)
- [Working
with Automation Documents (Playbooks)](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html)

**Related videos:**

- [AWS re:Invent 2022 - Observability best practices at Amazon](https://www.youtube.com/watch?v=zZPzXEBW4P8)
- [AWS re:Invent 2020: Automate anything with AWS Systems Manager](https://www.youtube.com/watch?v=AaI2xkW85yE)
- [Introduction to AWS Resilience Hub](https://www.youtube.com/watch?v=_OTTCOjWqPo)
- [Create Custom Ticket Systems for Amazon DevOps Guru Notifications](https://www.youtube.com/watch?v=Mu8IqWVGUfg)
- [Enable Multi-Account Insight Aggregation with Amazon DevOps Guru](https://www.youtube.com/watch?v=MHezNcTSTbI)

**Related examples:**

- [Amazon CloudWatch and Systems Manager Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/a8e9c6a6-0ba9-48a7-a90d-378a440ab8ba/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_automate_response_monitor.html*

---

# REL06-BP05 Analyze logs

Collect log files and metrics histories and analyze these for
broader trends and workload insights.

Amazon CloudWatch Logs Insights supports
a [simple
yet powerful query language](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html) that you can use to analyze log
data. Amazon CloudWatch Logs also supports subscriptions that allow
data to flow seamlessly to Amazon S3 where you can use or Amazon Athena to query the data. It also supports queries on a large array
of formats.
See [Supported
SerDes and Data Formats](https://docs.aws.amazon.com/athena/latest/ug/supported-format.html) in the Amazon Athena User Guide for
more information. For analysis of huge log file sets, you can run an
Amazon EMR cluster to run petabyte-scale analyses.

There are a number of tools provided by AWS Partners and third
parties that allow for aggregation, processing, storage, and
analytics. These tools include New Relic, Splunk, Loggly, Logstash,
CloudHealth, and Nagios. However, outside generation of system and
application logs is unique to each cloud provider, and often unique
to each service.

An often-overlooked part of the monitoring process is data
management. You need to determine the retention requirements for
monitoring data, and then apply lifecycle policies accordingly.
Amazon S3 supports lifecycle management at the S3 bucket level. This
lifecycle management can be applied differently to different paths
in the bucket. Toward the end of the lifecycle, you can transition
data to Amazon Glacier for long-term storage, and then expiration
after the end of the retention period is reached. The S3
Intelligent-Tiering storage class is designed to optimize costs by
automatically moving data to the most cost-effective access tier,
without performance impact or operational overhead.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- CloudWatch Logs Insights allows you to interactively search and
analyze your log data in Amazon CloudWatch Logs.

[Analyzing Log Data
with CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_cloudwatch_logs.html)
- [Amazon CloudWatch Logs Insights Sample Queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)

- Use Amazon CloudWatch Logs to send logs to Amazon S3 where you can
use or Amazon Athena to query the data.

[How
do I analyze my Amazon S3 server access logs using Athena?](https://aws.amazon.com/premiumsupport/knowledge-center/analyze-logs-athena/)

Create an S3 lifecycle policy for your server access logs bucket. Configure
the lifecycle policy to periodically remove log files. Doing so reduces the amount
of data that Athena analyzes for each query.

[How Do I Create a
Lifecycle Policy for an S3 Bucket?](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-lifecycle.html)

## Resources

**Related documents:**

- [Amazon CloudWatch Logs Insights Sample Queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html)
- [Analyzing
Log Data with CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_cloudwatch_logs.html)
- [Debugging
with Amazon CloudWatch Synthetics and AWS X-Ray](https://aws.amazon.com/blogs/devops/debugging-with-amazon-cloudwatch-synthetics-and-aws-x-ray/)
- [How
Do I Create a Lifecycle Policy for an S3 Bucket?](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-lifecycle.html)
- [How
do I analyze my Amazon S3 server access logs using
Athena?](https://aws.amazon.com/premiumsupport/knowledge-center/analyze-logs-athena/)
- [One
Observability Workshop](https://observability.workshop.aws/)
- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_storage_analytics.html*

---

# REL06-BP06 Regularly review monitoring scope and metrics

Frequently review how workload monitoring is implemented, and update
it as your workload and its architecture evolves. Regular audits of
your monitoring helps reduce the risk of missed or overlooked
trouble indicators and further helps your workload meet its
availability goals.

Effective monitoring is anchored in key business metrics, which
evolve as your business priorities change. Your monitoring review
process should emphasize service-level indicators (SLIs) and
incorporate insights from your infrastructure, applications,
clients, and users.

**Desired outcome:** You have an
effective monitoring strategy that is regularly reviewed and updated
periodically, as well as after any significant events or changes.
You verify that key application health indicators are still relevant
as your workload and business requirements evolve.

**Common anti-patterns:**

- You collect only default metrics.
- You set up a monitoring strategy, but you never review it.
- You don't discuss monitoring when major changes are deployed.
- You trust outdated metrics to determine workload health.
- Your operations teams are overwhelmed with false-positive alerts
due to outdated metrics and thresholds.
- You lack observability of application components that are not
being monitored.
- You focus only on low-level technical metrics and excluding
business metrics in your monitoring.

**Benefits of establishing this best
practice:** When you regularly review your monitoring, you
can anticipate potential problems and verify that you are capable of
detecting them. It also allows you to uncover blind spots that you
might have missed during earlier reviews, which further improves
your ability to detect issues.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Review monitoring metrics and scope during your
[operational
readiness review (ORR)](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/wa-operational-readiness-reviews.html) process. Perform periodic
operational readiness reviews on a consistent schedule to evaluate
whether there are any gaps between your current workload and the
monitoring you have configured. Establish a regular cadence for
operational performance reviews and knowledge sharing to enhance
your ability to achieve higher performance from your operational
teams. Validate whether existing alert thresholds are still
adequate, and check for situations where operational teams are
receiving false-positive alerts or not monitoring aspects of the
application that should be monitored.

The
[Resilience
Analysis Framework](https://docs.aws.amazon.com/prescriptive-guidance/latest/resilience-analysis-framework/introduction.html) provides useful guidance that can help
you navigate the process. The focus of the framework is to
identify potential failure modes and the preventive and corrective
controls you can use to mitigate their impact. This knowledge can
help you identify the right metrics and events to monitor and
alert upon.

### Implementation steps

- Schedule and conduct regular reviews of the workload
dashboards. You may have different cadences for the depth at
which you inspect.
- Inspect for trends in the metrics. Compare the metric values to historic values to see if there are trends that may indicate that something that needs investigation. Examples of this include increased latency, decreased primary business function, and increased failure responses.
- Inspect for outliers and anomalies in your metrics, which can be masked by averages or medians. Look at the highest and lowest values during the time frame, and investigate the causes of observations that are far outside of normal bounds. As you continue to remove these causes, you can tighten your expected metric bounds in response to the improved consistency of your workload performance.
- Look for sharp changes in behavior. An immediate change in quantity or direction of a metric may indicate that there has been a change in the application or external factors that you may need to add additional metrics to track.
- Review whether the current monitoring strategy remains relevant for the application. Based on an analysis of previous incidents (or the Resilience Analysis Framework), assess if there are additional aspects of the application that should be incorporated into the monitoring scope.
- Review your Real User Monitoring (RUM) metrics to determine whether there are any gaps in application functionality coverage.
- Review your change management process. Update your
procedures if necessary to include a monitoring analysis
step that should be performed before you approve a change.
- Implement monitoring review as part of your operational
readiness review and correction of error processes.

## Resources

**Related best practices**

- [REL06-BP01
Monitor all components for the workload (Generation)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP02
Define and calculate metrics (Aggregation)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_aggregation.html)
- [REL06-BP07
Monitor end-to-end tracing of requests through your
system](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_end_to_end.html)
- [REL12-BP02
Perform post-incident analysis](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_rca_resiliency.html)
- [REL12-BP06
Conduct game days regularly](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_game_days_resiliency.html)

**Related documents:**

- [Why
you should develop a correction of error (COE)](https://aws.amazon.com/blogs/mt/why-you-should-develop-a-correction-of-error-coe/)
- [Using
Amazon CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [Building
dashboards for operational visibility](https://aws.amazon.com/builders-library/building-dashboards-for-operational-visibility/?did=ba_card&trk=ba_card)
- [Advanced
Multi-AZ Resilience Patterns - Gray failures](https://docs.aws.amazon.com/whitepapers/latest/advanced-multi-az-resilience-patterns/gray-failures.html)
- [Amazon CloudWatch Logs Insights Sample Queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html)
- [Debugging
with Amazon CloudWatch Synthetics and AWS X-Ray](https://aws.amazon.com/blogs/devops/debugging-with-amazon-cloudwatch-synthetics-and-aws-x-ray/)
- [One
Observability Workshop](https://observability.workshop.aws/)
- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)
- [Using
Amazon CloudWatch Dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [AWS Observability Best Practices](https://aws-observability.github.io/observability-best-practices/)
- [Resilience
Analysis Framework](https://docs.aws.amazon.com/prescriptive-guidance/latest/resilience-analysis-framework/introduction.html)
- [Resilience
Analysis Framework - Observability](https://docs.aws.amazon.com/prescriptive-guidance/latest/resilience-analysis-framework/observability.html)
- [Operational
Readiness Review - ORR](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/wa-operational-readiness-reviews.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_review_monitoring.html*

---

# REL06-BP07 Monitor end-to-end tracing of requests through your system

Trace requests as they process through service components so product teams can more easily analyze and debug issues and improve performance.

**Desired outcome:** Workloads with comprehensive tracing across all components are easy to debug, improving [mean time to resolution](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/reducing-mttr.html) (MTTR) of errors and latency by simplifying root cause discovery. End-to-end tracing reduces the time it takes to discover impacted components and drill into the detailed root causes of errors or latency.

**Common anti-patterns:**

- Tracing is used for some components but not for all. For example, without tracing for AWS Lambda, teams might not clearly understand latency caused by cold starts in a spiky workload.
- Synthetic canaries or real-user monitoring (RUM) are not configured with tracing. Without canaries or RUM, client interaction telemetry is omitted from the trace analysis yielding an incomplete performance profile.
- Hybrid workloads include both cloud native and third party tracing tools, but steps have not been taken elect and fully integrate a single tracing solution. Based on the elected tracing solution, cloud native tracing SDKs should be used to instrument components that are not cloud native or third party tools should be configured to ingest cloud native trace telemetry.

**Benefits of establishing this best practice:** When development teams are alerted to issues, they can see a full picture of system component interactions, including component by component correlation to logging, performance, and failures. Because tracing makes it easy to visually identify root causes, less time is spent investigating root causes. Teams that understand component interactions in detail make better and faster decisions when resolving issues. Decisions like when to invoke disaster recovery (DR) failover or where to best implement self-healing strategies can be improved by analyzing systems traces, ultimately improving customer satisfaction with your services.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Teams that operate distributed applications can use tracing tools to establish a correlation identifier, collect traces of requests, and build service maps of connected components. All application components should be included in request traces including service clients, middleware gateways and event buses, compute components, and storage, including key value stores and databases. Include synthetic canaries and real-user monitoring in your end-to-end tracing configuration to measure remote client interactions and latency so that you can accurately evaluate your systems performance against your service level agreements and objectives.

You can use [AWS X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html) and [Amazon CloudWatch Application Monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Application-Monitoring-Sections.html) instrumentation services to provide a complete view of requests as they travel through your application. X-Ray collects application telemetry and allows you to visualize and filter it across payloads, functions, traces, services, APIs, and can be turned on for system components with no-code or low-code. CloudWatch application monitoring includes ServiceLens to integrate your traces with metrics, logs, and alarms. CloudWatch application monitoring also includes synthetics to monitor your endpoints and APIs, as well as real-user monitoring to instrument your web application clients.

## Implementation steps

- Use AWS X-Ray on all supported native services like [Amazon S3, AWS Lambda, and Amazon API Gateway](https://docs.aws.amazon.com/xray/latest/devguide/xray-services.html). These AWS services enable X-Ray with configuration toggles using infrastructure as code, AWS SDKs, or the AWS Management Console.
- Instrument applications [AWS Distro for Open Telemetry and X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-adot.html) or third-party collection agents.
- Review the [AWS X-Ray Developer Guide](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html) for programming language specific implementation. These documentation sections detail how to instrument HTTP requests, SQL queries, and other processes specific to your application programming language.
- Use X-Ray tracing for [Amazon CloudWatch Synthetic Canaries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html) and [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html) to analyze the request path from your end user client through your downstream AWS infrastructure.
- Configure CloudWatch metrics and alarms based on resource health and canary telemetry so that teams are alerted to issues quickly, and can then deep dive into traces and service maps with ServiceLens.
- Enable X-Ray integration for third party tracing tools like [Datadog](https://docs.datadoghq.com/tracing/guide/serverless_enable_aws_xray/), [New Relic](https://docs.newrelic.com/docs/infrastructure/amazon-integrations/aws-integrations-list/aws-x-ray-monitoring-integration/), or [Dynatrace](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-cloud-platforms/amazon-web-services/amazon-web-services-integrations/aws-service-metrics) if you are using third party tools for your primary tracing solution.

## Resources

**Related best practices:**

- [REL06-BP01 Monitor all components for the workload (Generation)](./rel_monitor_aws_resources_monitor_resources.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)

**Related documents:**

- [What
is AWS X-Ray?](https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html)
- [Amazon CloudWatch: Application Monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Application-Monitoring-Sections.html)
- [Debugging
with Amazon CloudWatch Synthetics and AWS X-Ray](https://aws.amazon.com/blogs/devops/debugging-with-amazon-cloudwatch-synthetics-and-aws-x-ray/)
- [The
Amazon Builders' Library: Instrumenting distributed systems
for operational visibility](https://aws.amazon.com/builders-library/instrumenting-distributed-systems-for-operational-visibility/)
- [Integrating AWS X-Ray with other AWS services](https://docs.aws.amazon.com/xray/latest/devguide/xray-services.html)
- [AWS Distro for OpenTelemetry and AWS X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-adot.html)
- [Amazon CloudWatch: Using synthetic monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
- [Amazon CloudWatch: Use CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)
- [Set up Amazon CloudWatch synthetics canary and Amazon CloudWatch alarm](https://docs.aws.amazon.com/solutions/latest/devops-monitoring-dashboard-on-aws/set-up-amazon-cloudwatch-synthetics-canary-and-amazon-cloudwatch-alarm.html)
- [Availability and Beyond: Understanding and Improving the Resilience of Distributed Systems on AWS](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/reducing-mttr.html)

**Related examples:**

- [One Observability Workshop](https://catalog.workshops.aws/observability/en-US)

**Related videos:**

- [AWS re:Invent 2022 - How to monitor applications across multiple accounts](https://www.youtube.com/watch?v=kFGOkywu-rw)
- [How to Monitor your AWS Applications](https://www.youtube.com/watch?v=UxWU9mrSbmA)

**Related tools:**

- [AWS X-Ray](https://aws.amazon.com/xray/)
- [Amazon CloudWatch](https://aws.amazon.com/pm/cloudwatch/)
- [Amazon Route 53](https://aws.amazon.com/route53/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_end_to_end.html*

---
