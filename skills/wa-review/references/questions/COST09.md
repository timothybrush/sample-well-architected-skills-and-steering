# COST 9 — How do you manage demand, and supply resources?

**Pillar**: Cost Optimization  
**Best Practices**: 3

---

# COST09-BP01 Perform an analysis on the workload demand

Analyze the demand of the workload over time. Verify that the
analysis covers seasonal trends and accurately represents operating
conditions over the full workload lifetime. Analysis effort should
reflect the potential benefit, for example, time spent is
proportional to the workload cost.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Analyzing workload demand for cloud computing involves
understanding the patterns and characteristics of computing tasks
that are initiated in the cloud environment. This analysis helps
users optimize resource allocation, manage costs, and verify that
performance meets required levels.

Know the requirements of the workload. Your organization's
requirements should indicate the workload response times for
requests. The response time can be used to determine if the demand
is managed, or if the supply of resources should change to meet
the demand.

The analysis should include the predictability and repeatability
of the demand, the rate of change in demand, and the amount of
change in demand. Perform the analysis over a long enough period
to incorporate any seasonal variance, such as end-of-month
processing or holiday peaks.

Analysis effort should reflect the potential benefits of
implementing scaling. Look at the expected total cost of the
component and any increases or decreases in usage and cost over
the workload's lifetime.

The following are some key aspects to consider when performing
workload demand analysis for cloud computing:

- **Resource utilization and performance
metrics**: Analyze how AWS resources are being used
over time. Determine peak and off-peak usage patterns to
optimize resource allocation and scaling strategies. Monitor
performance metrics such as response times, latency,
throughput, and error rates. These metrics help assess the
overall health and efficiency of the cloud infrastructure.
- **User and application scaling
behaviour**: Understand user behavior and how it
affects workload demand. Examining the patterns of user
traffic assists in enhancing the delivery of content and the
responsiveness of applications. Analyze how workloads scale
with increasing demand. Determine whether auto-scaling
parameters are configured correctly and effectively for
handling load fluctuations.
- **Workload types**: Identify
the different types of workloads running in the cloud, such as
batch processing, real-time data processing, web applications,
databases, or machine learning. Each type of workload may have
different resource requirements and performance profiles.
- **Service-level agreements
(SLAs)**: Compare actual performance with SLAs to
ensure compliance and identify areas that need improvement.

You can use
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to collect and track metrics, monitor log files,
set alarms, and automatically react to changes in your AWS
resources. You can also use Amazon CloudWatch to gain system-wide
visibility into resource utilization, application performance, and
operational health.

With
[AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/), you can provision your resources following
best practices to improve system performance and reliability,
increase security, and look for opportunities to save money. You
can also turn off non-production instances and use Amazon CloudWatch and Auto Scaling to match increases or reductions in
demand.

Finally, you can use
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) or
[Quick](https://aws.amazon.com/quicksight/) with the AWS Cost and Usage Report (CUR) file or your application
logs to perform advanced analysis of workload demand.

Overall, a comprehensive workload demand analysis allows
organizations to make informed decisions about resource
provisioning, scaling, and optimization, leading to better
performance, cost efficiency, and user satisfaction.

### Implementation steps

- **Analyze existing workload
data:** Analyze data from the existing workload,
previous versions of the workload, or predicted usage
patterns. Use Amazon CloudWatch, log files and monitoring
data to gain insight on how workload was used. Analyze a
full cycle of the workload, and collect data for any
seasonal changes such as end-of-month or end-of-year events.
The effort reflected in the analysis should reflect the
workload characteristics. The largest effort should be
placed on high-value workloads that have the largest changes
in demand. The least effort should be placed on low-value
workloads that have minimal changes in demand.
- **Forecast outside
influence:** Meet with team members from across the
organization that can influence or change the demand in the
workload. Common teams would be sales, marketing, or
business development. Work with them to know the cycles they
operate within, and if there are any events that would
change the demand of the workload. Forecast the workload
demand with this data.

## Resources

**Related documents:**

- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS X-Ray](https://aws.amazon.com/xray/)
- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Instance Scheduler](https://aws.amazon.com/answers/infrastructure-management/instance-scheduler/)
- [Getting
started with Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-getting-started.html)
- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
- [Quick](https://aws.amazon.com/quicksight/)

**Related examples:**

- [Monitor,
Track and Analyze for cost optimization](https://aws.amazon.com/aws-cost-management/aws-cost-optimization/monitor-track-and-analyze/)
- [Searching
and analyzing logs in CloudWatch](https://docs.aws.amazon.com/prescriptive-guidance/latest/implementing-logging-monitoring-cloudwatch/cloudwatch-search-analysis.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_cost_analysis.html*

---

# COST09-BP02 Implement a buffer or throttle to manage demand

Buffering and throttling modify the demand on your workload,
smoothing out any peaks. Implement throttling when your clients
perform retries. Implement buffering to store the request and defer
processing until a later time. Verify that your throttles and
buffers are designed so clients receive a response in the required
time.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Implementing a buffer or throttle is crucial in cloud computing in order to manage demand and reduce the provisioned capacity required for your workload. For optimal performance, it's essential to gauge the total demand, including peaks, the pace of change in requests, and the necessary response time. When clients have the ability to resend their requests, it becomes practical to apply throttling. Conversely, for clients lacking retry functionalities, the ideal approach is implementing a buffer solution. Such buffers streamline the influx of requests and optimize the interaction of applications with varied operational speeds.

*Demand curve with two distinct peaks that require high provisioned capacity*

Assume a workload with the demand curve shown in preceding image. This workload has two peaks, and to handle those peaks, the resource capacity as shown by orange line is provisioned. The resources and energy used for this workload are not indicated by the area under the demand curve, but the area under the provisioned capacity line, as provisioned capacity is needed to handle those two peaks. Flattening the workload demand curve can help you to reduce the provisioned capacity for a workload and reduce its environmental impact. To smooth out the peak, consider to implement throttling or buffering solution.

To understand them better, let’s explore throttling and buffering.

**Throttling:** If the source of the demand has retry
capability, then you can implement throttling. Throttling tells the source that if it cannot
service the request at the current time, it should try again later. The source waits for a
period of time, and then retries the request. Implementing throttling has the advantage of
limiting the maximum amount of resources and costs of the workload. In AWS, you can use
[Amazon API Gateway](https://aws.amazon.com/api-gateway/) to implement throttling.

**Buffer based:** A buffer-based approach uses *producers* (components that send messages to the queue), *consumers* (components that receive messages from the queue), and a *queue* (which holds messages) to store the messages. Messages are read by consumers and processed, allowing the messages to run at the rate that meets the consumers’ business requirements. By using a buffer-centric methodology, messages from producers are housed in queues or streams, ready to be accessed by consumers at a pace that aligns with their operational demands.

In AWS, you can choose from multiple services to implement a buffering approach. [Amazon Simple Queue Service(Amazon SQS)](https://aws.amazon.com/sqs/) is a managed service that
provides queues that allow a single consumer to read individual messages. [Amazon Kinesis](https://aws.amazon.com/kinesis/) provides a stream that allows many
consumers to read the same messages.

Buffering and throttling can smooth out any peaks by modifying the demand on your workload. Use throttling when clients retry actions and use buffering to hold the request and process it later. When working with a buffer-based approach, architect your workload to service the request in the required time, verify that you are able to handle duplicate requests for work. Analyze the overall demand, rate of change, and required response time to right size the throttle or buffer required.

### Implementation steps

- **Analyze the client requirements:** Analyze the client requests to determine if they are capable of performing retries. For clients that cannot perform retries, buffers need to be implemented. Analyze the overall demand, rate of change, and required response time to determine the size of throttle or buffer required.
- **Implement a buffer or throttle:** Implement a buffer
or throttle in the workload. A queue such as Amazon Simple Queue Service (Amazon SQS) can provide a buffer to
your workload components. Amazon API Gateway can provide throttling for your workload components.

## Resources

**Related best practices:**

- [SUS02-BP06 Implement buffering or throttling to flatten the demand curve](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_user_a7.html)
- [REL05-BP02 Throttle requests](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_throttle_requests.html)

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Instance Scheduler](https://aws.amazon.com/answers/infrastructure-management/instance-scheduler/)
- [Amazon API Gateway](https://aws.amazon.com/api-gateway/)
- [Amazon Simple Queue Service](https://aws.amazon.com/sqs/)
- [Getting
started with Amazon SQS](https://aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-getting-started.html)
- [Amazon Kinesis](https://aws.amazon.com/kinesis/)

**Related videos:**

- [Choosing the Right Messaging Service for Your Distributed App](https://www.youtube.com/watch?v=4-JmX6MIDDI)

**Related examples:**

- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [Throttling a tiered, multi-tenant REST API at scale using API Gateway](https://aws.amazon.com/blogs/architecture/throttling-a-tiered-multi-tenant-rest-api-at-scale-using-api-gateway-part-1/)
- [Enabling Tiering and Throttling in a Multi-Tenant Amazon EKS SaaS Solution Using Amazon API Gateway](https://aws.amazon.com/blogs/apn/enabling-tiering-and-throttling-in-a-multi-tenant-amazon-eks-saas-solution-using-amazon-api-gateway/)
- [Application integration Using Queues and Messages](https://aws.amazon.com/blogs/architecture/application-integration-using-queues-and-messages/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_buffer_throttle.html*

---

# COST09-BP03 Supply resources dynamically

Resources are provisioned in a planned manner. This can be demand-based, such as through automatic scaling, or time-based, where demand is predictable and resources are provided based on time. These methods result in the least amount of over-provisioning or under-provisioning.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

There are several ways for AWS customers to increase the resources available to their applications and supply resources to meet the demand. One of these options is to use AWS Instance Scheduler, which automates the starting and stopping of Amazon Elastic Compute Cloud (Amazon EC2) and Amazon Relational Database Service (Amazon RDS) instances. The other option is to use AWS Auto Scaling, which allows you to automatically scale your computing resources based on the demand of your application or service. Supplying resources based on demand will allow you to pay for the resources you use only, reduce cost by launching resources when they are needed, and terminate them when they aren't.

[AWS Instance Scheduler](https://aws.amazon.com/solutions/implementations/instance-scheduler-on-aws/)
allows you to configure the stop and start of your Amazon EC2 and Amazon RDS instances
at defined times so that you can meet the demand for the same resources within a consistent time
pattern such as every day user access Amazon EC2 instances at eight in the morning that they don’t need
after six at night. This solution helps reduce operational cost by stopping resources that are
not in use and starting them when they are needed.

*Cost optimization with AWS Instance Scheduler.*

You can also easily configure schedules for your Amazon EC2 instances across your accounts and Regions with a simple user interface (UI) using AWS Systems Manager Quick Setup. You can schedule Amazon EC2 or Amazon RDS instances with AWS Instance Scheduler and you can stop and start existing instances. However, you cannot stop and start instances which are part of your Auto Scaling group (ASG) or that manage services such as Amazon Redshift or Amazon OpenSearch Service. Auto Scaling groups have their own scheduling for the instances in the group and these instances are created.

[AWS Auto Scaling](https://aws.amazon.com/autoscaling/) helps you adjust your capacity to maintain steady, predictable performance at the lowest possible cost to meet changing demand. It is a fully managed and free service to scale the capacity of your application that integrates with Amazon EC2 instances and Spot Fleets, Amazon ECS, Amazon DynamoDB, and Amazon Aurora. Auto Scaling provides automatic resource discovery to help find resources in your workload that can be configured, it has built-in scaling strategies to optimize performance, costs, or a balance between the two, and provides predictive scaling to assist with regularly occurring spikes.

There are multiple scaling options available to scale your Auto Scaling group:

- Maintain current instance levels at all times
- Scale manually
- Scale based on a schedule
- Scale based on demand
- Use predictive scaling

Auto Scaling policies differ and can be categorized as dynamic and scheduled scaling policies. Dynamic policies are manual or dynamic scaling which, scheduled or predictive scaling. You can use scaling policies for dynamic, scheduled, and predictive scaling. You can also use metrics and alarms from [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to trigger scaling events for your workload. We recommend you use [launch templates](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html), which allow you to access the latest features and improvements. Not all Auto Scaling features are available when you use launch configurations. For example, you cannot create an Auto Scaling group that launches both Spot and On-Demand Instances or that specifies multiple instance types. You must use a launch template to configure these features. When using launch templates, we recommended you version each one. With versioning of launch templates, you can create a subset of the full set of parameters. Then, you can reuse it to create other versions of the same launch template.

You can use AWS Auto Scaling or incorporate scaling in your code with [AWS APIs or SDKs](https://aws.amazon.com/developer/tools/). This reduces your overall workload costs by removing the operational cost from manually making changes to your environment, and changes can be performed much faster. This also matches your workload resourcing to your demand at any time. In order to follow this best practice and supply resources dynamically for your organization, you should understand horizontal and vertical scaling in the AWS Cloud, as well as the nature of the applications running on Amazon EC2 instances. It is better for your Cloud Financial Management team to work with technical teams to follow this best practice.

[Elastic Load Balancing (Elastic Load Balancing)](https://aws.amazon.com/elasticloadbalancing/) helps you scale by distributing demand across multiple resources. By using ASG and Elastic Load Balancing, you can manage incoming requests by optimally routing traffic so that no one instance is overwhelmed in an Auto Scaling group. The requests would be distributed among all the targets of a target group in a round-robin fashion without consideration for capacity or utilization.

Typical metrics can be standard Amazon EC2 metrics, such as CPU utilization, network throughput, and Elastic Load Balancing observed request and response latency. When possible, you should use a metric that is indicative of customer experience, typically a custom metric that might originate from application code within your workload. To elaborate how to meet the demand dynamically in this document, we will group Auto Scaling into two categories as demand-based and time-based supply models and deep dive into each.

**Demand-based supply:** Take advantage of elasticity of the cloud to supply resources to meet changing demand by relying on near real-time demand state. For demand-based supply, use APIs or service features to programmatically vary the amount of cloud resources in your architecture. This allows you to scale components in your architecture and increase the number of resources during demand spikes to maintain performance and decrease capacity when demand subsides to reduce costs.

*Demand-based dynamic scaling policies*

- **Simple/Step Scaling:** Monitors metrics and adds/removes instances as per steps defined by the customers manually.
- **Target Tracking:** Thermostat-like control mechanism that automatically adds or removes instances to maintain metrics at a customer defined target.

When architecting with a demand-based approach keep in mind two key considerations.
First, understand how quickly you must provision new resources. Second, understand that
the size of margin between supply and demand will shift. You must be ready to cope with
the rate of change in demand and also be ready for resource failures.

**Time-based supply:** A time-based approach aligns resource
capacity to demand that is predictable or well-defined by time. This approach is typically not
dependent upon utilization levels of the resources. A time-based approach ensures that
resources are available at the specific time they are required and can be provided without
any delays due to start-up procedures and system or consistency checks. Using a time-based
approach, you can provide additional resources or increase capacity during busy
periods.

*Time-based scaling policies*

You can use scheduled or predictive auto scaling to implement a time-based approach. Workloads can be
scheduled to scale out or in at defined times (for example, the start of business hours),
making resources available when users arrive or demand increases. Predictive scaling uses
patterns to scale out while scheduled scaling uses pre-defined times to scale out. You can
also use [attribute-based instance type selection (ABS) strategy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html) in Auto Scaling groups,
which lets you express your instance requirements as a set of attributes, such as vCPU,
memory, and storage. This also allows you to automatically use newer generation instance
types when they are released and access a broader range of capacity with Amazon EC2 Spot Instances.
Amazon EC2 Fleet and Amazon EC2 Auto Scaling select and launch instances that fit the specified attributes,
removing the need to manually pick instance types.

You can also leverage the [AWS APIs
and SDKs](https://aws.amazon.com/developer/tools/) and [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
to automatically provision and decommission entire environments as you need them. This
approach is well suited for development or test environments that run only in defined business
hours or periods of time. You can use APIs to scale the size of resources within an environment (vertical scaling). For
example, you could scale up a production workload by changing the instance size or class.
This can be achieved by stopping and starting the instance and selecting the different
instance size or class. This technique can also be applied to other resources, such as Amazon EBS
Elastic Volumes, which can be modified to increase size, adjust performance (IOPS) or
change the volume type while in use.

When architecting with a time-based approach keep in mind two key considerations. First,
how consistent is the usage pattern? Second, what is the impact if the pattern changes? You
can increase the accuracy of predictions by monitoring your workloads and by using
business intelligence. If you see significant changes in the usage pattern, you can adjust the
times to ensure that coverage is provided.

## Implementation steps

- **Configure scheduled scaling:**For predictable
changes in demand, time-based scaling can provide the correct number of resources in a
timely manner. It is also useful if resource creation and configuration is not fast enough
to respond to changes on demand. Using the workload analysis configure scheduled scaling
using AWS Auto Scaling. To configure time-based scheduling, you can use predictive scaling of scheduled
scaling to increase the number of Amazon EC2 instances in your Auto Scaling groups in advance according
to expected or predictable load changes.
- **Configure predictive scaling:** Predictive scaling allows you
to increase the number of Amazon EC2 instances in your Auto Scaling group in advance of daily and
weekly patterns in traffic flows. If you have regular traffic spikes and applications that
take a long time to start, you should consider using predictive scaling. Predictive scaling
can help you scale faster by initializing capacity before projected load compared to dynamic
scaling alone, which is reactive in nature. For example, if users start using your workload
with the start of the business hours and don’t use after hours, then predictive scaling can
add capacity before the business hours which eliminates delay of dynamic scaling to react to
changing traffic.
- **Configure dynamic automatic scaling:**To configure scaling based
on active workload metrics, use Auto Scaling. Use the analysis and configure Auto Scaling to launch on the
correct resource levels, and verify that the workload scales in the required time. You can launch
and automatically scale a fleet of On-Demand Instances and Spot Instances within a single
Auto Scaling group. In addition to receiving discounts for using Spot Instances, you can use
Reserved Instances or a Savings Plan to receive discounted rates of the regular On-Demand
Instance pricing. All of these factors combined help you to optimize your cost savings for
Amazon EC2 instances and help you get the desired scale and performance for your application.

## Resources

**Related documents:**

- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [AWS Instance Scheduler](https://aws.amazon.com/answers/infrastructure-management/instance-scheduler/)
- Scale the size of your Auto Scaling group
- [Getting
Started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html)
- [Getting
started with Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-getting-started.html)
- [Scheduled
Scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html)
- [Predictive scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html)

**Related videos:**

- [Target Tracking Scaling Policies for Auto Scaling](https://www.youtube.com/watch?v=-RumeaoPB2M)
- [AWS Instance Scheduler](https://www.youtube.com/watch?v=nTLEyo2NzUs)

**Related examples:**

- [Attribute based Instance Type Selection for Auto Scaling for Amazon EC2 Fleet](https://aws.amazon.com/blogs/aws/new-attribute-based-instance-type-selection-for-ec2-auto-scaling-and-ec2-fleet/)
- [Optimizing Amazon Elastic Container Service for cost using scheduled scaling](https://aws.amazon.com/blogs/containers/optimizing-amazon-elastic-container-service-for-cost-using-scheduled-scaling/)
- [Predictive Scaling with Amazon EC2 Auto Scaling](https://aws.amazon.com/blogs/compute/introducing-native-support-for-predictive-scaling-with-amazon-ec2-auto-scaling/)
- [How do I use Instance Scheduler with CloudFormation to schedule Amazon EC2 instances?](https://aws.amazon.com/premiumsupport/knowledge-center/stop-start-instance-scheduler/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_dynamic.html*

---
