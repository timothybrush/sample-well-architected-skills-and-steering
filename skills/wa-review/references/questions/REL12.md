# REL 12 — How do you test reliability?

**Pillar**: Reliability  
**Best Practices**: 5

---

# REL12-BP01 Use playbooks to investigate failures

Permit consistent and prompt responses to failure scenarios that are
not well understood, by documenting the investigation process in
playbooks. Playbooks are the predefined steps performed to identify
the factors contributing to a failure scenario. The results from any
process step are used to determine the next steps to take until the
issue is identified or escalated.

The playbook is proactive planning that you must do, to be able to
take reactive actions effectively. When failure scenarios not
covered by the playbook are encountered in production, first address
the issue (put out the fire). Then go back and look at the steps you
took to address the issue and use these to add a new entry in the
playbook.

Note that playbooks are used in response to specific incidents,
while runbooks are used to achieve specific outcomes. Often,
runbooks are used for routine activities and playbooks are used to
respond to non-routine events.

**Common anti-patterns:**

- Planning to deploy a workload without knowing the processes to
diagnose issues or respond to incidents.
- Unplanned decisions about which systems to gather logs and
metrics from when investigating an event.
- Not retaining metrics and events long enough to be able to
retrieve the data.

**Benefits of establishing this best
practice:** Capturing playbooks ensures that processes can
be consistently followed. Codifying your playbooks limits the
introduction of errors from manual activity. Automating playbooks
shortens the time to respond to an event by eliminating the
requirement for team member intervention or providing them
additional information when their intervention begins.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

- Use playbooks to identify issues. Playbooks are documented
processes to investigate issues. Allow consistent and prompt
responses to failure scenarios by documenting processes in
playbooks. Playbooks must contain the information and guidance
necessary for an adequately skilled person to gather applicable
information, identify potential sources of failure, isolate
faults, and determine contributing factors (perform post-incident
analysis).

Implement playbooks as code. Perform your operations as code by scripting your
playbooks to ensure consistency and limit reduce errors caused by manual processes.
Playbooks can be composed of multiple scripts representing the different steps that
might be necessary to identify the contributing factors to an issue. Runbook
activities can be invoked or performed as part of playbook activities, or might prompt
to run a playbook in response to identified events.

[Automate your operational playbooks with AWS Systems Manager](https://aws.amazon.com/about-aws/whats-new/2019/11/automate-your-operational-playbooks-with-aws-systems-manager/)
- [AWS Systems Manager
Run Command](https://docs.aws.amazon.com/systems-manager/latest/userguide/execute-remote-commands.html)
- [AWS
Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [What is
AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [What Is
Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [Using Amazon CloudWatch
Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)

## Resources

**Related documents:**

- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [AWS Systems Manager Run Command](https://docs.aws.amazon.com/systems-manager/latest/userguide/execute-remote-commands.html)
- [Automate
your operational playbooks with AWS Systems Manager](https://aws.amazon.com/about-aws/whats-new/2019/11/automate-your-operational-playbooks-with-aws-systems-manager/)
- [Using
Amazon CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Using
Canaries (Amazon CloudWatch Synthetics)](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
- [What
Is Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [What
is AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)

**Related examples:**

- [Automating
operations with Playbooks and Runbooks](https://wellarchitectedlabs.com/operational-excellence/200_labs/200_automating_operations_with_playbooks_and_runbooks/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_playbook_resiliency.html*

---

# REL12-BP02 Perform post-incident analysis

Review customer-impacting events, and identify the contributing
factors and preventative action items. Use this information to
develop mitigations to limit or prevent recurrence. Develop
procedures for prompt and effective responses. Communicate
contributing factors and corrective actions as appropriate, tailored
to target audiences. Have a method to communicate these causes to
others as needed.

Assess why existing testing did not find the issue. Add tests for
this case if tests do not already exist.

**Desired outcome:** Your teams have a consistent and agreed upon approach to handling post-incident analysis. One mechanism is the [correction of error (COE) process](https://aws.amazon.com/blogs/mt/why-you-should-develop-a-correction-of-error-coe/). The COE process helps your teams identify, understand, and address the root causes for incidents, while also building mechanisms and guardrails to limit the probability of the same incident happening again.

**Common anti-patterns:**

- Finding contributing factors, but not continuing to look deeper
for other potential problems and approaches to mitigate.
- Only identifying human error causes, and not providing any
training or automation that could prevent human errors.
- Focus on assigning blame rather than understanding the root cause, creating a culture of fear and hindering open communication
- Failure to share insights, which keeps incident analysis findings within a small group and prevents others from benefiting from the lessons learned
- No mechanism to capture institutional knowledge, thereby losing valuable insights by not preserving the lessons-learned in the form of updated best practices and resulting in repeat incidents with the same or similar root cause

**Benefits of establishing this best
practice:** Conducting post-incident analysis and sharing
the results permits other workloads to mitigate the risk if they
have implemented the same contributing factors, and allows them to
implement the mitigation or automated recovery before an incident
occurs.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Good post-incident analysis provides opportunities to propose common solutions for problems with architecture patterns that are used in other places in your systems.

A cornerstone of the COE process is documenting and addressing issues. It is recommended to define a standardized way to document critical root causes, and ensure they are reviewed and addressed. Assign clear ownership for the post-incident analysis process. Designate a responsible team or individual who will oversee incident investigations and follow-ups.

Encourage a culture that focuses on learning and improvement rather than assigning blame. Emphasize that the goal is to prevent future incidents, not to penalize individuals.

Develop well-defined procedures for conducting post-incident analyses. These procedures should outline the steps to be taken, the information to be collected, and the key questions to be addressed during the analysis. Investigate incidents thoroughly, going beyond immediate causes to identify root causes and contributing factors. Use techniques like the *[five whys](https://en.wikipedia.org/wiki/Five_whys)* to delve deep into the underlying issues.

Maintain a repository of lessons learned from incident analyses. This institutional knowledge can serve as a reference for future incidents and prevention efforts. Share findings and insights from post-incident analyses, and consider holding open-invite post-incident review meetings to discuss lessons learned.

### Implementation steps

- While conducting post-incident analysis, ensure the process is blame-free. This allows people involved in the incident to be dispassionate about the proposed corrective actions and promote honest self-assessment and collaboration across teams.
- Define a standardized way to document critical issues. An example structure for such document is as follows:

What happened?
- What was the impact on customers and your business?
- What was the root cause?
- What data do you have to support this?

For example, metrics and graphs

- What were the critical pillar implications, especially security?

When architecting workloads, you make trade-offs between pillars based upon your business context. These business decisions can drive your engineering priorities. You might optimize to reduce cost at the expense of reliability in development environments, or, for mission-critical solutions, you might optimize reliability with increased costs. Security is always job zero, as you have to protect your customers.

- What lessons did you learn?
- What corrective actions are you taking?

Action items
- Related items

- Create well-defined standard operating procedures for conducting post-incident analyses.
- Set up a standardized incident reporting process. Document all incidents comprehensively, including the initial incident report, logs, communications, and actions taken during the incident.
- Remember that an incident does not require an outage. It could be a near-miss, or a system performing in an unexpected way while still fulfilling its business function.
- Continually improve your post-incident analysis process based on feedback and lessons learned.
- Capture key findings in a knowledge management system, and consider any patterns that should be added to developer guides or pre-deployment checklists.

## Resources

**Related documents:**

- [Why
you should develop a correction of error (COE)](https://aws.amazon.com/blogs/mt/why-you-should-develop-a-correction-of-error-coe/)

**Related videos:**

- [Amazon’s approach to failing successfully](https://aws.amazon.com/builders-library/amazon-approach-to-failing-successfully/)
- [AWS re:Invent 2021 - Amazon Builders’ Library: Operational Excellence at Amazon](https://www.youtube.com/watch?v=7MrD4VSLC_w)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_rca_resiliency.html*

---

# REL12-BP03 Test scalability and performance requirements

Use techniques such as load testing to validate that the workload
meets scaling and performance requirements.

In the cloud, you can create a production-scale test environment for
your workload on demand. Instead of reliance on a scaled-down test
environment, which could lead to inaccurate predictions of
production behaviors, you can use the cloud to provision a test
environment that closely mirrors your expected production
environment. This environment helps you test in a more accurate
simulation of the real-world conditions your application faces.

Alongside your performance testing efforts, it's essential to
validate that your base resources, scaling settings, service quotas,
and resiliency design operate as expected under load. This holistic
approach verifies that your application can reliably scale and
perform as required, even under the most demanding conditions.

**Desired outcome:** Your workload
maintains its expected behavior even while subject to peak load. You
proactively address any performance-related issues that may arise as
the application grows and evolves.

**Common anti-patterns:**

- You use test environments that do not closely match the
production environment.
- You treat load testing as a separate, one-time activity rather
than an integrated part of the deployment continuous integration
(CI) pipeline.
- You don't define clear and measurable performance requirements,
such as response time, throughput, and scalability targets.
- You perform tests with unrealistic or insufficient load
scenarios, and you fail to test for peak loads, sudden spikes,
and sustained high load.
- You don't stress test the workload by exceeding expected load
limits.
- You use inadequate or inappropriate load testing and performance
profiling tools.
- You lack comprehensive monitoring and alerting systems to track
performance metrics and detect anomalies.

**Benefits of establishing this best
practice:**

- Load testing helps you identify potential performance
bottlenecks in your system before it goes into production. When
you simulate production-level traffic and workloads, you can
identify areas where your system may struggle to handle the
load, such as slow response times, resource constraints, or
system failures.
- As you test your system under various load conditions, you can
better understand the resource requirements needed to support
your workload. This information can help you make informed
decisions about resource allocation and prevent
over-provisioning or under-provisioning of resources.
- To identify potential failure points, you can observe how your
workload performs under high load conditions. This information
helps you improve your workload's reliability and resiliency by
implementing fault-tolerance mechanisms, failover strategies,
and redundancy measures, as appropriate.
- You identify and address performance issues early, which helps
you avoid the costly consequences of system outages, slow
response times, and dissatisfied users.
- Detailed performance data and profiling information collected
during testing can help you troubleshoot performance-related
issues that may arise in production. This can lead to faster
incident response and resolution, which reduces the impact on
users and your organization's operations.
- In certain industries, proactive performance testing can help
your workload meet compliance standards, which reduces the risk
of penalties or legal issues.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

The first step is to define a comprehensive testing strategy that
covers all aspects of scaling and performance requirements. To
start, clearly define your workload's service-level objectives
(SLOs) based on your business needs, such as throughput, latency
histogram, and error rate. Next, design a suite of tests that can
simulate various load scenarios that range from average usage to
sudden spikes and sustained peak loads, and verify that the
workload's behavior meets your SLOs. These tests should be
automated and integrated into your continuous integration and
deployment pipeline to catch performance regressions early in the
development process.

To effectively test scaling and performance, invest in the right
tools and infrastructure. This includes load testing tools that
can generate realistic user traffic, performance profiling tools
to identify bottlenecks, and monitoring solutions to track key
metrics. Importantly, you should verify that your test
environments closely match the production environment in terms of
infrastructure and environment conditions to make your test
results as accurate as possible. To make it easier to reliably
replicate and scale production-like setups, use infrastructure as
code and container-based applications.

Scaling and performance tests are an ongoing process, not a
one-time activity. Implement comprehensive monitoring and alerting
to track the application's performance in production, and use this
data to continually refine your test strategies and optimization
efforts. Regularly analyze performance data to identify emerging
issues, test new scaling strategies, and implement optimizations
to improve the application's efficiency and reliability. When you
adopt an iterative approach and constantly learn from production
data, you can verify that your application can adapt to variable
user demands and maintain resiliency and optimal performance over
time.

### Implementation steps

- Establish clear and measurable performance requirements,
such as response time, throughput, and scalability targets.
These requirements should be based on your workload's usage
patterns, user expectations, and business needs.
- Select and configure a load testing tool that can accurately
mimic the load patterns and user behavior in your production
environment.
- Set up a test environment that closely matches the
production environment, including infrastructure and
environment conditions, to improve the accuracy of your test
results.
- Create a test suite that covers a wide range of scenarios,
from average usage patterns to peak loads, rapid spikes, and
sustained high loads. Integrate the tests into your
continuous integration and deployment pipelines to catch
performance regressions early in the development process.
- Conduct load testing to simulate real-world user traffic and
understand how your application behaves under different load
conditions. To stress test your application, exceed the
expected load and observe its behavior, such as response
time degradation, resource exhaustion, or system failures,
which helps identify the breaking point of your application
and inform scaling strategies. Evaluate the scalability of
your workload by incrementally increasing the load, and
measure the performance impact to identify scaling limits
and plan for future capacity needs.
- Implement comprehensive monitoring and alerting to track
performance metrics, detect anomalies, and initiate scaling
actions or notifications when thresholds are exceeded.
- Continually monitor and analyze performance data to identify
areas for improvement. Iterate on your testing strategies
and optimization efforts.

## Resources

**Related best practices:**

- [REL01-BP04
Monitor and manage quotas](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_monitor_manage_limits.html)
- [REL06-BP01
Monitor all components for the workload (Generation)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP03
Send notifications (Real-time processing and alarming)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_monitor.html))

**Related documents:**

- [Load
testing applications](https://docs.aws.amazon.com/prescriptive-guidance/latest/load-testing/welcome.html)
- [Distributed
Load Testing on AWS](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/)
- [Application
Performance Monitoring](https://aws.amazon.com/what-is/application-performance-monitoring/)
- [Amazon EC2 Testing Policy](https://aws.amazon.com/ec2/testing/)

**Related examples:**

- [Distributed
Load Testing on AWS (GitHub)](https://github.com/aws-solutions/distributed-load-testing-on-aws)

**Related tools:**

- [Amazon CodeGuru Profiler](https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html)
- [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)
- [Apache
JMeter](https://jmeter.apache.org/)
- [K6](https://k6.io/)
- [Vegeta](https://github.com/tsenart/vegeta)
- [Hey](https://github.com/rakyll/hey)
- [ab](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [wrk](https://github.com/wg/wrk)
- [Distributed Load Testing on AWS](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_test_non_functional.html*

---

# REL12-BP04 Test resiliency using chaos engineering

Run chaos experiments regularly in environments that are in or as close to production as possible to understand how your system responds to adverse conditions.

**Desired outcome:**

The resilience of the workload is regularly verified by applying chaos engineering in the form of fault injection experiments or injection of unexpected load,
in addition to resilience testing that validates known expected behavior of your workload during an event. Combine both chaos engineering and resilience testing
to gain confidence that your workload can survive component failure and can recover from unexpected disruptions with minimal to no impact.

**Common anti-patterns:**

- Designing for resiliency, but not verifying how the workload functions as a whole when
faults occur.
- Never experimenting under real-world conditions and expected load.
- Not treating your experiments as code or maintaining them through the development cycle.
- Not running chaos experiments both as part of your CI/CD pipeline, as well as outside of deployments.
- Neglecting to use past post-incident analyses when determining which faults to experiment with.

**Benefits of establishing this best practice:** Injecting faults to
verify the resilience of your workload allows you to gain confidence that the recovery procedures of
your resilient design will work in the case of a real fault.

**Level of risk exposed if this best practice is not established:** Medium

## Implementation guidance

Chaos engineering provides your teams with capabilities to continually inject real world
disruptions (simulations) in a controlled way at the service provider, infrastructure, workload,
and component level, with minimal to no impact to your customers. It allows your teams to learn
from faults and observe, measure, and improve the resilience of your workloads, as well as validate
that alerts fire and teams get notified in the case of an event.

When performed continually, chaos engineering can highlight deficiencies in your workloads that,
if left unaddressed, could negatively affect availability and operation.

Note
Chaos engineering is the discipline of experimenting on a system in order to build
confidence in the system’s capability to withstand turbulent conditions in production. –
[Principles of Chaos Engineering](https://principlesofchaos.org/)

If a system is able to withstand these disruptions, the chaos experiment should be maintained
as an automated regression test. In this way, chaos experiments should be performed as part of
your systems development lifecycle (SDLC) and as part of your CI/CD pipeline.

To ensure that your workload can survive component failure, inject real world events as part of
your experiments. For example, experiment with the loss of Amazon EC2 instances or failover of the primary
Amazon RDS database instance, and verify that your workload is not impacted (or only minimally impacted).
Use a combination of component faults to simulate events that may be caused by a disruption in an Availability Zone.

For application-level faults (such as crashes), you can start with stressors such as memory and CPU exhaustion.

To validate [fallback or failover mechanisms](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems/)
for external dependencies due to intermittent network disruptions, your components should simulate such an event by blocking access to the
third-party providers for a specified duration that can last from seconds to hours.

Other modes of degradation might cause reduced functionality and slow responses, often resulting in a disruption of your services.
Common sources of this degradation are increased latency on critical services and unreliable network communication (dropped packets).
Experiments with these faults, including networking effects such as latency, dropped messages, and DNS failures, could include the
inability to resolve a name, reach the DNS service, or establish connections to dependent services.

**Chaos engineering tools:**

AWS Fault Injection Service (AWS FIS) is a fully managed service for running fault injection
experiments that can be used as part of your CD pipeline, or outside of the pipeline. AWS FIS is a
good choice to use during chaos engineering game days. It supports simultaneously introducing
faults across different types of resources including Amazon EC2, Amazon Elastic Container Service (Amazon ECS), Amazon Elastic Kubernetes Service (Amazon EKS), and Amazon RDS.
These faults include termination of resources, forcing failovers, stressing CPU or memory, throttling,
latency, and packet loss. Since it is integrated with Amazon CloudWatch Alarms, you can set up stop
conditions as guardrails to rollback an experiment if it causes unexpected impact.

*AWS Fault Injection Service integrates with AWS
resources to allow you to run fault injection experiments for your
workloads.*

There are also several third-party options for fault injection experiments. These include
open-source tools such as [Chaos Toolkit](https://chaostoolkit.org/), [Chaos Mesh](https://chaos-mesh.org/), and [Litmus Chaos](https://litmuschaos.io/), as well as commercial options like Gremlin. To expand the scope of
faults that can be injected on AWS, AWS FIS [integrates with Chaos Mesh and Litmus Chaos](https://aws.amazon.com/about-aws/whats-new/2022/07/aws-fault-injection-simulator-supports-chaosmesh-litmus-experiments/), allowing you to coordinate fault
injection workflows among multiple tools. For example, you can run a stress test on a pod’s
CPU using Chaos Mesh or Litmus faults while terminating a randomly selected percentage of
cluster nodes using AWS FIS fault actions.

## Implementation steps

- Determine which faults to use for experiments.

Assess the design of your workload for resiliency. Such designs (created using the best
practices of the [Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)) account for risks based on critical dependencies,
past events, known issues, and compliance requirements. List each element of the design
intended to maintain resilience and the faults it is designed to mitigate. For more
information about creating such lists, see the [Operational Readiness Review whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/wa-operational-readiness-reviews.html) which guides you on how to
create a process to prevent reoccurrence of previous incidents. The Failure Modes and
Effects Analysis (FMEA) process provides you with a framework for performing a component-level
analysis of failures and how they impact your workload. FMEA is outlined in more detail by
Adrian Cockcroft in [Failure Modes and Continuous Resilience](https://adrianco.medium.com/failure-modes-and-continuous-resilience-6553078caad5).
- Assign a priority to each fault.

Start with a coarse categorization such as high, medium, or low.
To assess priority, consider frequency of the fault and impact of failure to the overall workload.

When considering frequency of a given fault, analyze past data for this workload when available.
If not available, use data from other workloads running in a similar environment.

When considering impact of a given fault, the larger the scope of the fault, generally the larger the impact.
Also consider the workload design and purpose. For example, the ability to access the source data stores is
critical for a workload doing data transformation and analysis. In this case, you would prioritize experiments
for access faults, as well as throttled access and latency insertion.

Post-incident analyses are a good source of data to understand both frequency and impact of failure modes.

Use the assigned priority to determine which faults to experiment with first
and the order with which to develop new fault injection experiments.
- For each experiment that you perform, follow the chaos engineering and continuous resilience flywheel in the following figure.

*Chaos engineering and continuous resilience flywheel, using the scientific method by Adrian Hornsby.*

Define steady state as some measurable output of a workload that indicates normal behavior.

Your workload exhibits steady state if it is operating reliably and as expected. Therefore, validate that your
workload is healthy before defining steady state. Steady state does not necessarily mean no impact to the workload
when a fault occurs, as a certain percentage in faults could be within acceptable limits. The steady state is
your baseline that you will observe during the experiment, which will highlight anomalies if your hypothesis
defined in the next step does not turn out as expected.

For example, a steady state of a payments system can be defined as the processing of 300 TPS with a success rate
of 99% and round-trip time of 500 ms.
- Form a hypothesis about how the workload will react to the fault.

A good hypothesis is based on how the workload is expected to mitigate the fault to maintain the steady state.
The hypothesis states that given the fault of a specific type, the system or workload will continue steady state,
because the workload was designed with specific mitigations. The specific type of fault and mitigations should be
specified in the hypothesis.

The following template can be used for the hypothesis (but other wording is also acceptable):

Note
If `specific fault` occurs, the `workload name` workload will `describe mitigating controls` to maintain
`business or technical metric impact`.

For example:

If 20% of the nodes in the Amazon EKS node-group are taken down, the Transaction Create API continues to serve the 99th percentile of
requests in under 100 ms (steady state). The Amazon EKS nodes will recover within five minutes, and pods will get scheduled and process
traffic within eight minutes after the initiation of the experiment. Alerts will fire within three minutes.
- If a single Amazon EC2 instance failure occurs, the order system’s Elastic Load Balancing health check will cause the Elastic Load Balancing
to only send requests to the remaining healthy instances while the Amazon EC2 Auto Scaling replaces the failed instance, maintaining a
less than 0.01% increase in server-side (5xx) errors (steady state).
- If the primary Amazon RDS database instance fails, the Supply Chain data collection workload will failover and connect to the standby
Amazon RDS database instance to maintain less than 1 minute of database read or write errors (steady state).

- Run the experiment by injecting the fault.

An experiment should by default be fail-safe and tolerated by the workload. If
you know that the workload will fail, do not run the experiment. Chaos engineering
should be used to find known-unknowns or unknown-unknowns. *Known-unknowns* are things you are aware of but don’t fully understand,
and *unknown-unknowns* are things you are neither
aware of nor fully understand. Experimenting against a workload that you know is
broken won’t provide you with new insights. Your experiment should be carefully
planned, have a clear scope of impact, and provide a rollback mechanism that can be
applied in case of unexpected turbulence. If your due-diligence shows that your
workload should survive the experiment, move forward with the
experiment. There are several options for injecting the faults. For workloads on
AWS, [AWS FIS](https://docs.aws.amazon.com/fis/latest/userguide/what-is.html) provides many predefined fault simulations called [actions](https://docs.aws.amazon.com/fis/latest/userguide/actions.html). You
can also define custom actions that run in AWS FIS using [AWS Systems Manager
documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html).

We discourage the use of custom scripts for chaos experiments, unless the scripts
have the capabilities to understand the current state of the workload, are able to emit logs,
and provide mechanisms for rollbacks and stop conditions where possible.

An effective framework or toolset which supports chaos engineering should track
the current state of an experiment, emit logs, and provide rollback mechanisms to
support the controlled running of an experiment. Start with an established service
like AWS FIS that allows you to perform experiments with a clearly defined scope and
safety mechanisms that rollback the experiment if the experiment introduces unexpected
turbulence. To learn about a wider variety of experiments using AWS FIS, also see the
[Resilient and Well-Architected Apps with Chaos Engineering lab](https://catalog.us-east-1.prod.workshops.aws/workshops/44e29d0c-6c38-4ef3-8ff3-6d95a51ce5ac/en-US). Also,
[AWS Resilience Hub](https://docs.aws.amazon.com/resilience-hub/latest/userguide/what-is.html) will
analyze your workload and create experiments that you can choose to implement and run
in AWS FIS.

Note
For every experiment, clearly understand the scope and its impact. We recommend that
faults should be simulated first on a non-production environment before being run in production.

Experiments should run in production under real-world load using
[canary deployments](https://medium.com/the-cloud-architect/chaos-engineering-q-a-how-to-safely-inject-failure-ced26e11b3db)
that spin up both a control and experimental system deployment, where feasible. Running experiments during off-peak times is a good
practice to mitigate potential impact when first experimenting in production. Also, if
using actual customer traffic poses too much risk, you can run experiments using
synthetic traffic on production infrastructure against the control and experimental
deployments. When using production is not possible, run experiments in pre-production
environments that are as close to production as possible.

You must establish and monitor guardrails to ensure the experiment does not
impact production traffic or other systems beyond acceptable limits. Establish stop
conditions to stop an experiment if it reaches a threshold on a guardrail metric that
you define. This should include the metrics for steady state for the workload, as well
as the metric against the components into which you’re injecting the fault. A [synthetic monitor](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html)
(also known as a user canary) is one metric you should
usually include as a user proxy. [Stop conditions for AWS FIS](https://docs.aws.amazon.com/fis/latest/userguide/stop-conditions.html)
are supported as part of the experiment template, allowing up to five stop-conditions per template.

One of the principles of chaos is minimize the scope of the experiment and its impact:

While there must be an allowance for some short-term negative impact, it is the responsibility and
obligation of the Chaos Engineer to ensure the fallout from experiments are minimized and contained.

A method to verify the scope and potential impact is to perform the experiment in a non-production environment
first, verifying that thresholds for stop conditions activate as expected during an experiment and observability
is in place to catch an exception, instead of directly experimenting in production.

When running fault injection experiments, verify that all responsible parties are well-informed. Communicate with
appropriate teams such as the operations teams, service reliability teams, and customer support to let them know
when experiments will be run and what to expect. Give these teams communication tools to inform those running the
experiment if they see any adverse effects.

You must restore the workload and its underlying systems back to the original known-good state. Often, the resilient
design of the workload will self-heal. But some fault designs or failed experiments can leave your workload in an
unexpected failed state. By the end of the experiment, you must be aware of this and restore the workload and systems.
With AWS FIS you can set a rollback configuration (also called a post action) within the action parameters. A post action
returns the target to the state that it was in before the action was run. Whether automated (such as using AWS FIS) or
manual, these post actions should be part of a playbook that describes how to detect and handle failures.
- Verify the hypothesis.

[Principles of Chaos
Engineering](https://principlesofchaos.org/) gives this guidance on how to verify steady state of your
workload:
Focus on the measurable output of a system, rather than internal attributes of the system.
Measurements of that output over a short period of time constitute a proxy for the system’s steady state.
The overall system’s throughput, error rates, and latency percentiles could all be metrics of interest
representing steady state behavior. By focusing on systemic behavior patterns during experiments, chaos engineering verifies
that the system does work, rather than trying to validate how it works.

In our two previous examples, we include the steady state metrics of less than 0.01% increase in server-side (5xx) errors and
less than one minute of database read and write errors.

The 5xx errors are a good metric because they are a consequence of the failure mode that a client of the workload will experience directly.
The database errors measurement is good as a direct consequence of the fault, but should also be supplemented with a client impact measurement
such as failed customer requests or errors surfaced to the client. Additionally, include a synthetic monitor (also known as a user canary) on
any APIs or URIs directly accessed by the client of your workload.
- Improve the workload design for resilience.

If steady state was not maintained, then investigate how the workload design can
be improved to mitigate the fault, applying the best practices of the [AWS Well-Architected
Reliability pillar](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html). Additional guidance and resources can be found in the
[AWS Builder’s Library](https://aws.amazon.com/builders-library/),
which hosts articles about how to [improve your health
checks](https://aws.amazon.com/builders-library/implementing-health-checks/) or [employ retries with
backoff in your application code](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/), among others.

After these changes have been implemented, run the experiment again (shown by the dotted line in the chaos engineering flywheel)
to determine their effectiveness. If the verify step indicates the hypothesis holds true, then the workload
will be in steady state, and the cycle continues.

- Run experiments regularly.

A chaos experiment is a cycle, and experiments should be run regularly as part of
chaos engineering. After a workload meets the experiment’s hypothesis, the experiment
should be automated to run continually as a regression part of your CI/CD pipeline. To
learn how to do this, see this blog on [how to run AWS FIS experiments using AWS CodePipeline](https://aws.amazon.com/blogs/architecture/chaos-testing-with-aws-fault-injection-simulator-and-aws-codepipeline/). This lab on recurrent [AWS FIS
experiments in a CI/CD pipeline](https://chaos-engineering.workshop.aws/en/030_basic_content/080_cicd.html) allows you to work hands-on.
Fault injection experiments are also a part of game days (see [REL12-BP05 Conduct game days regularly](./rel_testing_resiliency_game_days_resiliency.html)).
Game days simulate a failure or event to verify systems, processes, and team responses.
The purpose is to actually perform the actions the team would perform as if an exceptional event happened.
- Capture and store experiment results.

Results for fault injection experiments must be captured and persisted. Include all
necessary data (such as time, workload, and conditions) to be able to later
analyze experiment results and trends. Examples of results might include screenshots of
dashboards, CSV dumps from your metric’s database, or a hand-typed record of events and
observations from the experiment. [Experiment logging with AWS FIS](https://docs.aws.amazon.com/fis/latest/userguide/monitoring-logging.html)
can be part of this data capture.

## Resources

**Related best practices:**

- [REL08-BP03 Integrate resiliency testing as part of your deployment](./rel_tracking_change_management_resiliency_testing.html)
- [REL13-BP03 Test disaster recovery implementation to validate the implementation](./rel_planning_for_recovery_dr_tested.html)

**Related documents:**

- [What
is AWS Fault Injection Service?](https://docs.aws.amazon.com/fis/latest/userguide/what-is.html)
- [What is AWS Resilience Hub?](https://docs.aws.amazon.com/resilience-hub/latest/userguide/what-is.html)
- [Principles
of Chaos Engineering](https://principlesofchaos.org/)
- [Chaos Engineering: Planning your first experiment](https://medium.com/the-cloud-architect/chaos-engineering-part-2-b9c78a9f3dde)
- [Resilience Engineering: Learning
to Embrace Failure](https://queue.acm.org/detail.cfm?id=2371297)
- [Chaos Engineering
stories](https://github.com/ldomb/ChaosEngineeringPublicStories)
- [Avoiding fallback
in distributed systems](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems/)
- [Canary Deployment for Chaos Experiments](https://medium.com/the-cloud-architect/chaos-engineering-q-a-how-to-safely-inject-failure-ced26e11b3db)

**Related videos:**

- [AWS re:Invent 2020:
Testing resiliency using chaos engineering (ARC316)](https://www.youtube.com/watch?v=OlobVYPkxgg)
- [AWS re:Invent
2019: Improving resiliency with chaos engineering
(DOP309-R1)](https://youtu.be/ztiPjey2rfY)
- [AWS re:Invent 2019: Performing
chaos engineering in a serverless world (CMY301)](https://www.youtube.com/watch?v=vbyjpMeYitA)

**Related tools:**

- [AWS Fault Injection Service](https://aws.amazon.com/fis/)
- AWS Marketplace: [Gremlin Chaos
Engineering Platform](https://aws.amazon.com/marketplace/pp/prodview-tosyg6v5cyney)
- [Chaos Toolkit](https://chaostoolkit.org/)
- [Chaos Mesh](https://chaos-mesh.org/)
- [Litmus](https://litmuschaos.io/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_failure_injection_resiliency.html*

---

# REL12-BP05 Conduct game days regularly

Conduct game days to regularly exercise your procedures for
responding to workload-impacting events and impairments. Involve the
same teams who would be responsible for handling production
scenarios. These exercises help enforce measures to prevent user
impact caused by production events. When you practice your response
procedures in realistic conditions, you can identify and address any
gaps or weaknesses before a real event occurs.

Game days simulate events in production-like environments to test
systems, processes, and team responses. The purpose is to perform
the same actions the team would perform as if the event actually
occurred. These exercises help you understand where improvements can
be made and can help develop organizational experience in dealing
with events and impairments. These should be conducted regularly so
that your team knows builds ingrained habits for how to respond.

Game days prepare teams to handle production events with greater
confidence. Teams that are well-practiced are more able to quickly
detect and respond to various scenarios. This results in a
significantly improved readiness and resilience posture.

**Desired outcome:** You run
resilience game days on a consistent, scheduled basis. These game
days are seen as a normal and expected part of doing business. Your
organization has built a culture of preparedness, and when
production issues occur, your teams are well-prepared to respond
effectively, resolve the issues efficiently, and mitigate the impact
on customers.

**Common anti-patterns:**

- You document your procedures, but your never exercise them.
- You exclude business decision makers in the test exercises.
- You run a game day, but you don't inform all relevant
stakeholders.
- You focus solely on technical failures, but you don't involve
business stakeholders.
- You don't incorporate lessons learned from game days into your
recovery processes.
- You blame teams for failures or bugs.

**Benefits of establishing this best
practice:**

- Enhance response skills: On game days, teams practice their
duties and test their communication mechanisms during simulated
events, which creates a more coordinated and efficient response
in production situations.
- Identify and address dependencies: Complex environments often
involve intricate dependencies between various systems,
services, and components. Game days can help you identify and
address these dependencies, and verify that your critical
systems and services are properly covered by your runbook
procedures and can be scaled up or recovered in a timely manner.
- Foster a culture of resilience: Game days can help cultivate a
mindset of resilience within an organization. When you involve
cross-functional teams and stakeholders, these exercises promote
awareness, collaboration, and a shared understanding of the
importance of resilience across the entire organization.
- Continuous improvement and adaptation: Regular game days help
you to continually assess and adapt your resilience strategies,
which keeps them relevant and effective in the face of changing
circumstances.
- Increase confidence in the system: Successful game days can help
you build confidence in the system's ability to withstand and
recover from disruptions.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Once you have designed and implemented the necessary resilience
measures, conduct a game day to validate that everything works as
planned in production. A game day, especially the first one,
should involve all team members, and all stakeholders and
participants should be informed in advance about the date, time,
and simulated scenarios.

During the game day, the involved teams simulate various events
and potential scenarios according to the prescribed procedures.
The participants closely monitor and assess the impact of these
simulated events. If the system operates as designed, the
automated detection, scaling, and self-healing mechanisms should
activate and result in little to no impact on users. If the team
observes any negative impact, they roll back the test and remedy
the identified issues, either through automated means or manual
intervention documented in the applicable runbooks.

To continuously improve resilience, it's critical to document and
incorporate lessons learned. This process is a *feedback
loop* that systematically captures insights from game
days and uses them to enhance systems, processes, and team
capabilities.

To help you reproduce real-world scenarios where system components
or services may fail unexpectedly, inject simulated faults as a
game day exercise. Teams can test the resilience and fault
tolerance of their systems and simulate their incident response
and recovery processes in a controlled environment.

In AWS, your game days can be carried out with replicas of your
production environment using infrastructure as code. Through this
process, you can test in a safe environment that closely resembles
your production environment. Consider
[AWS Fault Injection Service](https://aws.amazon.com/fis/) to create different failure scenarios. Use
services like
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and
[AWS X-Ray](https://aws.amazon.com/xray/)
to monitor system behavior during game days. Use
[AWS Systems Manager](https://aws.amazon.com/systems-manager/) to manage and run playbooks, and use
[AWS Step Functions](https://aws.amazon.com/step-functions/) to orchestrate recurring game day workflows.

### Implementation steps

- **Establish a game day
program:** Develop a structured program that
defines the frequency, scope and objectives of game days.
Involve key stakeholders and subject matter experts in
planning and running these exercises.
- **Prepare the game day:**

Identify the key business-critical services that are the
focus of the game day. Catalog and map the people,
processes, and technologies that support those services.
- Set the agenda for the game day, and prepare the
involved teams to participate in the event. Prepare your
automation services to simulate the planned scenarios
and run the appropriate recovery processes. AWS services
such as
[AWS Fault Injection Service](https://aws.amazon.com/fis/),
[AWS Step Functions](https://aws.amazon.com/step-functions/), and
[AWS Systems Manager](https://aws.amazon.com/systems-manager/) can help you automate various
aspects of game days, such as injection of faults and
initiation of recovery actions.

- **Run your simulation:** On
the game day, run the planned scenario. Observe and document
how the people, processes, and technologies react to the
simulated event.
- **Conduct post-exercise
reviews:** After the game day, conduct a
retrospective session to review the lessons learned.
Identify areas for improvement and any actions needed to
improve operational resilience. Document your findings, and
track any necessary changes to enhance your resilience
strategies and preparedness to completion.

## Resources

**Related best practices:**

- [REL12-BP01
Use playbooks to investigate failures](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_playbook_resiliency.html)
- [REL12-BP04
Test resiliency using chaos engineering](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_failure_injection_resiliency.html)
- [OPS04-BP01
Identify key performance indicators](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_identify_kpis.html)
- [OPS07-BP03
Use runbooks to perform procedures](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_runbooks.html)
- [OPS10-BP01
Use a process for event, incident, and problem
management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_event_incident_problem_process.html)

**Related documents:**

- [What is AWS
GameDay?](https://aws.amazon.com/gameday/)

**Related videos:**

- [AWS re:Invent 2023 - Practice like you play: How Amazon scales
resilience to new heights](https://www.youtube.com/watch?v=r3J0fEgNCLQ&t=1734s)

**Related examples:**

- [AWS Workshop - Navigate the storm: Unleashing controlled chaos for
resilient systems](https://catalog.us-east-1.prod.workshops.aws/workshops/eb89c4d5-7c9a-40e0-b0bc-1cde2df1cb97)
- [Build
Your Own Game Day to Support Operational Resilience](https://aws.amazon.com/blogs/architecture/build-your-own-game-day-to-support-operational-resilience/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_game_days_resiliency.html*

---
