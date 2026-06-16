# SUS 5 — How do you select and use cloud hardware and services to support your sustainability goals?

**Pillar**: Sustainability  
**Best Practices**: 4

---

# SUS05-BP01 Use the minimum amount of hardware to meet your needs

Use the minimum amount of hardware for your workload to efficiently meet your business
needs.

**Common anti-patterns:**

- You do not monitor resource utilization.
- You have resources with a low utilization level in your architecture.
- You do not review the utilization of static hardware to determine if it should be
resized.
- You do not set hardware utilization goals for your compute infrastructure based on
business KPIs.

**Benefits of establishing this best practice:** Rightsizing your
cloud resources helps to reduce a workload’s environmental impact, save money, and maintain
performance benchmarks.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Optimally select the total number of hardware required for your workload to improve its
overall efficiency. The AWS Cloud provides the flexibility to expand or reduce the number of
resources dynamically through a variety of mechanisms, such as [AWS Auto Scaling](https://aws.amazon.com/autoscaling/), and meet changes in demand. It also provides [APIs and SDKs](https://aws.amazon.com/developer/tools/) that allow resources to be
modified with minimal effort. Use these capabilities to make frequent changes to your workload
implementations. Additionally, use rightsizing guidelines from AWS tools to efficiently
operate your cloud resource and meet your business needs.

**Implementation steps**

- **Choose the instances type:** Choose the right instances
type to best fit your needs. To learn about how to choose Amazon Elastic Compute Cloud instances and use
mechanisms such as attribute-based instance selection, see the following:

[How do
I choose the appropriate Amazon EC2 instance type for my workload?](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-choose-type-for-workload/)
- [Attribute-based instance type selection for Amazon EC2 Fleet.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html)
- [Create
an Auto Scaling group using attribute-based instance type selection.](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html)

- **Scale:** Use small increments to scale variable
workloads.
- **Use multiple compute purchase options:** Balance
instance flexibility, scalability, and cost savings with multiple compute purchase
options.

[Amazon EC2 On-Demand Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html) are best suited for new, stateful, and spiky
workloads which can’t be instance type, location, or time flexible.
- [Amazon EC2 Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html) are a great way to supplement the other options for
applications that are fault tolerant and flexible.
- Leverage [Compute
Savings Plans](https://aws.amazon.com/savingsplans/compute-pricing/) for steady state workloads that allow flexibility if your
needs (like AZ, Region, instance families, or instance types) change.

- **Use instance and Availability Zone diversity:** Maximize
application availability and take advantage of excess capacity by diversifying your
instances and Availability Zones.
- **Rightsize instances:** Use the rightsizing
recommendations from AWS tools to make adjustments on your workload. For more
information, see [Optimizing your cost with Rightsizing Recommendations](https://docs.aws.amazon.com/latest/userguide/ce-rightsizing.html) and [Right
Sizing: Provisioning Instances to Match Workloads](https://docs.aws.amazon.com/latest/cost-optimization-right-sizing/cost-optimization-right-sizing.html)

Use rightsizing recommendations in AWS Cost Explorer or [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) to identify rightsizing
opportunities.

- **Negotiate service-level agreements (SLAs):** Negotiate
SLAs that permit temporarily reducing capacity while automation deploys replacement
resources.

## Resources

**Related documents:**

- [Optimizing your AWS Infrastructure for Sustainability, Part I: Compute](https://aws.amazon.com/blogs/architecture/optimizing-your-aws-infrastructure-for-sustainability-part-i-compute/)
- [Attirbute based Instance Type Selection for Auto Scaling for Amazon EC2 Fleet](https://aws.amazon.com/blogs/aws/new-attribute-based-instance-type-selection-for-ec2-auto-scaling-and-ec2-fleet/)
- [AWS Compute Optimizer Documentation](https://docs.aws.amazon.com/compute-optimizer/index.html)
- [Operating Lambda:
Performance optimization](https://aws.amazon.com/blogs/compute/operating-lambda-performance-optimization-part-2/)
- [Auto Scaling
Documentation](https://docs.aws.amazon.com/autoscaling/index.html)

**Related videos:**

- [AWS re:Invent 2023 - What's
new with Amazon EC2](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS re:Invent 2023 - Smart
savings: Amazon Elastic Compute Cloud cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS re:Invent 2022 -
Optimizing Amazon Elastic Kubernetes Service for performance and cost on AWS](https://www.youtube.com/watch?v=5B4-s_ivn1o)
- [AWS re:Invent 2023 -
Sustainable compute: reducing costs and carbon emissions with AWS](https://www.youtube.com/watch?v=0Bl1SDU2HxI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_hardware_a2.html*

---

# SUS05-BP02 Use instance types with the least impact

Continually monitor and use new instance types to take advantage of energy efficiency
improvements.

**Common anti-patterns:**

- You are only using one family of instances.
- You are only using x86 instances.
- You specify one instance type in your Amazon EC2 Auto Scaling configuration.
- You use AWS instances in a manner that they were not designed for (for example, you
use compute-optimized instances for a memory-intensive workload).
- You do not evaluate new instance types regularly.
- You do not check recommendations from AWS rightsizing tools such as [AWS Compute Optimizer.](https://aws.amazon.com/compute-optimizer/)

**Benefits of establishing this best practice:** By using
energy-efficient and right-sized instances, you are able to greatly reduce the environmental
impact and cost of your workload.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Using efficient instances in cloud workload is crucial for lower resource usage and
cost-effectiveness. Continually monitor the release of new instance types and take advantage
of energy efficiency improvements, including those instance types designed to support specific
workloads such as machine learning training and inference, and video transcoding.

## Implementation steps

- **Learn and explore instance types:** Find instance types
that can lower your workload's environmental impact.

Subscribe to [What's New with AWS](https://aws.amazon.com/new/) to
stay up-to-date with the latest AWS technologies and instances.
- Learn about different AWS instance types.
- Learn about AWS Graviton-based instances which offer the best performance per
watt of energy use in Amazon EC2 by watching [re:Invent 2020 - Deep dive on
AWS Graviton2 processor-powered Amazon EC2 instances](https://www.youtube.com/watch?v=NLysl0QvqXU) and [Deep dive
into AWS Graviton3 and Amazon EC2 C7g instances](https://www.youtube.com/watch?v=WDKwwFQKfSI&ab_channel=AWSEvents).

- **Use instance types with the least impact:** Plan and
transition your workload to instance types with the least impact.

Define a process to evaluate new features or instances for your workload. Take
advantage of agility in the cloud to quickly test how new instance types can improve
your workload environmental sustainability. Use proxy metrics to measure how many
resources it takes you to complete a unit of work.
- If possible, modify your workload to work with different numbers of vCPUs and
different amounts of memory to maximize your choice of instance type.
- Consider transitioning your workload to Graviton-based instances to improve the
performance efficiency of your workload. For more information on moving workloads to
AWS Graviton, see [AWS
Graviton Fast Start](https://aws.amazon.com/ec2/graviton/fast-start/) and [Considerations when transitioning workloads to AWS Graviton-based Amazon Elastic Compute Cloud
instances](https://github.com/aws/aws-graviton-getting-started/blob/main/transition-guide.md).
- Consider selecting the AWS Graviton option in your usage of [AWS managed services.](https://github.com/aws/aws-graviton-getting-started/blob/main/managed_services.md)
- Migrate your workload to Regions that offer instances with the least
sustainability impact and still meet your business requirements.
- For machine learning workloads, take advantage of purpose-built hardware that is
specific to your workload such as [AWS Trainium](https://aws.amazon.com/machine-learning/trainium/), [AWS Inferentia](https://aws.amazon.com/machine-learning/inferentia/), and [Amazon EC2 DL1.](https://aws.amazon.com/ec2/instance-types/dl1/) AWS Inferentia
instances such as Inf2 instances offer up to 50% better performance per watt over
comparable Amazon EC2 instances.
- Use [Amazon SageMaker AI Inference
Recommender](https://docs.aws.amazon.com/sagemaker/latest/dg/inference-recommender.html) to right size ML inference endpoint.
- For spiky workloads (workloads with infrequent requirements for additional
capacity), use [burstable
performance instances.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html)
- For stateless and fault-tolerant workloads, use [Amazon EC2 Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
to increase overall utilization of the cloud, and reduce the sustainability impact of
unused resources.

- **Operate and optimize:** Operate and optimize your
workload instance.

For ephemeral workloads, evaluate [instance Amazon CloudWatch metrics](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html#ec2-cloudwatch-metrics) such as `CPUUtilization` to identify
if the instance is idle or under-utilized.
- For stable workloads, check AWS rightsizing tools such as [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) at regular intervals to
identify opportunities to optimize and right-size the instances. For further examples and recommendations, see the following labs:

[Well-Architected Lab - Rightsizing Recommendations](https://catalog.workshops.aws/well-architected-cost-optimization/en-US/3-cost-effective-resources/40-rightsizing-recommendations-100)
- [Well-Architected Lab - Rightsizing with Compute Optimizer](https://catalog.workshops.aws/well-architected-cost-optimization/en-US/3-cost-effective-resources/50-rightsizing-recommendations-200)
- [Well-Architected Lab - Optimize Hardware Patterns and Observice Sustainability
KPIs](https://catalog.workshops.aws/well-architected-sustainability/en-US/4-hardware-and-services/optimize-hardware-patterns-observe-sustainability-kpis)

## Resources

**Related documents:**

- [Optimizing your AWS Infrastructure for Sustainability, Part I: Compute](https://aws.amazon.com/blogs/architecture/optimizing-your-aws-infrastructure-for-sustainability-part-i-compute/)
- [AWS Graviton](https://aws.amazon.com/ec2/graviton/)
- [Amazon EC2 DL1](https://aws.amazon.com/ec2/instance-types/dl1/)
- [Amazon EC2 Capacity
Reservation Fleets](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cr-fleets.html)
- [Amazon EC2 Spot
Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet.html)
- [Functions: Lambda
Function Configuration](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html#function-configuration)
- [Attribute-based instance type selection for Amazon EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html)
- [Building Sustainable, Efficient, and Cost-Optimized Applications on
AWS](https://aws.amazon.com/blogs/compute/building-sustainable-efficient-and-cost-optimized-applications-on-aws/)
- [How the Contino Sustainability Dashboard Helps Customers Optimize Their Carbon
Footprint](https://aws.amazon.com/blogs/apn/how-the-contino-sustainability-dashboard-helps-customers-optimize-their-carbon-footprint/)

**Related videos:**

- [AWS re:Invent 2023 - AWS
Graviton: The best price performance for your AWS workloads](https://www.youtube.com/watch?v=T_hMIjKtSr4)
- [AWS re:Invent 2023 - New
Amazon Elastic Compute Cloud generative AI capabilities in AWS Management Console](https://www.youtube.com/watch?v=sSpJ8tWCEiA)
- [AWS re:Invent 2023 = What's new
with Amazon Elastic Compute Cloud](https://www.youtube.com/watch?v=mjHw_wgJJ5g)
- [AWS re:Invent 2023 - Smart
savings: Amazon Elastic Compute Cloud cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS
re:Invent 2021 - Deep dive into AWS Graviton3 and Amazon EC2 C7g instances](https://www.youtube.com/watch?v=WDKwwFQKfSI&ab_channel=AWSEvents)
- [AWS re:Invent 2022 - Build
a cost-, energy-, and resource-efficient compute environment](https://www.youtube.com/watch?v=8zsC5e1eLCg)

**Related examples:**

- [Solution: Guidance for Optimizing Deep Learning Workloads for Sustainability on AWS](https://aws.amazon.com/solutions/guidance/optimizing-deep-learning-workloads-for-sustainability-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_hardware_a3.html*

---

# SUS05-BP03 Use managed services

Use managed services to operate more efficiently in the cloud.

**Common anti-patterns:**

- You use Amazon EC2 instances with low utilization to run your applications.
- Your in-house team only manages the workload, without time to focus on innovation or
simplifications.
- You deploy and maintain technologies for tasks that can run more efficiently on managed
services.

**Benefits of establishing this best practice:**

- Using managed services shifts the responsibility to AWS, which has insights across
millions of customers that can help drive new innovations and efficiencies.
- Managed service distributes the environmental impact of the service across many users
because of the multi-tenet control planes.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Managed services shift responsibility to AWS for maintaining high utilization and
sustainability optimization of the deployed hardware. Managed services also remove the
operational and administrative burden of maintaining a service, which allows your team to have
more time and focus on innovation.

Review your workload to identify the components that can be replaced by AWS managed
services. For example, [Amazon RDS](https://aws.amazon.com/rds/), [Amazon Redshift](https://aws.amazon.com/redshift/), and [Amazon ElastiCache](https://aws.amazon.com/elasticache/) provide a managed database service. [Amazon Athena](https://aws.amazon.com/athena/), [Amazon EMR](https://aws.amazon.com/emr/), and [Amazon OpenSearch Service](https://aws.amazon.com/opensearch-service/)
provide a managed analytics service.

**Implementation steps**

- **Inventory your workload:** Inventory your workload for
services and components.
- **Identify candidates:** Assess and identify components
that can be replaced by managed services. Here are some examples of when you might
consider using a managed service:

Task
What to use on AWS

Hosting a database

Use managed [Amazon Relational Database Service (Amazon RDS)](https://aws.amazon.com/rds/)
instances instead of maintaining your own Amazon RDS instances on [Amazon Elastic Compute Cloud (Amazon EC2)](https://aws.amazon.com/ec2/).

Hosting a container workload

Use [AWS Fargate](https://aws.amazon.com/fargate/), instead of
implementing your own container infrastructure.

Hosting web apps

Use [AWS Amplify
Hosting](https://aws.amazon.com/amplify/hosting/) as fully managed CI/CD and hosting service for static websites
and server-side rendered web apps.
- **Create a migration plan:** Identify dependencies and
create a migrations plan. Update runbooks and playbooks accordingly.

The [AWS Application Discovery Service](https://aws.amazon.com/application-discovery/)
automatically collects and presents detailed information about application
dependencies and utilization to help you make more informed decisions as you plan your
migration

- **Perform tests** Test the service before migrating to
the managed service.
- **Replace self-hosted services:** Use your migration plan
to replace self-hosted services with managed service.
- **Monitor and adjust:** Continually monitor the service
after the migration is complete to make adjustments as required and optimize the service.

## Resources

**Related documents:**

- [AWS Cloud Products](https://aws.amazon.com/products/)
- [AWS Total Cost of Ownership (TCO) Calculator](https://calculator.aws/#/)
- [Amazon DocumentDB](https://aws.amazon.com/documentdb/)
- [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/)
- [Amazon Managed Streaming for Apache Kafka (Amazon MSK)](https://aws.amazon.com/msk/)

**Related videos:**

- [AWS re:Invent 2021 - Cloud
operations at scale with AWS Managed Services](https://www.youtube.com/watch?v=OCK8GCImWZw)
- [AWS re:Invent 2023 - Best
practices for operating on AWS](https://www.youtube.com/watch?v=XBKq2JXWsS4)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_hardware_a4.html*

---

# SUS05-BP04 Optimize your use of hardware-based compute accelerators

Optimize your use of accelerated computing instances to reduce the physical infrastructure
demands of your workload.

**Common anti-patterns:**

- You are not monitoring GPU usage.
- You are using a general-purpose instance for workload while a purpose-built instance
can deliver higher performance, lower cost, and better performance per watt.
- You are using hardware-based compute accelerators for tasks where they’re more
efficient using CPU-based alternatives.

**Benefits of establishing this best practice:** By optimizing the
use of hardware-based accelerators, you can reduce the physical-infrastructure demands of your
workload.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

If you require high processing capability, you can benefit from using accelerated
computing instances, which provide access to hardware-based compute accelerators such as
graphics processing units (GPUs) and field programmable gate arrays (FPGAs). These hardware
accelerators perform certain functions like graphic processing or data pattern matching more
efficiently than CPU-based alternatives. Many accelerated workloads, such as rendering,
transcoding, and machine learning, are highly variable in terms of resource usage. Only run
this hardware for the time needed, and decommission them with automation when not required to
minimize resources consumed.

## Implementation steps

- **Explore compute accelerators:** Identify which [accelerated computing
instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html) can address your requirements.
- **Use purpose-built hardware:** For machine learning workloads, take advantage of purpose-built hardware that is
specific to your workload, such as [AWS Trainium](https://aws.amazon.com/machine-learning/trainium/), [AWS Inferentia](https://aws.amazon.com/machine-learning/inferentia/), and [Amazon EC2 DL1](https://aws.amazon.com/ec2/instance-types/dl1/). AWS Inferentia instances such as Inf2
instances offer up to [50%
better performance per watt over comparable Amazon EC2 instances](https://aws.amazon.com/machine-learning/inferentia/).
- **Monitor usage metrics:** Collect usage metric for your accelerated computing instances. For example, you can
use CloudWatch agent to collect metrics such as `utilization_gpu` and
`utilization_memory` for your GPUs as shown in [Collect NVIDIA
GPU metrics with Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-NVIDIA-GPU.html).
- **Rightsize:** Optimize the code, network operation, and settings of hardware accelerators to make
sure that underlying hardware is fully utilized.

[Optimize
GPU settings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/optimize_gpu.html)
- [GPU
Monitoring and Optimization in the Deep Learning AMI](https://docs.aws.amazon.com/dlami/latest/devguide/tutorial-gpu.html)
- [Optimizing I/O for GPU performance tuning of deep learning training in
Amazon SageMaker AI](https://aws.amazon.com/blogs/machine-learning/optimizing-i-o-for-gpu-performance-tuning-of-deep-learning-training-in-amazon-sagemaker/)

- **Keep up to date:** Use the latest high performant libraries and GPU drivers.
- **Release unneeded instances:** Use automation to release GPU instances when not in use.

## Resources

**Related documents:**

- [Accelerated
Computing](https://aws.amazon.com/ec2/instance-types/#Accelerated_Computing)
- [Let's Architect!
Architecting with custom chips and accelerators](https://aws.amazon.com/blogs/architecture/lets-architect-custom-chips-and-accelerators/)
- [How do I
choose the appropriate Amazon EC2 instance type for my workload?](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-choose-type-for-workload/)
- [Amazon EC2 VT1 Instances](https://aws.amazon.com/ec2/instance-types/vt1/)
- [Choose the best AI accelerator and model compilation for computer vision inference
with Amazon SageMaker AI](https://aws.amazon.com/blogs/machine-learning/choose-the-best-ai-accelerator-and-model-compilation-for-computer-vision-inference-with-amazon-sagemaker/)

**Related videos:**

- [AWS re:Invent 2021 - How
to select Amazon EC2 GPU instances for deep learning](https://www.youtube.com/watch?v=4bVrIbgGWEA)
- [AWS Online Tech Talks -
Deploying Cost-Effective Deep Learning Inference](https://www.youtube.com/watch?v=WiCougIDRsw)
- [AWS re:Invent 2023 -
Cutting-edge AI with AWS and NVIDIA](https://www.youtube.com/watch?v=ud4-z_sb_ps)
- [AWS re:Invent 2022 - [NEW
LAUNCH!] Introducing AWS Inferentia2-based Amazon EC2 Inf2 instances](https://www.youtube.com/watch?v=jpqiG02Y2H4)
- [AWS re:Invent 2022 -
Accelerate deep learning and innovate faster with AWS Trainium](https://www.youtube.com/watch?v=YRqvfNwqUIA)
- [AWS re:Invent 2022 - Deep
learning on AWS with NVIDIA: From training to deployment](https://www.youtube.com/watch?v=l8AFfaCkp0E)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_hardware_a5.html*

---
