# REL 9 — How do you back up data?

**Pillar**: Reliability  
**Best Practices**: 4

---

# REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources

Understand and use the backup capabilities of the data services and resources used by the workload. Most services provide capabilities to back up workload data.

**Desired outcome:** Data sources have been identified and classified based on
criticality. Then, establish a strategy for data recovery based on
the RPO. This strategy involves either backing up these data
sources, or having the ability to reproduce data from other sources.
In the case of data loss, the strategy implemented allows recovery
or the reproduction of data within the defined RPO and RTO.

**Cloud maturity phase:**
Foundational

**Common anti-patterns:**

- Not aware of all data sources for the workload and their
criticality.
- Not taking backups of critical data sources.
- Taking backups of only some data sources without using
criticality as a criterion.
- No defined RPO, or backup frequency cannot meet RPO.
- Not evaluating if a backup is necessary or if data can be
reproduced from other sources.

**Benefits of establishing this best
practice:** Identifying the places where backups are
necessary and implementing a mechanism to create backups, or being
able to reproduce the data from an external source improves the
ability to restore and recover data during an outage.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

All AWS data stores offer backup capabilities. Services such as Amazon RDS and Amazon DynamoDB additionally support automated backup that allows point-in-time recovery (PITR), which allows you to restore a backup to any time up to five minutes or less before the current time. Many AWS services offer the ability to copy backups to another AWS Region. AWS Backup is a tool that gives you the ability to centralize and automate data protection across AWS services. [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/) allows you to copy full server workloads and maintain continuous data protection from on-premise, cross-AZ or cross-Region, with a Recovery Point Objective (RPO) measured in seconds.

Amazon S3 can be used as a backup destination for self-managed and AWS-managed data sources. AWS services such as Amazon EBS, Amazon RDS, and Amazon DynamoDB have built in capabilities to create backups. Third-party backup software can also be used.

On-premises data can be backed up to the AWS Cloud using [AWS Storage Gateway](https://docs.aws.amazon.com/storagegateway/latest/vgw/WhatIsStorageGateway.html) or [AWS DataSync](https://docs.aws.amazon.com/datasync/latest/userguide/what-is-datasync.html). Amazon S3 buckets can be used to store this data on AWS. Amazon S3 offers multiple storage tiers such as [Amazon Glacier or Amazon Glacier Deep Archive](https://docs.aws.amazon.com/prescriptive-guidance/latest/backup-recovery/amazon-s3-glacier.html) to reduce cost of data storage.

You might be able to meet data recovery needs by reproducing the data from other sources. For example, [Amazon ElastiCache replica nodes](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Replication.Redis.Groups.html) or [Amazon RDS read replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html) could be used to reproduce data if the primary is lost. In cases where sources like this can be used to meet your [Recovery Point Objective (RPO) and Recovery Time Objective (RTO)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/disaster-recovery-dr-objectives.html), you might not require a backup. Another example, if working with Amazon EMR, it might not be necessary to backup your HDFS data store, as long as you can [reproduce the data into Amazon EMR from Amazon S3](https://aws.amazon.com/premiumsupport/knowledge-center/copy-s3-hdfs-emr/).

When selecting a backup strategy, consider the time it takes to recover data. The time needed to recover data depends on the type of backup (in the case of a backup strategy), or the complexity of the data reproduction mechanism. This time should fall within the RTO for the workload.

**Implementation steps**

- **Identify all data sources for the
workload**. Data can be stored on a number of
resources such as
[databases](https://aws.amazon.com/products/databases/),
[volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html),
[filesystems](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html),
[logging
systems](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html), and
[object
storage](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html). Refer to the
**Resources** section to find
**Related documents** on
different AWS services where data is stored, and the backup
capability these services provide.
- **Classify data sources based on
criticality**. Different data sets will have
different levels of criticality for a workload, and therefore
different requirements for resiliency. For example, some data
might be critical and require a RPO near zero, while other
data might be less critical and can tolerate a higher RPO and
some data loss. Similarly, different data sets might have
different RTO requirements as well.
- **Use AWS or third-party services to
create backups of the data**.
[AWS Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html) is a managed service that allows creating
backups of various data sources on AWS. [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/) handles automated sub-second data
replication to an AWS Region. Most AWS services
also have native capabilities to create backups. The AWS Marketplace has many solutions that provide these capabilites
as well. Refer to the
**Resources** listed below for
information on how to create backups of data from various AWS
services.
- **For data that is not backed up,
establish a data reproduction mechanism**. You might
choose not to backup data that can be reproduced from other
sources for various reasons. There might be a situation where
it is cheaper to reproduce data from sources when needed
rather than creating a backup as there may be a cost
associated with storing backups. Another example is where
restoring from a backup takes longer than reproducing the data
from sources, resulting in a breach in RTO. In such
situations, consider tradeoffs and establish a well-defined
process for how data can be reproduced from these sources when
data recovery is necessary. For example, if you have loaded
data from Amazon S3 to a data warehouse (like Amazon Redshift), or MapReduce cluster (like Amazon EMR) to do
analysis on that data, this may be an example of data that can
be reproduced from other sources. As long as the results of
these analyses are either stored somewhere or reproducible,
you would not suffer a data loss from a failure in the data
warehouse or MapReduce cluster. Other examples that can be
reproduced from sources include caches (like Amazon ElastiCache) or RDS read replicas.
- **Establish a cadence for backing up
data**. Creating backups of data sources is a
periodic process and the frequency should depend on the RPO.

**Level of effort for the Implementation
Plan:** Moderate

## Resources

**Related Best Practices:**

[REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html)

[REL13-BP02 Use defined recovery strategies to meet the recovery objectives](./rel_planning_for_recovery_disaster_recovery.html)

**Related documents:**

- [What
Is AWS Backup?](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- [What
is AWS DataSync?](https://docs.aws.amazon.com/datasync/latest/userguide/what-is-datasync.html)
- [What
is Volume Gateway?](https://docs.aws.amazon.com/storagegateway/latest/vgw/WhatIsStorageGateway.html)
- [APN
Partner: partners that can help with backup](https://aws.amazon.com/partners/find/results/?keyword=Backup)
- [AWS Marketplace: products that can be used for backup](https://aws.amazon.com/marketplace/search/results?searchTerms=Backup)
- [Amazon EBS Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)
- [Backing
Up Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/efs-backup-solutions.html)
- [Backing
up Amazon FSx for Windows File Server](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html)
- [Backup
and Restore for ElastiCache for Redis](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups.html)
- [Creating
a DB Cluster Snapshot in Neptune](https://docs.aws.amazon.com/neptune/latest/userguide/backup-restore-create-snapshot.html)
- [Creating
a DB Snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateSnapshot.html)
- [Creating
an EventBridge Rule That Triggers on a Schedule](https://docs.aws.amazon.com/eventbridge/latest/userguide/create-eventbridge-scheduled-rule.html)
- [Cross-Region
Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html) with Amazon S3
- [EFS-to-EFS
AWS Backup](https://aws.amazon.com/solutions/efs-to-efs-backup-solution/)
- [Exporting
Log Data to Amazon S3](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/S3Export.html)
- [Object
lifecycle management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)
- [On-Demand
Backup and Restore for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/backuprestore_HowItWorks.html)
- [Point-in-time
recovery for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/PointInTimeRecovery.html)
- [Working
with Amazon OpenSearch Service Index Snapshots](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains-snapshots.html)
- [What is AWS Elastic Disaster Recovery?](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html)

**Related videos:**

- [AWS re:Invent 2021 - Backup, disaster recovery, and ransomware
protection with AWS](https://www.youtube.com/watch?v=Ru4jxh9qazc)
- [AWS Backup Demo: Cross-Account and Cross-Region Backup](https://www.youtube.com/watch?v=dCy7ixko3tE)
- [AWS re:Invent
2019: Deep dive on AWS Backup, ft. Rackspace (STG341)](https://youtu.be/av8DpL0uFjc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_identified_backups_data.html*

---

# REL09-BP02 Secure and encrypt backups

Control and detect access to backups using authentication and authorization. Prevent and detect if data integrity of backups is compromised using encryption.

Implement security controls to prevent unauthorized access to backup data. Encrypt backups to protect the confidentiality and integrity of your data.

**Common anti-patterns:**

- Having the same access to the backups and restoration automation
as you do to the data.
- Not encrypting your backups.
- Not implementing immutability for protection against deletion or tampering.
- Using the same security domain for production and backup systems.
- Not validating backup integrity through regular testing.

**Benefits of establishing this best
practice:**

- Securing your backups prevents tampering with
the data, and encryption of the data prevents access to that data if
it is accidentally exposed.
- Enhanced protection against ransomware and other cyber threats that target backup infrastructure.
- Reduced recovery time following a cyber incident through validated recovery processes.
- Improved business continuity capabilities during security incidents.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Control and detect access to backups using authentication and authorization, such as AWS Identity and Access Management (IAM). Prevent and detect if data integrity of backups is compromised using encryption.

Amazon S3 supports several methods of encryption of your data at
rest. Using server-side encryption, Amazon S3 accepts your objects
as unencrypted data, and then encrypts them as they are stored.
Using client-side encryption, your workload application is
responsible for encrypting the data before it is sent to Amazon S3.
Both methods allow you to use AWS Key Management Service (AWS KMS)
to create and store the data key, or you can provide your own key,
which you are then responsible for. Using AWS KMS, you can set
policies using IAM on who can and cannot access your data keys and
decrypted data.

For Amazon RDS, if you have chosen to encrypt your databases, then
your backups are encrypted also. DynamoDB backups are always
encrypted. When using AWS Elastic Disaster Recovery, all data in transit and at rest is encrypted. With Elastic Disaster Recovery, data at rest can be encrypted using either the default Amazon EBS encryption Volume Encryption Key or a custom customer-managed key.

**Cyber resilience considerations**

To enhance backup security against cyber threats, consider implementing these additional controls besides encryption:

- Implement immutability using AWS Backup Vault Lock or Amazon S3 Object Lock to prevent backup data from being altered or deleted during its retention period, protecting against ransomware and malicious deletion.
- Establish logical isolation between production and backup environments with AWS Backup logically air-gapped vault for critical systems, creating separation that helps prevent compromise of both environments simultaneously.
- Validate backup integrity regularly using AWS Backup restore testing to verify that backups are not corrupted and can be successfully restored following a cyber incident.
- Implement multi-party approval for critical recovery operations using AWS Backup multi-party approval to prevent unauthorized or malicious recovery attempts by requiring authorization from multiple designated approvers.

### Implementation steps

- Use encryption on each of your data stores. If your source data is
encrypted, then the backup will also be encrypted.

[Use encryption in Amazon RDS.](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Encryption.html). You can configure encryption at rest using AWS Key Management Service
when you create an RDS instance.
- [Use encryption on Amazon EBS volumes.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html). You can configure default encryption or specify
a unique key upon volume creation.
- Use the required [Amazon DynamoDB encryption](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/EncryptionAtRest.html). DynamoDB encrypts all data at rest. You can
either use an AWS owned AWS KMS key or an AWS managed KMS key, specifying a key that
is stored in your account.
- [Encrypt your data stored in Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/encryption.html). Configure the encryption when you create your
file system.
- Configure the encryption in the source and destination Regions. You can configure
encryption at rest in Amazon S3 using keys stored in KMS, but the keys are Region-specific.
You can specify the destination keys when you configure the replication.
- Choose whether to use the default or custom [Amazon EBS encryption for Elastic Disaster Recovery](https://docs.aws.amazon.com/drs/latest/userguide/volumes-drs.html#ebs-encryption). This option will encrypt your replicated data at rest on the Staging Area Subnet disks and the replicated disks.

- Implement least privilege permissions to access your backups.
Follow best practices to limit the access to the backups,
snapshots, and replicas in accordance with [security best
practices](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html).
- Configure immutability for critical backups. For critical data, implement AWS Backup Vault Lock or S3 Object Lock to prevent deletion or alteration during the specified retention period. For implementation details, see [AWS Backup Vault Lock](https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html).
- Create logical separation for backup environments. Implement AWS Backup logically air-gapped vault for critical systems requiring enhanced protection from cyber threats. For implementation guidance, see [Building cyber resiliency with AWS Backup logically air-gapped vault](https://aws.amazon.com/blogs/storage/building-cyber-resiliency-with-aws-backup-logically-air-gapped-vault/).
- Implement backup validation processes. Configure AWS Backup restore testing to regularly verify that backups are not corrupted and can be successfully restored following a cyber incident. For more information, see [Validate recovery readiness with AWS Backup restore testing](https://aws.amazon.com/blogs/storage/validate-recovery-readiness-with-aws-backup-restore-testing/).
- Configure multi-party approval for sensitive recovery operations. For critical systems, implement AWS Backup multi-party approval to require authorization from multiple designated approvers before recovery can proceed. For implementation details, see [Improve recovery resilience with AWS Backup support for Multi-party approval](https://aws.amazon.com/blogs/storage/improve-recovery-resilience-with-aws-backup-support-for-multi-party-approval/).

## Resources

**Related documents:**

- [AWS Marketplace: products that can be used for backup](https://aws.amazon.com/marketplace/search/results?searchTerms=Backup)
- [Amazon EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
- [Amazon S3: Protecting Data Using Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html)
- [CRR
Additional Configuration: Replicating Objects Created with Server-Side Encryption (SSE) Using Encryption Keys stored in AWS KMS](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr-replication-config-for-kms-objects.html)
- [DynamoDB
Encryption at Rest](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/EncryptionAtRest.html)
- [Encrypting
Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Encryption.html)
- [Encrypting
Data and Metadata in Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/encryption.html)
- [Encryption
for Backups in AWS](https://docs.aws.amazon.com/aws-backup/latest/devguide/encryption.html)
- [Managing
Encrypted Tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/encryption.tutorial.html)
- [Security
Pillar - AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [What is AWS Elastic Disaster Recovery?](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html)
- [FSISEC11: How are you protecting against ransomware?](https://docs.aws.amazon.com/wellarchitected/latest/financial-services-industry-lens/fsisec11.html)
- [Ransomware Risk Management on AWS Using the NIST Cyber Security Framework](https://docs.aws.amazon.com/whitepapers/latest/ransomware-risk-management-on-aws-using-nist-csf/welcome.html)
- [Building cyber resiliency with AWS Backup logically air-gapped vault](https://aws.amazon.com/blogs/storage/building-cyber-resiliency-with-aws-backup-logically-air-gapped-vault/)
- [Validate recovery readiness with AWS Backup restore testing](https://aws.amazon.com/blogs/storage/validate-recovery-readiness-with-aws-backup-restore-testing/)
- [Improve recovery resilience with AWS Backup support for Multi-party approval](https://aws.amazon.com/blogs/storage/improve-recovery-resilience-with-aws-backup-support-for-multi-party-approval/)

**Related examples:**

- [Implementing Bi-Directional Cross-Region Replication (CRR) for Amazon S3](https://wellarchitectedlabs.com/reliability/200_labs/200_bidirectional_replication_for_s3/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_secured_backups_data.html*

---

# REL09-BP03 Perform data backup automatically

Configure backups to be taken automatically based on a periodic schedule informed by the
Recovery Point Objective (RPO), or by changes in the dataset. Critical datasets with low data
loss requirements need to be backed up automatically on a frequent basis, whereas less
critical data where some loss is acceptable can be backed up less frequently.

**Desired outcome:** An automated process that creates backups of data sources at an
established cadence.

**Common anti-patterns:**

- Performing backups manually.
- Using resources that have backup capability, but not including
the backup in your automation.

**Benefits of establishing this best
practice:** Automating backups verifies that they are taken
regularly based on your RPO, and alerts you if they are not taken.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

AWS Backup can be used to create automated data backups of various
AWS data sources. Amazon RDS instances can be backed up almost
continuously every five minutes and Amazon S3 objects can be backed
up almost continuously every fifteen minutes, providing for
point-in-time recovery (PITR) to a specific point in time within the
backup history. For other AWS data sources, such as Amazon EBS
volumes, Amazon DynamoDB tables, or Amazon FSx file systems, AWS Backup can run automated backup as frequently as every hour. These
services also offer native backup capabilities. AWS services that
offer automated backup with point-in-time recovery
include [Amazon DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/PointInTimeRecovery_Howitworks.html), [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIT.html),
and [Amazon
Keyspaces (for Apache Cassandra)](https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html) – these can be restored to a
specific point in time within the backup history. Most other AWS
data storage services offer the ability to schedule periodic
backups, as frequently as every hour.

Amazon RDS and Amazon DynamoDB offer continuous backup with point-in-time recovery. Amazon S3 versioning,
once turned on, is automatic. [Amazon Data Lifecycle Manager](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html) can be used to automate the creation, copy and deletion of Amazon EBS snapshots.
It can also automate the creation, copy, deprecation and deregistration of Amazon EBS-backed Amazon
Machine Images (AMIs) and their underlying Amazon EBS snapshots.

AWS Elastic Disaster Recovery provides continuous block-level replication from the source
environment (on-premises or AWS) to the target recovery region. Point-in-time Amazon EBS snapshots are
automatically created and managed by the service.

For a centralized view of your backup automation and history, AWS Backup provides a fully managed, policy-based backup solution. It
centralizes and automates the back up of data across multiple AWS
services in the cloud as well as on premises using the AWS Storage Gateway.

In additional to versioning, Amazon S3 features replication. The
entire S3 bucket can be automatically replicated to another bucket
in the same, or a different AWS Region.

**Implementation steps**

- **Identify data sources** that
are currently being backed up manually. For more detail, see [REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources](./rel_backing_up_data_identified_backups_data.html).
- **Determine the RPO** for the
workload. For more detail, see [REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html).
- **Use an automated backup solution or
managed service**. AWS Backup is a fully-managed
service that makes it easy to
[centralize
and automate data protection across AWS services, in the
cloud, and on-premises](https://docs.aws.amazon.com/aws-backup/latest/devguide/creating-a-backup.html#creating-automatic-backups). Using backup plans in
AWS Backup, create rules which define the
resources to backup, and the frequency at which these backups
should be created. This frequency should be informed by the
RPO established in Step 2. For hands-on guidance on how to create
automated backups using AWS Backup, see
[Testing Backup and Restore of Data](https://wellarchitectedlabs.com/reliability/200_labs/200_testing_backup_and_restore_of_data/).
Native backup capabilities
are offered by most AWS services that store data. For example,
RDS can be leveraged for automated backups with point-in-time
recovery (PITR).
- **For data sources not
supported** by an automated backup solution or
managed service such as on-premises data sources or message
queues, consider using a trusted third-party solution to
create automated backups. Alternatively, you can create
automation to do this using the AWS CLI or SDKs. You can use
AWS Lambda Functions or AWS Step Functions to define the logic
involved in creating a data backup, and use Amazon EventBridge
to invoke it at a frequency based on your RPO.

**Level of effort for the Implementation
Plan:** Low

## Resources

**Related documents:**

- [APN
Partner: partners that can help with backup](https://aws.amazon.com/partners/find/results/?keyword=Backup)
- [AWS Marketplace: products that can be used for backup](https://aws.amazon.com/marketplace/search/results?searchTerms=Backup)
- [Creating
an EventBridge Rule That Triggers on a Schedule](https://docs.aws.amazon.com/eventbridge/latest/userguide/create-eventbridge-scheduled-rule.html)
- [What
Is AWS Backup?](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- [What
Is AWS Step Functions?](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [What is AWS Elastic Disaster Recovery?](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html)

**Related videos:**

- [AWS re:Invent
2019: Deep dive on AWS Backup, ft. Rackspace (STG341)](https://youtu.be/av8DpL0uFjc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_automated_backups_data.html*

---

# REL09-BP04 Perform periodic recovery of the data to verify backup integrity and processes

Validate that your backup process implementation meets your Recovery Time Objectives (RTO) and Recovery Point Objectives (RPO) by performing a recovery test.

**Desired outcome:** Data from
backups is periodically recovered using well-defined mechanisms to
verify that recovery is possible within the established recovery
time objective (RTO) for the workload. Verify that restoration from
a backup results in a resource that contains the original data
without any of it being corrupted or inaccessible, and with data
loss within the recovery point objective (RPO).

**Common anti-patterns:**

- Restoring a backup, but not querying or retrieving any data to
check that the restoration is usable.
- Assuming that a backup exists.
- Assuming that the backup of a system is fully operational and
that data can be recovered from it.
- Assuming that the time to restore or recover data from a backup
falls within the RTO for the workload.
- Assuming that the data contained on the backup falls within the
RPO for the workload
- Restoring when necessary, without using a runbook or outside of an
established automated procedure.

**Benefits of establishing this best
practice:** Testing the recovery of the backups verifies that
data can be restored when needed without having any worry that data
might be missing or corrupted, that the restoration and recovery is
possible within the RTO for the workload, and any data loss falls
within the RPO for the workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Testing backup and restore capability increases confidence in the
ability to perform these actions during an outage. Periodically
restore backups to a new location and run tests to verify the
integrity of the data. Some common tests that should be performed
are checking if all data is available, is not corrupted, is accessible, and that any data loss falls within the RPO for the workload. Such tests can also help ascertain if recovery mechanisms are fast enough to accommodate the workload's RTO.

Using AWS, you can stand up a testing environment and restore your
backups to assess RTO and RPO capabilities, and run tests on data
content and integrity.

Additionally, Amazon RDS and Amazon DynamoDB allow point-in-time
recovery (PITR). Using continuous backup, you can restore your
dataset to the state it was in at a specified date and time.

If all the data is available, is not corrupted, is accessible, and
any data loss falls within the RPO for the workload. Such tests
can also help ascertain if recovery mechanisms are fast enough to
accommodate the workload's RTO.

AWS Elastic Disaster Recovery offers continual point-in-time recovery snapshots of Amazon EBS volumes. As source servers are replicated, point-in-time states are chronicled over time based on the configured policy. Elastic Disaster Recovery helps you verify the integrity of these snapshots by launching instances for test and drill purposes without redirecting the traffic.

**Implementation steps**

- **Identify data sources** that
are currently being backed up and where these backups are
being stored. For implementation guidance, see [REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources](./rel_backing_up_data_identified_backups_data.html).
- **Establish criteria for data
validation** for each data source. Different types of
data will have different properties which might require
different validation mechanisms. Consider how this data might
be validated before you are confident to use it in production.
Some common ways to validate data are using data and backup
properties such as data type, format, checksum, size, or a
combination of these with custom validation logic. For
example, this might be a comparison of the checksum values
between the restored resource and the data source at the time
the backup was created.
- **Establish RTO and RPO** for
restoring the data based on data criticality. For implementation guidance, see
[REL13-BP01 Define recovery objectives for downtime and data loss](./rel_planning_for_recovery_objective_defined_recovery.html).
- **Assess your recovery
capability**. Review your backup and restore strategy
to understand if it can meet your RTO and RPO, and adjust the
strategy as necessary. Using
[AWS Resilience Hub](https://docs.aws.amazon.com/resilience-hub/latest/userguide/create-policy.html), you can run an assessment of your
workload. The assessment evaluates your application
configuration against the resiliency policy and reports if
your RTO and RPO targets can be met.
- **Do a test restore** using
currently established processes used in production for data
restoration. These processes depend on how the original data
source was backed up, the format and storage location of the
backup itself, or if the data is reproduced from other
sources. For example, if you are using a managed service such
as
[AWS Backup, this might be as simple as restoring the backup into a
new resource](https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-a-backup.html). If you used AWS Elastic Disaster Recovery
you can
[launch
a recovery drill](https://docs.aws.amazon.com/drs/latest/userguide/failback-preparing.html).
- **Validate data recovery** from
the restored resource based on
criteria you previously established for data validation. Does the restored and recovered data contain the most
recent record or item at the time of backup? Does this data fall
within the RPO for the workload?
- **Measure time required** for
restore and recovery and compare it to your established RTO. Does this process fall within the RTO for the
workload? For example, compare the timestamps from when the
restoration process started and when the recovery validation
completed to calculate how long this process takes. All AWS
API calls are timestamped and this information is available in
[AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html). While this information can provide details
on when the restore process started, the end timestamp for
when the validation was completed should be recorded by your
validation logic. If using an automated process, then services
like
[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) can be used to store this information.
Additionally, many AWS services provide an event history which
provides timestamped information when certain actions
occurred. Within AWS Backup, backup and restore actions are
referred to as *jobs*, and these jobs
contain timestamp information as part of its metadata which
can be used to measure time required for restoration and
recovery.
- **Notify stakeholders** if data
validation fails, or if the time required for restoration and
recovery exceeds the established RTO for the workload. When
implementing automation to do this,
[such
as in this lab](https://wellarchitectedlabs.com/reliability/200_labs/200_testing_backup_and_restore_of_data/), services like Amazon Simple Notification Service (Amazon SNS) can be used to send push
notifications such as email or SMS to stakeholders.
[These
messages can also be published to messaging applications such
as Amazon Chime, Slack, or Microsoft Teams](https://aws.amazon.com/premiumsupport/knowledge-center/sns-lambda-webhooks-chime-slack-teams/) or used to
[create
tasks as OpsItems using AWS Systems Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html).
- **Automate this process to run
periodically**. For example, services like AWS Lambda
or a State Machine in AWS Step Functions can be used to
automate the restore and recovery processes, and Amazon EventBridge can be used to invoke this automation workflow
periodically as shown in the architecture diagram below. Learn
how to
[Automate
data recovery validation with AWS Backup](https://aws.amazon.com/blogs/storage/automate-data-recovery-validation-with-aws-backup/). Additionally,
[this
Well-Architected lab](https://wellarchitectedlabs.com/reliability/200_labs/200_testing_backup_and_restore_of_data/) provides a hands-on experience on
one way to do automation for several of the steps here.

*Figure 9. An automated backup and restore process*

**Level of effort for the Implementation
Plan:** Moderate to high depending on the complexity of
the validation criteria.

## Resources

**Related documents:**

- [Automate
data recovery validation with AWS Backup](https://aws.amazon.com/blogs/storage/automate-data-recovery-validation-with-aws-backup/)
- [APN
Partner: partners that can help with backup](https://aws.amazon.com/partners/find/results/?keyword=Backup)
- [AWS Marketplace: products that can be used for backup](https://aws.amazon.com/marketplace/search/results?searchTerms=Backup)
- [Creating
an EventBridge Rule That Triggers on a Schedule](https://docs.aws.amazon.com/eventbridge/latest/userguide/create-eventbridge-scheduled-rule.html)
- [On-demand
backup and restore for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/BackupRestore.html)
- [What
Is AWS Backup?](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- [What
Is AWS Step Functions?](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [What
is AWS Elastic Disaster Recovery](https://docs.aws.amazon.com/drs/latest/userguide/what-is-drs.html)
- [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_periodic_recovery_testing_data.html*

---
