# REL 7 — How do you design your workload to adapt to changes in demand?

**Pillar**: Reliability  
**Best Practices**: 4

---

# REL07-BP01 Use automation when obtaining or scaling resources

A cornerstone of reliability in the cloud is the programmatic
definition, provisioning, and management of your infrastructure and
resources. Automation helps you streamline resource provisioning,
facilitate consistent and secure deployments, and scale resources
across your entire infrastructure.

**Desired outcome**: You manage your
infrastructure as code (IaC). You define and maintain your
infrastructure code in version control systems (VCS). You delegate
provisioning AWS resources to automated mechanisms and leverage
managed services like Application Load Balancer (ALB), Network Load
Balancer (NLB), and Auto Scaling groups. You provision your
resources using continuous integration/continuous delivery (CI/CD)
pipelines so that code changes automatically initiate resource
updates, including updates to your Auto Scaling configurations.

**Common anti-patterns**:

- You deploy resources manually using the command line or at the
AWS Management Console (also known as *click-ops*).
- You tightly couple your application components or resources, and
create inflexible architectures as a result.
- You implement inflexible scaling policies that do not adapt to
changing business requirements, traffic patterns, or new
resource types.
- You manually estimate capacity to meet anticipated demand.

**Benefits of establishing this best
practice**: Infrastructure as code (IaC) allows
infrastructure to be defined programmatically. This helps you manage
infrastructure changes through the same software development
lifecycle as application changes, which promotes consistency and
repeatability and reduces the risk of manual, error-prone tasks. You
can further streamline the process of provisioning and updating
resources through implementing IaC with automated delivery
pipelines. You can deploy infrastructure updates reliably and
efficiently without the need for manual intervention. This agility
is particularly important when scaling resources to meet fluctuating
demands.

You can achieve dynamic, automated resource scaling in conjunction
with IaC and delivery pipelines. By monitoring key metrics and
applying predefined scaling policies, Auto Scaling can automatically
provision or deprovision resources as needed, which improves
performance and cost-efficiency. This reduces the potential for
manual errors or delays in response to changes in application or
workload requirements.

The combination of IaC, automated delivery pipelines, and Auto
Scaling helps organizations provision, update, and scale their
environments with confidence. This automation is essential to
maintain a responsive, resilient, and efficiently-managed cloud
infrastructure.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To set up automation with CI/CD pipelines and infrastructure as
code (IaC) for your AWS architecture, choose a version control
system such as Git to store your IaC templates and configuration.
These templates can be written using tools such as
[AWS CloudFormation](https://aws.amazon.com/cloudformation/). To start, define your infrastructure
components (such as AWS VPCs, Amazon EC2 Auto Scaling Groups, and
Amazon RDS databases) within these templates.

Next, integrate these IaC templates with a CI/CD pipeline to
automate the deployment process.
[AWS CodePipeline](https://aws.amazon.com/codepipeline/) provides a seamless AWS-native solution, or
you can use other third-party CI/CD solutions. Create a pipeline
that activates when changes occur to your version control
repository. Configure the pipeline to include stages that lint and
validate your IaC templates, deploy the infrastructure to a
staging environment, run automated tests, and finally, deploy to
production. Incorporate approval steps where necessary to maintain
control over changes. This automated pipeline not only speeds up
deployment but also facilitates consistency and reliability across
environments.

Configure Auto Scaling of resources such as Amazon EC2 instances,
Amazon ECS tasks, and database replicas in your IaC to provide
automatic scale-out and scale-in as needed. This approach enhances
application availability and performance and optimizes cost by
dynamically adjusting resources based on demand. For a list of
supported resources, see
[Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html) and
[AWS Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).

### Implementation steps

- Create and use a source code repository to store the code
that controls your infrastructure configuration. Commit
changes to this repository to reflect any ongoing changes
you want to make.
- Select an infrastructure as code solution such as AWS CloudFormation to keep your infrastructure up to date and
detect inconsistency (drift) from your intended state.
- Integrate your IaC platform with your CI/CD pipeline to
automate deployments.
- Determine and collect the appropriate metrics for automatic
scaling of resources.
- Configure automatic scaling of resources using scale-out and
scale-in policies appropriate for your workload components.
Consider using scheduled scaling for predictable usage
patterns.
- Monitor deployments to detect failures and regressions.
Implement rollback mechanisms within your CI/CD platform to
revert changes if necessary.

## Resources

**Related documents:**

- [AWS Auto Scaling: How Scaling Plans Work](https://docs.aws.amazon.com/autoscaling/plans/userguide/how-it-works.html)
- [AWS Marketplace: products that can be used with auto
scaling](https://aws.amazon.com/marketplace/search/results?searchTerms=Auto+Scaling)
- [Managing
Throughput Capacity Automatically with DynamoDB Auto
Scaling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html)
- [Using
a load balancer with an Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html)
- [What
Is AWS Global Accelerator?](https://docs.aws.amazon.com/global-accelerator/latest/dg/what-is-global-accelerator.html)
- [What
Is Amazon EC2 Auto Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [What
is AWS Auto Scaling?](https://docs.aws.amazon.com/autoscaling/plans/userguide/what-is-aws-auto-scaling.html)
- [What
is Amazon CloudFront?](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html?ref=wellarchitected)
- [What
is Amazon Route 53?](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)
- [What
is Elastic Load Balancing?](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html)
- [What
is a Network Load Balancer?](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [What
is an Application Load Balancer?](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [Integrating
Jenkins with AWS CodeBuild and AWS CodeDeploy](https://aws.amazon.com/blogs/devops/setting-up-a-ci-cd-pipeline-by-integrating-jenkins-with-aws-codebuild-and-aws-codedeploy/)
- [Creating
a four stage pipeline with AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/tutorials-four-stage-pipeline.html)

**Related videos:**

- [Back
to Basics: Deploy Your Code to Amazon EC2](https://www.youtube.com/watch?v=f2wvEQ_sWS8)
- [AWS Supports You | Starting Your Infrastructure as Code Solution Using
AWS CloudFormation Templates](https://www.youtube.com/watch?v=bgfx76jr7tA)
- [Streamline
Your Software Release Process Using AWS CodePipeline](https://www.youtube.com/watch?v=zMa5gTLrzmQ)
- [Monitor
AWS Resources Using Amazon CloudWatch Dashboards](https://www.youtube.com/watch?v=I7EFLChc07M)
- [Create
Cross Account & Cross Region CloudWatch Dashboards | Amazon Web Services](https://www.youtube.com/watch?v=eIUZdaqColg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_autoscale_adapt.html*

---

# REL07-BP02 Obtain resources upon detection of impairment to a workload

Scale resources reactively when necessary if availability is
impacted, to restore workload availability.

You first must configure health checks and the criteria on these
checks to indicate when availability is impacted by lack of
resources. Then, either notify the appropriate personnel to manually
scale the resource, or start automation to automatically scale it.

Scale can be manually adjusted for your workload (for example,
changing the number of EC2 instances in an Auto Scaling group, or
modifying throughput of a DynamoDB table through the AWS Management Console or AWS CLI). However, automation should be used
whenever possible (refer to **Use automation
when obtaining or scaling resources**).

**Desired outcome:** Scaling activities (either automatically or manually) are initiated to restore availability upon detection of a failure or degraded customer experience.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Implement observability and monitoring across all components in your workload, to monitor customer experience and detect failure. Define the procedures, manual or automated, that scale the required resources. o For more information, see [REL11-BP01 Monitor all components of the workload to detect failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_monitoring_health.html).

### Implementation steps

- Define the procedures, manual or automated, that scale the required resources.

Scaling procedures depend on how the different components within your workload are designed.
- Scaling procedures also vary depending on the underlying technology utilized.

Components using AWS Auto Scaling can use scaling plans to configure a set of instructions for scaling your resources. If you work with AWS CloudFormation or add tags to AWS resources, you can set up scaling plans for different sets of resources per application. Auto Scaling provides recommendations for scaling strategies customized to each resource. After you create your scaling plan, Auto Scaling combines dynamic scaling and predictive scaling methods together to support your scaling strategy. For more detail, see [How scaling plans work](https://docs.aws.amazon.com/autoscaling/plans/userguide/how-it-works.html).
- Amazon EC2 Auto Scaling verifies that you have the correct number of Amazon EC2 instances available to handle the load for your application. You create collections of EC2 instances, called Auto Scaling groups. You can specify the minimum and maximum number of instances in each Auto Scaling group, and Amazon EC2 Auto Scaling ensures that your group never goes below or above these limits. For more detail, see [What is Amazon EC2 Auto Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- Amazon DynamoDB auto scaling uses the Application Auto Scaling service to dynamically adjust provisioned throughput capacity on your behalf, in response to actual traffic patterns. This allows a table or a global secondary index to increase its provisioned read and write capacity to handle sudden increases in traffic, without throttling. For more detail, see [Managing throughput capacity automatically with DynamoDB auto scaling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html).

## Resources

**Related best practices:**

- [REL07-BP01 Use automation when obtaining or scaling resources](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_autoscale_adapt.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_monitoring_health.html)

**Related documents:**

- [AWS Auto Scaling: How Scaling Plans Work](https://docs.aws.amazon.com/autoscaling/plans/userguide/how-it-works.html)
- [Managing
Throughput Capacity Automatically with DynamoDB Auto
Scaling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html)
- [What
Is Amazon EC2 Auto Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_reactive_adapt_auto.html*

---

# REL07-BP03 Obtain resources upon detection that more resources are needed for a workload

One of the most valuable features of cloud computing is the ability
to provision resources dynamically.

In traditional on-premises compute environments, you must identify
and provision enough capacity in advance to serve peak demand. This
is a problem because it is expensive and because it poses risks to
availability if you underestimate the workload's peak capacity
needs.

In the cloud, you don't have to do this. Instead, you can provision
compute, database, and other resource capacity as needed to meet
current and forecasted demand. Automated solutions such as Amazon EC2 Auto Scaling and Application Auto Scaling can bring resources
online for you based on metrics you specify. This can make the
scaling process easier and predictable, and it can make your
workload significantly more reliable by ensuring you have enough
resources available at all times.

**Desired outcome**: You configure
automatic scaling of compute and other resources to meet demand. You
provide sufficient headroom in your scaling policies to allow bursts
of traffic to be served while additional resources are brought
online.

**Common anti-patterns:**

- You provision a fixed number of scalable resources.
- You choose a scaling metric that does not correlate to actual
demand.
- You fail to provide enough headroom in your scaling plans to
accommodate demand bursts.
- Your scaling policies add capacity too late, which leads to
capacity exhaustion and degraded service while additional
resources are brought online.
- You fail to correctly configure minimum and maximum resource
counts, which leads to scaling failures.

**Benefits of establishing this best
practice:** Having enough resources to meet current demand
is critical to provide high availability of your workload and adhere
to your defined service-level objectives (SLOs). Automatic scaling
allows you to provide the right amount of compute, database, and
other resources your workload needs in order to serve current and
forecasted demand. You don't need to determine peak capacity needs
and statically allocate resources to serve it. Instead, as demand
grows, you can allocate more resources to accommodate it, and after
demand falls, you can deactivate resources to reduce cost.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

First, determine whether the workload component is suitable for
automatic scaling. These components are called
*horizontally scalable* because they provide
the same resources and behave identically. Examples of
horizontally-scalable components include EC2 instances that are
configured alike,
[Amazon Elastic Container Service (ECS)](https://aws.amazon.com/ecs/) tasks, and pods running on
[Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/). These compute resources are
typically located behind a load balancer and are referred to as
*replicas*.

Other replicated resources may include database read replicas,
[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) tables, and
[Amazon ElastiCache](https://aws.amazon.com/elasticache/) (Redis OSS) clusters. For a complete list of
supported resources, see
[AWS services that you can use with Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/integrated-services-list.html).

For container-based architectures, you may need to scale two
different ways. First, you may need to scale the containers that
provide horizontally-scalable services. Second, you may need to
scale the compute resources to make space for new containers.
Different automatic scaling mechanisms exist for each layer. To
scale ECS tasks, you can use
[Application
Auto Scaling](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-auto-scaling.html). To scale Kubernetes pods, you can use
[Horizontal
Pod Autoscaler (HPA)](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) or
[Kubernetes Event-driven
Autoscaling (KEDA)](https://keda.sh/). To scale the compute resources, you can
use
[Capacity
Providers](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/asg-capacity-providers.html) for ECS, or for Kubernetes, you can use
[Karpenter](https://karpenter.sh) or
[Cluster
Autoscaler](https://kubernetes.io/docs/concepts/cluster-administration/cluster-autoscaling/).

Next, select how you will perform automatic scaling. There are
three major options: metric-based scaling, scheduled scaling, and
predictive scaling.

**Metric-based scaling**

Metric-based scaling provisions resources based on the value of
one or more *scaling metrics*. A scaling metric
is one that corresponds to your workload's demand. A good way to
determine appropriate scaling metrics is to perform load testing
in a non-production environment. During your load tests, keep the
number of scalable resources fixed, and slowly increase demand
(for example, throughput, concurrency, or simulated users). Then
look for metrics that increase (or decrease) as demand grows, and
conversely decrease (or increase) as demand falls. Typical scaling
metrics include CPU utilization, work queue depth (such as an
[Amazon SQS](https://aws.amazon.com/sqs/)
queue), number of active users, and network throughput.

Note
AWS has observed that
with most applications, memory utilization increases as the
application warms up and then reaches a steady value. When demand
decreases, memory utilization typically remains elevated rather
than decreasing in parallel. Because memory utilization does not
correspond to demand in both directions–that is, growing and
falling with demand–consider carefully before you select this
metric for automatic scaling.

Metric-based scaling is a *latent operation*.
It can take several minutes for utilization metrics to propagate
to auto scaling mechanisms, and these mechanisms typically wait
for a clear signal of increased demand before reacting. Then, as
the auto scaler creates new resources, it can take additional time
for them to come to full service. Because of this, it is important
to not set your scaling metric targets too close to full
utilization (for example, 90% CPU utilization). Doing so risks
exhausting existing resource capacity before additional capacity
can come online. Typical resource utilization targets can range
between 50-70% for optimum availability, depending on demand
patterns and time required to provision additional resources.

**Scheduled scaling**

Scheduled scaling provisions or removes resources based on the
calendar or time of day. It is frequently used for workloads that
have predictable demand, such as peak utilization during weekday
business hours or sales events. Both
[Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html) and
[Application
Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html) support scheduled scaling. KEDA's
[cron
scaler](https://keda.sh/docs/latest/scalers/cron/) supports scheduled scaling of Kubernetes pods.

**Predictive scaling**

Predictive scaling uses machine learning to automatically scale
resources based on anticipated demand. Predictive scaling analyzes
the historical value of a utilization metric you provide and
continuously predicts its future value. The predicted value is
then used to scale the resource up or down.
[Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html) can perform predictive scaling.

### Implementation steps

- Determine whether the workload component is suitable for
automatic scaling.
- Determine what kind of scaling mechanism is most appropriate
for the workload: metric-based scaling, scheduled scaling,
or predictive scaling.
- Select the appropriate automatic scaling mechanism for the
component. For Amazon EC2 instances, use Amazon EC2 Auto Scaling. For other AWS services, use Application Auto
Scaling. For Kubernetes pods (such as those running in an
Amazon EKS cluster), consider Horizontal Pod Autoscaler
(HPA) or Kubernetes Event-driven Autoscaling (KEDA). For
Kubernetes or EKS nodes, consider Karpenter and Cluster Auto
Scaler (CAS).
- For metric or scheduled scaling, conduct load testing to
determine the appropriate scaling metrics and target values
for your workload. For scheduled scaling, determine the
number of resources needed at the dates and times you
select. Determine the maximum number of resources needed to
serve expected peak traffic.
- Configure the auto scaler based on the information collected
above. Consult the auto scaling service's documentation for
details. Verify that the maximum and minimum scaling limits
are configured correctly.
- Verify the scaling configuration is working as expected.
Perform load testing in a non-production environment and
observe how the system reacts, and adjust as needed. When
enabling auto scaling in production, configure appropriate
alarms to notify you of any unexpected behavior.

## Resources

**Related documents:**

- [What
Is Amazon EC2 Auto Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [AWS Prescriptive Guidance: Load testing applications](https://docs.aws.amazon.com/prescriptive-guidance/latest/load-testing/)
- [AWS Marketplace: products that can be used with auto
scaling](https://aws.amazon.com/marketplace/search/results?searchTerms=Auto+Scaling)
- [Managing
Throughput Capacity Automatically with DynamoDB Auto
Scaling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html)
- [Predictive
Scaling for EC2, Powered by Machine Learning](https://aws.amazon.com/blogs/aws/new-predictive-scaling-for-ec2-powered-by-machine-learning/)
- [Scheduled
Scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html)
- [Telling
Stories About Little's Law](https://brooker.co.za/blog/2018/06/20/littles-law.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_proactive_adapt_auto.html*

---

# REL07-BP04 Load test your workload

Adopt a load testing methodology to measure if scaling activity
meets workload requirements.

It’s important to perform sustained load testing. Load tests should
discover the breaking point and test the performance of your
workload. AWS makes it easy to set up temporary testing environments
that model the scale of your production workload. In the cloud, you
can create a production-scale test environment on demand, complete
your testing, and then decommission the resources. Because you only
pay for the test environment when it's running, you can simulate
your live environment for a fraction of the cost of testing on
premises.

Load testing in production should also be considered as part of game
days where the production system is stressed, during hours of lower
customer usage, with all personnel on hand to interpret results and
address any problems that arise.

**Common anti-patterns:**

- Performing load testing on deployments that are not the same
configuration as your production.
- Performing load testing only on individual pieces of your
workload, and not on the entire workload.
- Performing load testing with a subset of requests and not a
representative set of actual requests.
- Performing load testing to a small safety factor above expected
load.

**Benefits of establishing this best
practice:** You know what components in your architecture
fail under load and be able to identify what metrics to watch to
indicate that you are approaching that load in time to address the
problem, preventing the impact of that failure.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- Perform load testing to identify which aspect of your workload
indicates that you must add or remove capacity. Load testing
should have representative traffic similar to what you receive in
production. Increase the load while watching the metrics you have
instrumented to determine which metric indicates when you must add
or remove resources.

[Distributed
Load Testing on AWS: simulate thousands of connected users](https://aws.amazon.com/solutions/distributed-load-testing-on-aws/)

Identify the mix of requests. You may have varied mixes of requests, so you
should look at various time frames when identifying the mix of traffic.
- Implement a load driver. You can use custom code, open source, or commercial
software to implement a load driver.
- Load test initially using small capacity. You see some immediate effects by
driving load onto a lesser capacity, possibly as small as one instance or
container.
- Load test against larger capacity. The effects will be different on a
distributed load, so you must test against as close to a product environment as
possible.

## Resources

**Related documents:**

- [Distributed
Load Testing on AWS: simulate thousands of connected
users](https://aws.amazon.com/solutions/distributed-load-testing-on-aws/)
- [Load testing applications](https://docs.aws.amazon.com/prescriptive-guidance/latest/load-testing/welcome.html)

**Related videos:**

- [AWS Summit ANZ 2023: Accelerate with confidence through AWS Distributed Load Testing](https://www.youtube.com/watch?v=4J6lVqa6Yh8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_load_tested_adapt.html*

---
