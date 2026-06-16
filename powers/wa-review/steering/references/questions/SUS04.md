# SUS 4 — How do you take advantage of data management policies and patterns?

**Pillar**: Sustainability  
**Best Practices**: 8

---

# SUS04-BP01 Implement a data classification policy

Classify data to understand its criticality to business
outcomes and choose the right energy-efficient storage tier
to store the data.

**Common anti-patterns:**

- You do not identify data assets with similar characteristics
(such as sensitivity, business criticality, or regulatory
requirements) that are being processed or stored.
- You have not implemented a data catalog to inventory your data assets.

**Benefits of establishing this best practice:** Implementing
a data classification policy allows you to determine the most energy-efficient storage
tier for data.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Data classification involves identifying the types of data
that are being processed and stored in an information system
owned or operated by an organization. It also involves making
a determination on the criticality of the data and the likely
impact of a data compromise, loss, or misuse.

Implement data classification policy by working backwards
from the contextual use of the data and creating a categorization
scheme that takes into account the level of criticality of a
given dataset to an organization’s operations.

### Implementation steps

- **Perform data inventory:**
Conduct an inventory of the various data types that exist for your workload.
- **Group data:**
Determine criticality, confidentiality, integrity, and
availability of data based on risk to the organization.
Use these requirements to group data into one of the data
classification tiers that you adopt. As an example, see [Four simple steps to classify your data and
secure your startup](https://aws.amazon.com/blogs/startups/four-simple-steps-to-classify-your-data-and-secure-your-startup/).
- **Define data classification levels and policies:**
For each data group, define data classification level (for example, public or confidential) and handling policies. Tag data accordingly. For more detail on data classification categories, see Data Classification whitepaper.
- **Periodically review:**
Periodically review and audit your environment for untagged and
unclassified data. Use automation to identify this data, and classify and tag the data
appropriately. As an example, see [Data Catalog and crawlers in AWS Glue](https://docs.aws.amazon.com/glue/latest/dg/catalog-and-crawler.html).
- **Establish a data catalog:**
Establish a data catalog that provides
audit and governance capabilities.
- **Documentation:**
Document data classification policies and handling procedures
for each data class.

## Resources

**Related documents:**

- [Leveraging
AWS Cloud to Support Data Classification](https://docs.aws.amazon.com/whitepapers/latest/data-classification/leveraging-aws-cloud-to-support-data-classification.html)
- [Tag
policies from AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html)

**Related videos:**

- [AWS re:Invent 2022 - Enabling agility with data governance on AWS](https://www.youtube.com/watch?v=vznDgJkoH7k)
- [AWS re:Invent 2023 - Data protection and resilience with AWS storage](https://www.youtube.com/watch?v=rdG8JV3Fhk4)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a2.html*

---

# SUS04-BP02 Use technologies that support data access and storage patterns

Use storage technologies that best support how your
data is accessed and stored to minimize the resources
provisioned while supporting your workload.

**Common anti-patterns:**

- You assume that all workloads have similar data storage and access patterns.
- You only use one tier of storage, assuming all workloads fit within that tier.
- You assume that data access patterns will stay consistent over time.

**Benefits of establishing this best practice:** Selecting
and optimizing your storage technologies based on data access and storage patterns will
help you reduce the required cloud resources to meet your business needs and improve
the overall efficiency of cloud workload.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Select the storage solution that aligns best to your access
patterns, or consider changing your access patterns to align
with the storage solution to maximize performance efficiency.

### Implementation steps

- **Evaluate data and access characteristics:**
Evaluate your data characteristics and access pattern to
collect the key characteristics of your storage needs.
Key characteristics to consider include:

**Data type:** structured, semi-structured,
unstructured
- **Data growth:** bounded, unbounded
- **Data durability:** persistent, ephemeral,
transient
- **Access patterns:** reads or writes,
frequency, spiky, or consistent

- **Choose the right storage technology:**
Migrate data to the appropriate storage technology that supports
your data characteristics and access pattern. Here are some
examples of AWS storage technologies and their
key characteristics:

Type
Technology
Key characteristics

Object storage

[Amazon S3](https://aws.amazon.com/s3/)

An object storage service with unlimited scalability,
high availability, and multiple options for accessibility.
Transferring and accessing objects in and out of Amazon S3
can use a service, such as
[Transfer Acceleration](https://aws.amazon.com/s3/transfer-acceleration/)
or [Access
Points](https://aws.amazon.com/s3/features/access-points/), to support your location, security needs, and access
patterns.

Archiving storage

[Amazon Glacier](https://aws.amazon.com/s3/storage-classes/glacier/)

Storage class of Amazon S3 built for data-archiving.

Shared file system

[Amazon Elastic File System (Amazon EFS)](https://aws.amazon.com/efs/)

Mountable file system that can be accessed by multiple
types of compute solutions. Amazon EFS automatically
grows and shrinks storage and is performance-optimized
to deliver consistent low latencies.

Shared file system

[Amazon FSx](https://aws.amazon.com/fsx/)

Built on the latest AWS compute solutions to support
four commonly used file systems: NetApp ONTAP, OpenZFS,
Windows File Server, and Lustre. Amazon FSx
[latency,
throughput, and IOPS](https://aws.amazon.com/fsx/when-to-choose-fsx/) vary per file system and should be
considered when selecting the right file system for your
workload needs.

Block storage

[Amazon Elastic Block Store (Amazon EBS)](https://aws.amazon.com/ebs/)

Scalable, high-performance block-storage service
designed for Amazon Elastic Compute Cloud (Amazon EC2).
Amazon EBS includes SSD-backed storage for transactional,
IOPS-intensive workloads and HDD-backed storage for
throughput-intensive workloads.

Relational database

[Amazon Aurora](https://aws.amazon.com/rds/aurora/), [Amazon RDS](https://aws.amazon.com/rds/), [Amazon Redshift](https://aws.amazon.com/redshift/)

Designed to support ACID (atomicity, consistency, isolation, durability) transactions and maintain referential integrity and strong data consistency. Many traditional applications, enterprise resource planning (ERP), customer relationship management (CRM), and ecommerce systems use relational databases to store their data.

Key-value database

[Amazon DynamoDB](https://aws.amazon.com/dynamodb/)

Optimized for common access patterns, typically to store and retrieve large volumes of data. High-traffic web apps, ecommerce systems, and gaming applications are typical use-cases for key-value databases.
- **Automate storage allocation:**
For storage systems that are a fixed size, such as
Amazon EBS or Amazon FSx, monitor the available
storage space and automate storage allocation on
reaching a threshold. You can leverage Amazon CloudWatch
to collect and analyze different metrics for
[Amazon EBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cloudwatch_ebs.html) and
[Amazon FSx](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/monitoring-cloudwatch.html).
- **Choose the right storage class:**
Choose the appropriate storage class for your data.

Amazon S3 storage classes can be configured at the object
level. A single bucket can contain objects stored
across all of the storage classes.
- You can use
[Amazon S3 Lifecycle policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) to automatically transition objects
between storage classes or remove data without any application changes.
In general, you have to make a trade-off between resource
efficiency, access latency, and reliability when considering
these storage mechanisms.

## Resources

**Related documents:**

- [Amazon EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)
- [Amazon EC2 instance store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)
- [Amazon S3 Intelligent-Tiering](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering.html)
- [Amazon EBS I/O Characteristics](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-io-characteristics.html)
- [Using Amazon S3 storage classes](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html)
- [What
is Amazon Glacier?](https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html)

**Related videos:**

- [AWS re:Invent 2023 - Improve Amazon EBS efficiency and be more cost-efficient](https://www.youtube.com/watch?v=7-CB02rqiuw)
- [AWS re:Invent 2023 - Optimizing storage price and performance with Amazon S3](https://www.youtube.com/watch?v=RxgYNrXPOLw)
- [AWS re:Invent 2023 - Building and optimizing a data lake on Amazon S3](https://www.youtube.com/watch?v=mpQa_Zm1xW8)
- [AWS re:Invent 2022 - Building modern data architectures on AWS](https://www.youtube.com/watch?v=Uk2CqEt5f0o)
- [AWS re:Invent 2022 - Modernize apps with purpose-built databases](https://www.youtube.com/watch?v=V-DiplATdi0)
- [AWS re:Invent 2022 - Building data mesh architectures on AWS](https://www.youtube.com/watch?v=nGRvlobeM_U)
- [AWS re:Invent 2023 - Deep dive into Amazon Aurora and its innovations](https://www.youtube.com/watch?v=je6GCOZ22lI)
- [AWS re:Invent 2023 - Advanced data modeling with Amazon DynamoDB](https://www.youtube.com/watch?v=PVUofrFiS_A)

**Related examples:**

- [Amazon S3 Examples](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/s3-examples.html)
- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)
- [Databases for Developers](https://catalog.workshops.aws/db4devs/en-US)
- [AWS Modern Data Architecture Immersion Day](https://catalog.us-east-1.prod.workshops.aws/workshops/32f3e732-d67d-4c63-b967-c8c5eabd9ebf/en-US)
- [Build a Data Mesh on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/23e6326b-58ee-4ab0-9bc7-3c8d730eb851/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a3.html*

---

# SUS04-BP03 Use policies to manage the lifecycle of your datasets

Manage the lifecycle of all of your data and automatically enforce
deletion to minimize the total storage required for your workload.

**Common anti-patterns:**

- You manually delete data.
- You do not delete any of your workload data.
- You do not move data to more energy-efficient storage tiers based on its retention and access requirements.

**Benefits of establishing this best practice:** Using data lifecycle policies ensures efficient data access and retention in a workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Datasets usually have different retention and access requirements during their lifecycle.
For example, your application may need frequent access to some datasets for a limited
period of time. After that, those datasets are infrequently accessed. To improve the efficiency of data storage and computation over time, implement lifecycle policies, which are rules that define how data is handled over time.

With lifecycle configuration rules, you can tell the specific storage service to transition a dataset to more energy-efficient storage tiers, archive it, or delete it. This practice minimizes active data storage and retrieval, which leads to lower energy consumption. In addition, practices such as archiving or deleting obsolete data support regulatory compliance and data governance.

### Implementation steps

- **Use data classification:** [Classify datasets in your workload.](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a2.html)
- **Define handling rules:** Define handling procedures for each data class.
- **Enable automation:** Set automated lifecycle policies to enforce lifecycle rules.
Here are some examples of how to set up automated lifecycle policies
for different AWS storage services:

Storage service
How to set automated lifecycle policies

[Amazon S3](https://aws.amazon.com/s3/index.html)

You can use [Amazon S3 Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) to manage your objects throughout their lifecycle.
If your access patterns are unknown, changing, or unpredictable, you can use [Amazon S3
Intelligent-Tiering](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering.html), which monitors access patterns and automatically moves objects that
have not been accessed to lower-cost access tiers. You can leverage [Amazon S3 Storage Lens](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html)
metrics to identify optimization opportunities and gaps in lifecycle management.

[Amazon Elastic Block Store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)

You can use [Amazon Data Lifecycle Manager](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html) to automate the creation,
retention, and deletion of Amazon EBS snapshots and Amazon EBS-backed AMIs.

[Amazon Elastic File System](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

[Amazon EFS lifecycle management](https://docs.aws.amazon.com/efs/latest/ug/lifecycle-management-efs.html) automatically manages file storage for your file systems.

[Amazon Elastic Container Registry](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)

[Amazon ECR lifecycle policies](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html) automate the cleanup of your
container images by expiring images based on age or count.

[AWS Elemental MediaStore](https://docs.aws.amazon.com/mediastore/latest/ug/what-is.html)

You can use an [object lifecycle policy](https://docs.aws.amazon.com/mediastore/latest/ug/policies-object-lifecycle.html) that governs how long objects should be stored in the MediaStore container.
- **Delete unused assets:** Delete unused volumes, snapshots, and data that is out of its retention period.
Use native service features like [Amazon DynamoDB Time To Live](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html) or [Amazon CloudWatch
log retention](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#SettingLogRetention) for deletion.
- **Aggregate and compress:** Aggregate and compress data where applicable based on lifecycle rules.

## Resources

**Related documents:**

- [Optimize your Amazon S3 Lifecycle rules with Amazon S3 Storage Class Analysis](https://docs.aws.amazon.com/AmazonS3/latest/userguide/analytics-storage-class.html)
- [Evaluating
Resources with AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html)

**Related videos:**

- [AWS re:Invent 2021 - Amazon S3 Lifecycle best practices to optimize your storage spend](https://www.youtube.com/watch?v=yGNXn7jOytA)
- [AWS re:Invent 2023 - Optimizing storage price and performance with Amazon S3](https://www.youtube.com/watch?v=RxgYNrXPOLw)
- [Simplify Your Data Lifecycle and Optimize Storage Costs With Amazon S3 Lifecycle](https://www.youtube.com/watch?v=53eHNSpaMJI)
- [Reduce Your Storage Costs Using Amazon S3 Storage Lens](https://www.youtube.com/watch?v=A8qOBLM6ITY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a4.html*

---

# SUS04-BP04 Use elasticity and automation to expand block storage or file system

Use elasticity and automation to expand block storage or file system as data grows to minimize the total provisioned storage.

**Common anti-patterns:**

- You procure large block storage or file system for future need.
- You overprovision the input and output operations per second (IOPS) of your file system.
- You do not monitor the utilization of your data volumes.

**Benefits of establishing this best practice:** Minimizing over-provisioning for storage system reduces the idle resources and improves the overall efficiency of your workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Create block storage and file systems with size allocation, throughput, and latency that are appropriate for your workload. Use elasticity and automation to expand block storage or file system as data grows without having to over-provision these storage services.

### Implementation steps

- For fixed size storage like [Amazon EBS](https://aws.amazon.com/ebs/), verify that you are monitoring the amount of storage used versus the overall storage size and create automation, if possible, to increase the storage size when reaching a threshold.
- Use elastic volumes and managed block data services to automate allocation of additional storage as your persistent data grows. As an example, you can use [Amazon EBS Elastic Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modify-volume.html) to change volume size, volume type, or adjust the performance of your Amazon EBS volumes.
- Choose the right storage class, performance mode, and throughput mode for your file system to address your business need, not exceeding that.

[Amazon EFS performance](https://docs.aws.amazon.com/efs/latest/ug/performance.html)
- [Amazon EBS volume performance on Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSPerformance.html)

- Set target levels of utilization for your data volumes, and resize volumes outside of expected ranges.
- Right size read-only volumes to fit the data.
- Migrate data to object stores to avoid provisioning the excess capacity from fixed volume sizes on block storage.
- Regularly review elastic volumes and file systems to terminate idle volumes and shrink over-provisioned resources to fit the current data size.

## Resources

**Related documents:**

- [Extend the file system after resizing an EBS volume](https://docs.aws.amazon.com/ebs/latest/userguide/recognize-expanded-volume-linux.html)
- [Modify a volume using Amazon EBS Elastic Volumes](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-modify-volume.html)
- [Amazon FSx Documentation](https://docs.aws.amazon.com/fsx/index.html)
- [What
is Amazon Elastic File System?](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

**Related videos:**

- [Deep Dive on Amazon EBS Elastic Volumes](https://www.youtube.com/watch?v=Vi_1Or7QuOg)
- [Amazon EBS and Snapshot Optimization Strategies for Better Performance and Cost Savings](https://www.youtube.com/watch?v=h1hzRCsJefs)
- [Optimizing Amazon EFS for cost and performance, using best practices](https://www.youtube.com/watch?v=9kfeh6_uZY8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a5.html*

---

# SUS04-BP05 Remove unneeded or redundant data

Remove unneeded or redundant data to minimize the storage resources required to store your
datasets.

**Common anti-patterns:**

- You duplicate data that can be easily obtained or recreated.
- You back up all data without considering its criticality.
- You only delete data irregularly, on operational events, or not at all.
- You store data redundantly irrespective of the storage service's durability.
- You turn on Amazon S3 versioning without any business justification.

**Benefits of establishing this best practice:** Removing unneeded
data reduces the storage size required for your workload and the workload environmental impact.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

When you remove unneeded and redundant datasets, you can reduce storage cost and environmental footprint. This practice may also make computing more efficient, as compute resources only process important data instead of unneeded data. Automate the deletion of unneeded data. Use technologies that deduplicate data at the file and block level. Use service features for native data replication and redundancy.

### Implementation steps

- **Evaluate public datasets:** Evaluate if you can avoid storing data by using existing publicly available datasets
in [AWS Data Exchange](https://aws.amazon.com/data-exchange/) and [Open Data on AWS](https://registry.opendata.aws/).
- **De-deplicate data:** Use mechanisms that can deduplicate data at the block and object level. Here are some
examples of how to deduplicate data on AWS:

Storage service
Deduplication mechanism

[Amazon S3](https://aws.amazon.com/s3/)

Use [AWS Lake Formation FindMatches](https://aws.amazon.com/blogs/big-data/integrate-and-deduplicate-datasets-using-aws-lake-formation-findmatches/) to find matching records across a dataset
(including ones without identifiers) by using the new FindMatches ML
Transform.

[Amazon FSx](https://aws.amazon.com/fsx/)

Use [data deduplication](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-data-dedup.html)
on Amazon FSx for Windows.

[Amazon Elastic Block Store snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)

Snapshots are incremental backups, which means that only the blocks on the
device that have changed after your most recent snapshot are saved.
- **Use lifecycle policies:** Use lifecycle policies to automate unneeded data deletion. Use native service features like [Amazon DynamoDB Time To Live](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html),
[Amazon S3 Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html), or [Amazon CloudWatch log
retention](https://docs.aws.amazon.com/managedservices/latest/userguide/log-customize-retention.html) for deletion.
- **Use data virtualization:** Use data virtualization capabilities on AWS to maintain data at its source and
avoid data duplication.

[Cloud Native Data
Virtualization on AWS](https://www.youtube.com/watch?v=BM6sMreBzoA)
- [Optimize Data Pattern Using Amazon Redshift Data Sharing](https://catalog.workshops.aws/well-architected-sustainability/en-US/3-data/optimize-data-pattern-using-redshift-data-sharing)

- **Use incremental backup:** Use backup technology that can make incremental backups.
- **Use native durability:** Leverage the durability of [Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DataDurability.html) and [replication of
Amazon EBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html) to meet your durability goals instead of self-managed technologies (such
as a redundant array of independent disks (RAID)).
- **Use efficient logging:** Centralize log and trace data, deduplicate identical log entries, and establish
mechanisms to tune verbosity when needed.
- **Use efficient caching:** Pre-populate caches only where justified.
- Establish cache monitoring and automation to resize the cache accordingly.
- **Remove old version assets:** Remove out-of-date deployments and assets from object stores and edge caches when
pushing new versions of your workload.

## Resources

**Related documents:**

- [Change log data retention in CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#SettingLogRetention)
- [Data
deduplication on Amazon FSx for Windows File Server](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-data-dedup.html)
- [Features of
Amazon FSx for ONTAP including data deduplication](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/what-is-fsx-ontap.html#features-overview)
- [Invalidating Files on Amazon CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html)
- [Using AWS Backup to back up
and restore Amazon EFS file systems](https://docs.aws.amazon.com/efs/latest/ug/awsbackup.html)
- [What is
Amazon CloudWatch Logs?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
- [Working with
backups on Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html)
- [Integrate and deduplicate datasets using AWS Lake Formation](https://aws.amazon.com/blogs/big-data/integrate-and-deduplicate-datasets-using-aws-lake-formation-findmatches/)

**Related videos:**

- [Amazon Redshift Data Sharing Use
Cases](https://www.youtube.com/watch?v=sIoTB8B5nn4)

**Related examples:**

- [How do
I analyze my Amazon S3 server access logs using Amazon Athena?](https://aws.amazon.com/premiumsupport/knowledge-center/analyze-logs-athena/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a6.html*

---

# SUS04-BP06 Use shared file systems or storage to access common data

Adopt shared file systems or storage to avoid data duplication and allow for more efficient
infrastructure for your workload.

**Common anti-patterns:**

- You provision storage for each individual client.
- You do not detach data volume from inactive clients.
- You do not provide access to storage across platforms and systems.

**Benefits of establishing this best practice:** Using shared file
systems or storage allows for sharing data to one or more consumers without having to copy the
data. This helps to reduce the storage resources required for the workload.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

If you have multiple users or applications accessing the same datasets, using shared
storage technology is crucial to use efficient infrastructure for your workload. Shared
storage technology provides a central location to store and manage datasets and avoid data
duplication. It also enforces consistency of the data across different systems. Moreover,
shared storage technology allows for more efficient use of compute power, as multiple compute
resources can access and process data at the same time in parallel.

Fetch data from these shared storage services only as needed and detach unused volumes to
free up resources.

### Implementation steps

- **Use shared storage:** Migrate data to shared storage when the data has multiple consumers. Here are some
examples of shared storage technology on AWS:

Storage option
When to use

[Amazon EBS
Multi-Attach](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html)

Amazon EBS Multi-Attach allows you to attach a single Provisioned IOPS SSD (io1
or io2) volume to multiple instances that are in the same Availability
Zone.

[Amazon EFS](https://aws.amazon.com/efs/)

See [When to Choose
Amazon EFS](https://aws.amazon.com/efs/when-to-choose-efs/).

[Amazon FSx](https://aws.amazon.com/fsx/)

See [Choosing an Amazon FSx
File System](https://aws.amazon.com/fsx/when-to-choose-fsx/).

[Amazon S3](https://aws.amazon.com/s3/)

Applications that do not require a file system structure and are designed to
work with object storage can use Amazon S3 as a massively scalable, durable, low-cost
object storage solution.
- **Fetch data as needed:** Copy data to or fetch data from shared file systems only as needed. As an example, you
can create an [Amazon FSx for Lustre file system backed by Amazon S3](https://aws.amazon.com/blogs/storage/new-enhancements-for-moving-data-between-amazon-fsx-for-lustre-and-amazon-s3/) and only load the subset of data
required for processing jobs to Amazon FSx.
- **Delete unneeded data:** Delete data as appropriate for your usage patterns as outlined in [SUS04-BP03 Use policies to manage the lifecycle of your datasets](./sus_sus_data_a4.html).
- **Detach inactive clients:** Detach volumes from clients that are not actively using them.

## Resources

**Related documents:**

- [Linking your file system
to an Amazon S3 bucket](https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html)
- [Using Amazon EFS for AWS Lambda in your serverless applications](https://aws.amazon.com/blogs/compute/using-amazon-efs-for-aws-lambda-in-your-serverless-applications/)
- [Amazon EFS Intelligent-Tiering Optimizes Costs for Workloads with Changing Access Patterns](https://aws.amazon.com/blogs/aws/new-amazon-efs-intelligent-tiering-optimizes-costs-for-workloads-with-changing-access-patterns/)
- [Using
Amazon FSx with your on-premises data repository](https://docs.aws.amazon.com/fsx/latest/LustreGuide/fsx-on-premises.html)

**related videos:**

- [Storage cost optimization
with Amazon EFS](https://www.youtube.com/watch?v=0nYAwPsYvBo)
- [AWS re:Invent 2023 - What's
new with AWS file storage](https://www.youtube.com/watch?v=yXIeIKlTFV0)
- [AWS re:Invent 2023 - File
storage for builders and data scientists on Amazon Elastic File System](https://www.youtube.com/watch?v=g0f6lrmEyRM)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a7.html*

---

# SUS04-BP07 Minimize data movement across networks

Use shared file systems or object storage to access common data and minimize the total
networking resources required to support data movement for your workload.

**Common anti-patterns:**

- You store all data in the same AWS Region independent of where the data users are.
- You do not optimize data size and format before moving it over the network.

**Benefits of establishing this best practice:** Optimizing data
movement across the network reduces the total networking resources required for the workload and
lowers its environmental impact.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Moving data around your organization requires compute, networking, and storage resources.
Use techniques to minimize data movement and improve the overall efficiency of your workload.

## Implementation steps

- **Use proximity:** Consider proximity to the data or users as a decision factor when [selecting a Region for your workload](https://aws.amazon.com/blogs/architecture/how-to-select-a-region-for-your-workload-based-on-sustainability-goals/).
- **Partition services:** Partition Regionally-consumed services so that their Region-specific data is stored
within the Region where it is consumed.
- **Use efficient file formats:** Use efficient file formats (such as Parquet or ORC) and compress data before you move
it over the network.
- **Minimize data movement:** Don't move unused data. Some examples that can help you avoid moving unused data:

Reduce API responses to only relevant data.
- Aggregate data where detailed (record-level information is not required).
- See [Well-Architected Lab - Optimize Data Pattern Using Amazon Redshift Data Sharing](https://catalog.workshops.aws/well-architected-sustainability/en-US/3-data/optimize-data-pattern-using-redshift-data-sharing).
- Consider [Cross-account data
sharing in AWS Lake Formation](https://docs.aws.amazon.com/lake-formation/latest/dg/cross-account-permissions.html).

- **Use edge services:** Use services that can help you run code closer to users of your workload.

Service
When to use

[Lambda@Edge](https://aws.amazon.com/lambda/edge/)

Use for compute-heavy operations that are run when objects are not in the
cache.

[CloudFront
Functions](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-functions.html)

Use for simple use cases such as HTTP(s) request/response manipulations that
can be initiated by short-lived functions.

[AWS IoT Greengrass](https://aws.amazon.com/greengrass/)

Run local compute, messaging, and data caching for connected devices.

## Resources

**Related documents:**

- [Optimizing your AWS Infrastructure for Sustainability, Part III: Networking](https://aws.amazon.com/blogs/architecture/optimizing-your-aws-infrastructure-for-sustainability-part-iii-networking/)
- [AWS Global
Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
- [Amazon CloudFront Key Features including the
CloudFront Global Edge Network](https://aws.amazon.com/cloudfront/features/)
- [Compressing HTTP requests in Amazon OpenSearch Service](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/gzip.html)
- [Intermediate data compression with Amazon EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-output-compression.html#HadoopIntermediateDataCompression)
- [Loading
compressed data files from Amazon S3 into Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/t_loading-gzip-compressed-data-files-from-S3.html)
- [Serving compressed
files with Amazon CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html)

**Related videos:**

- [Demystifying data transfer
on AWS](https://www.youtube.com/watch?v=-MqXgzw1IGA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a8.html*

---

# SUS04-BP08 Back up data only when difficult to recreate

Avoid backing up data that has no business value to minimize storage resources requirements
for your workload.

**Common anti-patterns:**

- You do not have a backup strategy for your data.
- You back up data that can be easily recreated.

**Benefits of establishing this best practice:** Avoiding back-up
of non-critical data reduces the required storage resources for the workload and lowers its
environmental impact.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Avoiding the back up of unnecessary data can help lower cost and reduce the storage
resources used by the workload. Only back up data that has business value or is needed to
satisfy compliance requirements. Examine backup policies and exclude ephemeral storage that
doesn’t provide value in a recovery scenario.

### Implementation steps

- **Classify data:** Implement data classification policy as outlined in [SUS04-BP01 Implement a data classification policy](./sus_sus_data_a2.html).
- **Design a backup strategy:** Use the criticality of your data classification and design backup strategy based on
your [recovery time objective (RTO) and recovery point objective (RPO](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_objective_defined_recovery.html)). Avoid backing
up non-critical data.

Exclude data that can be easily recreated.
- Exclude ephemeral data from your backups.
- Exclude local copies of data, unless the time required to restore that data from
a common location exceeds your service-level agreements (SLAs).

- **Use automated backup:** Use an automated solution or managed service to back up business-critical data.

[AWS Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html) is a fully-managed service that makes it easy to centralize and
automate data protection across AWS services, in the cloud, and on premises. For
hands-on guidance on how to create automated backups using AWS Backup, see [Well-Architected Labs - Testing Backup and Restore of Data](https://catalog.workshops.aws/well-architected-reliability/en-US/4-failure-management/1-backup/30-testing-backup-and-restore-of-data).
- [Automate backups and optimize backup costs for Amazon EFS using AWS Backup](https://aws.amazon.com/blogs/storage/automating-backups-and-optimizing-backup-costs-for-amazon-efs-using-aws-backup/).

## Resources

**Related best practices:**

- [REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the
data from sources](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_identified_backups_data.html)
- [REL09-BP03 Perform data backup automatically](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_backing_up_data_automated_backups_data.html)
- [REL13-BP02 Use defined recovery strategies to meet the recovery
objectives](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_disaster_recovery.html)

**Related documents:**

- [Using AWS Backup to back up
and restore Amazon EFS file systems](https://docs.aws.amazon.com/efs/latest/ug/awsbackup.html)
- [Amazon EBS
snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)
- [Working with
backups on Amazon Relational Database Service](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html)
- [APN
Partner: partners that can help with backup](https://partners.amazonaws.com/search/partners?keyword=Backup)
- [AWS Marketplace: products that can be used for backup](https://aws.amazon.com/marketplace/search/results?searchTerms=Backup)
- [Backing Up
Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/efs-backup-solutions.html)
- [Backing
Up Amazon FSx for Windows File Server](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html)
- [Backup
and Restore for Amazon ElastiCache (Redis OSS)](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups.html)

**Related videos:**

- [AWS re:Invent 2023 -
Backup and disaster recovery strategies for increased resilience](https://www.youtube.com/watch?v=E073XISxrSU)
- [AWS re:Invent 2023 - What's
new with AWS Backup](https://www.youtube.com/watch?v=QIffkOyTf7I)
- [AWS re:Invent 2021 -
Backup, disaster recovery, and ransomware protection with AWS](https://www.youtube.com/watch?v=Ru4jxh9qazc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_data_a9.html*

---
