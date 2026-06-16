# SUS 2 — How do you align cloud resources to your demand?

**Pillar**: Sustainability  
**Best Practices**: 6

---

# SUS02-BP01 Scale workload infrastructure dynamically

Use elasticity of the cloud and scale your infrastructure dynamically to match supply of cloud
resources to demand and avoid overprovisioned capacity in your workload.

**Common anti-patterns:**

- You do not scale your infrastructure with user load.
- You manually scale your infrastructure all the time.
- You leave increased capacity after a scaling event instead of scaling back down.

**Benefits of establishing this best practice:** Configuring and testing
workload elasticity help to efficiently match supply of cloud resources to demand and avoid overprovisioned
capacity. You can take advantage of elasticity in the cloud to automatically scale capacity during and
after demand spikes to make sure you are only using the right number of resources needed to meet your
business requirements.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The cloud provides the flexibility to expand or reduce your resources dynamically through a variety of
mechanisms to meet changes in demand. Optimally matching supply to demand delivers the lowest environmental
impact for a workload.

Demand can be fixed or variable, requiring metrics and automation to make sure that management does
not become burdensome. Applications can scale vertically (up or down) by modifying the instance size,
horizontally (in or out) by modifying the number of instances, or a combination of both.

You can use a number of different approaches to match supply of resources with demand.

- **Target-tracking approach:** Monitor your scaling metric and
automatically increase or decrease capacity as you need it.
- **Predictive scaling:** Scale in anticipation of daily and weekly trends.
- **Schedule-based approach:** Set your own scaling schedule according to
predictable load changes.
- **Service scaling:** Pick services (like serverless) that are natively
scaling by design or provide auto scaling as a feature.

Identify periods of low or no utilization and scale resources to remove excess capacity and improve efficiency.

## Implementation steps

- Elasticity matches the supply of resources you have against the demand for those resources.
Instances, containers, and functions provide mechanisms for elasticity, either in combination with
automatic scaling or as a feature of the service. AWS provides a range of auto scaling mechanisms
to ensure that workloads can scale down quickly and easily during periods of low user load. Here
are some examples of auto scaling mechanisms:

Auto scaling mechanism
Where to use

[Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

Use to verify you have the correct number of Amazon EC2 instances available to
handle the user load for your application.

[Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html)

Use to automatically scale the resources for individual AWS services beyond Amazon EC2,
such as Lambda functions or Amazon Elastic Container Service (Amazon ECS) services.

[Kubernetes Cluster Autoscaler](https://aws.amazon.com/blogs/aws/introducing-karpenter-an-open-source-high-performance-kubernetes-cluster-autoscaler/)

Use to automatically scale Kubernetes clusters on AWS.
- Scaling is often discussed related to compute services like Amazon EC2 instances or AWS Lambda
functions. Consider the configuration of non-compute services like [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) read and write
capacity units or [Amazon Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/) shards to match the demand.
- Verify that the metrics for scaling up or down are validated against the type of workload being deployed.
If you are deploying a video transcoding application, 100% CPU utilization is expected and should not be your primary metric.
You can use a [customized metric](https://aws.amazon.com/blogs/mt/create-amazon-ec2-auto-scaling-policy-memory-utilization-metric-linux/) (such as memory utilization) for your
scaling policy if required. To choose the right metrics, consider the following guidance for Amazon EC2:

The metric should be a valid utilization metric and describe how busy an instance is.
- The metric value must increase or decrease proportionally to the number of instances in the Auto Scaling group.

- Use [dynamic scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html) instead of
[manual scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html) for your Auto Scaling group.
We also recommend that you use [target
tracking scaling policies](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html) in your dynamic scaling.
- Verify that workload deployments can handle both scale-out and scale-in events. Create test scenarios for scale-in events to verify that the workload behaves as expected
and does not affect the user experience (like losing sticky sessions). You can use
[Activity history](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html) to verify a scaling activity for an Auto Scaling group.
- Evaluate your workload for predictable patterns and proactively scale as you anticipate predicted and planned changes in demand. With predictive scaling, you can eliminate the need to overprovision capacity. For more detail, see
[Predictive Scaling with Amazon EC2 Auto Scaling](https://aws.amazon.com/blogs/compute/introducing-native-support-for-predictive-scaling-with-amazon-ec2-auto-scaling/).

## Resources

**Related documents:**

- [Getting
Started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html)
- [Predictive
Scaling for EC2, Powered by Machine Learning](https://aws.amazon.com/blogs/aws/new-predictive-scaling-for-ec2-powered-by-machine-learning/)
- [Analyze
user behavior using Amazon OpenSearch Service, Amazon Data Firehose and Kibana](https://aws.amazon.com/blogs/database/analyze-user-behavior-using-amazon-elasticsearch-service-amazon-kinesis-data-firehose-and-kibana/)
- [What
is Amazon CloudWatch?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [Monitoring
DB load with Performance Insights on Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
- [Introducing Native Support for Predictive Scaling with Amazon EC2 Auto Scaling](https://aws.amazon.com/blogs/compute/introducing-native-support-for-predictive-scaling-with-amazon-ec2-auto-scaling/)
- [Introducing Karpenter - An Open-Source, High-Performance Kubernetes Cluster Autoscaler](https://aws.amazon.com/blogs/aws/introducing-karpenter-an-open-source-high-performance-kubernetes-cluster-autoscaler/)
- [Deep Dive on Amazon ECS Cluster Auto Scaling](https://aws.amazon.com/blogs/containers/deep-dive-on-amazon-ecs-cluster-auto-scaling/)

**Related videos:**

- [AWS re:Invent 2023 - Scaling on AWS for the first 10 million users](https://www.youtube.com/watch?v=JzuNJ8OUht0)
- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [AWS re:Invent 2022 - Build a cost-, energy-, and resource-efficient
compute environment](https://www.youtube.com/watch?v=8zsC5e1eLCg)
- [AWS re:Invent 2022 - Scaling containers from one user to millions](https://www.youtube.com/watch?v=hItHqzKoBk0)
- [AWS re:Invent 2023 - Scaling FM inference to hundreds of models with Amazon SageMaker AI](https://www.youtube.com/watch?v=6xENDvgnMCs)
- [AWS re:Invent 2023 - Harness the power of Karpenter to scale, optimize & upgrade Kubernetes](https://www.youtube.com/watch?v=lkg_9ETHeks)

**Related examples:**

- [Autoscaling](https://www.eksworkshop.com/docs/autoscaling/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a2.html*

---

# SUS02-BP02 Align SLAs with sustainability goals

Review and optimize workload service-level agreements
(SLA) based on your sustainability goals to minimize the
resources required to support your workload while continuing
to meet business needs.

**Common anti-patterns:**

- Workload SLAs are unknown or ambiguous.
- You define your SLA just for availability and performance.
- You use the same design pattern (like Multi-AZ architecture) for all your workloads.

**Benefits of establishing this best practice:** Aligning
SLAs with sustainability goals leads to optimal resource usage while meeting business
needs.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

SLAs define the level of service expected from a cloud workload,
such as response time, availability, and data retention. They
influence the architecture, resource usage, and environmental
impact of a cloud workload. At a regular cadence, review SLAs
and make trade-offs that significantly reduce resource usage
in exchange for acceptable decreases in service levels.

### Implementation steps

- **Understand sustainability goals:** Identify sustainability goals in your organization, such as carbon reduction or improving resource utilization.
- **Review SLAs:** Evaluate your SLAs to assess if they support your business requirements. If you are exceeding SLAs, perform further review.
- **Understand trade-offs:** Understand the trade-offs across your workload’s complexity (like high volume of concurrent users), performance (like latency), and sustainability impact (like required resources). Typically, prioritizing two of the factors comes at the expense of the third.
- **Adjust SLAs:** Adjust your SLAs by making trade-offs that significantly reduce sustainability impacts in exchange for acceptable decreases in service levels.

**Sustainability and reliability:** Highly available workloads tend to consume more resources.
- **Sustainability and performance:** Using more resources to boost performance could have a higher environmental impact.
- **Sustainability and security:** Overly secure workloads could have a higher environmental impact.

- **Define sustainability SLAs if possible:** Include sustainability SLAs for your workload. For example, define a minimum utilization level as a sustainability SLA for your compute instances.
- **Use efficient design patterns:** Use design patterns such as microservices on AWS that prioritize business-critical functions and allow lower service levels (such as response time or recovery time objectives) for non-critical functions.
- **Communicate and establish accountability:** Share the SLAs with all relevant stakeholders, including your development team and your customers. Use reporting to track and monitor the SLAs. Assign accountability to meet the sustainability targets for your SLAs.
- **Use incentives and rewards:** Use incentives and rewards to achieve or exceed SLAs aligned with sustainability goals.
- **Review and iterate:** Regularly review and adjust your SLAs to make sure they are aligned with evolving sustainability and performance goals.

## Resources

**Related documents:**

- [Understand resiliency patterns and trade-offs to architect efficiently in the cloud](https://aws.amazon.com/blogs/architecture/understand-resiliency-patterns-and-trade-offs-to-architect-efficiently-in-the-cloud/)
- [Importance
of Service Level Agreement for SaaS Providers](https://aws.amazon.com/blogs/apn/importance-of-service-level-agreement-for-saas-providers/)

**Related videos:**

- [AWS re:Invent 2023 - Capacity, availability, cost efficiency: Pick three](https://www.youtube.com/watch?v=E0dYLPXrX_w)
- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [AWS re:Invent 2023 - Advanced integration patterns & trade-offs for loosely coupled systems](https://www.youtube.com/watch?v=FGKGdUiZKto)
- [AWS re:Invent 2022 - Delivering sustainable, high-performing architectures](https://www.youtube.com/watch?v=FBc9hXQfat0)
- [AWS re:Invent 2022 - Build a cost-, energy-, and resource-efficient compute environment](https://www.youtube.com/watch?v=8zsC5e1eLCg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a3.html*

---

# SUS02-BP03 Stop the creation and maintenance of unused assets

Decommission unused assets in your workload to reduce
the number of cloud resources required to support your
demand and minimize waste.

**Common anti-patterns:**

- You do not analyze your application for assets that are redundant or no longer required.
- You do not remove assets that are redundant or no longer required.

**Benefits of establishing this best practice:** Removing
unused assets frees resources and improves the overall efficiency of the workload.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Unused assets consume cloud resources like storage space and compute power. By identifying and eliminating these assets, you can free up these resources, resulting in a more efficient cloud architecture. Perform regular analysis on application assets such as pre-compiled reports, datasets, static images, and asset access patterns to identify redundancy, underutilization, and potential decommission targets. Remove those redundant assets to reduce the resource waste in your workload.

### Implementation steps

- **Conduct an inventory:** Conduct a comprehensive inventory to identify all assets within your workload.
- **Analyze usage:** Use continuous monitoring to identify static assets that are no longer required.
- **Remove unused assets:** Develop a plan to remove assets that are no longer required.

Before removing any asset, evaluate the impact of removing it on the architecture.
- Consolidate overlapping generated assets to remove redundant processing.
- Update your applications to no longer produce and store assets that are not required.

- **Communicate with third parties:** Instruct third parties to stop producing and storing assets managed on your behalf that are no longer required. Ask to consolidate redundant assets.
- **Use lifecycle policies:** Use lifecycle policies to automatically delete unused assets.

You can use [Amazon S3 Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) to manage your objects throughout their lifecycle.
- You can use [Amazon Data Lifecycle Manager](https://docs.aws.amazon.com/ebs/latest/userguide/snapshot-lifecycle.html) to automate the creation, retention, and deletion of Amazon EBS snapshots and Amazon EBS-backed AMIs.

- **Review and optimize:** Regularly review your workload to identify and remove any unused assets.

## Resources

**Related documents:**

- [Optimizing
your AWS Infrastructure for Sustainability, Part II:
Storage](https://aws.amazon.com/blogs/architecture/optimizing-your-aws-infrastructure-for-sustainability-part-ii-storage/)
- [How do I terminate active resources that I no longer need on my AWS account?](https://aws.amazon.com/premiumsupport/knowledge-center/terminate-resources-account-closure/)

**Related videos:**

- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [AWS re:Invent 2022 - Preserving and maximizing the value of digital media assets using Amazon S3](https://www.youtube.com/watch?v=8OI0Uu-YvD8)
- [AWS re:Invent 2023 - Optimize costs in your multi-account environments](https://www.youtube.com/watch?v=ie_Mqb-eC4A)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a4.html*

---

# SUS02-BP04 Optimize geographic placement of workloads based on their networking requirements

Select cloud location and services for your workload that reduce the distance network
traffic must travel and decrease the total network resources required to support your workload.

**Common anti-patterns:**

- You select the workload's Region based on your own location.
- You consolidate all workload resources into one geographic location.
- All traffic flows through your existing data centers.

**Benefits of establishing this best practice:** Placing a workload close
to its users provides the lowest latency while decreasing data movement across
the network and reducing environmental impact.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The AWS Cloud infrastructure is built around location options such as Regions, Availability Zones,
placement groups, and edge locations such as [AWS Outposts](https://docs.aws.amazon.com/outposts/latest/userguide/what-is-outposts.html) and [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/). These location options
are responsible for maintaining connectivity between application components, cloud services, edge networks and on-premises data centers.

Analyze the network access patterns in your workload to identify how to use these cloud location options and reduce the distance network traffic must travel.

## Implementation steps

- Analyze network access patterns in your workload to identify how users use your application.

Use monitoring tools, such as [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and [AWS CloudTrail](https://aws.amazon.com/cloudtrail/), to gather data on network activities.
- Analyze the data to identify the network access pattern.

- Select the Regions for your workload deployment based on the following key elements:

**Your Sustainability goal:** as explained in [Region selection](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/region-selection.html).
- **Where your data is located:** For data-heavy applications (such as big data and machine learning),
application code should run as close to the data as possible.
- **Where your users are located:** For user-facing
applications, choose a Region (or Regions) close to your workload’s users.
- **Other constraints:** Consider constraints such as
cost and compliance as explained in [What to Consider when Selecting a Region for your Workloads](https://aws.amazon.com/blogs/architecture/what-to-consider-when-selecting-a-region-for-your-workloads/).

- Use local caching or [AWS
Caching Solutions](https://aws.amazon.com/caching/aws-caching/) for frequently used assets to improve performance, reduce
data movement, and lower environmental impact.

Service
When to use

[Amazon CloudFront](https://aws.amazon.com/cloudfront/)

Use to cache static content such as images, scripts, and videos, as well as dynamic content
such as API responses or web applications.

[Amazon ElastiCache](https://aws.amazon.com/elasticache/)

Use to cache content for web applications.

[DynamoDB Accelerator](https://aws.amazon.com/dynamodb/dax/)

Use to add in-memory acceleration to your DynamoDB tables.
- Use services that can help you run code closer to users of your workload:

Service
When to use

[Lambda@Edge](https://aws.amazon.com/lambda/edge/)

Use for
compute-heavy operations that are initiated when objects are not in the cache.

[Amazon CloudFront Functions](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-functions.html)

Use for simple use cases like HTTP(s) request or response manipulations
that can be initiated by short-lived functions.

[AWS IoT Greengrass](https://aws.amazon.com/greengrass/)

Use to run local compute, messaging, and data caching for connected devices.
- Use connection pooling to allow for connection reuse and reduce required
resources.
- Use distributed data stores that don’t rely on persistent connections and synchronous updates for consistency to serve regional populations.
- Replace pre-provisioned static network capacity with shared dynamic capacity, and share the sustainability impact of network capacity with other subscribers.

## Resources

**Related documents:**

- [Optimizing
your AWS Infrastructure for Sustainability, Part III:
Networking](https://aws.amazon.com/blogs/architecture/optimizing-your-aws-infrastructure-for-sustainability-part-iii-networking/)
- [Amazon ElastiCache Documentation](https://docs.aws.amazon.com/elasticache/index.html)
- [What
is Amazon CloudFront?](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)
- [Amazon CloudFront Key Features](https://aws.amazon.com/cloudfront/features/)
- [AWS Global Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
- [AWS Local Zones and AWS Outposts, choosing the right technology for your edge workload](https://aws.amazon.com/blogs/compute/aws-local-zones-and-aws-outposts-choosing-the-right-technology-for-your-edge-workload/)
- [Placement groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/)
- [AWS Outposts](https://aws.amazon.com/outposts/)

**Related videos:**

- [Demystifying data transfer on AWS](https://www.youtube.com/watch?v=-MqXgzw1IGA)
- [Scaling network performance on next-gen Amazon EC2 instances](https://www.youtube.com/watch?v=jNYpWa7gf1A)
- [AWS Local Zones Explainer Video](https://www.youtube.com/watch?v=JHt-D4_zh7w)
- [AWS Outposts: Overview and How it Works](https://www.youtube.com/watch?v=ppG2FFB0mMQ)
- [AWS re:Invent 2023 - A migration strategy for edge and on-premises workloads](https://www.youtube.com/watch?v=4wUXzYNLvTw)
- [AWS re:Invent 2021 - AWS Outposts: Bringing the AWS experience on premises](https://www.youtube.com/watch?v=FxVF6A22498)
- [AWS re:Invent 2020 - AWS Wavelength: Run apps with ultra-low latency at 5G edge](https://www.youtube.com/watch?v=AQ-GbAFDvpM)
- [AWS re:Invent 2022 - AWS Local Zones: Building applications for a distributed edge](https://www.youtube.com/watch?v=bDnh_d-slhw)
- [AWS re:Invent 2021 - Building low-latency websites with Amazon CloudFront](https://www.youtube.com/watch?v=9npcOZ1PP_c)
- [AWS re:Invent 2022 - Improve performance and availability with AWS Global Accelerator](https://www.youtube.com/watch?v=s5sjsdDC0Lg)
- [AWS re:Invent 2022 - Build your global wide area network using AWS](https://www.youtube.com/watch?v=flBieylTwvI)
- [AWS re:Invent 2020: Global traffic management with Amazon Route 53](https://www.youtube.com/watch?v=E33dA6n9O7I)

**Related examples:**

- [AWS Networking
Workshops](https://catalog.workshops.aws/networking/en-US)
- [Architecting for sustainability - Minimize data movement across networks](https://catalog.us-east-1.prod.workshops.aws/workshops/7c4f8394-8081-4737-aa1b-6ae811d46e0a/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a5.html*

---

# SUS02-BP05 Optimize team member resources for activities performed

Optimize resources provided to team members to minimize the
environmental sustainability impact while supporting their needs.

**Common anti-patterns:**

- You ignore the impact of devices used by your team members on the overall efficiency of your cloud application.
- You manually manage and update resources used by team members.

**Benefits of establishing this best practice:** Optimizing
team member resources improves the overall efficiency of cloud-enabled applications.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Understand the resources your team members use to consume your services, their expected lifecycle, and the financial and sustainability impact. Implement strategies to optimize these resources. For example, perform complex operations, such as rendering and compilation, on highly utilized scalable infrastructure instead of on underutilized high-powered single-user systems.

### Implementation steps

- **Use energy-efficient workstations:** Provide team members with energy-efficient workstations and peripherals. Use efficient power management features (like low power mode) in these devices to reduce their energy usage
- **use virtualization:** Use virtual desktops and application streaming to limit upgrade and device requirements.
- **Encourage remote collaboration:** Encourage team members to use remote collaboration tools such as [Amazon Chime](https://aws.amazon.com/chime/) or [AWS Wickr](https://aws.amazon.com/wickr/) to reduce the need for travel and associated carbon emissions.
- **Use energy-efficient software:** Provide team members with energy-efficient software by removing or turning off unnecessary features and processes.
- **Manage lifecycles:** Evaluate the impact of processes and systems on your device lifecycle, and select solutions that minimize the requirement for device replacement while satisfying business requirements. Regularly maintain and update workstations or software to maintain and improve efficiency.
- **Remote device management:** Implement remote management for devices to reduce required business travel.

[AWS Systems Manager Fleet Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/fleet.html) is a unified user interface (UI) experience that helps you remotely manage your nodes running on AWS or on premises.

## Resources

**Related documents:**

- [What
is Amazon WorkSpaces?](https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces.html)
- [Cost Optimizer for Amazon WorkSpaces](https://docs.aws.amazon.com/solutions/latest/cost-optimizer-for-workspaces/overview.html)
- [Amazon
AppStream 2.0 Documentation](https://docs.aws.amazon.com/appstream2/)
- [NICE
DCV](https://docs.aws.amazon.com/dcv/)

**Related videos:**

- [Managing cost for Amazon WorkSpaces on AWS](https://www.youtube.com/watch?v=0MoY31hZQuE)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a6.html*

---

# SUS02-BP06 Implement buffering or throttling to flatten the demand curve

Buffering and throttling flatten the demand curve and reduce the provisioned capacity required for your workload.

**Common anti-patterns:**

- You process the client requests immediately while it is not needed.
- You do not analyze the requirements for client requests.

**Benefits of establishing this best practice:** Flattening the demand curve reduce the required provisioned capacity for the workload. Reducing the provisioned capacity means less energy consumption and less environmental impact.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Flattening the workload demand curve can help you to reduce the provisioned capacity for a workload and reduce its environmental impact. Assume a workload with the demand curve shown in below figure. This workload has two peaks, and to handle those peaks, the resource capacity as shown by orange line is provisioned. The resources and energy used for this workload is not indicated by the area under the demand curve, but the area under the provisioned capacity line, as provisioned capacity is needed to handle those two peaks.

*Demand curve with two distinct peaks that require high provisioned capacity.*

You can use buffering or throttling to modify the demand curve and smooth out the peaks, which means less provisioned capacity and less energy consumed. Implement throttling when your clients can perform retries. Implement buffering to store the request and defer processing until a later time.

*Throttling's effect on the demand curve and provisioned capacity.*

**Implementation steps**

- Analyze the client requests to determine how to respond to them. Questions to consider include:

Can this request be processed asynchronously?
- Does the client have retry capability?

- If the client has retry capability, then you can implement throttling, which tells the source that if it cannot service the request at the current time, it should try again later.

You can use [Amazon API Gateway](https://aws.amazon.com/api-gateway/) to implement throttling.

- For clients that cannot perform retries, a buffer needs to be implemented to flatten the demand curve. A buffer defers request processing, allowing applications that run at different rates to communicate effectively. A buffer-based approach uses a queue or a stream to accept messages from producers. Messages are read by consumers and processed, allowing the messages to run at the rate that meets the consumers’ business requirements.

[Amazon Simple Queue Service (Amazon SQS)](https://aws.amazon.com/sqs/) is a managed service that provides queues that allow a single consumer to read individual messages.
- [Amazon Kinesis](https://aws.amazon.com/kinesis/) provides a stream that allows many consumers to read the same messages.

- Analyze the overall demand, rate of change, and required response time to right size the throttle or buffer required.

## Resources

**Related documents:**

- [Getting started with Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-getting-started.html)
- [Application integration Using Queues and Messages](https://aws.amazon.com/blogs/architecture/application-integration-using-queues-and-messages/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [Throttling a tiered, multi-tenant REST API at scale using API Gateway](https://aws.amazon.com/blogs/architecture/throttling-a-tiered-multi-tenant-rest-api-at-scale-using-api-gateway-part-1/)
- [Application integration Using Queues and Messages](https://aws.amazon.com/blogs/architecture/application-integration-using-queues-and-messages/)

**Related videos:**

- [AWS re:Invent 2022 - Application integration patterns for microservices](https://www.youtube.com/watch?v=GoBOivyE7PY)
- [AWS re:Invent 2023 - Smart savings: Amazon EC2 cost-optimization strategies](https://www.youtube.com/watch?v=_AHPbxzIGV0)
- [AWS re:Invent 2023 - Advanced integration patterns & trade-offs for loosely coupled systems](https://www.youtube.com/watch?v=FGKGdUiZKto)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a7.html*

---
