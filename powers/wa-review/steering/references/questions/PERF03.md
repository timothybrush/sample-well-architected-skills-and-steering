# PERF 3 — How do you store, manage, and access data?

**Pillar**: Performance Efficiency  
**Best Practices**: 5

---

# PERF03-BP01 Use a purpose-built data store that best supports your data access and storage requirements

Understand data characteristics (like shareable, size, cache size, access patterns,
latency, throughput, and persistence of data) to select the right purpose-built data stores
(storage or database) for your workload.

**Common anti-patterns:**

- You stick to one data store because there is internal experience and knowledge of one
particular type of database solution.
- You assume that all workloads have similar data storage and access requirements.
- You have not implemented a data catalog to inventory your data assets.

**Benefits of establishing this best practice:** Understanding data
characteristics and requirements allows you to determine the most efficient and performant
storage technology appropriate for your workload needs.

**Level of risk exposed if this best practice is not established:**
High

## Implementation guidance

When selecting and implementing data storage, make sure that the querying, scaling, and
storage characteristics support the workload data requirements. AWS provides numerous data
storage and database technologies including block storage, object storage, streaming storage,
file system, relational, key-value, document, in-memory, graph, time series, and ledger
databases. Each data management solution has options and configurations available to you to
support your use-cases and data models. By understanding data characteristics and
requirements, you can break away from monolithic storage technology and restrictive,
one-size-fits-all approaches to focus on managing data appropriately.

### Implementation steps

- Conduct an inventory of the various data types that exist in your workload.
- Understand and document data characteristics and requirements, including:

Data type (unstructured, semi-structured, relational)
- Data volume and growth
- Data durability: persistent, ephemeral, transient
- ACID (atomicity, consistency, isolation, durability) requirements
- Data access patterns (read-heavy or write-heavy)
- Latency
- Throughput
- IOPS (input/output operations per second)
- Data retention period

- Learn about different data stores ([storage](https://docs.aws.amazon.com/whitepapers/latest/aws-overview/storage-services.html) and [database](https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html) services) available for
your workload on AWS that can meet your data characteristics, as outlined in [PERF01-BP01 Learn about and understand available cloud services and features](./perf_architecture_understand_cloud_services_and_features.html). Some examples of
AWS storage technologies and their key characteristics include:

**Type**

**AWS Services**

**Key characteristics**

Object storage

[Amazon S3](https://aws.amazon.com/s3/)

Unlimited scalability, high availability, and multiple options for
accessibility. Transferring and accessing objects in and out of Amazon S3 can use a
service, such as [Transfer Acceleration](https://aws.amazon.com/s3/transfer-acceleration/) or [Access Points](https://aws.amazon.com/s3/features/access-points/), to support your
location, security needs, and access patterns.

Archiving storage

[Amazon Glacier](https://aws.amazon.com/s3/storage-classes/glacier/)

Built for data archiving.

Streaming storage

[Amazon Kinesis](https://aws.amazon.com/kinesis/)

[Amazon Managed Streaming for Apache Kafka (Amazon MSK)](https://aws.amazon.com/msk/)

Efficient ingestion and storage of streaming data.

Shared file system

[Amazon Elastic File System (Amazon EFS)](https://aws.amazon.com/efs/)

Mountable file system that can be accessed by multiple types of
compute solutions.

Shared file system

[Amazon FSx](https://aws.amazon.com/fsx/)

Built on the latest AWS compute solutions to support four commonly used
file systems: NetApp ONTAP, OpenZFS, Windows File Server, and Lustre.
Amazon FSx [latency,
throughput, and IOPS](https://aws.amazon.com/fsx/when-to-choose-fsx/) vary per file system and should be considered
when selecting the right file system for your workload needs.

Block storage

[Amazon Elastic Block Store (Amazon EBS)](https://aws.amazon.com/ebs/)

Scalable, high-performance block-storage service designed for Amazon Elastic Compute Cloud
(Amazon EC2). Amazon EBS includes SSD-backed storage for transactional, IOPS-intensive
workloads and HDD-backed storage for throughput-intensive workloads.

Relational database

[Amazon Aurora](https://aws.amazon.com/rds/aurora), [Amazon RDS](https://aws.amazon.com/rds), [Amazon Redshift](https://aws.amazon.com/redshift).
Designed to support ACID (atomicity, consistency, isolation, durability)
transactions, and maintain referential integrity and strong data consistency.
Many traditional applications, enterprise resource planning (ERP), customer
relationship management (CRM), and ecommerce use relational databases to store
their data.

Key-value database

[Amazon DynamoDB](https://aws.amazon.com/dynamodb/)

Optimized for common access patterns, typically to store and retrieve
large volumes of data. High-traffic web apps, ecommerce systems, and gaming
applications are typical use-cases for key-value databases.

Document database

[Amazon DocumentDB](https://aws.amazon.com/documentdb/)

Designed to store semi-structured data as JSON-like documents. These
databases help developers build and update applications such as content
management, catalogs, and user profiles quickly.

In-memory database

[Amazon ElastiCache](https://aws.amazon.com/elasticache/) , [Amazon MemoryDB for Redis](https://aws.amazon.com/memorydb/)

Used for applications that require real-time access to data, lowest
latency and highest throughput. You may use in-memory databases for application
caching, session management, gaming leaderboards, low latency ML feature store,
microservices messaging system, and a high-throughput streaming mechanism

Graph database

[Amazon Neptune](https://aws.amazon.com/neptune/)

Used for applications that must navigate and query millions of
relationships between highly connected graph datasets with millisecond latency
at large scale. Many companies use graph databases for fraud detection, social
networking, and recommendation engines.

Time Series database

[Amazon Timestream](https://aws.amazon.com/timestream/)

Used to efficiently collect, synthesize, and derive insights from data
that changes over time. IoT applications, DevOps, and industrial telemetry can
utilize time-series databases.

Wide column

[Amazon Keyspaces (for Apache
Cassandra)](https://aws.amazon.com/mcs/)

Uses tables, rows, and columns, but unlike a relational database, the
names and format of the columns can vary from row to row in the same table. You
typically see a wide column store in high scale industrial apps for equipment
maintenance, fleet management, and route optimization.

Ledger

[Amazon Quantum Ledger Database (Amazon
QLDB)](https://aws.amazon.com/qldb/)

Provides a centralized and trusted authority to maintain a scalable,
immutable, and cryptographically verifiable record of transactions for every
application. We see ledger databases used for systems of record, supply chain,
registrations, and even banking transactions.
- If you are building a data platform, leverage [modern data
architecture](https://aws.amazon.com/big-data/datalakes-and-analytics/modern-data-architecture/) on AWS to integrate your data lake, data warehouse, and
purpose-built data stores.
- The key questions that you need to consider when choosing a data store for your
workload are as follows:

Question
Things to consider

How is the data structured?

If the data is unstructured, consider an object-store such as [Amazon S3](https://aws.amazon.com/products/storage/data-lake-storage/)
or a NoSQL database such as [Amazon DocumentDB](https://aws.amazon.com/documentdb/)
- For key-value data, consider [DynamoDB](https://aws.amazon.com/documentdb/), [Amazon ElastiCache (Redis OSS)](https://aws.amazon.com/elasticache/redis/) or [Amazon MemoryDB](https://aws.amazon.com/memorydb/)

What level of referential integrity is required?

- For foreign key constraints, relational databases such as [Amazon RDS](https://aws.amazon.com/rds/) and [Aurora](https://aws.amazon.com/rds/aurora/) can provide this level of integrity.
- Typically, within a NoSQL data-model, you would de-normalize your
data into a single document or collection of documents to be retrieved in
a single request rather than joining across documents or tables.

Is ACID (atomicity, consistency, isolation, durability) compliance
required?

- If the ACID properties associated with relational databases are
required, consider a relational database such as [Amazon RDS](https://aws.amazon.com/rds/) and [Aurora](https://aws.amazon.com/rds/aurora/).
- If strong consistency is required for [NoSQL database](https://aws.amazon.com/nosql/), you can use strongly consistent
reads with [DynamoDB](https://aws.amazon.com/documentdb/).

How will the storage requirements change over time? How does this impact
scalability?

- Serverless databases such as [DynamoDB](https://aws.amazon.com/documentdb/) and [Amazon Quantum Ledger Database (Amazon QLDB)](https://aws.amazon.com/qldb/) will scale dynamically.
- Relational databases have upper bounds on provisioned storage, and
often must be horizontally partitioned using mechanisms such as sharding
once they reach these limits.

What is the proportion of read queries in relation to write queries? Would
caching be likely to improve performance?

- Read-heavy workloads can benefit from a caching layer, like [ElastiCache](https://aws.amazon.com/elasticache/) or [DAX](https://aws.amazon.com/dynamodb/dax/) if the database is
DynamoDB.
- Reads can also be offloaded to read replicas with relational
databases such as [Amazon RDS](https://aws.amazon.com/rds/).

Does storage and modification (OLTP - Online Transaction Processing) or
retrieval and reporting (OLAP - Online Analytical Processing) have a higher
priority?

- For high-throughput read as-is transactional processing, consider a
NoSQL database such as DynamoDB.
- For high-throughput and complex read patterns (like join) with
consistency use Amazon RDS.
- For analytical queries, consider a columnar database such as [Amazon Redshift](https://aws.amazon.com/redshift/) or exporting the data
to Amazon S3 and performing analytics using [Athena](https://aws.amazon.com/athena/) or [Amazon Quick](https://aws.amazon.com/quicksight/).

What level of durability does the data require?

- Aurora automatically replicates your data across three Availability
Zones within a Region, meaning your data is highly durable with less
chance of data loss.
- DynamoDB is automatically replicated across multiple Availability Zones,
providing high availability and data durability.
- Amazon S3 provides 11 nines of durability. Many database services, such as
Amazon RDS and DynamoDB, support exporting data to Amazon S3 for long-term retention
and archival.

Is there a desire to move away from commercial database engines or
licensing costs?

- Consider open-source engines such as PostgreSQL and MySQL on Amazon RDS or
Aurora.
- Leverage [AWS Database Migration Service](https://aws.amazon.com/dms/) and
[AWS Schema Conversion Tool](https://aws.amazon.com/dms/schema-conversion-tool/) to perform migrations from commercial database
engines to open-source

What is the operational expectation for the database? Is moving to managed
services a primary concern?

- Leveraging Amazon RDS instead of Amazon EC2, and DynamoDB or Amazon DocumentDB instead of
self-hosting a NoSQL database can reduce operational overhead.

How is the database currently accessed? Is it only application access, or
are there business intelligence (BI) users and other connected off-the-shelf
applications?

- If you have dependencies on external tooling then you may have to
maintain compatibility with the databases they support. Amazon RDS is fully
compatible with the difference engine versions that it supports including
Microsoft SQL Server, Oracle, MySQL, and PostgreSQL.

- Perform experiments and benchmarking in a non-production environment to identify
which data store can address your workload requirements.

## Resources

**Related documents:**

- [Amazon EBS Volume
Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html)
- [Amazon EC2
Storage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Storage.html)
- [Amazon EFS: Amazon EFS
Performance](https://docs.aws.amazon.com/efs/latest/ug/performance.html)
- [Amazon FSx for Lustre
Performance](https://docs.aws.amazon.com/fsx/latest/LustreGuide/performance.html)
- [Amazon FSx for Windows File Server Performance](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/performance.html)
- [Amazon Glacier:
Amazon Glacier Documentation](https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html)
- [Amazon S3: Request Rate and
Performance Considerations](https://docs.aws.amazon.com/AmazonS3/latest/dev/request-rate-perf-considerations.html)
- [Cloud Storage with AWS](https://aws.amazon.com/products/storage/)
- [Amazon EBS I/O Characteristics](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-io-characteristics.html)
- [Cloud Databases with
AWS](https://aws.amazon.com/products/databases/?ref=wellarchitected)
- [AWS Database
Caching](https://aws.amazon.com/caching/database-caching/?ref=wellarchitected)
- [DynamoDB Accelerator](https://aws.amazon.com/dynamodb/dax/?ref=wellarchitected)
- [Amazon Aurora
best practices](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Aurora.BestPractices.html?ref=wellarchitected)
- [Amazon Redshift performance](https://docs.aws.amazon.com/redshift/latest/dg/c_challenges_achieving_high_performance_queries.html?ref=wellarchitected)
- [Amazon Athena top 10 performance tips](https://aws.amazon.com/blogs/big-data/top-10-performance-tuning-tips-for-amazon-athena/?ref=wellarchitected)
- [Amazon Redshift Spectrum best practices](https://aws.amazon.com/blogs/big-data/10-best-practices-for-amazon-redshift-spectrum/?ref=wellarchitected)
- [Amazon DynamoDB best practices](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/BestPractices.html?ref=wellarchitected)
- [Choose between
Amazon EC2 and Amazon RDS](https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-sql-server/comparison.html)
- [Best Practices for Implementing Amazon ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/BestPractices.html)

**Related videos:**

- [AWS re:Invent 2023: Improve
Amazon Elastic Block Store efficiency and be more cost-efficient](https://www.youtube.com/watch?v=7-CB02rqiuw)
- [AWS re:Invent 2023: Optimizing
storage price and performance with Amazon Simple Storage Service](https://www.youtube.com/watch?v=RxgYNrXPOLw)
- [AWS re:Invent 2023: Building
and optimizing a data lake on Amazon Simple Storage Service](https://www.youtube.com/watch?v=mpQa_Zm1xW8)
- [AWS re:Invent 2022: Building
modern data architectures on AWS](https://www.youtube.com/watch?v=Uk2CqEt5f0o)
- [AWS re:Invent 2022: Building
data mesh architectures on AWS](https://www.youtube.com/watch?v=nGRvlobeM_U)
- [AWS re:Invent 2023: Deep dive
into Amazon Aurora and its innovations](https://www.youtube.com/watch?v=je6GCOZ22lI)
- [AWS re:Invent 2023: Advanced
data modeling with Amazon DynamoDB](https://www.youtube.com/watch?v=PVUofrFiS_A)
- [AWS re:Invent 2022:
Modernize apps with purpose-built databases](https://www.youtube.com/watch?v=V-DiplATdi0)
- [Amazon DynamoDB deep dive:
Advanced design patterns](https://www.youtube.com/watch?v=6yqfmXiZTlM)

**Related examples:**

- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)
- [Databases for Developers](https://catalog.workshops.aws/db4devs/en-US)
- [AWS Modern Data Architecture Immersion Day](https://catalog.us-east-1.prod.workshops.aws/workshops/32f3e732-d67d-4c63-b967-c8c5eabd9ebf/en-US)
- [Build a Data Mesh on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/23e6326b-58ee-4ab0-9bc7-3c8d730eb851/en-US)
- [Amazon S3 Examples](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/s3-examples.html)
- [Optimize Data Pattern using Amazon Redshift Data Sharing](https://wellarchitectedlabs.com/sustainability/300_labs/300_optimize_data_pattern_using_redshift_data_sharing/)
- [Database
Migrations](https://github.com/aws-samples/aws-database-migration-samples)
- [MS SQL Server - AWS Database Migration Service
(AWS DMS) Replication Demo](https://github.com/aws-samples/aws-dms-sql-server)
- [Database
Modernization Hands On Workshop](https://github.com/aws-samples/amazon-rds-purpose-built-workshop)
- [Amazon Neptune
Samples](https://github.com/aws-samples/amazon-neptune-samples)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_data_use_purpose_built_data_store.html*

---

# PERF03-BP02 Evaluate available configuration options for data store

Understand and evaluate the various features and configuration options available for your
data stores to optimize storage space and performance for your workload.

**Common anti-patterns:**

- You only use one storage type, such as Amazon EBS, for all workloads.
- You use provisioned IOPS for all workloads without real-world testing against all
storage tiers.
- You are not aware of the configuration options of your chosen data management solution.
- You rely solely on increasing instance size without looking at other available
configuration options.
- You are not testing the scaling characteristics of your data store.

**Benefits of establishing this best practice:** By exploring and
experimenting with the data store configurations, you may be able to reduce the cost of
infrastructure, improve performance, and lower the effort required to maintain your workloads.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

A workload could have one or more data stores used based on data storage and access
requirements. To optimize your performance efficiency and cost, you must evaluate data access
patterns to determine the appropriate data store configurations. While you explore data store
options, take into consideration various aspects such as the storage options, memory, compute,
read replica, consistency requirements, connection pooling, and caching options. Experiment
with these various configuration options to improve performance efficiency metrics.

### Implementation steps

- Understand the current configurations (like instance type, storage size, or
database engine version) of your data store.
- Review AWS documentation and best practices to learn about recommended
configuration options that can help improve the performance of your data store. Key data
store options to consider are the following:

Configuration option
Examples

Offloading reads (like read replicas and caching)

For DynamoDB tables, you can offload reads using DAX for caching.
- You can create an Amazon ElastiCache (Redis OSS) cluster and configure your application
to read from the cache first, falling back to the database if the
requested item is not present.
- Relational databases such as Amazon RDS and Aurora, and provisioned NoSQL
databases such as Neptune and Amazon DocumentDB all support adding read replicas
to offload the read portions of the workload.
- Serverless databases such as DynamoDB will scale automatically. Ensure
that you have enough read capacity units (RCU) provisioned to handle the
workload.

Scaling writes (like partition key sharding or introducing a queue)

- For relational databases, you can increase the size of the instance
to accommodate an increased workload or increase the provisioned IOPs to
allow for an increased throughput to the underlying storage.
- You can also introduce a queue in front of your database rather than
writing directly to the database. This pattern allows you to decouple the
ingestion from the database and control the flow-rate so the database does
not get overwhelmed.
- Batching your write requests rather than creating many short-lived
transactions can help improve throughput in high-write volume relational
databases.
- Serverless databases like DynamoDB can scale the write throughput
automatically or by adjusting the provisioned write capacity units (WCU)
depending on the capacity mode.
- You can still run into issues with hot partitions when you reach the
throughput limits for a given partition key. This can be mitigated by
choosing a more evenly distributed partition key or by write-sharding the
partition key.

Policies to manage the lifecycle of your datasets

- You can use [Amazon S3
Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) to manage your objects throughout their lifecycle. If
your access patterns are unknown, changing, or unpredictable, you can
use [Amazon S3
Intelligent-Tiering](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering.html), which monitors access patterns and
automatically moves objects that have not been accessed to lower-cost
access tiers. You can leverage [Amazon S3 Storage
Lens](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html) metrics to identify optimization opportunities and gaps in
lifecycle management.
- [Amazon EFS lifecycle
management](https://docs.aws.amazon.com/efs/latest/ug/lifecycle-management-efs.html) automatically manages file storage for your file
systems.

Connection management and pooling

- Amazon RDS Proxy can be used with Amazon RDS and Aurora to manage connections to
the database.
- Serverless databases such as DynamoDB do not have connections associated
with them, but consider the provisioned capacity and automatic scaling
policies to deal with spikes in load.

- Perform experiments and benchmarking in non-production environment to identify
which configuration option can address your workload requirements.
- Once you have experimented, plan your migration and validate your performance
metrics.
- Use AWS monitoring (like [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)) and optimization (like [Amazon S3 Storage Lens](https://aws.amazon.com/s3/storage-lens/)) tools to continuously optimize your
data store using real-world usage pattern.

## Resources

**Related documents:**

- [Cloud Storage with
AWS](https://aws.amazon.com/products/storage/?ref=wellarchitected)
- [Amazon EBS Volume
Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html)
- [Amazon EC2
Storage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Storage.html)
- [Amazon EFS: Amazon EFS
Performance](https://docs.aws.amazon.com/efs/latest/ug/performance.html)
- [Amazon FSx for Lustre
Performance](https://docs.aws.amazon.com/fsx/latest/LustreGuide/performance.html)
- [Amazon FSx for Windows File Server Performance](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/performance.html)
- [Amazon Glacier:
Amazon Glacier Documentation](https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html)
- [Amazon S3: Request Rate and
Performance Considerations](https://docs.aws.amazon.com/AmazonS3/latest/dev/request-rate-perf-considerations.html)
- [Amazon EBS I/O Characteristics](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-io-characteristics.html)
- [Cloud Databases with
AWS](https://aws.amazon.com/products/databases/?ref=wellarchitected)
- [AWS Database
Caching](https://aws.amazon.com/caching/database-caching/?ref=wellarchitected)
- [DynamoDB Accelerator](https://aws.amazon.com/dynamodb/dax/?ref=wellarchitected)
- [Amazon Aurora
best practices](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Aurora.BestPractices.html?ref=wellarchitected)
- [Amazon Redshift performance](https://docs.aws.amazon.com/redshift/latest/dg/c_challenges_achieving_high_performance_queries.html?ref=wellarchitected)
- [Amazon Athena top 10 performance tips](https://aws.amazon.com/blogs/big-data/top-10-performance-tuning-tips-for-amazon-athena/?ref=wellarchitected)
- [Amazon Redshift Spectrum best practices](https://aws.amazon.com/blogs/big-data/10-best-practices-for-amazon-redshift-spectrum/?ref=wellarchitected)
- [Amazon DynamoDB best practices](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/BestPractices.html?ref=wellarchitected)

**Related videos:**

- [AWS
re:Invent 2023: Improve Amazon Elastic Block Store efficiency and be more cost-efficient](https://www.youtube.com/watch?v=7-CB02rqiuw)
- [AWS
re:Invent 2023: Optimize storage price and performance with Amazon Simple Storage Service](https://www.youtube.com/watch?v=RxgYNrXPOLw)
- [AWS
re:Invent 2023: Building and optimizing a data lake on Amazon Simple Storage Service](https://www.youtube.com/watch?v=mpQa_Zm1xW8)
- [AWS
re:Invent 2023: What's new with AWS file storage](https://www.youtube.com/watch?v=yXIeIKlTFV0)
- [AWS
re:Invent 2023: Dive deep into Amazon DynamoDB](https://www.youtube.com/watch?v=ld-xoehkJuU)

**Related examples:**

- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)
- [Databases for Developers](https://catalog.workshops.aws/db4devs/en-US)
- [AWS Modern Data Architecture Immersion Day](https://catalog.us-east-1.prod.workshops.aws/workshops/32f3e732-d67d-4c63-b967-c8c5eabd9ebf/en-US)
- [Amazon EBS Autoscale](https://github.com/awslabs/amazon-ebs-autoscale)
- [Amazon S3 Examples](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/s3-examples.html)
- [Amazon DynamoDB
Examples](https://github.com/aws-samples/aws-dynamodb-examples)
- [AWS Database
migration samples](https://github.com/aws-samples/aws-database-migration-samples)
- [Database
Modernization Workshop](https://github.com/aws-samples/amazon-rds-purpose-built-workshop)
- [Working with parameters on your Amazon RDS for Postgress DB](https://github.com/awsdocs/amazon-rds-user-guide/blob/main/doc_source/Appendix.PostgreSQL.CommonDBATasks.Parameters.md)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_data_evaluate_configuration_options_data_store.html*

---

# PERF03-BP03 Collect and record data store performance metrics

Track and record relevant performance metrics for your data store to
understand how your data management solutions are performing. These
metrics can help you optimize your data store, verify that your
workload requirements are met, and provide a clear overview on how
the workload performs.

**Common anti-patterns:**

- You only use manual log file searching for metrics.
- You only publish metrics to internal tools used by your team and
don’t have a comprehensive picture of your workload.
- You only use the default metrics recorded by your selected
monitoring software.
- You only review metrics when there is an issue.
- You only monitor system-level metrics and do not capture data
access or usage metrics.

**Benefits of establishing this best
practice:** Establishing a performance baseline helps you
understand the normal behavior and requirements of workloads.
Abnormal patterns can be identified and debugged faster, improving
the performance and reliability of the data store.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To monitor the performance of your data stores, you must record
multiple performance metrics over a period of time. This allows
you to detect anomalies, as well as measure performance against
business metrics to verify you are meeting your workload needs.

Metrics should include both the underlying system that is
supporting the data store and the database metrics. The underlying
system metrics might include CPU utilization, memory, available
disk storage, disk I/O, cache hit ratio, and network inbound and
outbound metrics, while the data store metrics might include
transactions per second, top queries, average queries rates,
response times, index usage, table locks, query timeouts, and
number of connections open. This data is crucial to understand how
the workload is performing and how the data management solution is
used. Use these metrics as part of a data-driven approach to tune
and optimize your workload's resources.

Use tools, libraries, and systems that record performance
measurements related to database performance.

## Implementation steps

- Identify the key performance metrics for your data store to
track.

[Amazon S3 Metrics and dimensions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metrics-dimensions.html)
- [Monitoring
metrics for in an Amazon RDS instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Monitoring.html)
- [Monitoring DB load with Performance Insights on Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
- [Overview of Enhanced
Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.overview.html)
- [DynamoDB
Metrics and dimensions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/metrics-dimensions.html)
- [Monitoring
DynamoDB Accelerator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.Monitoring.html)
- [Monitoring
Amazon MemoryDB with Amazon CloudWatch](https://docs.aws.amazon.com/memorydb/latest/devguide/monitoring-cloudwatch.html)
- [Which Metrics Should I Monitor?](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheMetrics.WhichShouldIMonitor.html)
- [Monitoring
Amazon Redshift cluster performance](https://docs.aws.amazon.com/redshift/latest/mgmt/metrics.html)
- [Timestream
metrics and dimensions](https://docs.aws.amazon.com/timestream/latest/developerguide/metrics-dimensions.html)
- [Amazon CloudWatch metrics for Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.AuroraMonitoring.Metrics.html)
- [Logging and monitoring in Amazon Keyspaces (for Apache Cassandra)](https://docs.aws.amazon.com/keyspaces/latest/devguide/monitoring.html)
- [Monitoring
Amazon Neptune Resources](https://docs.aws.amazon.com/neptune/latest/userguide/monitoring.html)

- Use an approved logging and monitoring solution to collect
these metrics.
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) can collect metrics across the resources in
your architecture. You can also collect and publish custom
metrics to surface business or derived metrics. Use CloudWatch
or third-party solutions to set alarms that indicate when
thresholds are breached.
- Check if data store monitoring can benefit from a machine
learning solution that detects performance anomalies.

[Amazon DevOps Guru for Amazon RDS](https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-rds.overview.how-it-works.html) provides visibility into
performance issues and makes recommendations for
corrective actions.

- Configure data retention in your monitoring and logging
solution to match your security and operational goals.

[Default
data retention for CloudWatch metrics](https://aws.amazon.com/cloudwatch/faqs/#AWS_resource_.26_custom_metrics_monitoring)
- [Default
data retention for CloudWatch Logs](https://aws.amazon.com/cloudwatch/faqs/#Log_management)

## Resources

**Related documents:**

- [AWS Database Caching](https://aws.amazon.com/caching/database-caching/)
- [Amazon Athena top 10 performance tips](https://aws.amazon.com/blogs/big-data/top-10-performance-tuning-tips-for-amazon-athena/)
- [Amazon Aurora best practices](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Aurora.BestPractices.html)
- [DynamoDB Accelerator](https://aws.amazon.com/dynamodb/dax/)
- [Amazon DynamoDB best practices](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/BestPractices.html)
- [Amazon Redshift Spectrum best practices](https://aws.amazon.com/blogs/big-data/10-best-practices-for-amazon-redshift-spectrum/)
- [Amazon Redshift performance](https://docs.aws.amazon.com/redshift/latest/dg/c_challenges_achieving_high_performance_queries.html)
- [Cloud
Databases with AWS](https://aws.amazon.com/products/databases/)
- [Amazon RDS Performance Insights](https://aws.amazon.com/rds/performance-insights/)

**Related videos:**

- [AWS re:Invent 2022 - Performance monitoring with Amazon RDS and Aurora, featuring Autodesk](https://www.youtube.com/watch?v=wokRbwK4YLo)
- [Database Performance Monitoring and Tuning with Amazon DevOps Guru for Amazon RDS](https://www.youtube.com/watch?v=cHKuVH7YGBE)
- [AWS re:Invent 2023 - What’s new with AWS file storage](https://www.youtube.com/watch?v=yXIeIKlTFV0)
- [AWS re:Invent 2023 - Dive deep into Amazon DynamoDB](https://www.youtube.com/watch?v=ld-xoehkJuU)
- [AWS re:Invent 2023 - Building and optimizing a data lake on Amazon S3](https://www.youtube.com/watch?v=mpQa_Zm1xW8)
- [AWS re:Invent 2023 - What’s new with AWS file storage](https://www.youtube.com/watch?v=yXIeIKlTFV0)
- [AWS re:Invent 2023 - Dive deep into Amazon DynamoDB](https://www.youtube.com/watch?v=ld-xoehkJuU)
- [Best
Practices for Monitoring Redis Workloads on Amazon ElastiCache](https://www.youtube.com/watch?v=c-hTMLN35BY&ab_channel=AWSOnlineTechTalks)

**Related examples:**

- [AWS Dataset Ingestion Metrics Collection Framework](https://github.com/awslabs/aws-dataset-ingestion-metrics-collection-framework)
- [Amazon RDS Monitoring Workshop](https://www.workshops.aws/?tag=Enhanced%20Monitoring)
- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_data_collect_record_data_store_performance_metrics.html*

---

# PERF03-BP04 Implement strategies to improve query performance in data store

Implement strategies to optimize data and improve data query to
enable more scalability and efficient performance for your workload.

**Common anti-patterns:**

- You do not partition data in your data store.
- You store data in only one file format in your data store.
- You do not use indexes in your data store.

**Benefits of establishing this best
practice:** Optimizing data and query performance
results in more efficiency, lower cost, and improved user
experience.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Data optimization and query tuning are critical aspects of performance efficiency in a data store, as they impact the performance and responsiveness of the entire cloud workload. Unoptimized queries can result in greater resource usage and bottlenecks, which reduce the overall efficiency of a data store.

Data optimization includes several techniques to ensure efficient data storage and access. This also help to improve the query performance in a data store. Key strategies include data partitioning, data compression, and data denormalization, which help data to be optimized for both storage and access.

### Implementation steps

- Understand and analyze the critical data queries which are
performed in your data store.
- Identify the slow-running queries in your data store and use query
plans to understand their current state.

[Analyzing
the query plan in Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/c-analyzing-the-query-plan.html)
- [Using
EXPLAIN and EXPLAIN ANALYZE in Athena](https://docs.aws.amazon.com/athena/latest/ug/athena-explain-statement.html)

- Implement strategies to improve the query performance. Some
of the key strategies include:

Using a [columnar file format](https://docs.aws.amazon.com/athena/latest/ug/columnar-storage.html) (like Parquet or ORC).
- Compressing data in the data store to reduce storage space and I/O operation.
- Data partitioning to split data into smaller parts and
reduce data scanning time.

[Partitioning data in Athena](https://docs.aws.amazon.com/athena/latest/ug/partitions.html)
- [Partitions and data distribution](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.Partitions.html)

- Data indexing on the common columns in the query.
- Use materialized views for frequent queries.

[Understanding materialized views](https://docs.aws.amazon.com/prescriptive-guidance/latest/materialized-views-redshift/understanding-materialized-views.html)
- [Creating materialized views in Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/materialized-view-overview.html)

- Choose the right join operation for the query. When you join two tables, specify the larger table on the left side of join and the smaller table on the right side of the join.
- Distributed caching solution to improve latency and reduce
the number of database I/O operation.
- Regular maintenance such as [vacuuming](https://docs.aws.amazon.com/prescriptive-guidance/latest/postgresql-maintenance-rds-aurora/autovacuum.html), reindexing, and [running statistics](https://docs.aws.amazon.com/redshift/latest/dg/t_Analyzing_tables.html).

- Experiment and test strategies in a non-production
environment.

## Resources

**Related documents:**

- [Amazon Aurora best practices](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Aurora.BestPractices.html?ref=wellarchitected)
- [Amazon Redshift performance](https://docs.aws.amazon.com/redshift/latest/dg/c_challenges_achieving_high_performance_queries.html?ref=wellarchitected)
- [Amazon Athena top 10 performance tips](https://aws.amazon.com/blogs/big-data/top-10-performance-tuning-tips-for-amazon-athena/?ref=wellarchitected)
- [AWS Database Caching](https://aws.amazon.com/caching/database-caching/?ref=wellarchitected)
- [Best
Practices for Implementing Amazon ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/BestPractices.html)
- [Partitioning
data in Athena](https://docs.aws.amazon.com/athena/latest/ug/partitions.html)

**Related videos:**

- [AWS re:Invent 2023 - AWS storage cost-optimization best practices](https://www.youtube.com/watch?v=8LVKNHcA6RY)
- [AWS re:Invent 2022 - Performance monitoring with Amazon RDS and Aurora, featuring Autodesk](https://www.youtube.com/watch?v=wokRbwK4YLo)
- [Optimize
Amazon Athena Queries with New Query Analysis Tools](https://www.youtube.com/watch?v=7JUyTqglmNU&ab_channel=AmazonWebServices)

**Related examples:**

- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_data_implement_strategies_to_improve_query_performance.html*

---

# PERF03-BP05 Implement data access patterns that utilize caching

Implement access patterns that can benefit from caching data for
fast retrieval of frequently accessed data.

**Common anti-patterns:**

- You cache data that changes frequently.
- You rely on cached data as if it is durably stored and always
available.
- You don't consider the consistency of your cached data.
- You don't monitor the efficiency of your caching implementation.

**Benefits of establishing this best
practice:** Storing data in a cache can improve read
latency, read throughput, user experience, and overall efficiency,
as well as reduce costs.

**Level of risk exposed if this best practice
is not established**: Medium

## Implementation guidance

A cache is a software or hardware component aimed at storing data
so that future requests for the same data can be served faster or
more efficiently. The data stored in a cache can be reconstructed
if lost by repeating an earlier calculation or fetching it from
another data store.

Data caching can be one of the most effective strategies to
improve your overall application performance and reduce burden on
your underlying primary data sources. Data can be cached at
multiple levels in the application, such as within the application
making remote calls, known as *client-side
caching*, or by using a fast secondary service for
storing the data, known as *remote caching*.

**Client-side caching**

With client-side caching, each client (an application or service
that queries the backend datastore) can store the results of their
unique queries locally for a specified amount of time. This can
reduce the number of requests across the network to a datastore by
checking the local client cache first. If the results are not
present, the application can then query the datastore and store
those results locally. This pattern allows each client to store
data in the closest location possible (the client itself),
resulting in the lowest possible latency. Clients can also
continue to serve some queries when the backend datastore is
unavailable, increasing the availability of the overall system.

One disadvantage of this approach is that when multiple clients are involved, they may store the same cached data locally. This results in both duplicate storage usage and data inconsistency between those clients. One client might cache the results of a query, and one minute later another client can run the same query and get a different result.

**Remote caching**

To solve the issue of duplicate data between clients, a fast
external service, or *remote cache*, can be
used to store the queried data. Instead of checking a local data
store, each client will check the remote cache before querying the
backend datastore. This strategy allows for more consistent
responses between clients, better efficiency in stored data, and a
higher volume of cached data because the storage space scales
independently of clients.

The disadvantage of a remote cache is that the overall system may
see a higher latency, as an additional network hop is required to
check the remote cache. Client-side caching can be used alongside
remote caching for multi-level caching to improve the latency.

### Implementation steps

- Identify databases, APIs and network services that could
benefit from caching. Services that have heavy read
workloads, have a high read-to-write ratio, or are expensive
to scale are candidates for caching.

[Database
Caching](https://aws.amazon.com/caching/database-caching/)
- [Enabling
API caching to enhance responsiveness](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html)

- Identify the appropriate type of caching strategy that best
fits your access pattern.

[Caching
strategies](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Strategies.html)
- [AWS Caching Solutions](https://aws.amazon.com/caching/aws-caching/)

- Follow
[Caching
Best Practices](https://aws.amazon.com/caching/best-practices/) for your data store.
- Configure a cache invalidation strategy, such as a
time-to-live (TTL), for all data that balances freshness of
data and reducing pressure on backend datastore.
- Enable features such as automatic connection retries,
exponential backoff, client-side timeouts, and connection
pooling in the client, if available, as they can improve
performance and reliability.

[Best
practices: Redis clients and Amazon ElastiCache (Redis OSS)](https://aws.amazon.com/blogs/database/best-practices-redis-clients-and-amazon-elasticache-for-redis/)

- Monitor cache hit rate with a goal of 80% or higher. Lower
values may indicate insufficient cache size or an access
pattern that does not benefit from caching.

[Which
metrics should I monitor?](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheMetrics.WhichShouldIMonitor.html)
- [Best
practices for monitoring Redis workloads on Amazon ElastiCache](https://www.youtube.com/watch?v=c-hTMLN35BY)
- [Monitoring
best practices with Amazon ElastiCache (Redis OSS) using
Amazon CloudWatch](https://aws.amazon.com/blogs/database/monitoring-best-practices-with-amazon-elasticache-for-redis-using-amazon-cloudwatch/)

- Implement
[data
replication](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Replication.Redis.Groups.html) to offload reads to multiple instances
and improve data read performance and availability.

## Resources

**Related documents:**

- [Using
the Amazon ElastiCache Well-Architected Lens](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WellArchitechtedLens.html)
- [Monitoring
best practices with Amazon ElastiCache (Redis OSS) using Amazon CloudWatch](https://aws.amazon.com/blogs/database/monitoring-best-practices-with-amazon-elasticache-for-redis-using-amazon-cloudwatch/)
- [Which
Metrics Should I Monitor?](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheMetrics.WhichShouldIMonitor.html)
- [Performance
at Scale with Amazon ElastiCache whitepaper](https://docs.aws.amazon.com/whitepapers/latest/scale-performance-elasticache/scale-performance-elasticache.html)
- [Caching
challenges and strategies](https://aws.amazon.com/builders-library/caching-challenges-and-strategies/)

**Related videos:**

- [Amazon ElastiCache Learning Path](https://pages.awscloud.com/GLB-WBNR-AWS-OTT-2021_LP_0003-DAT_AmazonElastiCache.html)
- [Design for
success with Amazon ElastiCache best practices](https://youtu.be/_4SkEy6r-C4)
- [AWS re:Invent 2020 - Design for success with Amazon ElastiCache best practices](https://www.youtube.com/watch?v=_4SkEy6r-C4)
- [AWS re:Invent 2023 - [LAUNCH] Introducing Amazon ElastiCache Serverless](https://www.youtube.com/watch?v=YYStP97pbXo)
- [AWS re:Invent 2022 - 5 great ways to reimagine your data layer with Redis](https://www.youtube.com/watch?v=CD1kvauvKII)
- [AWS re:Invent 2021 - Deep dive on Amazon ElastiCache (Redis OSS)](https://www.youtube.com/watch?v=QEKDpToureQ)

**Related examples:**

- [Boosting
MySQL database performance with Amazon ElastiCache (Redis OSS)](https://aws.amazon.com/getting-started/hands-on/boosting-mysql-database-performance-with-amazon-elasticache-for-redis/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_data_access_patterns_caching.html*

---
