# PERF 2 — How do you select and use compute resources?

**Pillar**: Performance Efficiency  
**Best Practices**: 6

---

# PERF02-BP01 Select the best compute options for your workload

Selecting the most appropriate compute option for your workload
allows you to improve performance, reduce unnecessary infrastructure
costs, and lower the operational efforts required to maintain your
workload.

**Common anti-patterns:**

- You use the same compute option that was used on
premises.
- You lack awareness of the cloud compute options, features, and
solutions, and how those solutions might improve your compute
performance.
- You over-provision an existing compute option to meet scaling or
performance requirements when an alternative compute option
would align to your workload characteristics more precisely.

**Benefits of establishing this best
practice:** By identifying the compute requirements and
evaluating against the options available, you can make your workload
more resource efficient.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To optimize your cloud workloads for performance efficiency, it is
important to select the most appropriate compute options for your
use case and performance requirements. AWS provides a variety of
compute options that cater to different workloads in the cloud.
For instance, you can use [Amazon EC2](https://docs.aws.amazon.com/ec2/) to launch and manage virtual
servers, [AWS Lambda](https://docs.aws.amazon.com/lambda/?icmpid=docs_homepage_featuredsvcs) to run code without having to provision or
manage servers, [Amazon ECS](https://aws.amazon.com/ecs/) or [Amazon EKS](https://aws.amazon.com/eks/) to run and manage containers, or
[AWS Batch](https://aws.amazon.com/batch/) to process large volumes of data in parallel. Based on
your scale and compute needs, you should choose and configure the
optimal compute solution for your situation. You can also consider
using multiple types of compute solutions in a single workload, as
each one has its own advantages and drawbacks.

The following steps guide you through selecting the right compute
options to match your workload characteristics and performance
requirements.

## Implementation steps

- Understand your workload compute requirements. Key
requirements to consider include processing needs, traffic
patterns, data access patterns, scaling needs, and latency
requirements.
- Learn about different [AWS compute services](https://docs.aws.amazon.com/whitepapers/latest/aws-overview/compute-services.html) for your
workload. For more information, see [PERF01-BP01 Learn about and understand available cloud services and features](./perf_architecture_understand_cloud_services_and_features.html). Here are some key
AWS compute options, their characteristics, and common
use cases:

AWS service

Key characteristics

Common use cases

[Amazon Elastic Compute Cloud (Amazon EC2)](https://aws.amazon.com/ec2/)

Has dedicated option for hardware, license requirements,
large selection of different instance families, processor
types and compute accelerators

Lift and shift migrations, monolithic application, hybrid
environments, enterprise applications

[Amazon Elastic Container Service (Amazon ECS)](https://aws.amazon.com/ecs/), [Amazon Elastic Kubernetes Service (Amazon EKS)](https://aws.amazon.com/eks/)

Easy deployment, consistent environments, scalable

Microservices, hybrid environments

[AWS Lambda](https://aws.amazon.com/lambda/)

[Serverless
compute](https://aws.amazon.com/serverless/) service that runs code in response to
events and automatically manages the underlying compute
resources.

Microservices, event-driven applications

[AWS Batch](https://aws.amazon.com/batch/)

Efficiently and dynamically provisions and
scales [Amazon Elastic Container Service (Amazon ECS)](https://aws.amazon.com/ecs/), [Amazon Elastic Kubernetes Service (Amazon EKS)](https://aws.amazon.com/eks/),
and [AWS Fargate](https://aws.amazon.com/fargate/) compute resources, with an option to use
On-Demand or Spot Instances based on your job requirements

HPC, train ML models

[Amazon Lightsail](https://aws.amazon.com/lightsail/)

Preconfigured Linux and Windows application for running
small workloads

Simple web applications, custom website
- Evaluate cost (like hourly charge or data transfer) and
management overhead (like patching and scaling) associated to
each compute option.
- Perform experiments and benchmarking in a non-production
environment to identify which compute option can best address
your workload requirements.
- Once you have experimented and identified your new compute
solution, plan your migration and validate your performance
metrics.
- Use AWS monitoring tools like [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) and
optimization services like [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) to
continually optimize your compute resources based on real-world usage
patterns.

## Resources

**Related documents:**

- [Cloud
Compute with AWS](https://aws.amazon.com/products/compute/?ref=wellarchitected)
- [Amazon EC2
Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html?ref=wellarchitected)
- [Amazon EKS
Containers: Amazon EKS Worker Nodes](https://docs.aws.amazon.com/eks/latest/userguide/worker.html?ref=wellarchitected)
- [Amazon ECS Containers: Amazon ECS Container
Instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html?ref=wellarchitected)
- [Functions:
Lambda Function Configuration](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html?ref=wellarchitected#function-configuration)
- [Prescriptive Guidance for Containers](https://aws.amazon.com/prescriptive-guidance/?apg-all-cards.sort-by=item.additionalFields.sortText&apg-all-cards.sort-order=desc&awsf.apg-new-filter=*all&awsf.apg-content-type-filter=*all&awsf.apg-code-filter=*all&awsf.apg-category-filter=categories%23containers&awsf.apg-rtype-filter=*all&awsf.apg-isv-filter=*all&awsf.apg-product-filter=*all&awsf.apg-env-filter=*all)
- [Prescriptive
Guidance for Serverless](https://aws.amazon.com/prescriptive-guidance/?apg-all-cards.sort-by=item.additionalFields.sortText&apg-all-cards.sort-order=desc&awsf.apg-new-filter=*all&awsf.apg-content-type-filter=*all&awsf.apg-code-filter=*all&awsf.apg-category-filter=categories%23serverless&awsf.apg-rtype-filter=*all&awsf.apg-isv-filter=*all&awsf.apg-product-filter=*all&awsf.apg-env-filter=*all)

**Related videos:**

- [AWS
re:Invent 2023 - AWS Graviton: The best price performance for your AWS
workloads](https://www.youtube.com/watch?v=T_hMIjKtSr4&ab_channel=AWSEvents)
- [AWS
re:Invent 2023 - New Amazon Elastic Compute Cloud generative AI capabilities in AMS](https://www.youtube.com/watch?v=sSpJ8tWCEiA)
- [AWS
re:Invent 2023 - What’s new with Amazon Elastic Compute Cloud](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS
re:Invent 2023 - Smart savings: Amazon Elastic Compute Cloud cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS
re:Invent 2021 - Powering next-gen Amazon Elastic Compute Cloud: Deep dive on the Nitro System](https://www.youtube.com/watch?v=2uc1vaEsPXU)
- [AWS re:Invent 2019 - Optimize
performance and cost for your AWS compute](https://www.youtube.com/watch?v=zt6jYJLK8sg)
- [AWS
re:Invent 2019 - Amazon Elastic Compute Cloud foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)
- [AWS re:Invent 2022 - Deploy ML
models for inference at high performance and low cost](https://www.youtube.com/watch?v=4FqHt5bmS2o)
- [AWS re:Invent 2019 - Optimize
performance and cost for your AWS compute](https://www.youtube.com/watch?v=zt6jYJLK8sg)
- [Amazon EC2
foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)
- [Deploy ML models for inference at
high performance and low cost](https://www.youtube.com/watch?v=4FqHt5bmS2o)

**Related examples:**

- [Migrating
the Web application to containers](https://application-migration-with-aws.workshop.aws/en/container-migration.html)
- [Run
a Serverless Hello World](https://aws.amazon.com/getting-started/hands-on/run-serverless-code/)
- [Amazon EKS Workshop](https://www.eksworkshop.com/)
- [Amazon EC2 Workshop](https://ec2spotworkshops.com/)
- [Efficient and Resilient Workloads with Amazon Elastic Compute Cloud Auto Scaling](https://catalog.us-east-1.prod.workshops.aws/workshops/20c57d32-162e-4ad5-86a6-dff1f8de4b3c/en-US)
- [Migrating to AWS Graviton with Container Services](https://catalog.us-east-1.prod.workshops.aws/workshops/dcab7555-32fc-42d2-97e5-2b7a35cd008f/en-US/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_select_best_compute_options.html*

---

# PERF02-BP02 Understand the available compute configuration and features

Understand the available configuration options and features for your
compute service to help you provision the right amount of resources
and improve performance efficiency.

**Common anti-patterns:**

- You do not evaluate compute options or available instance
families against workload characteristics.
- You over-provision compute resources to meet peak-demand
requirements.

**Benefits of establishing this best practice:** Be familiar with AWS compute features and configurations so that you can use a compute solution optimized to meet your workload characteristics and needs.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Each compute solution has unique configurations and features
available to support different workload characteristics and
requirements. Learn how these options complement your workload,
and determine which configuration options are best for your
application. Examples of these options include instance family,
sizes, features (GPU, I/O), bursting, time-outs, function sizes,
container instances, and concurrency. If your workload has been
using the same compute option for more than four weeks and you
anticipate that the characteristics will remain the same in the
future, you can
use [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/)  to find out if your current compute option is
suitable for the workloads from CPU and memory perspective.

## Implementation steps

- Understand workload requirements (like CPU need, memory, and
latency).
- Review AWS documentation and best practices to learn about
recommended configuration options that can help improve compute performance. Here are some key configuration
options to consider:

Configuration option

Examples

Instance type

[Compute-optimized](https://aws.amazon.com/ec2/instance-types/?trk=36c6da98-7b20-48fa-8225-4784bced9843&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Compute|EC2|US|EN|Text&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types&ef_id=CjwKCAjwiuuRBhBvEiwAFXKaNNRXM5FrnFg5H8RGQ4bQKuUuK1rYWmU2iH-5H3VZPqEheB-pEm-GNBoCdD0QAvD_BwE:G:s&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types#Compute_Optimized) instances
are ideal for the workloads that require high higher
vCPU to memory ratio.
- [Memory-optimized](https://aws.amazon.com/ec2/instance-types/?trk=36c6da98-7b20-48fa-8225-4784bced9843&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Compute|EC2|US|EN|Text&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types&ef_id=CjwKCAjwiuuRBhBvEiwAFXKaNNRXM5FrnFg5H8RGQ4bQKuUuK1rYWmU2iH-5H3VZPqEheB-pEm-GNBoCdD0QAvD_BwE:G:s&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types#Memory_Optimized) instances
deliver large amounts of memory to support memory
intensive workloads.
- [Storage-optimized](https://aws.amazon.com/ec2/instance-types/?trk=36c6da98-7b20-48fa-8225-4784bced9843&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Compute|EC2|US|EN|Text&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types&ef_id=CjwKCAjwiuuRBhBvEiwAFXKaNNRXM5FrnFg5H8RGQ4bQKuUuK1rYWmU2iH-5H3VZPqEheB-pEm-GNBoCdD0QAvD_BwE:G:s&s_kwcid=AL!4422!3!536392622533!e!!g!!ec2%20instance%20types#Storage_Optimized) instances
are designed for workloads that require high,
sequential read and write access (IOPS) to local
storage.

Pricing model

- [On-Demand
Instances](https://aws.amazon.com/ec2/pricing/on-demand/) let you use the compute capacity by
the hour or second with no long-term commitment.
These instances are good for bursting above
performance baseline needs.
- [Savings Plans](https://aws.amazon.com/savingsplans/) offer significant savings over
On-Demand Instances in exchange for a commitment to
use a specific amount of compute power for a one or
three-year period.
- [Spot
Instances](https://aws.amazon.com/ec2/spot/) let you take advantage of unused
instance capacity at a discount for your stateless,
fault-tolerant workloads.

Auto Scaling

Use
[Auto Scaling](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/capacity-autoscaling.html) configuration to match compute resources to
traffic patterns.

Sizing

- Use [Compute Optimizer](https://aws.amazon.com/compute-optimizer/) to get a machine-learning powered
recommendations on which compute configuration best
matches your compute characteristics.
- Use
[AWS Lambda Power Tuning](https://docs.aws.amazon.com/lambda/latest/operatorguide/profile-functions.html) to select the best
configuration for your Lambda function.

Hardware-based compute accelerators

- [Accelerated
computing instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html) perform functions like
graphics processing or data pattern matching more
efficiently than CPU-based alternatives.
- For machine learning workloads, take advantage of
purpose-built hardware that is specific to your
workload, such
as [AWS Trainium](https://aws.amazon.com/machine-learning/trainium/), [AWS Inferentia](https://aws.amazon.com/machine-learning/inferentia/),
and [Amazon EC2 DL1](https://aws.amazon.com/ec2/instance-types/dl1/)

## Resources

**Related documents:**

- [Cloud
Compute with AWS](https://aws.amazon.com/products/compute/?ref=wellarchitected)
- [Amazon EC2
Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html?ref=wellarchitected)
- [Processor
State Control for Your Amazon EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/processor_state_control.html?ref=wellarchitected)
- [Amazon EKS
Containers: Amazon EKS Worker Nodes](https://docs.aws.amazon.com/eks/latest/userguide/worker.html?ref=wellarchitected)
- [Amazon ECS Containers: Amazon ECS Container Instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html?ref=wellarchitected)
- [Functions:
Lambda Function Configuration](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html?ref=wellarchitected#function-configuration)

**Related videos:**

- [AWS re:Invent 2023 – AWS Graviton: The best price performance for your AWS workloads](https://www.youtube.com/watch?v=T_hMIjKtSr4)
- [AWS re:Invent 2023 – New Amazon EC2 generative AI capabilities in AWS Management Console](https://www.youtube.com/watch?v=sSpJ8tWCEiA)
- [AWS re:Invent 2023 – What's new with Amazon EC2](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS re:Invent 2023 – Smart savings: Amazon EC2 cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS re:Invent 2021 – Powering next-gen Amazon EC2: Deep dive on the Nitro System](https://www.youtube.com/watch?v=2uc1vaEsPXU)
- [AWS re:Invent 2019 – Amazon EC2 foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)
- [AWS re:Invent 2022 – Optimizing Amazon EKS for performance and cost on AWS](https://www.youtube.com/watch?v=5B4-s_ivn1o)

**Related examples:**

- [Compute Optimizer demo code](https://github.com/awslabs/ec2-spot-labs/tree/master/aws-compute-optimizer)
- [Amazon EC2 spot instances workshop](https://ec2spotworkshops.com/)
- [Efficient and Resilient Workloads with Amazon EC2 AWS Auto Scaling](https://catalog.us-east-1.prod.workshops.aws/workshops/20c57d32-162e-4ad5-86a6-dff1f8de4b3c/en-US)
- [Graviton developer workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/dcab7555-32fc-42d2-97e5-2b7a35cd008f/en-US/)
- [AWS for Microsoft workloads immersion day](https://catalog.us-east-1.prod.workshops.aws/workshops/d6c7ecdc-c75f-4ad1-910f-fdd994cc4aed/en-US)
- [AWS for Linux workloads immersion day](https://catalog.us-east-1.prod.workshops.aws/workshops/a8e9c6a6-0ba9-48a7-a90d-378a440ab8ba/en-US)
- [AWS Compute Optimizer Demo code](https://github.com/awslabs/ec2-spot-labs/tree/master/aws-compute-optimizer)
- [Amazon EKS workshop](https://www.eksworkshop.com/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_understand_compute_configuration_features.html*

---

# PERF02-BP03 Collect compute-related metrics

Record and track compute-related metrics to better understand how
your compute resources are performing and improve their performance
and their utilization.

**Common anti-patterns:**

- You only use manual log file searching for metrics.
- You only use the default metrics recorded by your monitoring
software.
- You only review metrics when there is an issue.

**Benefits of establishing this best
practice:** Collecting performance-related metrics will
help you align application performance with business requirements to
ensure that you are meeting your workload needs. It can also help
you continually improve the resource performance and utilization in
your workload.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Cloud workloads can generate large volumes of data such as
metrics, logs, and events. In the AWS Cloud, collecting metrics is
a crucial step to improve security, cost efficiency, performance,
and sustainability. AWS provides a wide range of
performance-related metrics using monitoring services such as
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to provide you with valuable insights. Metrics
such as CPU utilization, memory utilization, disk I/O, and network
inbound and outbound can provide insight into utilization levels
or performance bottlenecks. Use these metrics as part of a
data-driven approach to actively tune and optimize your workload's
resources.  In an ideal case, you should collect all metrics
related to your compute resources in a single platform with
retention policies implemented to support cost and operational
goals.

## Implementation steps

- Identify which performance-related metrics are relevant to
your workload. You should collect metrics around resource
utilization and the way your cloud workload is operating (like
response time and throughput).

[Amazon EC2
default metrics](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html)
- [Amazon ECS default metrics](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-metrics.html)
- [Amazon EKS
default metrics](https://docs.aws.amazon.com/prescriptive-guidance/latest/implementing-logging-monitoring-cloudwatch/kubernetes-eks-metrics.html)
- [Lambda
default metrics](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-access-metrics.html)
- [Amazon EC2
memory and disk metrics](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html)

- Choose and set up the right logging and monitoring solution
for your workload.

[AWS native Observability](https://catalog.workshops.aws/observability/en-US/aws-native)
- [AWS Distro
for OpenTelemetry](https://aws.amazon.com/otel/)
- [Amazon Managed Service for Prometheus](https://docs.aws.amazon.com/grafana/latest/userguide/prometheus-data-source.html)

- Define the required filter and aggregation for the metrics
based on your workload requirements.

[Quantify
custom application metrics with Amazon CloudWatch Logs and
metric filters](https://aws.amazon.com/blogs/mt/quantify-custom-application-metrics-with-amazon-cloudwatch-logs-and-metric-filters/)
- [Collect
custom metrics with Amazon CloudWatch strategic
tagging](https://aws.amazon.com/blogs/infrastructure-and-automation/collect-custom-metrics-with-amazon-cloudwatch-strategic-tagging/)

- Configure data retention policies for your metrics to match
your security and operational goals.

[Default
data retention for CloudWatch metrics](https://aws.amazon.com/cloudwatch/faqs/#AWS_resource_.26_custom_metrics_monitoring)
- [Default
data retention for CloudWatch Logs](https://aws.amazon.com/cloudwatch/faqs/#Log_management)

- If required, create alarms and notifications for your metrics
to help you proactively respond to performance-related issues.

[Create
alarms for custom metrics using Amazon CloudWatch anomaly
detection](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/create-alarms-for-custom-metrics-using-amazon-cloudwatch-anomaly-detection.html)
- [Create
metrics and alarms for specific web pages with Amazon CloudWatch RUM](https://aws.amazon.com/blogs/mt/create-metrics-and-alarms-for-specific-web-pages-amazon-cloudwatch-rum/)

- Use automation to deploy your metric and log aggregation
agents.

[AWS Systems Manager automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html?ref=wellarchitected)
- [OpenTelemetry
Collector](https://aws-otel.github.io/docs/getting-started/collector)

## Resources

**Related documents:**

- [Monitoring and observability](https://aws.amazon.com/cloudops/monitoring-and-observability/)
- [Best practices: implementing observability with AWS](https://aws.amazon.com/blogs/mt/best-practices-implementing-observability-with-aws/)
- [Amazon CloudWatch documentation](https://docs.aws.amazon.com/cloudwatch/index.html?ref=wellarchitected)
- [Collect
metrics and logs from Amazon EC2 instances and on-premises
servers with the CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html?ref=wellarchitected)
- [Accessing
Amazon CloudWatch Logs for AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-logs.html?ref=wellarchitected)
- [Using
CloudWatch Logs with container instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_cloudwatch_logs.html?ref=wellarchitected)
- [Publish
custom metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html?ref=wellarchitected)
- [AWS Answers: Centralized Logging](https://aws.amazon.com/answers/logging/centralized-logging/?ref=wellarchitected)
- [AWS Services That Publish CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html?ref=wellarchitected)
- [Monitoring
Amazon EKS on AWS Fargate](https://aws.amazon.com/blogs/containers/monitoring-amazon-eks-on-aws-fargate-using-prometheus-and-grafana/)

**Related videos:**

- [AWS re:Invent 2023 – [LAUNCH] Application monitoring for modern workloads](https://www.youtube.com/watch?v=T2TovTLje8w)
- [AWS re:Invent 2023 – Implementing application observability](https://www.youtube.com/watch?v=IcTcwUSwIs4)
- [AWS re:Invent 2023 – Building an effective observability strategy](https://www.youtube.com/watch?v=7PQv9eYCJW8)
- [AWS re:Invent 2023 – Seamless observability with AWS Distro for OpenTelemetry](https://www.youtube.com/watch?v=S4GfA2R0N_A)
- [Application
Performance Management on AWS](https://www.youtube.com/watch?v=5T4stR-HFas&ref=wellarchitected)

**Related examples:**

- [AWS for Linux Workloads Immersion Day- Amazon CloudWatch](https://catalog.us-east-1.prod.workshops.aws/workshops/a8e9c6a6-0ba9-48a7-a90d-378a440ab8ba/en-US/300-cloudwatch)
- [Monitoring Amazon ECS clusters and containers](https://ecsworkshop.com/monitoring/)
- [Monitoring with Amazon CloudWatch dashboards](https://catalog.workshops.aws/well-architected-performance-efficiency/en-US/3-monitoring/monitoring-with-cloudwatch-dashboards)
- [Amazon EKS workshop](https://www.eksworkshop.com/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_collect_compute_related_metrics.html*

---

# PERF02-BP04 Configure and right-size compute resources

Configure and right-size compute resources to match your workload’s
performance requirements and avoid under- or over-utilized
resources.

**Common anti-patterns:**

- You ignore your workload performance requirements resulting in
over-provisioned or under-provisioned compute resources.
- You only choose the largest or smallest instance available for
all workloads.
- You only use one instance family for ease of management.
- You ignore recommendations from AWS Cost Explorer or Compute Optimizer for right-sizing.
- You do not re-evaluate the workload for suitability of new
instance types.
- You certify only a small number of instance configurations for
your organization.

**Benefits of establishing this best
practice:**
Right-sizing compute resources ensures optimal operation in the
cloud by avoiding over-provisioning and under-provisioning
resources. Properly sizing compute resources typically results in
better performance and enhanced customer experience, while also
lowering cost.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Right-sizing allows organizations to operate their cloud
infrastructure in an efficient and cost-effective manner while
addressing their business needs. Over-provisioning cloud resources
can lead to extra costs, while under-provisioning can result in
poor performance and a negative customer experience. AWS provides
tools such as
[AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) and
[AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/) that use historical data to provide
recommendations to right-size your compute resources.

### Implementation steps

- Choose an instance type to best fit your needs:

[How
do I choose the appropriate Amazon EC2 instance type for
my workload?](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-choose-type-for-workload/)
- [Attribute-based
instance type selection for Amazon EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html)
- [Create
an Auto Scaling group using attribute-based instance
type selection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html)
- [Optimizing
your Kubernetes compute costs with Karpenter
consolidation](https://aws.amazon.com/blogs/containers/optimizing-your-kubernetes-compute-costs-with-karpenter-consolidation/)

- Analyze the various performance characteristics of your
workload and how these characteristics relate to memory,
network, and CPU usage. Use this data to choose resources
that best match your workload's profile and performance
goals.
- Monitor your resource usage using AWS monitoring tools such
as Amazon CloudWatch.
- Select the right configuration for compute resources.

For ephemeral workloads,
evaluate [instance
Amazon CloudWatch metrics](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html) such
as `CPUUtilization` to identify if the instance is
under-utilized or over-utilized.
- For stable workloads, check AWS rightsizing tools such
as AWS Compute Optimizer and AWS Trusted Advisor at
regular intervals to identify opportunities to optimize
and right-size the compute resource.

- Test configuration changes in a non-production environment
before implementing in a live environment.
- Continually re-evaluate new compute offerings and compare
against your workload’s needs.

## Resources

**Related documents:**

- [Cloud
Compute with AWS](https://aws.amazon.com/products/compute/)
- [Amazon EC2
Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html)
- [Amazon ECS
Containers: Amazon ECS Container Instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html)
- [Amazon EKS
Containers: Amazon EKS Worker Nodes](https://docs.aws.amazon.com/eks/latest/userguide/worker.html)
- [Functions:
Lambda Function Configuration](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html#function-configuration)
- [Processor
State Control for Your Amazon EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/processor_state_control.html)

**Related videos:**

- [Amazon EC2 foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)
- [AWS re:Invent 2023 – AWS Graviton: The best price performance for your AWS workloads](https://www.youtube.com/watch?v=T_hMIjKtSr4)
- [AWS re:Invent 2023 – New Amazon EC2 generative AI capabilities in AWS Management Console](https://www.youtube.com/watch?v=sSpJ8tWCEiA)
- [AWS re:Invent 2023 – What’s new with Amazon EC2](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS re:Invent 2023 – Smart savings: Amazon EC2 cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS re:Invent 2021 – Powering next-gen Amazon EC2: Deep dive on the Nitro System](https://www.youtube.com/watch?v=2uc1vaEsPXU)
- [AWS re:Invent 2019 – Amazon EC2 foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)

**Related examples:**

- [AWS Compute Optimizer Demo code](https://github.com/awslabs/ec2-spot-labs/tree/master/aws-compute-optimizer)
- [Amazon EKS workshop](https://www.eksworkshop.com/)
- [Right-sizing recommendations](https://catalog.workshops.aws/well-architected-cost-optimization/en-US/3-cost-effective-resources/40-rightsizing-recommendations-100)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_configure_and_right_size_compute_resources.html*

---

# PERF02-BP05 Scale your compute resources dynamically

Use the elasticity of the cloud to scale your compute resources up
or down dynamically to match your needs and avoid over- or
under-provisioning capacity for your workload.

**Common anti-patterns:**

- You react to alarms by manually increasing capacity.
- You use the same sizing guidelines (generally static
infrastructure) as in on-premises.
- You leave increased capacity after a scaling event instead of
scaling back down.

**Benefits of establishing this best
practice:** Configuring and testing the elasticity of
compute resources can help you save money, maintain performance
benchmarks, and improve reliability as traffic changes.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS provides the flexibility to scale your resources up or down
dynamically through a variety of scaling mechanisms in order to
meet changes in demand. Combined with compute-related metrics, a
dynamic scaling allows workloads to automatically respond to
changes and use the optimal set of compute resources to achieve
its goal.

You can use a number of different approaches to match supply of
resources with demand.

- **Target-tracking approach**: Monitor your scaling metric and
automatically increase or decrease capacity as you need it.
- **Predictive scaling**: Scale in anticipation of daily and
weekly trends.
- **Schedule-based approach**: Set your own scaling schedule
according to predictable load changes.
- **Service scaling**: Choose services (like serverless) that
that automatically scale by design.

You must ensure that workload deployments can handle both scale-up
and scale-down events.

### Implementation steps

- Compute instances, containers, and functions provide
mechanisms for elasticity, either in combination with
autoscaling or as a feature of the service. Here are some
examples of automatic scaling mechanisms:

Autoscaling Mechanism

Where to use

[Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

To ensure you have the correct number of
[Amazon EC2](https://aws.amazon.com/ec2/) instances available to handle the user load
for your application.

[Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html)

To automatically scale the resources for individual AWS
services beyond Amazon EC2 such as
[AWS Lambda](https://aws.amazon.com/lambda/) functions or
[Amazon Elastic Container Service (Amazon ECS)](https://aws.amazon.com/ecs/) services.

[Kubernetes
Cluster Autoscaler/Karpenter](https://aws.amazon.com/blogs/aws/introducing-karpenter-an-open-source-high-performance-kubernetes-cluster-autoscaler/)

To automatically scale Kubernetes clusters.
- Scaling is often discussed related to compute services like
Amazon EC2 Instances or AWS Lambda functions. Be sure to
also consider the configuration of non-compute services like
[AWS Glue](https://docs.aws.amazon.com/glue/latest/dg/auto-scaling.html) to match the demand.
- Verify that the metrics for scaling match the
characteristics of the workload being deployed. If you are
deploying a video transcoding application, 100% CPU
utilization is expected and should not be your primary
metric. Use the depth of the transcoding job queue instead.
You can use a
[customized
metric](https://aws.amazon.com/blogs/mt/create-amazon-ec2-auto-scaling-policy-memory-utilization-metric-linux/) for your scaling policy if required. To choose
the right metrics, consider the following guidance for Amazon EC2:

The metric should be a valid utilization metric and
describe how busy an instance is.
- The metric value must increase or decrease
proportionally to the number of instances in the Auto Scaling group.

- Make sure that you use
[dynamic
scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html) instead of
[manual
scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html) for your Auto Scaling group. We also
recommend that you use
[target
tracking scaling policies](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html) in your dynamic scaling.
- Verify that workload deployments can handle both scaling
events (up and down). As an example, you can use
[Activity
history](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html) to verify a scaling activity for an Auto Scaling group.
- Evaluate your workload for predictable patterns and
proactively scale as you anticipate predicted and planned
changes in demand. With predictive scaling, you can
eliminate the need to overprovision capacity. For more detail,
see [Predictive
Scaling with Amazon EC2 Auto Scaling](https://aws.amazon.com/blogs/compute/introducing-native-support-for-predictive-scaling-with-amazon-ec2-auto-scaling/).

## Resources

**Related documents:**

- [Cloud
Compute with AWS](https://aws.amazon.com/products/compute/)
- [Amazon EC2
Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html)
- [Amazon ECS
Containers: Amazon ECS Container Instances](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html)
- [Amazon EKS
Containers: Amazon EKS Worker Nodes](https://docs.aws.amazon.com/eks/latest/userguide/worker.html)
- [Functions:
Lambda Function Configuration](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html#function-configuration)
- [Processor
State Control for Your Amazon EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/processor_state_control.html)
- [Deep
Dive on Amazon ECS Cluster Auto Scaling](https://aws.amazon.com/blogs/containers/deep-dive-on-amazon-ecs-cluster-auto-scaling/)
- [Introducing
Karpenter – An Open-Source High-Performance Kubernetes Cluster
Autoscaler](https://aws.amazon.com/blogs/aws/introducing-karpenter-an-open-source-high-performance-kubernetes-cluster-autoscaler/)

**Related videos:**

- [AWS re:Invent 2023 – AWS Graviton: The best price performance for your AWS workloads](https://www.youtube.com/watch?v=T_hMIjKtSr4)
- [AWS re:Invent 2023 – New Amazon EC2 generative AI capabilities in AWS Management Console](https://www.youtube.com/watch?v=sSpJ8tWCEiA)
- [AWS re:Invent 2023 – What’s new with Amazon EC2](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS re:Invent 2023 – Smart savings: Amazon EC2 cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS re:Invent 2021 – Powering next-gen Amazon EC2: Deep dive on the Nitro System](https://www.youtube.com/watch?v=2uc1vaEsPXU)
- [AWS re:Invent 2019 – Amazon EC2 foundations](https://www.youtube.com/watch?v=kMMybKqC2Y0)

**Related examples:**

- [Amazon EC2 Auto Scaling Group Examples](https://github.com/aws-samples/amazon-ec2-auto-scaling-group-examples)
- [Amazon EKS Workshop](https://www.eksworkshop.com/)
- [Scale your Amazon EKS workloads by running on IPv6](https://catalog.us-east-1.prod.workshops.aws/workshops/3b06259f-8e17-4f2f-811a-75c9b06a2807/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_scale_compute_resources_dynamically.html*

---

# PERF02-BP06 Use optimized hardware-based compute accelerators

Use hardware accelerators to perform certain functions more efficiently than CPU-based
alternatives.

**Common anti-patterns:**

- In your workload, you haven't benchmarked a general-purpose instance against a
purpose-built instance that can deliver higher performance and lower cost.
- You are using hardware-based compute accelerators for tasks that can be more efficient
using CPU-based alternatives.
- You are not monitoring GPU usage.

**Benefits of establishing this best practice:** By using
hardware-based accelerators, such as graphics processing units (GPUs) and field programmable
gate arrays (FPGAs), you can perform certain processing functions more efficiently.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Accelerated computing instances provide access to hardware-based compute accelerators
such as GPUs and FPGAs. These hardware accelerators perform certain functions like graphic
processing or data pattern matching more efficiently than CPU-based alternatives. Many
accelerated workloads, such as rendering, transcoding, and machine learning, are highly
variable in terms of resource usage. Only run this hardware for the time needed, and
decommission them with automation when not required to improve overall performance efficiency.

### Implementation steps

- Identify which [accelerated
computing instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html) can address your requirements.
- For machine learning workloads, take advantage of purpose-built hardware that is
specific to your workload, such as [AWS Trainium](https://aws.amazon.com/machine-learning/trainium/), [AWS Inferentia](https://aws.amazon.com/machine-learning/inferentia/), and [Amazon EC2 DL1](https://aws.amazon.com/ec2/instance-types/dl1/). AWS Inferentia
instances such as Inf2 instances [offer up to 50% better performance/watt over
comparable Amazon EC2 instances](https://aws.amazon.com/machine-learning/inferentia/).
- Collect usage metrics for your accelerated computing instances. For example, you
can use CloudWatch agent to collect metrics such as `utilization_gpu` and
`utilization_memory` for your GPUs as shown in [Collect NVIDIA GPU
metrics with Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-NVIDIA-GPU.html).
- Optimize the code, network operation, and settings of hardware accelerators to make
sure that underlying hardware is fully utilized.

[Optimize
GPU settings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/optimize_gpu.html)
- [GPU
Monitoring and Optimization in the Deep Learning AMI](https://docs.aws.amazon.com/dlami/latest/devguide/tutorial-gpu.html)
- [Optimizing I/O for GPU performance tuning of deep learning training in
Amazon SageMaker AI](https://aws.amazon.com/blogs/machine-learning/optimizing-i-o-for-gpu-performance-tuning-of-deep-learning-training-in-amazon-sagemaker/)

- Use the latest high performant libraries and GPU drivers.
- Use automation to release GPU instances when not in use.

## Resources

**Related documents:**

- [Working
with GPUs on Amazon Elastic Container Service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html)
- [GPU
instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#gpu-instances)
- [Instances with AWS Trainium](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#aws-trainium-instances)
- [Instances with AWS Inferentia](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#aws-inferentia-instances)
- [Let’s Architect!
Architecting with custom chips and accelerators](https://aws.amazon.com/blogs/architecture/lets-architect-custom-chips-and-accelerators/)

- [Accelerated
Computing](https://aws.amazon.com/ec2/instance-types/#Accelerated_Computing)
- [Amazon EC2 VT1 Instances](https://aws.amazon.com/ec2/instance-types/vt1/)
- [How do I
choose the appropriate Amazon EC2 instance type for my workload?](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-choose-type-for-workload/)
- [Choose the best AI accelerator and model compilation for computer vision inference with
Amazon SageMaker AI](https://aws.amazon.com/blogs/machine-learning/choose-the-best-ai-accelerator-and-model-compilation-for-computer-vision-inference-with-amazon-sagemaker/)

**Related videos:**

- AWS re:Invent 2021 - [How to select
Amazon Elastic Compute Cloud GPU instances for deep learning](https://www.youtube.com/watch?v=4bVrIbgGWEA&ab_channel=AWSEvents)
- [AWS
re:Invent 2022 - [NEW LAUNCH!] Introducing AWS Inferentia2-based Amazon EC2 Inf2
instances](https://www.youtube.com/watch?v=jpqiG02Y2H4&ab_channel=AWSEvents)
- [AWS
re:Invent 2022 - Accelerate deep learning and innovate faster with AWS
Trainium](https://www.youtube.com/watch?v=YRqvfNwqUIA&ab_channel=AWSEvents)
- [AWS
re:Invent 2022 - Deep learning on AWS with NVIDIA: From training to deployment](https://www.youtube.com/watch?v=l8AFfaCkp0E&ab_channel=AWSEvents)

**Related examples:**

- [Amazon SageMaker AI
and NVIDIA GPU Cloud (NGC)](https://github.com/aws-samples/amazon-sagemaker-nvidia-ngc-examples)
- [Use SageMaker AI with
Trainium and Inferentia for optimized deep learning training and inferencing
workloads](https://github.com/aws-samples/sagemaker-trainium-inferentia)
- [Optimizing
NLP models with Amazon Elastic Compute Cloud Inf1 instances in Amazon SageMaker AI](https://github.com/aws-samples/aws-inferentia-huggingface-workshop)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_compute_hardware_compute_accelerators.html*

---
