# SUS 3 — How do you take advantage of software and architecture patterns to support your sustainability goals?

**Pillar**: Sustainability  
**Best Practices**: 5

---

# SUS03-BP01 Optimize software and architecture for asynchronous and scheduled jobs

Use efficient software and architecture patterns such as queue-driven to
maintain consistent high utilization of deployed resources.

**Common anti-patterns:**

- You overprovision the resources in your cloud workload to meet unforeseen spikes in demand.
- Your architecture does not decouple senders and receivers of asynchronous messages by a messaging component.

**Benefits of establishing this best practice:**

- Efficient software and architecture patterns minimize the unused resources in your workload and improve the overall efficiency.
- You can scale the processing independently of the receiving of asynchronous messages.
- Through a messaging component, you have relaxed availability requirements that you can meet with fewer resources.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Use efficient architecture patterns such as [event-driven architecture](https://aws.amazon.com/event-driven-architecture/) that result in
even utilization of components and minimize overprovisioning in your workload. Using
efficient architecture patterns minimizes idle resources from lack of use due to changes
in demand over time.

Understand the requirements of your workload components and adopt architecture patterns
that increase overall utilization of resources. Retire components that are no longer required.

### Implementation steps

- Analyze the demand for your workload to determine how to respond to those.
- For requests or jobs that don’t require synchronous responses, use queue-driven
architectures and auto scaling workers to maximize utilization. Here are some
examples of when you might consider queue-driven architecture:

Queuing mechanism
Description

[AWS Batch job queues](https://docs.aws.amazon.com/batch/latest/userguide/job_queues.html)

AWS Batch jobs are submitted to a job queue where
they reside until they can be scheduled to run in a
compute environment.

[Amazon Simple Queue Service and Amazon EC2 Spot Instances](https://aws.amazon.com/blogs/compute/running-cost-effective-queue-workers-with-amazon-sqs-and-amazon-ec2-spot-instances/)

Pairing Amazon SQS and Spot Instances to build fault tolerant and efficient architecture.
- For requests or jobs that can be processed anytime, use scheduling mechanisms
to process jobs in batch for more efficiency. Here are some examples of scheduling
mechanisms on AWS:

Scheduling mechanism
Description

[Amazon EventBridge Scheduler](https://aws.amazon.com/blogs/compute/introducing-amazon-eventbridge-scheduler/)

A capability from [Amazon EventBridge](https://aws.amazon.com/eventbridge/) that allows you to create, run, and manage scheduled tasks at scale.

[AWS Glue time-based schedule](https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html)

Define a time-based schedule for your crawlers and jobs in AWS Glue.

[Amazon Elastic Container Service (Amazon ECS) scheduled tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduled_tasks.html)

Amazon ECS supports creating scheduled tasks. Scheduled tasks use Amazon EventBridge rules to run tasks either on a schedule or in a response to an EventBridge event.

[Instance Scheduler](https://aws.amazon.com/solutions/implementations/instance-scheduler-on-aws/)

Configure start and stop schedules for your Amazon EC2 and Amazon Relational Database Service instances.
- If you use polling and webhooks mechanisms in your architecture, replace those with events.
Use [event-driven architectures](https://docs.aws.amazon.com/lambda/latest/operatorguide/event-driven-architectures.html) to build highly efficient workloads.
- Leverage [serverless on AWS](https://aws.amazon.com/serverless/) to eliminate over-provisioned infrastructure.
- Right size individual components of your architecture to prevent idling resources waiting for input.

You can use the [Rightsizing Recommendations in AWS Cost Explorer](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-rightsizing.html) or [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) to identify rightsizing opportunities.
- For more detail, see [Right Sizing: Provisioning Instances to Match Workloads](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/cost-optimization-right-sizing.html).

## Resources

**Related documents:**

- [What
is Amazon Simple Queue Service?](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [What
is Amazon MQ?](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/welcome.html)
- [Scaling
based on Amazon SQS](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)
- [What
is AWS Step Functions?](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [What
is AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Using
AWS Lambda with Amazon SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html)
- [What
is Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [Managing Asynchronous Workflows with a REST API](https://aws.amazon.com/blogs/architecture/managing-asynchronous-workflows-with-a-rest-api/)

**Related videos:**

- [AWS re:Invent 2023 - Navigating the journey to serverless event-driven architecture](https://www.youtube.com/watch?v=hvGuqHp051c)
- [AWS re:Invent 2023 - Using serverless for event-driven architecture & domain-driven design](https://www.youtube.com/watch?v=3foMZJSPMI4)
- [AWS re:Invent 2023 - Advanced event-driven patterns with Amazon EventBridge](https://www.youtube.com/watch?v=6X4lSPkn4ps)
- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [Asynchronous Message Patterns | AWS Events](https://www.youtube.com/watch?v=-yJqBuwouZ4)

**Related examples:**

- [Event-driven architecture with AWS Graviton Processors and Amazon EC2 Spot Instances](https://catalog.workshops.aws/well-architected-sustainability/en-US/2-software-and-architecture/event-driven-architecture-with-graviton-spot)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a2.html*

---

# SUS03-BP02 Remove or refactor workload components with low or no use

Remove components that are unused and no longer required, and refactor
components with little utilization to minimize waste in your workload.

**Common anti-patterns:**

- You do not regularly check the utilization level of individual components of your workload.
- You do not check and analyze recommendations from AWS rightsizing tools such as [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/).

**Benefits of establishing this best practice:** Removing unused components
minimizes waste and improves the overall efficiency of your cloud workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Unused or underutilized components in a cloud workload consume unnecessary compute, storage or network resources. Remove or refactor these components to directly reduce waste and improve the overall efficiency of a cloud workload. This is an iterative improvement process which can be initiated by changes in demand or the release of a new cloud service. For example, a significant drop in [AWS Lambda](https://docs.aws.amazon.com/lambda/) function run time can be indicate a need to lower the memory size. Also, as AWS releases new services and features, the optimal services and architecture for your workload may change.

Continually monitor workload activity and look for opportunities to improve the utilization level of individual components. By removing idle components and performing rightsizing activities, you meet your business requirements with the fewest cloud resources.

### Implementation steps

- **Inventory your AWS resourceds:** Create an inventory of your AWS resources. In AWS, you can turn on [AWS Resource Explorer](https://docs.aws.amazon.com/resource-explorer/latest/userguide/welcome.html) to explore and organize your AWS resources. For more details, see [AWS re:Invent 2022 - How to manage resources and applications at scale on AWS](https://www.youtube.com/watch?v=bbgUnKq6PAU).
- **Monitor utilization:** Monitor and capture the utilization metrics for critical components of your workload (like CPU utilization, memory utilization, or network throughput in [Amazon CloudWatch metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)).
- **Identify unused components:**Identify unused or under-utilized components in your architecture.

For stable workloads, check AWS rightsizing tools such as [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) at regular intervals to identify idle, unused, or underutilized components.
- For ephemeral workloads, evaluate utilization metrics to identify idle, unused, or underutilized components.

- **Remove unused components:** Retire components and associated assets (like Amazon ECR images) that are no longer needed.

[Automated Cleanup of Unused Images in Amazon ECR](https://aws.amazon.com/blogs/compute/automated-cleanup-of-unused-images-in-amazon-ecr/)
- [Delete unused Amazon Elastic Block Store (Amazon EBS) volumes by using AWS Config and AWS Systems Manager](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/delete-unused-amazon-elastic-block-store-amazon-ebs-volumes-by-using-aws-config-and-aws-systems-manager.html)

- **Refactor underutilized components:** Refactor or consolidate underutilized components with other resources to improve utilization efficiency. For example, you can provision multiple small databases on a single [Amazon RDS](https://aws.amazon.com/rds/) database instance instead of running databases on individual underutilized instances.
- **Evaluate improvements:** Understand the [resources provisioned by your workload to complete a unit of work](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/evaluate-specific-improvements.html). Use this information to evaluate improvements achieved by removing or refactoring components.

[Measure and track cloud efficiency with sustainability proxy metrics, Part I: What are proxy metrics?](https://aws.amazon.com/blogs/aws-cloud-financial-management/measure-and-track-cloud-efficiency-with-sustainability-proxy-metrics-part-i-what-are-proxy-metrics/)
- [Measure and track cloud efficiency with sustainability proxy metrics, Part II: Establish a metrics pipeline](https://aws.amazon.com/blogs/aws-cloud-financial-management/measure-and-track-cloud-efficiency-with-sustainability-proxy-metrics-part-ii-establish-a-metrics-pipeline/)

## Resources

**Related documents:**

- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [What
is Amazon CloudWatch?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [Right Sizing: Provisioning Instances to Match Workloads](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-right-sizing/cost-optimization-right-sizing.html)
- [Optimizing your cost with Rightsizing Recommendations](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-rightsizing.html)

**Related videos:**

- [AWS re:Invent 2023 - Capacity, availability, cost efficiency: Pick three](https://www.youtube.com/watch?v=E0dYLPXrX_w)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a3.html*

---

# SUS03-BP03 Optimize areas of code that consume the most time or resources

Optimize your code that runs within different components of your
architecture to minimize resource usage while maximizing performance.

**Common anti-patterns:**

- You ignore optimizing your code for resource usage.
- You usually respond to performance issues by increasing the resources.
- Your code review and development process does not track performance changes.

**Benefits of establishing this best practice:** Using
efficient code minimizes resource usage and improves performance.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

It is crucial to examine every functional area, including the code for a cloud architected application, to optimize its resource usage and performance. Continually monitor your workload’s performance in build environments and production and identify opportunities to improve code snippets that have particularly high resource usage. Adopt a regular review process to identify bugs or anti-patterns within your code that use resources inefficiently. Leverage simple and efficient algorithms that produce the same results for your use case.

## Implementation steps

- **Use efficient programming language:**
Use an efficient operating system and programming language for the workload. For details on energy efficient programming languages (including Rust), see [Sustainability with Rust](https://aws.amazon.com/blogs/opensource/sustainability-with-rust/).
- **Use an AI coding companion:** Consider using an AI coding companion such as [Amazon Q Developer](https://aws.amazon.com/q/developer/) to efficiently write code.
- **Automate code reviews:**
While developing your workloads, adopt an automated code review process to improve quality and identify bugs and anti-patterns.

[Automate code reviews with Amazon CodeGuru Reviewer](https://aws.amazon.com/blogs/devops/automate-code-reviews-with-amazon-codeguru-reviewer/)
- [Detecting concurrency bugs with Amazon CodeGuru](https://aws.amazon.com/blogs/devops/detecting-concurrency-bugs-with-amazon-codeguru/)
- [Raising code quality for Python applications using Amazon CodeGuru](https://aws.amazon.com/blogs/devops/raising-code-quality-for-python-applications-using-amazon-codeguru/)

- **Use a code profiler:**
Use a code profiler to identify the areas of code that use the most time or resources as targets for optimization.

[Reducing your organization's carbon footprint with Amazon CodeGuru Profiler](https://aws.amazon.com/blogs/devops/reducing-your-organizations-carbon-footprint-with-codeguru-profiler/)
- [Understanding memory usage in your Java application with Amazon CodeGuru Profiler](https://aws.amazon.com/blogs/devops/understanding-memory-usage-in-your-java-application-with-amazon-codeguru-profiler/)
- [Improving customer experience and reducing cost with Amazon CodeGuru Profiler](https://aws.amazon.com/blogs/devops/improving-customer-experience-and-reducing-cost-with-codeguru-profiler/)

- **Monitor and optimize:** Use continuous monitoring resources to identify components with high resource requirements or suboptimal configuration.

Replace computationally intensive algorithms with simpler and more efficient version that produce the same result.
- Remove unnecessary code such as sorting and formatting.

- **Use code refactoring or transformation:** Explore the possibility of [Amazon Q code transformation](https://aws.amazon.com/q/aws/code-transformation/) for application maintenance and upgrades.

[Upgrade language versions with Amazon Q Code Transformation](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/code-transformation.html)
- [AWS re:Invent 2023 - Automate app upgrades & maintenance using Amazon Q Code Transformation](https://www.youtube.com/watch?v=LY76tak6Z1E)

## Resources

**Related documents:**

- [What
is Amazon CodeGuru Profiler?](https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html)
- [FPGA
instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/fpga-getting-started.html)
- [The AWS SDKs
on Tools to Build on AWS](https://aws.amazon.com/tools/)

**Related videos:**

- [Improve Code Efficiency Using Amazon CodeGuru Profiler](https://www.youtube.com/watch?v=1pU4VddsBRw)
- [Automate Code Reviews and Application Performance Recommendations with Amazon CodeGuru](https://www.youtube.com/watch?v=OD8H63C0E0I)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a4.html*

---

# SUS03-BP04 Optimize impact on devices and equipment

Understand the devices and equipment used in your architecture and use strategies to reduce their usage. This can minimize the overall environmental impact of your cloud workload.

**Common anti-patterns:**

- You ignore the environmental impact of devices used by your customers.
- You manually manage and update resources used by customers.

**Benefits of establishing this best practice:** Implementing software patterns and features that are optimized for customer device can reduce the overall environmental impact of cloud workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Implementing software patterns and features that are optimized for customer devices can reduce the environmental impact in several ways:

- Implementing new features that are backward compatible can reduce the number of hardware replacements.
- Optimizing an application to run efficiently on devices can help to reduce their energy consumption and extend their battery life (if they are powered by battery).
- Optimizing an application for devices can also reduce the data transfer over the network.

Understand the devices and equipment used in your architecture, their expected lifecycle, and the impact of replacing those components. Implement software patterns and features that can help to minimize the device energy consumption, the need for customers to replace the device and also upgrade it manually.

### Implementation steps

- **Conduct an inventory:**
Inventory the devices used in your architecture. Devices can be mobile, tablet, IOT devices, smart light, or even smart devices in a factory.
- **Use energy-efficient devices:** Consider using energy-efficient devices in your architecture. Use power management configurations on devices to enter low power mode when not in use.
- **Run efficient applications:**
Optimize the application running on the devices:

Use strategies such as running tasks in the background to reduce their energy consumption.
- Account for network bandwidth and latency when building payloads, and implement capabilities that help your applications work well on low bandwidth, high latency links.
- Convert payloads and files into optimized formats required by devices. For example, you can use [Amazon Elastic Transcoder](https://docs.aws.amazon.com/elastic-transcoder/) or [AWS Elemental MediaConvert](https://aws.amazon.com/mediaconvert/) to convert large, high quality digital media files into formats that users can play back on mobile devices, tablets, web browsers, and connected televisions.
- Perform computationally intense activities server-side (such as image rendering), or use application streaming to improve the user experience on older devices.
- Segment and paginate output, especially for interactive sessions, to manage payloads and limit local storage requirements.

- **Engage suppliers:**
Work with device suppliers who use sustainable materials and provide transparency in their supply chains and environmental certifications.
- **Use over-the-air (OTA) updates:**
Use automated over-the-air (OTA) mechanism to deploy updates to one or more devices.

You can use a [CI/CD pipeline](https://aws.amazon.com/blogs/mobile/build-a-cicd-pipeline-for-your-android-app-with-aws-services/) to update mobile applications.
- You can use [AWS IoT Device Management](https://aws.amazon.com/iot-device-management/) to remotely manage connected devices at scale.

- **Use managed device farms:**
To test new features and updates, use managed device farms with representative sets of hardware and iterate development to maximize the devices supported. For more details, see [SUS06-BP05 Use managed device farms for testing](./sus_sus_dev_a5.html).
- **Continue to monitor and improve:**
Track the energy usage of devices to identify areas for improvement. Use new technologies or best practices to enhance environmental impacts of these devices.

## Resources

**Related documents:**

- [What
is AWS Device Farm?](https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html)
- [WorkSpaces Applications Documentation](https://docs.aws.amazon.com/appstream2/)
- [NICE
DCV](https://docs.aws.amazon.com/dcv/)
- [OTA tutorial for updating firmware on devices running FreeRTOS](https://docs.aws.amazon.com/freertos/latest/userguide/dev-guide-ota-workflow.html)
- [Optimizing Your IoT Devices for Environmental Sustainability](https://aws.amazon.com/blogs/architecture/optimizing-your-iot-devices-for-environmental-sustainability/)

**Related videos:**

- [AWS re:Invent 2023 - Improve your mobile and web app quality using AWS Device Farm](https://www.youtube.com/watch?v=__93Tm0YCRg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a5.html*

---

# SUS03-BP05 Use software patterns and architectures that best support data access and storage patterns

Understand how data is used within your workload, consumed by your users, transferred, and stored.
Use software patterns and architectures that best support data access and storage to minimize the compute,
networking, and storage resources required to support the workload.

**Common anti-patterns:**

- You assume that all workloads have similar data storage and access patterns.
- You only use one tier of storage, assuming all workloads fit within that tier.
- You assume that data access patterns will stay consistent over time.
- Your architecture supports a potential high data access burst, which results in the resources remaining idle most of the time.

**Benefits of establishing this best practice:** Selecting and optimizing your architecture based on data access and storage patterns will help decrease development complexity and increase overall utilization. Understanding when to use global tables, data partitioning, and caching will help you decrease operational overhead and scale based on your workload needs.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To improve long-term workload sustainability, use architecture patterns that support data access and storage characteristics for your workload. These patterns help you efficiently retrieve and process data. For example, you can use [modern data architecture on AWS](https://aws.amazon.com/big-data/datalakes-and-analytics/modern-data-architecture/) with purpose-built services optimized for your unique analytics use cases. These architecture patterns allow for efficient data processing and reduce the resource usage.

### Implementation steps

- **Understand data characteristics:** Analyze your data characteristics and access patterns to identify the correct configuration for your cloud resources. Key characteristics to consider include:

**Data type:** structured, semi-structured, unstructured
- **Data growth:** bounded, unbounded
- **Data durability:** persistent, ephemeral, transient
- **Access patterns** reads or writes, update frequency, spiky, or consistent

- **Use optimal architecture patterns:** Use architecture patterns that best support data access and storage patterns.

[Patterns for enabling data persistence](https://docs.aws.amazon.com/prescriptive-guidance/latest/modernization-data-persistence/enabling-patterns.html)
- [Let’s Architect! Modern data architectures](https://aws.amazon.com/blogs/architecture/lets-architect-modern-data-architectures/)
- [Databases on AWS: The Right Tool for the Right Job](https://www.youtube.com/watch?v=-pb-DkD6cWg)

- **Use purpose-built services:** Use technologies that are fit-for-purpose.

Use technologies that work natively with compressed data.

[Athena Compression Support file formats](https://docs.aws.amazon.com/athena/latest/ug/compression-formats.html)
- [Format Options for ETL Inputs and Outputs in AWS Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-format.html)
- [Loading compressed data files from Amazon S3 with Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/t_loading-gzip-compressed-data-files-from-S3.html)

- Use purpose-built [analytics services](https://aws.amazon.com/big-data/datalakes-and-analytics/?nc2=h_ql_prod_an_a) for data processing in your architecture. For detail on AWS purpose-built analytics services, see [AWS re:Invent 2022 - Building modern data architectures on AWS](https://www.youtube.com/watch?v=Uk2CqEt5f0o).
- Use the database engine that best supports your dominant query pattern. Manage your database indexes for efficient querying. For further details, see [AWS Databases](https://aws.amazon.com/products/databases/) and [AWS re:Invent 2022 - Modernize apps with purpose-built databases](https://www.youtube.com/watch?v=V-DiplATdi0).

- **Minimize data transfer:** Select network protocols that reduce the amount of network capacity consumed in your architecture.

## Resources

**Related documents:**

- [COPY
from columnar data formats with Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/copy-usage_notes-copy-from-columnar.html)
- [Converting
Your Input Record Format in Firehose](https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html)
- [Improve
query performance on Amazon Athena by Converting to Columnar
Formats](https://docs.aws.amazon.com/athena/latest/ug/convert-to-columnar.html)
- [Monitoring
DB load with Performance Insights on Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html)
- [Monitoring
DB load with Performance Insights on Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
- [Amazon S3 Intelligent-Tiering storage class](https://aws.amazon.com/s3/storage-classes/intelligent-tiering/)
- [Build a CQRS event store with Amazon DynamoDB](https://aws.amazon.com/blogs/database/build-a-cqrs-event-store-with-amazon-dynamodb/)

**Related videos:**

- [AWS re:Invent 2022 - Building data mesh architectures on AWS](https://www.youtube.com/watch?v=nGRvlobeM_U)
- [AWS re:Invent 2023 - Deep dive into Amazon Aurora and its innovations](https://www.youtube.com/watch?v=je6GCOZ22lI)
- [AWS re:Invent 2023 - Improve Amazon EBS efficiency and be more cost-efficient](https://www.youtube.com/watch?v=7-CB02rqiuw)
- [AWS re:Invent 2023 - Optimizing storage price and performance with Amazon S3](https://www.youtube.com/watch?v=RxgYNrXPOLw)
- [AWS re:Invent 2023 - Building and optimizing a data lake on Amazon S3](https://www.youtube.com/watch?v=mpQa_Zm1xW8)
- [AWS re:Invent 2023 - Advanced event-driven patterns with Amazon EventBridge](https://www.youtube.com/watch?v=6X4lSPkn4ps)

**Related examples:**

- [AWS Purpose Built Databases Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/93f64257-52be-4c12-a95b-c0a1ff3b7e2b/en-US)
- [AWS Modern Data Architecture Immersion Day](https://catalog.us-east-1.prod.workshops.aws/workshops/32f3e732-d67d-4c63-b967-c8c5eabd9ebf/en-US)
- [Build a Data Mesh on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/23e6326b-58ee-4ab0-9bc7-3c8d730eb851/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a6.html*

---
