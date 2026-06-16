# SEC 8 — How do you protect your data at rest?

**Pillar**: Security  
**Best Practices**: 4

---

# SEC08-BP01 Implement secure key management

Secure key management includes the storage, rotation, access
control, and monitoring of key material required to secure data at
rest for your workload.

**Desired outcome:** You have a
scalable, repeatable, and automated key management mechanism. The
mechanism enforces least privilege access to key material and
provides the correct balance between key availability,
confidentiality, and integrity. You monitor access to the keys, and
if rotation of key material is required, you rotate them using an
automated process. You do not allow key material to be accessed by
human operators.

**Common anti-patterns:**

- Human access to unencrypted key material.
- Creating custom cryptographic algorithms.
- Overly broad permissions to access key material.

**Benefits of establishing this best practice:** By establishing a
secure key management mechanism for your workload, you can help provide protection for your
content against unauthorized access. Additionally, you may be subject to regulatory requirements
to encrypt your data. An effective key management solution can provide technical mechanisms
aligned to those regulations to protect key material.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Encryption of data at rest is a fundamental security control. To
implement this control, your workload needs a mechanism to
securely store and manage the key material used to encrypt your
data at rest.

AWS offers the AWS Key Management Service (AWS KMS) to provide
durable, secure, and redundant storage for AWS KMS keys.
[Many
AWS services integrate with AWS KMS](https://aws.amazon.com/kms/features/#integration) to support encryption
of your data. AWS KMS uses FIPS 140-3 Level 3 validated hardware
security modules to protect your keys. There is no mechanism to
export AWS KMS keys in plain text.

When deploying workloads using a multi-account strategy, you
should keep AWS KMS keys in the same account as the workload that
uses them.
[This
distributed model](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/application.html#app-kms) places the responsibility for managing
the AWS KMS keys with your team. In other use cases, your
organization may choose to store AWS KMS keys into a centralized
account. This centralized structure requires additional policies
to enable the cross-account access required for the workload
account to access keys stored in the centralized account, but may
be more applicable in use cases where a single key is shared
across multiple AWS accounts.

Regardless of where the key material is stored, you should tightly
control access to the key through the use of
[key
policies](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html) and IAM policies. Key policies are the primary way
to control access to an AWS KMS key. Additionally, AWS KMS key
grants can provide access to AWS services to encrypt and decrypt
data on your behalf. Review the
[guidance
for access control to your AWS KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies-best-practices.html).

You should monitor the use of encryption keys to detect unusual
access patterns. Operations performed using AWS managed keys and
customer managed keys stored in AWS KMS can be logged in AWS CloudTrail and should be reviewed periodically. Pay special
attention to monitoring key destruction events. To mitigate
accidental or malicious destruction of key material, key
destruction events do not delete the key material immediately.
Attempts to delete keys in AWS KMS are subject to a
[waiting
period](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#deleting-keys-how-it-works), which defaults to 30 days and a minimum of 7 days,
providing administrators time to review these actions and roll
back the request if necessary.

Most AWS services use AWS KMS in a way that is transparent to you
- your only requirement is to decide whether to use an AWS managed
or customer managed key. If your workload requires the direct use
of AWS KMS to encrypt or decrypt data, you should use
[envelope
encryption](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#enveloping) to protect your data. The
[AWS Encryption SDK](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/introduction.html) can provide your applications client-side
encryption primitives to implement envelope encryption and
integrate with AWS KMS.

### Implementation steps

- Determine the appropriate
[key
management options](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-mgmt) (AWS managed or customer managed)
for the key.

For ease of use, AWS offers AWS owned and AWS managed
keys for most services, which provide encryption-at-rest
capability without the need to manage key material or
key policies.
- When using customer managed keys, consider the default
key store to provide the best balance between agility,
security, data sovereignty, and availability. Other use
cases may require the use of custom key stores with
[AWS CloudHSM](https://aws.amazon.com/cloudhsm/) or the
[external
key store](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html).

- Review the list of services that you are using for your
workload to understand how AWS KMS integrates with the
service. For example, EC2 instances can use encrypted EBS
volumes, verifying that Amazon EBS snapshots created from
those volumes are also encrypted using a customer managed
key and mitigating accidental disclosure of unencrypted
snapshot data.

[How
AWS services use AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/service-integration.html)
- For detailed information about the encryption options
that an AWS service offers, see the Encryption at Rest
topic in the user guide or the developer guide for the
service.

- Implement AWS KMS: AWS KMS makes it simple for you to create
and manage keys and control the use of encryption across a
wide range of AWS services and in your applications.

[Getting
started: AWS Key Management Service (AWS KMS)](https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html)
- Review the
[best
practices for access control to your AWS KMS
keys](https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies-best-practices.html).

- Consider AWS Encryption SDK: Use the AWS Encryption SDK with
AWS KMS integration when your application needs to encrypt
data client-side.

[AWS Encryption SDK](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/introduction.html)

- Enable
[IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html) to automatically review and notify if
there are overly broad AWS KMS key policies.

Consider using
[custom
policy checks](https://docs.aws.amazon.com/access-analyzer/latest/APIReference/API_CheckNoPublicAccess.html) to verify that a resource policy
update does not grant public access to KMS Keys.

- Enable
[Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/kms-controls.html) to receive notifications if there are
misconfigured key policies, keys scheduled for deletion, or
keys without automated rotation enabled.
- Determine the logging level appropriate for your AWS KMS
keys. Since calls to AWS KMS, including read-only events,
are logged, the CloudTrail logs associated with AWS KMS can
become voluminous.

Some organizations prefer to segregate the AWS KMS
logging activity into a separate trail. For more detail,
see the
[Logging
AWS KMS API calls with CloudTrail](https://docs.aws.amazon.com/kms/latest/developerguide/logging-using-cloudtrail.html) section of the
AWS KMS developers guide.

## Resources

**Related documents:**

- [AWS Key Management Service](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)
- [AWS cryptographic services and tools](https://docs.aws.amazon.com/crypto/latest/userguide/awscryp-overview.html)
- [Protecting
Amazon S3 Data Using Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html)
- [Envelope
encryption](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#enveloping)
- [Digital sovereignty pledge](https://aws.amazon.com/blogs/security/aws-digital-sovereignty-pledge-control-without-compromise/)
- [Demystifying
AWS KMS key operations, bring your own key, custom key store, and
ciphertext portability](https://aws.amazon.com/blogs/security/demystifying-kms-keys-operations-bring-your-own-key-byok-custom-key-store-and-ciphertext-portability/)
- [AWS Key Management Service cryptographic details](https://docs.aws.amazon.com/kms/latest/cryptographic-details/intro.html)

**Related videos:**

- [How
Encryption Works in AWS](https://youtu.be/plv7PQZICCM)
- [Securing
Your Block Storage on AWS](https://youtu.be/Y1hE1Nkcxs8)
- [AWS data protection: Using locks, keys, signatures, and
certificates](https://www.youtube.com/watch?v=lD34wbc7KNA)

**Related examples:**

- [Implement
advanced access control mechanisms using AWS KMS](https://catalog.workshops.aws/advkmsaccess/en-US/introduction)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_rest_key_mgmt.html*

---

# SEC08-BP02 Enforce encryption at rest

Encrypt private data at rest to maintain confidentiality and provide
an additional layer of protection against unintended data disclosure
or exfiltration. Encryption protects data so that it cannot be read
or accessed without first being decrypted. Inventory and control
unencrypted data to mitigate risks associated with data exposure.

**Desired outcome:** You have mechanisms that encrypt private data by default when at rest. These mechanisms help maintain the confidentiality of the data and provides an additional layer of protection against unintended data disclosure or exfiltration. You maintain an inventory of unencrypted data and understand the controls that are in place to protect it.

**Common anti-patterns:**

- Not using encrypt-by-default configurations.
- Providing overly permissive access to decryption keys.
- Not monitoring the use of encryption and decryption keys.
- Storing data unencrypted.
- Using the same encryption key for all data regardless of data usage, types, and classification.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Map encryption keys to data classifications within your workloads. This approach helps protect against overly permissive access when using either a single, or very small number of encryption keys for your data (see [SEC07-BP01 Understand your data classification scheme](./sec_data_classification_identify_data.html)).

AWS Key Management Service (AWS KMS) integrates with many AWS
services to make it easier to encrypt your data at rest. For
example, in Amazon Elastic Compute Cloud (Amazon EC2), you can set
[default
encryption](https://docs.aws.amazon.com/ebs/latest/userguide/work-with-ebs-encr.html#encryption-by-default) on accounts so that new EBS volumes are
automatically encrypted. When using AWS KMS, consider how tightly
the data needs to be restricted. Default and service-controlled
AWS KMS keys are managed and used on your behalf by AWS. For
sensitive data that requires fine-grained access to the underlying
encryption key, consider customer managed keys (CMKs). You have
full control over CMKs, including rotation and access management
through the use of key policies.

Additionally, services such as Amazon Simple Storage Service
([Amazon S3](https://aws.amazon.com/blogs/aws/amazon-s3-encrypts-new-objects-by-default/)) now encrypt all new objects by default. This
implementation provides enhanced security with no impact on
performance.

Other services, such as
[Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default) (Amazon EC2) or
[Amazon Elastic File System](https://docs.aws.amazon.com/prescriptive-guidance/latest/encryption-best-practices/efs.html) (Amazon EFS), support settings for
default encryption. You can also use
[AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html) to automatically check that you are using
encryption for
[Amazon Elastic Block Store (Amazon EBS) volumes](https://docs.aws.amazon.com/config/latest/developerguide/encrypted-volumes.html),
[Amazon Relational Database Service (Amazon RDS) instances](https://docs.aws.amazon.com/config/latest/developerguide/rds-storage-encrypted.html),
[Amazon S3 buckets](https://docs.aws.amazon.com/config/latest/developerguide/s3-default-encryption-kms.html), and other services within your organization.

AWS also provides options for client-side encryption, allowing you to encrypt data prior to uploading it to the cloud. The AWS Encryption SDK provides a way to encrypt your data using [envelope encryption](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#enveloping). You provide the wrapping key, and the AWS Encryption SDK generates a unique data key for each data object it encrypts. Consider AWS CloudHSM if you need a managed single-tenant hardware security module (HSM). AWS CloudHSM allows you to generate, import, and manage cryptographic keys on a FIPS 140-2 level 3 validated HSM. Some use cases for AWS CloudHSM include protecting private keys for issuing a certificate authority (CA), and turning on transparent data encryption (TDE) for Oracle databases. The AWS CloudHSM Client SDK provides software that allows you to encrypt data client side using keys stored inside AWS CloudHSM prior to uploading your data into AWS. The Amazon DynamoDB Encryption Client also allows you to encrypt and sign items prior to upload into a DynamoDB table.

### Implementation steps

- **Configure**[default
encryption for new Amazon EBS
volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)**:**
Specify that you want all newly created Amazon EBS volumes
to be created in encrypted form, with the option of using
the default key provided by AWS or a key that you create.
- **Configure encrypted Amazon Machine
Images (AMIs):** Copying an existing AMI with
encryption configured will automatically encrypt root
volumes and snapshots.
- **Configure**[Amazon RDS
encryption](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Overview.Encryption.html)**:**
Configure encryption for your Amazon RDS database clusters
and snapshots at rest by using the encryption option.
- **Create and configure AWS KMS keys
with policies that limit access to the appropriate
principals for each classification of data:** For
example, create one AWS KMS key for encrypting production
data and a different key for encrypting development or test
data. You can also provide key access to other AWS accounts.
Consider having different accounts for your development and
production environments. If your production environment
needs to decrypt artifacts in the development account, you
can edit the CMK policy used to encrypt the development
artifacts to give the production account the ability to
decrypt those artifacts. The production environment can then
ingest the decrypted data for use in production.
- **Configure encryption in additional
AWS services:** For other AWS services you use,
review the
[security
documentation](https://docs.aws.amazon.com/security/) for that service to determine the
service's encryption options.

## Resources

**Related documents:**

- [AWS Crypto Tools](https://docs.aws.amazon.com/aws-crypto-tools)
- [AWS Encryption SDK](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/introduction.html)
- [AWS KMS Cryptographic Details Whitepaper](https://docs.aws.amazon.com/kms/latest/cryptographic-details/intro.html)
- [AWS Key Management Service](https://aws.amazon.com/kms)
- [AWS cryptographic services and tools](https://docs.aws.amazon.com/aws-crypto-tools/)
- [Amazon EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
- [Default
encryption for Amazon EBS volumes](https://aws.amazon.com/blogs/aws/new-opt-in-to-default-encryption-for-new-ebs-volumes/)
- [Encrypting
Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Encryption.html)
- [How
do I enable default encryption for an Amazon S3 bucket?](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/default-bucket-encryption.html)
- [Protecting
Amazon S3 Data Using Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html)

**Related videos:**

- [How Encryption
Works in AWS](https://youtu.be/plv7PQZICCM)
- [Securing Your
Block Storage on AWS](https://youtu.be/Y1hE1Nkcxs8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_rest_encrypt.html*

---

# SEC08-BP03 Automate data at rest protection

Use automation to validate and enforce data at rest controls.  Use
automated scanning to detect misconfiguration of your data storage
solutions, and perform remediations through automated programmatic
response where possible.  Incorporate automation in your CI/CD
processes to detect data storage misconfigurations before they are
deployed to production.

**Desired outcome:** Automated
systems scan and monitor data storage locations for misconfiguration
of controls, unauthorized access, and unexpected use.  Detection of
misconfigured storage locations initiates automated remediations.
Automated processes create data backups and store immutable copies
outside of the original environment.

**Common anti-patterns:**

- Not considering options to enable encryption by default
settings, where supported.
- Not considering security events, in addition to operational
events, when formulating an automated backup and recovery
strategy.
- Not enforcing public access settings for storage services.
- Not monitoring and audit your controls for protecting data at
rest.

**Benefits of establishing this best
practice:** Automation helps to prevent the risk of
misconfiguring your data storage locations. It helps to prevent
misconfigurations from entering your production environments. This
best practice also helps with detecting and fixing misconfigurations
if they occur.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Automation is a theme throughout the practices for protecting your
data at rest.
[SEC01-BP06 Automate
deployment of standard security controls](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_automate_security_controls.html) describes how you
can capture the configuration of your resources using
*infrastructure as code* (IaC) templates, such
as
with [AWS CloudFormation](https://aws.amazon.com/cloudformation/).  These templates are committed to a version
control system, and are used to deploy resources on AWS through a
CI/CD pipeline.  These techniques equally apply to automating the
configuration of your data storage solutions, such as encryption
settings on Amazon S3 buckets.

You can check the settings that you define in your IaC templates
for misconfiguration in your CI/CD pipelines using rules in [AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html).  You
can monitor settings that are not yet available in CloudFormation
or other IaC tooling for misconfiguration with
[AWS Config](https://aws.amazon.com/config/).  Alerts that Config generates for misconfigurations
can be remediated automatically, as described in
[SEC04-BP04 Initiate
remediation for non-compliant resources](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_detect_investigate_events_noncompliant_resources.html).

Using automation as part of your permissions management strategy
is also an integral component of automated data protections.
[SEC03-BP02
Grant least privilege access](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_least_privileges.html) and
[SEC03-BP04
Reduce permissions continuously](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_continuous_reduction.html) describe configuring
least-privilege access policies that are continually monitored by the [AWS Identity and Access Management Access Analyzer](https://aws.amazon.com/iam/access-analyzer/) to generate findings when permission can be reduced.  Beyond
automation for monitoring permissions, you can configure
[Amazon GuardDuty](https://aws.amazon.com/guardduty/) to watch for anomalous data access behavior for
your
[EBS
volumes](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_finding-types-ec2.html) (by way of an EC2 instance),
[S3
buckets](https://docs.aws.amazon.com/guardduty/latest/ug/s3-protection.html), and supported
[Amazon Relational Database Service databases](https://docs.aws.amazon.com/guardduty/latest/ug/rds-protection.html).

Automation also plays a role in detecting when sensitive data is
stored in unauthorized locations.
[SEC07-BP03 Automate
identification and classification](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_data_classification_auto_classification.html) describes how
[Amazon Macie](https://aws.amazon.com/macie/) can monitor your S3 buckets for unexpected sensitive
data and generate alerts that can initiate an automated response.

Follow the practices in
[REL09
Back up data](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/back-up-data.html) to develop an automated data backup and
recovery strategy. Data backup and recovery is as important for
recovering from security events as it is for operational events.

### Implementation steps

- Capture data storage configuration in IaC templates.  Use
automated checks in your CI/CD pipelines to detect
misconfigurations.

You can use for [CloudFormation](https://aws.amazon.com/cloudformation/) your IaC templates, and
[CloudFormation
Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html) for checking templates for misconfiguration.
- Use [AWS Config](https://aws.amazon.com/config/) to run rules in a proactive evaluation mode.
Use this setting to check the compliance of a resource as
a step in your CI/CD pipeline before creating it.

- Monitor resources for data storage misconfigurations.

Set [AWS Config](https://aws.amazon.com/config/) to monitor data storage resources for
changes in control configurations and generate alerts to
invoke remediation actions when it detects a
misconfiguration.
- See
[SEC04-BP04 Initiate
remediation for non-compliant resources](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_detect_investigate_events_noncompliant_resources.html)
for more guidance on automated remediations.

- Monitor and reduce data access permissions continually through
automation.

[IAM Access Analyzer](https://aws.amazon.com/iam/access-analyzer/) can run continually to generate
alerts when permissions can potentially be reduced.

- Monitor and alert on anomalous data access behaviors.

[GuardDuty](https://aws.amazon.com/guardduty/)
watches for both known threat signatures and deviations
from baseline access behaviors for data storage resources
such as EBS volumes, S3 buckets, and RDS databases.

- Monitor and alert on sensitive data being stored in unexpected
locations.

Use
[Amazon Macie](https://aws.amazon.com/macie/) to continually scan your S3 buckets for
sensitive data.

- Automate secure and encrypted backups of your data.

[AWS Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html) is a managed service that creates encrypted
and secure backups of various data sources on AWS.
[Elastic
Disaster Recovery](https://aws.amazon.com/disaster-recovery/) allows you to copy full server
workloads and maintain continuous data protection with a
recovery point objective (RPO) measured in seconds.  You
can configure both services to work together to automate
creating data backups and copying them to failover
locations.  This can help keep your data available when
impacted by either operational or security events.

## Resources

**Related best practices:**

- [SEC01-BP06
Automate deployment of standard security controls](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_automate_security_controls.html)
- [SEC03-BP02
Grant least privilege access](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_least_privileges.html)
- [SEC03-BP04
Reduce permissions continuously](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_continuous_reduction.html)
- [SEC04-BP04 Initiate
remediation for non-compliant resources](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_detect_investigate_events_noncompliant_resources.html)
- [SEC07-BP03 Automate
identification and classification](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_data_classification_auto_classification.html)
- [REL09-BP02
Secure and encrypt backups](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_secured_backups_data.html)
- [REL09-BP03
Perform data backup automatically](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_automated_backups_data.html)

**Related documents:**

- [AWS Prescriptive Guidance: Automatically encrypt existing and new
Amazon EBS volumes](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/automatically-encrypt-existing-and-new-amazon-ebs-volumes.html)
- [Ransomware
Risk Management on AWS Using the NIST Cyber Security Framework
(CSF)](https://docs.aws.amazon.com/whitepapers/latest/ransomware-risk-management-on-aws-using-nist-csf/ransomware-risk-management-on-aws-using-nist-csf.html)

**Related examples:**

- [How
to use AWS Config proactive rules and AWS CloudFormation Hooks
to prevent creation of noncompliant cloud resources](https://aws.amazon.com/blogs/mt/how-to-use-aws-config-proactive-rules-and-aws-cloudformation-hooks-to-prevent-creation-of-non-complaint-cloud-resources/)
- [Automate
and centrally manage data protection for Amazon S3 with AWS Backup](https://aws.amazon.com/blogs/storage/automate-and-centrally-manage-data-protection-for-amazon-s3-with-aws-backup/)
- [AWS re:Invent 2023 - Implement proactive data protection using
Amazon EBS snapshots](https://www.youtube.com/watch?v=d7C6XsUnmHc)
- [AWS re:Invent 2022 - Build and automate for resilience with modern
data protection](https://www.youtube.com/watch?v=OkaGvr3xYNk)

**Related tools:**

- [AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)
- [AWS CloudFormation Guard Rules Registry](https://github.com/aws-cloudformation/aws-guard-rules-registry)
- [IAM Access Analyzer](https://aws.amazon.com/iam/access-analyzer/)
- [Amazon Macie](https://aws.amazon.com/macie/)
- [AWS Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- [Elastic
Disaster Recovery](https://aws.amazon.com/disaster-recovery/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_rest_automate_protection.html*

---

# SEC08-BP04 Enforce access control

To help protect your data at rest, enforce access control using
mechanisms such as isolation and versioning. Apply least privilege
and conditional access controls. Prevent granting public access to
your data.

**Desired outcome:** You verify that
only authorized users can access data on a need-to-know basis. You
protect your data with regular backups and versioning to prevent
against intentional or inadvertent modification or deletion of data.
You isolate critical data from other data to protect its
confidentiality and data integrity.

**Common anti-patterns:**

- Storing data with different sensitivity requirements or classification together.
- Using overly permissive permissions on decryption keys.
- Improperly classifying data.
- Not retaining detailed backups of important data.
- Providing persistent access to production data.
- Not auditing data access or regularly reviewing permissions.

**Level of risk exposed if this best practice is not
established:** High

## Implementation guidance

Protecting data at rest is important to maintain data integrity,
confidentiality, and compliance with regulatory requirements. You
can implement multiple controls to help achieve this, including
access control, isolation, conditional access, and versioning.

You can enforce access control with the principle of least
privilege, which provides only the necessary permissions to users
and services to perform their tasks. This includes access to
encryption keys. Review your
[AWS Key Management Service (AWS KMS) policies](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html) to verify that
the level of access you grant is appropriate and that relevant
conditions apply.

You can separate data based on different classification levels by
using distinct AWS accounts for each level, and manage these
accounts using
[AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html). This isolation can help prevent unauthorized
access and minimizes the risk of data exposure.

Regularly review the level of access granted in Amazon S3 bucket
policies. Avoid using publicly readable or writeable buckets
unless absolutely necessary. Consider using
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html) to detect publicly available buckets and Amazon CloudFront to serve content from Amazon S3. Verify that buckets
that should not allow public access are properly configured to
prevent it.

Implement versioning and object locking mechanisms for critical
data stored in Amazon S3.
[Amazon S3 versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html) preserves previous versions of objects to
recover data from accidental deletion or overwrites.
[Amazon S3 Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html) provides mandatory access control for
objects, which prevents them from being deleted or overwritten,
even by the root user, until the lock expires. Additionally,
[Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html) offers a similar feature for archives
stored in Amazon Glacier.

### Implementation steps

- **Enforce access control with the
principle of least privilege**:

Review the access permissions granted to users and
services, and verify that they have only the necessary
permissions to perform their tasks.
- Review access to encryption keys by checking the
[AWS Key Management Service (AWS KMS) policies](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html).

- **Separate data based on different
classification levels**:

Use distinct AWS accounts for each data classification
level.
- Manage these accounts using
[AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).

- **Review Amazon S3 bucket and object
permissions**:

Regularly review the level of access granted in Amazon S3 bucket policies.
- Avoid using publicly readable or writeable buckets
unless absolutely necessary.
- Consider using
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html) to detect publicly available buckets.
- Use Amazon CloudFront to serve content from Amazon S3.
- Verify that buckets that should not allow public access
are properly configured to prevent it.
- You can apply the same review process for databases and
any other data sources that use IAM authentication, such
as SQS or third-party data stores.

- **Use AWS IAM Access Analyzer**:

You can configure [AWS IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html)
to analyze Amazon S3 buckets and generate findings when
an S3 policy grants access to an external entity.

- **Implement versioning and object
locking mechanisms**:

Use
[Amazon S3 versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html) to preserve previous versions of
objects, which provides recovery from accidental
deletion or overwrites.
- Use
[Amazon S3 Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html) to provide mandatory access
control for objects, which prevents them from being
deleted or overwritten, even by the root user, until the
lock expires.
- Use
[Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html) for archives stored in
Amazon Glacier.

- **Use Amazon S3 Inventory**:

You can use
[Amazon S3 Inventory](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html) to audit and report on the
replication and encryption status of your S3 objects.

- **Review Amazon EBS and AMI sharing
permissions**:

Review your sharing permissions for
[Amazon EBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html) and
[AMI
sharing](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sharing-amis.html) to verify that your images and volumes
are not shared with AWS accounts that are external to
your workload.

- **Review AWS Resource Access Manager
Shares periodically**:

You can use
[AWS Resource Access Manager](https://docs.aws.amazon.com/ram/latest/userguide/what-is.html) to share resources, such
as AWS Network Firewall policies, Amazon Route 53
resolver rules, and subnets, within your Amazon VPCs.
- Audit shared resources regularly and stop sharing
resources that no longer need to be shared.

## Resources

**Related best practices:**

- [SEC03-BP01 Define access requirements](./sec_permissions_define.html)
- [SEC03-BP02 Grant least privilege access](./sec_permissions_least_privileges.html)

**Related documents:**

- [AWS KMS Cryptographic Details Whitepaper](https://docs.aws.amazon.com/kms/latest/cryptographic-details/intro.html)
- [Introduction
to Managing Access Permissions to Your Amazon S3
Resources](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-managing-access-s3-resources.html)
- [Overview
of managing access to your AWS KMS resources](https://docs.aws.amazon.com/kms/latest/developerguide/control-access-overview.html)
- [AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html)
- [Amazon S3 + Amazon CloudFront: A Match Made in the Cloud](https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)
- [Using
versioning](https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html)
- [Locking
Objects Using Amazon S3 Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html)
- [Sharing
an Amazon EBS Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html)
- [Shared
AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sharing-amis.html)
- [Hosting
a single-page application on Amazon S3](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/deploy-a-react-based-single-page-application-to-amazon-s3-and-cloudfront.html)
- [AWS Global Condition Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html)
- [Building
a Data Perimeter on AWS](https://docs.aws.amazon.com/whitepapers/latest/building-a-data-perimeter-on-aws/building-a-data-perimeter-on-aws.html)

**Related videos:**

- [Securing Your
Block Storage on AWS](https://youtu.be/Y1hE1Nkcxs8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_rest_access_control.html*

---
