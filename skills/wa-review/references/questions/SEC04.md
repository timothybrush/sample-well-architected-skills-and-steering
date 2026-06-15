# SEC 4 — How do you detect and investigate security events?

**Pillar**: Security  
**Best Practices**: 4

---

# SEC04-BP01 Configure service and application logging

Retain security event logs from services and applications. This is a fundamental principle of security for audit, investigations, and operational use cases, and a common security requirement driven by governance, risk, and compliance (GRC) standards, policies, and procedures.

**Desired outcome:** An organization should be able to reliably and consistently retrieve security event logs from AWS services and applications in a timely manner when required to fulfill an internal process or obligation, such as a security incident response. Consider centralizing logs for better operational results.

**Common anti-patterns:**

- Logs are stored in perpetuity or deleted too soon.
- Everybody can access logs.
- Relying entirely on manual processes for log governance and use.
- Storing every single type of log just in case it is needed.
- Checking log integrity only when necessary.

**Benefits of establishing this best practice:** Implement a root cause analysis (RCA) mechanism for security incidents and a source of evidence for your governance, risk, and compliance obligations.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

During a security investigation or other use cases based on your requirements, you need to be able to review relevant logs to record and understand the full scope and timeline of the incident. Logs are also required for alert generation, indicating that certain actions of interest have happened. It is critical to select, turn on, store, and set up querying and retrieval mechanisms and alerting.

**Implementation steps**

- **Select and use log sources.** Ahead of a security investigation, you need to capture relevant logs to retroactively reconstruct activity in an AWS account. Select log sources relevant to your workloads.

The log source selection criteria should be based on the use cases required by your business. Establish a trail for each AWS account using AWS CloudTrail or an AWS Organizations trail, and configure an Amazon S3 bucket for it.

AWS CloudTrail is a logging service that tracks API calls made against an AWS account capturing AWS service activity. It’s turned on by default with a 90-day retention of management events that can be [retrieved through CloudTrail Event history](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events.html) using the AWS Management Console, the AWS CLI, or an AWS SDK. For longer retention and visibility of data events, [create a CloudTrail trail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html) and associate it with an Amazon S3 bucket, and optionally with a Amazon CloudWatch log group. Alternatively, you can create a [CloudTrail Lake](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake.html), which retains CloudTrail logs for up to seven years and provides a SQL-based querying facility

AWS recommends that customers using a VPC turn on network traﬃc and DNS logs using [VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) and [Amazon Route 53 resolver query logs](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-query-logs.html), respectively, and streaming them to either an Amazon S3 bucket or a CloudWatch log group. You can create a VPC ﬂow log for a VPC, a subnet, or a network interface. For VPC Flow Logs, you can be selective on how and where you use Flow Logs to reduce cost.

AWS CloudTrail Logs, VPC Flow Logs, and Route 53 resolver query logs are the basic logging sources to support security investigations in AWS. You can also use [Amazon Security Lake](https://docs.aws.amazon.com/security-lake/latest/userguide/what-is-security-lake.html) to collect, normalize, and store this log data in Apache Parquet format and Open Cybersecurity Schema Framework (OCSF), which is ready for querying. Security Lake also supports other AWS logs and logs from third-party sources.

AWS services can generate logs not captured by the basic log sources, such as Elastic Load Balancing logs, AWS WAF logs, AWS Config recorder logs, Amazon GuardDuty ﬁndings, Amazon Elastic Kubernetes Service (Amazon EKS) audit logs, and Amazon EC2 instance operating system and application logs. For a full list of logging and monitoring options, see [Appendix A: Cloud capability deﬁnitions – Logging and Events](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/logging-and-events.html) of the [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/detection.html).
- **Research logging capabilities for each AWS service and application:** Each AWS service and application provides you with options for log storage, each of which with its own retention and life-cycle capabilities. The two most common log storage services are Amazon Simple Storage Service (Amazon S3) and Amazon CloudWatch. For long retention periods, it is recommended to use Amazon S3 for its cost effectiveness and flexible lifecycle capabilities. If the primary logging option is Amazon CloudWatch Logs, as an option, you should consider archiving less frequently accessed logs to Amazon S3.
- **Select log storage:** The choice of log storage is generally related to which querying tool you use, retention capabilities, familiarity, and cost. The main options for log storage are an Amazon S3 bucket or a CloudWatch Log group.

An Amazon S3 bucket provides cost-eﬀective, durable storage with an optional lifecycle policy. Logs stored in Amazon S3 buckets can be queried using services such as Amazon Athena.

A CloudWatch log group provides durable storage and a built-in query facility through CloudWatch Logs Insights.
- **Identify appropriate log retention:** When you use an Amazon S3 bucket or CloudWatch log group to store logs, you must establish adequate lifecycles for each log source to optimize storage and retrieval costs. Customers generally have between three months to one year of logs readily available for querying, with retention of up to seven years. The choice of availability and retention should align with your security requirements and a composite of statutory, regulatory, and business mandates.
- **Use logging for each AWS service and application with proper retention and lifecycle policies:** For each AWS service or application in your organization, look for the specific logging configuration guidance:

[Configure AWS CloudTrail Trail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html)
- [Configure VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [Configure Amazon GuardDuty Finding Export](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_exportfindings.html)
- [Configure AWS Config recording](https://docs.aws.amazon.com/systems-manager/latest/userguide/quick-setup-config.html)
- [Configure AWS WAF web ACL traffic](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html)
- [Configure AWS Network Firewall network traffic logs](https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-logging.html)
- [Configure Elastic Load Balancing access logs](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html)
- [Configure Amazon Route 53 resolver query logs](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-query-logs.html)
- [Configure Amazon RDS logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html)
- [Configure Amazon EKS Control Plane logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
- [Configure Amazon CloudWatch agent for Amazon EC2 instances and on-premises servers](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)

- **Select and implement querying mechanisms for logs:** For log queries, you can use [CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html) for data stored in CloudWatch log groups, and [Amazon Athena](https://aws.amazon.com/athena/) and [Amazon OpenSearch Service](https://aws.amazon.com/opensearch-service/) for data stored in Amazon S3. You can also use third-party querying tools such as a security information and event management (SIEM) service.

The process for selecting a log querying tool should consider the people, process, and technology aspects of your security operations. Select a tool that fulﬁlls operational, business, and security requirements, and is both accessible and maintainable in the long term. Keep in mind that log querying tools work optimally when the number of logs to be scanned is kept within the tool’s limits. It is not uncommon to have multiple querying tools because of cost or technical constraints.

For example, you might use a third-party security information and event management (SIEM) tool to perform queries for the last 90 days of data, but use Athena to perform queries beyond 90 days because of the log ingestion cost of a SIEM. Regardless of the implementation, verify that your approach minimizes the number of tools required to maximize operational eﬃciency, especially during a security event investigation.
- **Use logs for alerting:** AWS provides alerting through several security services:

[AWS Config](https://aws.amazon.com/config/) monitors and records your AWS resource configurations and allows you to automate the evaluation and remediation against desired configurations.
- [Amazon GuardDuty](https://aws.amazon.com/guardduty/) is a threat detection service that continually monitors for malicious activity and unauthorized behavior to protect your AWS accounts and workloads. GuardDuty ingests, aggregates, and analyzes information from sources, such as AWS CloudTrail management and data events, DNS logs, VPC Flow Logs, and Amazon EKS Audit logs. GuardDuty pulls independent data streams directly from CloudTrail, VPC Flow Logs, DNS query logs, and Amazon EKS. You don’t have to manage Amazon S3 bucket policies or modify the way you collect and store logs. It is still recommended to retain these logs for your own investigation and compliance purposes.
- [AWS Security Hub CSPM](https://aws.amazon.com/security-hub/) provides a single place that aggregates, organizes, and prioritizes your security alerts or findings from multiple AWS services and optional third-party products to give you a comprehensive view of security alerts and compliance status.

You can also use custom alert generation engines for security alerts not covered by these services or for speciﬁc alerts relevant to your environment. For information on building these alerts and detections, see [Detection in the AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/detection.html).

## Resources

**Related best practices:**

- [SEC04-BP02 Capture logs, findings, and metrics in standardized locations](./sec_detect_investigate_events_logs.html)
- [SEC07-BP04 Define scalable data lifecycle management](./sec_data_classification_lifecycle_management.html)
- [SEC10-BP06 Pre-deploy tools](./sec_incident_response_pre_deploy_tools.html)

**Related documents:**

- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html)
- [Getting Started with Amazon Security Lake](https://aws.amazon.com/security-lake/getting-started/)
- [Getting started: Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_GettingStarted.html)

**Related videos:**

- [AWS re:Invent 2022 - Introducing Amazon Security Lake](https://www.youtube.com/watch?v=V7XwbPPjXSY)

**Related examples:**

- [Assisted Log Enabler for AWS](https://github.com/awslabs/assisted-log-enabler-for-aws/)
- [AWS Security Hub CSPM Findings Historical Export](https://github.com/aws-samples/aws-security-hub-findings-historical-export)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_detect_investigate_events_app_service_logging.html*

---

# SEC04-BP02 Capture logs, findings, and metrics in standardized locations

Security teams rely on logs and findings to analyze events that may
indicate unauthorized activity or unintentional changes. To
streamline this analysis, capture security logs and findings in
standardized locations.  This makes data points of interest
available for correlation and can simplify tool integrations.

**Desired outcome:** You have a
standardized approach to collect, analyze, and visualize log data,
findings, and metrics. Security teams can efficiently correlate,
analyze, and visualize security data across disparate systems to
discover potential security events and identify anomalies. Security
information and event management (SIEM) systems or other mechanisms
are integrated to query and analyze log data for timely responses,
tracking, and escalation of security events.

**Common anti-patterns:**

- Teams independently own and manage logging and metrics
collection that is inconsistent to the organization's logging
strategy.
- Teams don't have adequate access controls to restrict visibility
and alteration of the data collected.
- Teams don't govern their security logs, findings, and metrics as
part of their data classification policy.
- Teams neglect data sovereignty and localization requirements
when configuring data collections.

**Benefits of establishing this best
practice:** A standardized logging solution to collect and
query log data and events improves insights derived from the
information they contain. Configuring an automated lifecycle for the
collected log data can reduce the costs incurred by log storage. You
can build fine-grained access control for the collected log
information according to the sensitivity of the data and access
patterns needed by your teams. You can integrate tooling to
correlate, visualize, and derive insights from the data.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Growth in AWS usage within an organization results in a growing
number of distributed workloads and environments. As each of these
workloads and environments generate data about the activity within
them, capturing and storing this data locally presents a challenge
for security operations. Security teams use tools such as security
information and event management (SIEM) systems to collect data
from distributed sources and undergo correlation, analysis, and
response workflows. This requires managing a complex set of
permissions for accessing the various data sources and additional
overhead in operating the extraction, transformation, and loading
(ETL) processes.

To overcome these challenges, consider aggregating all relevant
sources of security log data into a
Log Archive account as described in
[Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/security-ou-and-accounts.html#log-archive-account). This includes
all security-related data from your workload and logs that AWS
services generate, such as
[AWS CloudTrail](https://aws.amazon.com/cloudtrail/),
[AWS WAF](https://aws.amazon.com/waf/),
[Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/), and
[Amazon Route 53](https://aws.amazon.com/route53/). There are several benefits to capturing this data in
standardized locations in a separate AWS account with proper
cross-account permissions. This practice helps prevent log
tampering within compromised workloads and environments, provides
a single integration point for additional tools, and offers a more
simplified model for configuring data retention and lifecycle.
Evaluate the impacts of data sovereignty, compliance scopes, and
other regulations to determine if multiple security data storage
locations and retention periods are required.

To ease capturing and standardizing logs and findings, evaluate
[Amazon
Security Lake](https://docs.aws.amazon.com/security-lake/latest/userguide/what-is-security-lake.html) in your Log Archive account. You can
configure Security Lake to automatically ingest data from common
sources such as CloudTrail, Route 53,
[Amazon EKS](https://aws.amazon.com/eks/),
and
[VPC
Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html). You can also configure AWS Security Hub CSPM as a
data source into Security Lake, allowing you to correlate findings
from other AWS services, such as
[Amazon GuardDuty](https://aws.amazon.com/guardduty/) and
[Amazon Inspector](https://aws.amazon.com/inspector/), with your log data.  You can also use
third-party data source integrations, or configure custom data
sources. All integrations standardize your data into the
[Open Cybersecurity
Schema Framework](https://github.com/ocsf) (OCSF) format, and are stored in
[Amazon S3](https://aws.amazon.com/s3/)
buckets as Parquet files, eliminating the need for ETL processing.

Storing security data in standardized locations provides advanced
analytics capabilities.  AWS recommends you deploy tools for
security analytics that operate in an AWS environment into a
[Security
Tooling](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/security-ou-and-accounts.html#security-tooling-accounts) account that is separate from your Log Archive
account. This approach allows you to implement controls at depth
to protect the integrity and availability of the logs and log
management process, distinct from the tools that access them.
Consider using services, such as
[Amazon Athena](https://aws.amazon.com/athena/), to run on-demand queries that correlate multiple
data sources. You can also integrate visualization tools, such as
[Quick](https://aws.amazon.com/quicksight/). AI-powered solutions are becoming increasingly
available and can perform functions such as translating findings
into human-readable summaries and natural language interaction. These solutions are often more readily integrated by having a
standardized data storage location for querying.

## Implementation steps

- **Create the Log Archive and Security
Tooling accounts**

Using AWS Organizations,
[create
the Log Archive and Security Tooling accounts](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html) under
a security organizational unit. If you are using AWS Control Tower to manage your organization, the Log Archive
and Security Tooling accounts are created for you
automatically. Configure roles and permissions for
accessing and administering these accounts as required.

- **Configure your standardized security
data locations**

Determine your strategy for creating standardized security
data locations.  You can achieve this through options like
common data lake architecture approaches, third-party data
products, or
[Amazon Security Lake](https://docs.aws.amazon.com/security-lake/latest/userguide/getting-started.html).  AWS recommends that you capture
security data from AWS Regions that are
[opted-in](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-regions.html)
for your accounts, even when not actively in use.

- **Configure data source publication to
your standardized locations**

Identify the sources for your security data and configure
them to publish into your standardized locations. Evaluate
options to automatically export data in the desired format
as opposed to those where ETL processes need to be
developed. With Amazon Security Lake, you
can [collect
data](https://docs.aws.amazon.com/security-lake/latest/userguide/source-management.html) from supported AWS sources and integrated
third-party systems.

- **Configure tools to access your
standardized locations**

Configure tools such as Amazon Athena, Quick,
or third-party solutions to have the access required to
your standardized locations.  Configure these tools to
operate out of the Security Tooling account with
cross-account read access to the Log Archive account where
applicable.
[Create
subscribers in Amazon Security Lake](https://docs.aws.amazon.com/security-lake/latest/userguide/subscriber-management.html) to provide
these tools access to your data.

## Resources

**Related best practices:**

- [SEC01-BP01 Separate workloads using accounts](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_multi_accounts.html)
- [SEC07-BP04 Define data lifecycle management](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_data_classification_lifecycle_management.html)
- [SEC08-BP04 Enforce access control](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_data_rest_access_control.html)
- [OPS08-BP02
Analyze workload logs](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_workload_observability_analyze_workload_logs.html)

**Related documents:**

- [AWS Whitepapers: Organizing Your AWS Environment Using Multiple
Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)
- [AWS Prescriptive Guidance: AWS Security Reference Architecture
(AWS SRA)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html)
- [AWS Prescriptive Guidance: Logging and monitoring guide for
application owners](https://docs.aws.amazon.com/prescriptive-guidance/latest/logging-monitoring-for-application-owners/introduction.html)

**Related examples:**

- [Aggregating,
searching, and visualizing log data from distributed sources
with Amazon Athena and Quick](https://aws.amazon.com/blogs/security/aggregating-searching-and-visualizing-log-data-from-distributed-sources-with-amazon-athena-and-amazon-quicksight/)
- [How
to visualize Amazon Security Lake findings with Quick](https://aws.amazon.com/blogs/security/how-to-visualize-amazon-security-lake-findings-with-amazon-quicksight/)
- [Generate
AI powered insights for Amazon Security Lake using Amazon SageMaker AI Studio and Amazon Bedrock](https://aws.amazon.com/blogs/security/generate-ai-powered-insights-for-amazon-security-lake-using-amazon-sagemaker-studio-and-amazon-bedrock/)
- [Identify
cybersecurity anomalies in your Amazon Security Lake data
using Amazon SageMaker AI](https://aws.amazon.com/blogs/machine-learning/identify-cybersecurity-anomalies-in-your-amazon-security-lake-data-using-amazon-sagemaker/)
- [Ingest,
transform, and deliver events published by Amazon Security Lake to Amazon OpenSearch Service](https://aws.amazon.com/blogs/big-data/ingest-transform-and-deliver-events-published-by-amazon-security-lake-to-amazon-opensearch-service/)
- [Simplify
AWS CloudTrail log analysis with natural language query
generation in CloudTrail Lake](https://aws.amazon.com/blogs/aws/simplify-aws-cloudtrail-log-analysis-with-natural-language-query-generation-in-cloudtrail-lake-preview/)

**Related tools:**

- [Amazon Security Lake](https://docs.aws.amazon.com/security-lake/latest/userguide/what-is-security-lake.html)
- [Amazon Security Lake Partner Integrations](https://aws.amazon.com/security-lake/partners/)
- [Open Cybersecurity
Schema Framework (OCSF)](https://github.com/ocsf)
- [Amazon Athena](https://aws.amazon.com/athena/)
- [Quick](https://aws.amazon.com/quicksight/)
- [Amazon Bedrock](https://aws.amazon.com/bedrock/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_detect_investigate_events_logs.html*

---

# SEC04-BP03 Correlate and enrich security alerts

Unexpected activity can generate multiple security alerts by
different sources, requiring further correlation and enrichment to
understand the full context. Implement automated correlation and
enrichment of security alerts to help achieve more accurate incident
identification and response.

**Desired outcome:** As activity
generates different alerts within your workloads and environments,
automated mechanisms correlate data and enrich that data with
additional information. This pre-processing presents a more detailed
understanding of the event, which helps your investigators determine
the criticality of the event and if it constitutes an incident that
requires formal response. This process reduces the load on your
monitoring and investigation teams.

**Common anti-patterns:**

- Different groups of people investigate findings and alerts
generated by different systems, unless otherwise mandated by
separation of duty requirements.
- Your organization funnels all security finding and alert data to
standard locations, but requires investigators to perform manual
correlation and enrichment.
- You rely solely on the intelligence of threat detection systems
to report on findings and establish criticality.

**Benefits of establishing this best
practice:** Automated correlation and enrichment of alerts
helps to reduce the overall cognitive load and manual data
preparation required of your investigators. This practice can reduce
the time it takes to determine if the event represents an incident
and initiate a formal response. Additional context also helps you
accurately assess the true severity of an event, as it may be higher
or lower than what any one alert suggests.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Security alerts can come from many different sources within AWS,
including:

- Services such as
[Amazon GuardDuty](https://aws.amazon.com/guardduty/),
[AWS Security Hub CSPM](https://aws.amazon.com/security-hub/),
[Amazon Macie](https://aws.amazon.com/macie/),
[Amazon Inspector](https://aws.amazon.com/inspector/),
[AWS Config](https://aws.amazon.com/config/),
[AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html), and
[Network Access Analyzer](https://docs.aws.amazon.com/vpc/latest/network-access-analyzer/what-is-vaa.html)
- Alerts from automated analysis of AWS service, infrastructure,
and application logs, such as from
[Security
Analytics for Amazon OpenSearch Service.](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/security-analytics.html)
- Alarms in response to changes in your billing activity from
sources such as
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch),
[Amazon EventBridge](https://aws.amazon.com/eventbridge/), or
[AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/).
- Third-party sources such as threat intelligence feeds
and [Security
Partner Solutions](https://aws.amazon.com/security/partner-solutions/) from the AWS Partner Network
- [Contact
by AWS Trust & Safety](https://repost.aws/knowledge-center/aws-abuse-report) or other sources, such as
customers or internal employees.
- Use [Threat Technique Catalog by AWS (TTC)](https://aws.amazon.com/blogs/security/aws-cirt-announces-the-launch-of-the-threat-technique-catalog-for-aws/) to assist with identification and correlation of threat actor behavior through indicator of compromise (IoC) identification. The TTC is an extension of the MITRE ATT&CK framework, categorizing all known and observed threat actor behaviors and techniques directed at AWS resources.

In their most fundamental form, alerts contain information about
who (the *principal* or
*identity*) is doing what
*(*the *action* taken) to
what (the *resources* affected). For each of
these sources, identify if there are ways you can create mappings
across identifiers for these identities, actions, and resources as
the foundation for performing correlation. This can take the form
of integrating alert sources with a security information and event
management (SIEM) tool to perform automated correlation for you,
building your own data pipelines and processing, or a combination
of both.

An example of a service that can perform correlation for you is
[Amazon Detective](https://aws.amazon.com/detective). Detective performs ongoing ingestion of alerts
from various AWS and third-party sources and uses different forms
of intelligence to assemble a visual graph of their relationships
to aid investigations.

While the initial criticality of an alert is an aid for
prioritization, the context in which the alert happened determines
its true criticality. As an example,
[Amazon GuardDuty](https://aws.amazon.com/guardduty/) can alert that an Amazon EC2 instance within your
workload is querying an unexpected domain name. GuardDuty might
assign low criticality to this alert on its own. However,
automated correlation with other activity around the time of the
alert might uncover that several hundred EC2 instances were
deployed by the same identity, which increases overall operating
costs. In this event, this correlated event context would warrant
a new security alert and the criticality might be adjusted to
high, which would expedite further action.

### Implementation steps

- Identify sources for security alert information. Understand
how alerts from these systems represent identity, action,
and resources to determine where correlation is possible.
- Establish a mechanism for capturing alerts from different
sources. Consider services such as Security Hub CSPM,
EventBridge, and CloudWatch for this purpose.
- Identify sources for data correlation and enrichment.
Example sources include
[AWS CloudTrail](https://aws.amazon.com/cloudtrail/),
[VPC
Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html),
[Route 53
Resolver logs](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-query-logs.html), and infrastructure and application
logs. Any or all of these logs might be consumed through a
single integration with
[Amazon
Security Lake](https://aws.amazon.com/security-lake/).
- Integrate your alerts with your data correlation and
enrichment sources to create more detailed security event
contexts and establish criticality.

Amazon Detective, SIEM tooling, or other third-party
solutions can perform a certain level of ingestion,
correlation, and enrichment automatically.
- You can also use AWS services to build your own. For
example, you can invoke an AWS Lambda function to run an
Amazon Athena query against AWS CloudTrail or
Amazon Security Lake, and publish the results to EventBridge.

## Resources

**Related best practices:**

- [SEC10-BP03 Prepare
forensic capabilities](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_incident_response_prepare_forensic.html)
- [OPS08-BP04
Create actionable alerts](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_workload_observability_create_alerts.html)
- [REL06-BP03
Send notifications (Real-time processing and alarming)](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_monitor_aws_resources_notification_monitor.html)

**Related documents:**

- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html)

**Related examples:**

- [How
to enrich AWS Security Hub CSPM findings with account
metadata](https://aws.amazon.com/blogs/security/how-to-enrich-aws-security-hub-findings-with-account-metadata/)

**Related tools:**

- [Amazon Detective](https://aws.amazon.com/detective/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [AWS Lambda](https://aws.amazon.com/lambda/)
- [Amazon Athena](https://aws.amazon.com/athena/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_detect_investigate_events_security_alerts.html*

---

# SEC04-BP04 Initiate remediation for non-compliant resources

Your detective controls may alert on resources that are out of
compliance with your configuration requirements. You can initiate
programmatically-defined remediations, either manually or
automatically, to fix these resources and help minimize potential
impacts. When you define remediations programmatically, you can take
prompt and consistent action.

While automation can enhance security operations, you should
implement and manage automation carefully.  Place appropriate
oversight and control mechanisms to verify that automated responses
are effective, accurate, and aligned with organizational policies
and risk appetite.

**Desired outcome:** You define
resource configuration standards along with the steps to remediate
when resources are detected to be non-compliant. Where possible,
you've defined remediations programmatically so they can be
initiated either manually or through automation. Detection systems
are in place to identify non-compliant resources and publish alerts
into centralized tools that are monitored by your security
personnel. These tools support running your programmatic
remediations, either manually or automatically. Automatic
remediations have appropriate oversight and control mechanisms in
place to govern their use.

**Common anti-patterns:**

- You implement automation, but fail to thoroughly test and
validate remediation actions. This can result in unintended
consequences, such as disrupting legitimate business operations
or causing system instability.
- You improve response times and procedures through automation,
but without proper monitoring and mechanisms that allow human
intervention and judgment when needed.
- You rely solely on remediations, rather than having remediations
as one part of a broader incident response and recovery program.

**Benefits of establishing this best
practice:** Automatic remediations can respond to
misconfigurations faster than manual processes, which helps you
minimize potential business impacts and reduce the window of
opportunity for unintended uses. When you define remediations
programmatically, they are applied consistently, which reduces the
risk of human error. Automation also can handle a larger volume of
alerts simultaneously, which is particularly important in
environments operating at large scale.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

As described in [SEC01-BP03 Identify and validate control objectives](./sec_securely_operate_control_objectives.html), services such as
[AWS Config](https://aws.amazon.com/config/) and
[AWS Security Hub CSPM](https://aws.amazon.com/security-hub/) can help you monitor the configuration of
resources in your accounts for adherence to your requirements.
When non-compliant resources are detected, services such as AWS Security Hub CSPM, can help with routing alerts appropriately and
remediation. These solutions provide a central place for your
security investigators to monitor for issues and take corrective
action.

In addition to AWS Security Hub CSPM, AWS introduced [Security Hub Advanced](https://aws.amazon.com/security-hub/). This service, announced at re:Invent 2025, transforms how organizations prioritize their most critical security issues and respond at scale to protect their cloud environments. The enhanced Security Hub now uses advanced analytics to automatically correlate, enrich, and prioritize security signals across your cloud environment. Security Hub seamlessly integrates with [Amazon GuardDuty](https://aws.amazon.com/guardduty/), [Amazon Inspector](https://aws.amazon.com/inspector/), [Amazon Macie](https://aws.amazon.com/macie/), and [AWS Security Hub CSPM](https://aws.amazon.com/security-hub/cspm/features/). Correlated findings in Security Hub can result in a net-new finding, called an exposure finding, which includes an assumed attack path based on vulnerabilities found in each resource.

While some non-compliant resource situations are unique and
require human judgment to remediate, other situations have a
standard response that you can define programmatically. For
example, a standard response to a misconfigured VPC security group
could be to remove the disallowed rules and notify the owner.
Responses can be defined in
[AWS Lambda](https://aws.amazon.com/pm/lambda) functions,
[AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html) documents, or through other code
environments you prefer. Make sure the environment is able to
authenticate to AWS using an IAM role with the least amount of
permission needed to take corrective action.

Once you define the desired remediation, you can then determine
your preferred means for initiating it. AWS Config can
[initiate
remediations](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html) for you. If you are using Security Hub CSPM, you
can do this through
[custom
actions](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cwe-custom-actions.html), which publishes the finding information to
[Amazon EventBridge](https://aws.amazon.com/eventbridge/). An EventBridge rule can then initiate your
remediation. You can configure remediations through Security Hub CSPM
to run either automatically or manually.

For programmatic remediation, we recommend that you have
comprehensive logs and audits for the actions taken, as well as
their outcomes. Review and analyze these logs to assess the
effectiveness of the automated processes, and identify areas of
improvement. Capture logs in
[Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html) and remediation outcomes as
[finding
notes](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-findings.html) in Security Hub CSPM.

As a starting point, consider
[Automated
Security Response on AWS](https://aws.amazon.com/solutions/implementations/automated-security-response-on-aws/), which has pre-built remediations
for resolving common security misconfigurations.

### Implementation steps

- Analyze and prioritize alerts.

Consolidate security alerts from various AWS services
into Security Hub CSPM for centralized visibility,
prioritization, and remediation.

- Develop remediations.

Use services such as Systems Manager and AWS Lambda to
run programmatic remediations.

- Configure how remediations are initiated.

Using Systems Manager, define custom actions that
publish findings to EventBridge. Configure these actions
to be initiated manually or automatically.
- You can also use
[Amazon Simple Notification Service (SNS)](https://aws.amazon.com/sns/) to send
notifications and alerts to relevant stakeholders (like
security team or incident response teams) for manual
intervention or escalation, if required.

- Review and analyze remediation logs for effectiveness and
improvement.

Send log output to CloudWatch Logs. Capture outcomes as
finding notes in Security Hub CSPM.

## Resources

**Related best practices:**

- [SEC06-BP03
Reduce manual management and interactive access](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_reduce_manual_management.html)

**Related documents:**

- [AWS Security Incident Response Guide - Detection](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/detection.html)

**Related examples:**

- [Automated
Security Response on AWS](https://aws.amazon.com/solutions/implementations/automated-security-response-on-aws/)
- [Monitor
EC2 instance key pairs using AWS Config](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/monitor-ec2-instance-key-pairs-using-aws-config.html)
- [Create
AWS Config custom rules by using AWS CloudFormation Guard
policies](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/create-aws-config-custom-rules-by-using-aws-cloudformation-guard-policies.html)
- [Automatically
remediate unencrypted Amazon RDS DB instances and
clusters](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/automatically-remediate-unencrypted-amazon-rds-db-instances-and-clusters.html)

**Related tools:**

- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [Automated
Security Response on AWS](https://aws.amazon.com/solutions/implementations/automated-security-response-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_detect_investigate_events_noncompliant_resources.html*

---
