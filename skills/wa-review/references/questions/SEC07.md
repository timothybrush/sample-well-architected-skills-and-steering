# SEC 7 — How do you classify your data?

**Pillar**: Security  
**Best Practices**: 4

---

# SEC07-BP01 Understand your data classification scheme

Understand the classification of data your workload is processing,
its handling requirements, the associated business processes, where
the data is stored, and who the data owner is.  Your data
classification and handling scheme should consider the applicable
legal and compliance requirements of your workload and what data
controls are needed. Understanding the data is the first step in the
data classification journey.

**Desired outcome:** The types of
data present in your workload are well-understood and documented.
Appropriate controls are in place to protect sensitive data based
on its classification.  These controls govern considerations such as
who is allowed to access the data and for what purpose, where the
data is stored, the encryption policy for that data and how
encryption keys are managed, the lifecycle for the data and its
retention requirements, appropriate destruction processes, what
backup and recovery processes are in place, and the auditing of
access.

**Common anti-patterns:**

- Not having a formal data classification policy in place to
define data sensitivity levels and their handling requirements
- Not having a good understanding of the sensitivity levels of
data within your workload, and not capturing this information in
architecture and operations documentation
- Failing to apply the appropriate controls around your data based
on its sensitivity and requirements, as outlined in your data
classification and handling policy
- Failing to provide feedback about data classification and
handling requirements to owners of the policies.

**Benefits of establishing this best practice:** This practice removes ambiguity around the appropriate
handling of data within your workload.  Applying a formal policy
that defines the sensitivity levels of data in your organization and
their required protections can help you comply with legal
regulations and other cybersecurity attestations and certifications.
Workload owners can have confidence in knowing where sensitive data
is stored and what protection controls are in place.  Capturing
these in documentation helps new team members better understand them
and maintain controls early in their tenure. These practices can
also help reduce costs by right sizing the controls for each type of
data.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When designing a workload, you may be considering ways to protect
sensitive data intuitively.  For example, in a multi-tenant
application, it is intuitive to think of each tenant's data as
sensitive and put protections in place so that one tenant can't
access the data of another tenant.  Likewise, you may intuitively
design access controls so only administrators can modify data
while other users have only read-level access or no access at all.

By having these data sensitivity levels defined and captured in
policy, along with their data protection requirements, you can
formally identify what data resides in your workload. You can then
determine if the right controls are in place, if the controls can
be audited, and what responses are appropriate if data is found to
be mishandled.

To help identify where sensitive data resides within your
workload, consider using a data catalog. A data catalog is a
database that maps data in your organization, its location,
sensitivity level, and the controls in place to protect that data.
Additionally, consider using
[resource
tags](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html) where available.  For example, you can apply a tag
that has a *tag key* of
`Classification` and a *tag
value* of `PHI` for protected health
information (PHI), and another tag that has a *tag
key* of `Sensitivity` and a
*tag value* of `High`.
Services such as
[AWS Config](https://aws.amazon.com/config/) can then be used to monitor these resources for
changes and alert if they are modified in a way that brings them
out of compliance with your protection requirements (such as
changing the encryption settings).  You can capture the standard
definition of your tag keys and acceptable values using
[tag
policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html), a feature of AWS Organizations. It is not
recommended that the tag key or value contains private or
sensitive data.

### Implementation steps

- Understand your organization's data classification scheme and
protection requirements.
- Identify the types of sensitive data processed by your
workloads.
- Capture the data in a data catalog that provides a single
view of where data resides in the organization and the level
of sensitivity of that data.
- Consider using resource and data-level tagging, where
available, to tag data with its sensitivity level and other
operational metadata that can help with monitoring and
incident response.

AWS Organizations tag policies can be used to enforce
tagging standards.

## Resources

**Related best practices:**

- [SUS04-BP01
Implement a data classification policy](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_data_a2.html)

**Related documents:**

- [Data
Classification whitepaper](https://docs.aws.amazon.com/whitepapers/latest/data-classification/data-classification-overview.html)
- [Best
Practices for Tagging AWS Resources](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)

**Related examples:**

- [AWS Organizations Tag Policy Syntax and Examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example-tag-policies.html)

**Related tools**

- [AWS Tag Editor](https://docs.aws.amazon.com/tag-editor/latest/userguide/tag-editor.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_identify_data.html*

---

# SEC07-BP02 Apply data protection controls based on data sensitivity

Apply data protection controls that provide an appropriate level of
control for each class of data defined in your classification
policy.  This practice can allow you to protect sensitive data from
unauthorized access and use, while preserving the availability and
use of data.

**Desired outcome:** You have a
classification policy that defines the different levels of
sensitivity for data in your organization.  For each of these
sensitivity levels, you have clear guidelines published for approved
storage and handling services and locations, and their required
configuration.  You implement the controls for each level according
to the level of protection required and their associated costs.  You
have monitoring and alerting in place to detect if data is present
in unauthorized locations, processed in unauthorized environments,
accessed by unauthorized actors, or the configuration of related
services becomes non-compliant.

**Common anti-patterns:**

- Applying the same level of protection controls across all data.
This may lead to over-provisioning security controls for
low-sensitivity data, or insufficient protection of highly
sensitive data.
- Not involving relevant stakeholders from security, compliance,
and business teams when defining data protection controls.
- Overlooking the operational overhead and costs associated with
implementing and maintaining data protection controls.
- Not conducting periodic data protection control reviews to
maintain alignment with classification policies.
- Not having a complete inventory of where data resides at rest
and in transit.

**Benefits of establishing this best
practice:** By aligning your controls to the classification
level of your data, your organization can invest in higher levels of
control where needed. This can include increasing resources on
securing, monitoring, measuring, remediating, and reporting.  Where
fewer controls are appropriate, you can improve the accessibility
and completeness of data for your workforce, customers, or
constituents.  This approach gives your organization the most
flexibility with data usage, while still adhering to data protection
requirements.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implementing data protection controls based on data sensitivity
levels involves several key steps. First, identify the different
data sensitivity levels within your workload architecture (such as
public, internal, confidential, and restricted) and evaluate where
you store and process this data. Next, define isolation boundaries
around data based on its sensitivity level. We recommend you
separate data into different AWS accounts, using
[service
control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) (SCPs) to restrict services and actions
allowed for each data sensitivity level. This way, you can create
strong isolation boundaries and enforce the principle of least
privilege.

After you define the isolation boundaries, implement appropriate
protection controls based on the data sensitivity levels. Refer to
best practices for [Protecting
data at rest](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/protecting-data-at-rest.html) and
[Protecting data in
transit](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/protecting-data-in-transit.html) to implement relevant controls like encryption,
access controls, and auditing. Consider techniques like
tokenization or anonymization to reduce the sensitivity level of
your data. Simplify applying consistent data policies across your
business with a centralized system for tokenization and
de-tokenization.

Continuously monitor and test the effectiveness of the implemented
controls. Regularly review and update the data classification
scheme, risk assessments, and protection controls as your
organization's data landscape and threats evolve. Align the
implemented data protection controls with relevant industry
regulations, standards, and legal requirements. Further, provide
security awareness and training to help employees understand the
data classification scheme and their responsibilities in handling
and protecting sensitive data.

### Implementation steps

- Identify the classification and sensitivity levels of data
within your workload.
- Define isolation boundaries for each level and determine an
enforcement strategy.
- Evaluate the controls you define that govern access,
encryption, auditing, retention, and others required by your
data classification policy.
- Evaluate options to reduce the sensitivity level of data where
appropriate, such as using tokenization or anonymization.
- Verify your controls using automated testing and monitoring of
your configured resources.

## Resources

**Related best practices:**

- [PERF03-BP01
Use a purpose-built data store that best supports your data
access and storage requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_data_use_purpose_built_data_store.html)
- [COST04-BP05
Enforce data retention policies](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_decomissioning_resources_data_retention.html)

**Related documents:**

- [Data
Classification whitepaper](https://docs.aws.amazon.com/whitepapers/latest/data-classification/data-classification.html)
- [Best
Practices for Security, Identify, & Compliance](https://aws.amazon.com/architecture/security-identity-compliance/?cards-all.sort-by=item.additionalFields.sortDate&cards-all.sort-order=desc&awsf.content-type=*all&awsf.methodology=*all)
- [AWS KMS Best Practices](https://docs.aws.amazon.com/kms/latest/developerguide/best-practices.html)
- [Encryption
best practices and features for AWS services](https://docs.aws.amazon.com/prescriptive-guidance/latest/encryption-best-practices/welcome.html)

**Related examples:**

- [Building
a serverless tokenization solution to mask sensitive
data](https://aws.amazon.com/blogs/compute/building-a-serverless-tokenization-solution-to-mask-sensitive-data/)
- [How
to use tokenization to improve data security and reduce
audit scope](https://aws.amazon.com/blogs/security/how-to-use-tokenization-to-improve-data-security-and-reduce-audit-scope/)

**Related tools:**

- [AWS Key Management Service (AWS KMS)](https://aws.amazon.com/kms/)
- [AWS CloudHSM](https://aws.amazon.com/cloudhsm/)
- [AWS Organizations](https://aws.amazon.com/organizations/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_define_protection.html*

---

# SEC07-BP03 Automate identification and classification

Automating the identification and classification of data can help
you implement the correct controls. Using automation to augment
manual determination reduces the risk of human error and exposure.

**Desired outcome:** You are able to
verify whether the proper controls are in place based on your
classification and handling policy. Automated tools and services
help you to identify and classify the sensitivity level of your
data.  Automation also helps you continually monitor your
environments to detect and alert if data is being stored or handled
in unauthorized ways so corrective action can be taken quickly.

**Common anti-patterns:**

- Relying solely on manual processes for data identification and
classification, which can be error-prone and time-consuming.
This can lead to inefficient and inconsistent data
classification, especially as data volumes grow.
- Not having mechanisms to track and manage data assets across the
organization.
- Overlooking the need for continuous monitoring and
classification of data as it moves and evolves within the
organization.

**Benefits of establishing this best
practice:** Automating data identification and
classification can lead to more consistent and accurate application
of data protection controls, reducing the risk of human error.
Automation can also provide visibility into sensitive data access
and movement, helping you detect unauthorized handling and take
corrective action.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

While human judgment is often used to classify data during the
initial design phases of a workload, consider having systems in
place that automate identification and classification on test data
as a preventive control. For example, developers can be provided a
tool or service to scan representative data to determine its
sensitivity.  Within AWS, you can upload data sets into
[Amazon S3](https://aws.amazon.com/s3/) and
scan them using
[Amazon Macie](https://aws.amazon.com/macie/),
[Amazon Comprehend](https://aws.amazon.com/comprehend/), or
[Amazon Comprehend Medical](https://aws.amazon.com/comprehend/medical/).  Likewise, consider scanning data as
part of unit and integration testing to detect where sensitive
data is not expected. Alerting on sensitive data at this stage can
highlight gaps in protections before deployment to production.
Other features such as sensitive data detection in
[AWS Glue](https://docs.aws.amazon.com/glue/latest/dg/detect-PII.html),
[Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-message-data-protection-managed-data-identifiers.htm), and
[Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html) can also be used to detect PII and take
mitigating action. For any automated tool or service, understand
how it defines sensitive data, and augment it with other human or
automated solutions to close any gaps as needed.

As a detective control, use ongoing monitoring of your
environments to detect if sensitive data is being stored in
non-compliant ways.  This can help detect situations such as
sensitive data being emitted into log files or being copied to a
data analytics environment without proper de-identification or
redaction.  Data that is stored in Amazon S3 can be continually
monitored for sensitive data using Amazon Macie.

### Implementation steps

- Review the data classification scheme within your
organization described in
[SEC07-BP01](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_identify_data.html).

With an understanding of your organization's data
classification scheme, you can establish accurate
processes for automated identification and
classification that align with your company's policies.

- Perform an initial scan of your environments for automated
identification and classification.

An initial full scan of your data can help produce a
comprehensive understanding of where sensitive data
resides in your environments. When a full scan is not
initially required or is unable to be completed up-front
due to cost, evaluate if data sampling techniques are
suitable to achieve your outcomes. For example, Amazon Macie can be configured to perform a broad automated
sensitive data discovery operation across your S3
buckets.  This capability uses sampling techniques to
cost-efficiently perform a preliminary analysis of where
sensitive data resides.  A deeper analysis of S3 buckets
can then be performed using a sensitive data discovery
job. Other data stores can also be exported to S3 to be
scanned by Macie.
- Establish access control defined in
[SEC07-BP02](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_define_protection.html) for
your data storage resources identified within your scan.

- Configure ongoing scans of your environments.

The automated sensitive data discovery capability of
Macie can be used to perform ongoing scans of your
environments.  Known S3 buckets that are authorized to
store sensitive data can be excluded using an allow list
in Macie.

- Incorporate identification and classification into your
build and test processes.

Identify tools that developers can use to scan data for
sensitivity while workloads are in development.  Use
these tools as part of integration testing to alert when
sensitive data is unexpected and prevent further
deployment.

- Implement a system or runbook to take action when sensitive
data is found in unauthorized locations.

Restrict access to data using auto-remediation. For
example, you can move this data to an S3 bucket with
restricted access or tag the object if you use
attribute-based access control (ABAC). Additionally,
consider masking the data when it is detected.
- Alert your data protection and incident response teams
to investigate the root cause of the incident. Any
learnings they identify can help prevent future
incidents.

## Resources

**Related documents:**

- [AWS Glue: Detect and process sensitive data](https://docs.aws.amazon.com/glue/latest/dg/detect-PII.html)
- [Using
managed data identifiers in Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-message-data-protection-managed-data-identifiers.html)
- [Amazon CloudWatch Logs: Help protect sensitive log data with
masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html)

**Related examples:**

- [Enabling
data classification for Amazon RDS database with Macie](https://aws.amazon.com/blogs/security/enabling-data-classification-for-amazon-rds-database-with-amazon-macie/)
- [Detecting
sensitive data in DynamoDB with Macie](https://aws.amazon.com/blogs/security/detecting-sensitive-data-in-dynamodb-with-macie/)

**Related tools:**

- [Amazon Macie](https://aws.amazon.com/macie/)
- [Amazon Comprehend](https://aws.amazon.com/comprehend/)
- [Amazon Comprehend Medical](https://aws.amazon.com/comprehend/medical/)
- [AWS Glue](https://aws.amazon.com/glue/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_auto_classification.html*

---

# SEC07-BP04 Define scalable data lifecycle management

Understand your data lifecycle requirements as they relate to your
different levels of data classification and handling.  This can
include how data is handled when it first enters your environment,
how data is transformed, and the rules for its destruction. Consider
factors such as retention periods, access, auditing, and tracking
provenance.

**Desired outcome:** You classify
data as close as possible to the point and time of ingestion. When
data classification requires masking, tokenization, or other
processes that reduce sensitivity level, you perform these actions
as close as possible to point and time of ingestion.

You delete data in accordance with your policy when it is no longer
appropriate to keep, based on its classification.

**Common anti-patterns:**

- Implementing a one-size-fits-all approach to data lifecycle
management, without considering varying sensitivity levels and
access requirements.
- Considering lifecycle management only from the perspective of
either data that is usable, or data that is backed up, but not
both.
- Assuming that data that has entered your workload is valid,
without establishing its value or provenance.
- Relying on data durability as a substitute for data backups and
protection.
- Retaining data beyond its usefulness and required retention
period.

**Benefits of establishing this best
practice:** A well-defined and scalable data lifecycle
management strategy helps maintain regulatory compliance, improves
data security, optimizes storage costs, and enables efficient data
access and sharing while maintaining appropriate controls.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Data within a workload is often dynamic.  The form it takes when
entering your workload environment can be different from when it
is stored or used in business logic, reporting, analytics, or
machine learning.  In addition, the value of data can change over
time. Some data is temporal in nature and loses value as it gets
older.  Consider how these changes to your data impact evaluation
under your data classification scheme and associated controls.
Where possible, use an automated lifecycle mechanism, such as
[Amazon S3 lifecycle policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) and the
[Amazon Data Lifecycle Manager](https://aws.amazon.com/ebs/data-lifecycle-manager/), to configure your data retention,
archiving, and expiration processes. For data stored in DynamoDB,
you can use the
[Time
To Live (TTL)](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html) feature to define a per-item expiration
timestamp.

Distinguish between data that is available for use, and data that
is stored as a backup.  Consider using
[AWS Backup](https://aws.amazon.com/backup/) to automate the backup of data across AWS services.
[Amazon EBS snapshots](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-snapshots.html) provide a way to copy an EBS volume and store
it using S3 features, including lifecycle, data protection, and
access to protection mechanisms. Two of these mechanisms are
[S3
Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html) and
[AWS Backup Vault Lock](https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html), which can provide you with additional
security and control over your backups. Manage clear separation of
duties and access for backups. Isolate backups at the account
level to maintain separation from the affected environment during
an event.

Another aspect of lifecycle management is recording the history of
data as it progresses through your workload, called *data
provenance tracking*. This can give confidence that you
know where the data came from, any transformations performed, what
owner or process made those changes, and when.  Having this
history helps with troubleshooting issues and investigations
during potential security events.  For example, you can log
metadata about transformations in an
[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) table.  Within a data lake, you can keep copies of
transformed data in different S3 buckets for each data pipeline
stage. Store schema and timestamp information in an
[AWS Glue Data Catalog](https://docs.aws.amazon.com/glue/latest/dg/catalog-and-crawler.html).  Regardless of your solution, consider
the requirements of your end users to determine the appropriate
tooling you need to report on your data provenance.  This will
help you determine how to best track your provenance.

### Implementation steps

- Analyze the workload's data types, sensitivity levels, and
access requirements to classify the data and define
appropriate lifecycle management strategies.
- Design and implement data retention policies and automated
destruction processes that align with legal, regulatory, and
organizational requirements.
- Establish processes and automation for continuous monitoring,
auditing, and adjustment of data lifecycle management
strategies, controls, and policies as workload requirements
and regulations evolve.

Detect resources that do not have automated lifecycle
management turned on with
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/s3-lifecycle-policy-check.html)

## Resources

**Related best practices:**

- [COST04-BP05
Enforce data retention policies](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_decomissioning_resources_data_retention.html)
- [SUS04-BP03
Use policies to manage the lifecycle of your datasets](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_data_a4.html)

**Related documents:**

- [Data
Classification Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/data-classification/data-classification-overview.html)
- [AWS Blueprint for Ransomware Defense](https://d1.awsstatic.com/whitepapers/compliance/AWS-Blueprint-for-Ransomware-Defense.pdf)
- [DevOps
Guidance: Improve traceability with data provenance
tracking](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/ag.dlm.8-improve-traceability-with-data-provenance-tracking.html)

**Related examples:**

- [How
to protect sensitive data for its entire lifecycle in
AWS](https://aws.amazon.com/blogs/security/how-to-protect-sensitive-data-for-its-entire-lifecycle-in-aws/)
- [Build
data lineage for data lakes using AWS Glue, Amazon Neptune,
and Spline](https://aws.amazon.com/blogs/big-data/build-data-lineage-for-data-lakes-using-aws-glue-amazon-neptune-and-spline/)

**Related tools:**

- [AWS Backup](https://aws.amazon.com/backup/)
- [Amazon Data Lifecycle Manager](https://aws.amazon.com/ebs/data-lifecycle-manager/)
- [AWS Identity and Access Management Access Analyzer](https://aws.amazon.com/iam/access-analyzer/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_data_classification_lifecycle_management.html*

---
