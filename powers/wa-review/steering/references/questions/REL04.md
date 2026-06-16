# REL 4 — How do you design interactions in a distributed system to prevent failures?

**Pillar**: Reliability  
**Best Practices**: 4

---

# REL04-BP01 Identify the kind of distributed systems you depend on

Distributed systems can be synchronous, asynchronous, or batch.
Synchronous systems must process requests as quickly as possible and
communicate with each other by making synchronous request and
response calls using HTTP/S, REST, or remote procedure call (RPC)
protocols. Asynchronous systems communicate with each other by
exchanging data asynchronously through an intermediary service
without coupling individual systems. Batch systems receive a large
volume of input data, run automated data processes without human
intervention, and generate output data.

**Desired outcome**: Design a
workload that effectively interacts with synchronous, asynchronous,
and batch dependencies.

**Common anti-patterns**:

- Workload waits indefinitely for a response from its
dependencies, which could lead to workload clients timing out,
not knowing if their request has been received.
- Workload uses a chain of dependent systems that call each other
synchronously. This requires each system to be available and to
successfully process a request before the whole chain can
succeed, leading to potentially brittle behavior and overall
availability.
- Workload communicates with its dependencies asynchronously and
rely on the concept of exactly-once guaranteed delivery of
messages, when often it is still possible to receive duplicate
messages.
- Workload does not use proper batch scheduling tools and allows
concurrent execution of the same batch job.

**Benefits of establishing this best
practice**: It is common for a given workload to implement
one or more style of communication between synchronous,
asynchronous, and batch. This best practice helps you identify the
different trade-offs associated with each style of communication to
make your workload able to tolerate disruptions in any of its
dependencies.

**Level of risk exposed if this best practice
is not established**: High

## Implementation guidance

The following sections contain both general and specific
implementation guidance for each kind of dependency.

**General guidance**

- Make sure that the performance and reliability service-level
objectives (SLOs) that your dependencies offer meet the
performance and reliability requirements of your workload.
- Use
[AWS observability services](https://aws.amazon.com/cloudops/monitoring-and-observability) to
[monitor
response times and error rates](https://www.youtube.com/watch?v=or7uFFyHIX0) to make sure your
dependency is providing service at the levels needed by your
workload.
- Identify the potential challenges that your workload may face
when communicating with its dependencies. Distributed systems
[come
with a wide range of challenges](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/) that might increase
architectural complexity, operational burden, and cost. Common
challenges include latency, network disruptions, data loss,
scaling, and data replication lag.
- Implement robust error handling and
[logging](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
to help you troubleshoot problems when your dependency
experiences issues.

**Synchronous dependency**

In synchronous communications, your workload sends a request to its
dependency and blocks the operation waiting for a response. When its
dependency receives the request, it tries to handle it as soon as
possible and sends a response back to your workload. A significant
challenge with synchronous communication is that it causes temporal
coupling, which requires your workload and its dependencies to be
available at the same time. When your workload needs to communicate
synchronously with its dependencies, consider the following
guidance:

- Your workload should not rely on multiple synchronous
dependencies to perform a single function. This chain of
dependencies increases overall brittleness because all
dependencies in the pathway need to be available in order for
the request to complete successfully.
- When a dependency is unhealthy or unavailable, determine your
error handling and retry strategies. Avoid using bimodal
behavior. Bimodal behavior is when your workload exhibits
different behavior under normal and failure modes. For more
details on bimodal behavior, see
[REL11-BP05
Use static stability to prevent bimodal behavior.](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_static_stability.html)
- Keep in mind that failing fast is better than making your
workload wait. For instance, the
[AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/invocation-retries.html) describes how to handle retries
and failures when you invoke Lambda functions.
- Set timeouts when your workload calls its dependency. This
technique avoids waiting too long or waiting indefinitely for a
response. For helpful discussion of this issue, see
[Tuning
AWS Java SDK HTTP request settings for latency-aware Amazon DynamoDB applications](https://aws.amazon.com/blogs/database/tuning-aws-java-sdk-http-request-settings-for-latency-aware-amazon-dynamodb-applications/).
- Minimize the number of calls made from your workload to its
dependency to fulfill a single request. Having chatty calls
between them increases coupling and latency.

**Asynchronous dependency**

To temporally decouple your workload from its dependency, they
should communicate asynchronously. Using an asynchronous approach,
your workload can continue with any other processing without having
to wait for its dependency, or chain of dependencies, to send a
response.

When your workload needs to communicate asynchronously with its
dependency, consider the following guidance:

- Determine whether to use messaging or event streaming based on
your use case and requirements.
[Messaging](https://aws.amazon.com/messaging/)
allows your workload to communicate with its dependency by
sending and receiving messages through a message broker.
[Event
streaming](https://aws.amazon.com/streaming-data/) allows your workload and its dependency to use
a streaming service to publish and subscribe to events,
delivered as continuous streams of data, that need to be
processed as soon as possible.

- Messaging and event streaming handle messages differently so you
need to make trade-off decisions based on:

**Message priority:** message
brokers can process high-priority messages ahead of normal
messages. In event streaming, all messages have the same
priority.
- **Message consumption**:
message brokers ensure that consumers receive the message.
Event streaming consumers must keep track of the last
message they have read.
- **Message ordering**: with
messaging, receiving messages in the exact order they are
sent is not guaranteed unless you use a first-in-first-out
(FIFO) approach. Event streaming always preserves the order
in which the data was produced.
- **Message deletion**: with
messaging, the consumer must delete the message after
processing it. The event streaming service appends the
message to a stream and remains in there until the message's
retention period expires. This deletion policy makes event
streaming suitable for replaying messages.

- Define how your workload knows when its dependency completes its
work. For instance, when your workload invokes a
[Lambda
function asynchronously](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html), Lambda places the event in a
queue and returns a success response without additional
information. After processing is complete, the Lambda function
can
[send
the result to a destination](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations), configurable based on
success or failure.
- Build your workload to handle duplicate messages by leveraging
idempotency. Idempotency means that the results of your workload
do not change even if your workload is generated more than once
for the same message. It is important to point out that
[messaging](https://aws.amazon.com/sqs/faqs/#FIFO_queues)
or
[streaming](https://docs.aws.amazon.com/streams/latest/dev/kinesis-record-processor-duplicates.html)
services will redeliver a message if a network failure occurs or
if an acknowledgement has not been received.
- If your workload does not get a response from its dependency, it
needs to resubmit the request. Consider limiting the number of
retries to preserve your workload's CPU, memory, and network
resources to handle other requests. The
[AWS Lambda documentation](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-errors) shows how to handle errors for
asynchronous invocation.
- Leverage suitable observability, debugging, and tracing tools to
manage and operate your workload's asynchronous communication
with its dependency. You can use
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to monitor
[messaging](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html)
and
[event
streaming](https://docs.aws.amazon.com/streams/latest/dev/monitoring-with-cloudwatch.html) services. You can also instrument your workload
with [AWS X-Ray](https://aws.amazon.com/xray/) to quickly
[gain
insights](https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html) for troubleshooting problems.

**Batch dependency**

Batch systems take input data, initiate a series of jobs to process
it, and produce some output data, without manual intervention.
Depending on the data size, jobs could run from minutes to, in some
cases, several days. When your workload communicates with its batch
dependency, consider the following guidance:

- Define the time window when your workload should run the batch
job. Your workload can set up a recurrence pattern to invoke a
batch system, for example, every hour or at the end of every
month.
- Determine the location of the data input and the processed data
output. Choose a storage service, such as
[Amazon Simple Storage Services (Amazon S3)](https://aws.amazon.com/s3/),
[Amazon Elastic File System (Amazon EFS)](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html), and
[Amazon FSx for Lustre](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html), that allows your workload to read and
write files at scale.
- If your workload needs to invoke multiple batch jobs, you could
leverage
[AWS Step Functions](https://aws.amazon.com/step-functions/?step-functions.sort-by=item.additionalFields.postDateTime&step-functions.sort-order=desc) to simplify the orchestration of batch
jobs that run in AWS or on-premises. This
[sample
project](https://github.com/aws-samples/aws-stepfunction-complex-orchestrator-app) demonstrates orchestration of batch jobs using
Step Functions,
[AWS Batch](https://aws.amazon.com/batch/), and Lambda.
- Monitor batch jobs to look for abnormalities, such as a job
taking longer than it should to complete. You could use tools
like
[CloudWatch
Container Insights](https://docs.aws.amazon.com/batch/latest/userguide/cloudwatch-container-insights.html) to monitor AWS Batch environments and
jobs. In this instance, your workload would stop the next job
from beginning and inform the relevant staff of the exception.

## Resources

**Related documents**:

- [AWS Cloud Operations: Monitoring and Observability](https://aws.amazon.com/cloudops/monitoring-and-observability)
- [The
Amazon's Builder Library: Challenges with distributed
systems](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/)
- [REL11-BP05
Use static stability to prevent bimodal behavior](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_static_stability.html)
- [AWS Lambda Developer Guide: Error handling and automatic retries in
AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/invocation-retries.html)
- [Tuning
AWS Java SDK HTTP request settings for latency-aware Amazon DynamoDB applications](https://aws.amazon.com/blogs/database/tuning-aws-java-sdk-http-request-settings-for-latency-aware-amazon-dynamodb-applications/)
- [AWS Messaging](https://aws.amazon.com/messaging/)
- [What
is streaming data?](https://aws.amazon.com/streaming-data/)
- [AWS Lambda Developer Guide: Asynchronous invocation](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html)
- [Amazon Simple Queue Service FAQ: FIFO queues](https://aws.amazon.com/sqs/faqs/#FIFO_queues)
- [Amazon Kinesis Data Streams Developer Guide: Handling Duplicate
Records](https://docs.aws.amazon.com/streams/latest/dev/kinesis-record-processor-duplicates.html)
- [Amazon Simple Queue Service Developer Guide: Available CloudWatch
metrics for Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html)
- [Amazon Kinesis Data Streams Developer Guide: Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch](https://docs.aws.amazon.com/streams/latest/dev/monitoring-with-cloudwatch.html)
- [AWS X-Ray Developer Guide: AWS X-Ray concepts](https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html)
- [AWS Samples on GitHub: AWS Step functions Complex Orchestrator
App](https://github.com/aws-samples/aws-stepfunction-complex-orchestrator-app)
- [AWS Batch User Guide: AWS Batch CloudWatch Container Insights](https://docs.aws.amazon.com/batch/latest/userguide/cloudwatch-container-insights.html)

**Related videos**:

- [AWS Summit SF 2022 - Full-stack observability and application
monitoring with AWS (COP310)](https://www.youtube.com/watch?v=or7uFFyHIX0)

**Related tools**:

- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
- [AWS X-Ray](https://aws.amazon.com/xray/)
- [Amazon Simple Storage Services (Amazon S3)](https://aws.amazon.com/s3/)
- [Amazon Elastic File System (Amazon EFS)](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)
- [Amazon FSx for Lustre](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)
- [AWS Step Functions](https://aws.amazon.com/step-functions/?step-functions.sort-by=item.additionalFields.postDateTime&step-functions.sort-order=desc)
- [AWS Batch](https://aws.amazon.com/batch/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_prevent_interaction_failure_identify.html*

---

# REL04-BP02 Implement loosely coupled dependencies

Dependencies such as queuing systems, streaming systems, workflows,
and load balancers are loosely coupled. Loose coupling helps isolate
behavior of a component from other components that depend on it,
increasing resiliency and agility.

Decoupling dependencies, such as queuing systems, streaming systems, and workflows, help minimize the impact of changes or failure on a system. This separation isolates a component's behavior from affecting others that depend on it, improving resilience and agility.

In tightly coupled systems, changes to one component can necessitate changes in other components that rely on it, resulting in degraded performance across all components. *Loose* coupling breaks this dependency so that dependent components only need to know the versioned and published interface. Implementing loose coupling between dependencies isolates a failure in one from impacting another.

Loose coupling allows you to modify code or add features to a component while minimizing risk to other components that depend on it. It also allows for granular resilience at a component level where you can scale out or even change underlying implementation of the dependency.

To further improve resiliency through loose coupling, make component
interactions asynchronous where possible. This model is suitable for
any interaction that does not need an immediate response and where
an acknowledgment that a request has been registered will suffice.
It involves one component that generates events and another that
consumes them. The two components do not integrate through direct
point-to-point interaction but usually through an intermediate
durable storage layer, such as an Amazon SQS queue, a streaming data
platform such as Amazon Kinesis, or AWS Step Functions.

*Figure 4: Dependencies such as queuing systems and load
balancers are loosely coupled*

Amazon SQS queues and AWS Step Functions are just two ways to
add an intermediate layer for loose coupling. Event-driven
architectures can also be built in the AWS Cloud using Amazon EventBridge, which can abstract clients (event producers) from the
services they rely on (event consumers). Amazon Simple Notification Service (Amazon SNS) is an effective solution when you need
high-throughput, push-based, many-to-many messaging. Using Amazon SNS topics, your publisher systems can fan out messages to a large
number of subscriber endpoints for parallel processing.

While queues offer several advantages, in most hard real-time
systems, requests older than a threshold time (often seconds) should
be considered stale (the client has given up and is no longer
waiting for a response), and not processed. This way more recent
(and likely still valid requests) can be processed instead.

**Desired outcome:** Implementing loosely coupled dependencies allows you to minimize the surface area for failure to a component level, which helps diagnose and resolve issues. It also simplifies development cycles, allowing teams to implement changes at a modular level without affecting the performance of other components that depend on it. This approach provides the capability to scale out at a component level based on resource needs, as well as utilization of a component contributing to cost-effectiveness.

**Common anti-patterns:**

- Deploying a monolithic workload.
- Directly invoking APIs between workload tiers with no capability
of failover or asynchronous processing of the request.
- Tight coupling using shared data. Loosely coupled systems should avoid sharing data through shared databases or other forms of tightly coupled data storage, which can reintroduce tight coupling and hinder scalability.
- Ignoring back pressure. Your workload should have the ability to slow down or stop incoming data when a component can't process it at the same rate.

**Benefits of establishing this best
practice:** Loose coupling helps isolate behavior of a
component from other components that depend on it, increasing
resiliency and agility. Failure in one component is isolated from
others.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implement loosely coupled dependencies. There are various solutions that allow you to build loosely coupled applications. These include services for implementing fully managed queues, automated workflows, react to events, and APIs among others which can help isolate behavior of components from other components, and as such increasing resilience and agility.

- **Build event-driven architectures:** [Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html) helps you build loosely coupled and distributed event-driven architectures.
- **Implement queues in distributed systems:** You can use [Amazon Simple Queue Service (Amazon SQS)](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html) to integrate and decouple distributed systems.
- **Containerize components as microservices:** [Microservices](https://aws.amazon.com/microservices/) allow teams to build applications composed of small independent components which communicate over well-defined APIs. [Amazon Elastic Container Service (Amazon ECS)](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html), and [Amazon Elastic Kubernetes Service (Amazon EKS)](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html) can help you get started faster with containers.
- **Manage workflows with Step Functions:** [Step Functions](https://aws.amazon.com/step-functions/getting-started/) help you coordinate multiple AWS services into flexible workflows.
- **Leverage publish-subscribe (pub/sub) messaging architectures:** [Amazon Simple Notification Service (Amazon SNS)](https://docs.aws.amazon.com/sns/latest/dg/welcome.html) provides message delivery from publishers to subscribers (also known as producers and consumers).

### Implementation steps

- Components in an event-driven architecture are initiated by events. Events are actions that happen in a system, such as a user adding an item to a cart. When an action is successful, an event is generated that actuates the next component of the system.

[Building Event-driven Applications with Amazon EventBridge](https://aws.amazon.com/blogs/compute/building-an-event-driven-application-with-amazon-eventbridge/)
- [AWS re:Invent 2022 - Designing Event-Driven Integrations using Amazon EventBridge](https://www.youtube.com/watch?v=W3Rh70jG-LM)

- Distributed messaging systems have three main parts that need to be implemented for a queue based architecture. They include components of the distributed system, the queue that is used for decoupling (distributed on Amazon SQS servers), and the messages in the queue. A typical system has producers which initiate the message into the queue, and the consumer which receives the message from the queue. The queue stores messages across multiple Amazon SQS servers for redundancy.

[Basic Amazon SQS architecture](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-basic-architecture.html)
- [Send Messages Between Distributed Applications with Amazon Simple Queue Service](https://aws.amazon.com/getting-started/hands-on/send-messages-distributed-applications/)

- Microservices, when well-utilized, enhance maintainability and boost scalability, as loosely coupled components are managed by independent teams. It also allows for the isolation of behaviors to a single component in case of changes.

[Implementing Microservices on AWS](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/microservices-on-aws.html)
- [Let's Architect! Architecting microservices with containers](https://aws.amazon.com/blogs/architecture/lets-architect-architecting-microservices-with-containers/)

- With AWS Step Functions you can build distributed applications, automate processes, orchestrate microservices, among other things. The orchestration of multiple components into an automated workflow allows you to decouple dependencies in your application.

[Create a Serverless Workflow with AWS Step Functions and AWS Lambda](https://aws.amazon.com/tutorials/create-a-serverless-workflow-step-functions-lambda/)
- [Getting Started with AWS Step Functions](https://aws.amazon.com/step-functions/getting-started/)

## Resources

**Related documents:**

- [Amazon EC2: Ensuring Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html)
- [The
Amazon Builders' Library: Challenges with distributed
systems](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/)
- [The
Amazon Builders' Library: Reliability, constant work, and a
good cup of coffee](https://aws.amazon.com/builders-library/reliability-and-constant-work/)
- [What
Is Amazon EventBridge?](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html)
- [What
Is Amazon Simple Queue Service?](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [Break up with your monolith](https://pages.awscloud.com/break-up-your-monolith.html)
- [Orchestrate Queue-based Microservices with AWS Step Functions and Amazon SQS](https://aws.amazon.com/tutorials/orchestrate-microservices-with-message-queues-on-step-functions/)
- [Basic Amazon SQS architecture](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-basic-architecture.html)
- [Queue-Based Architecture](https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/queue-based-architecture.html)

**Related videos:**

- [AWS New York
Summit 2019: Intro to Event-driven Architectures and Amazon EventBridge (MAD205)](https://youtu.be/tvELVa9D9qU)
- [AWS re:Invent
2018: Close Loops and Opening Minds: How to Take Control of Systems, Big and Small ARC337 (includes loose coupling,
constant work, static stability)](https://youtu.be/O8xLxNje30M)
- [AWS re:Invent
2019: Moving to event-driven architectures (SVS308)](https://youtu.be/h46IquqjF3E)
- [AWS re:Invent 2019: Scalable serverless event-driven applications using Amazon SQS and Lambda](https://www.youtube.com/watch?v=2rikdPIFc_Q)
- [AWS re:Invent 2022 - Designing event-driven integrations using Amazon EventBridge](https://www.youtube.com/watch?v=W3Rh70jG-LM)
- [AWS re:Invent 2017: Elastic Load Balancing Deep Dive and Best Practices](https://www.youtube.com/watch?v=9TwkMMogojY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_prevent_interaction_failure_loosely_coupled_system.html*

---

# REL04-BP03 Do constant work

Systems can fail when there are large, rapid changes in load. For
example, if your workload is doing a health check that monitors the
health of thousands of servers, it should send the same size payload
(a full snapshot of the current state) each time. Whether no servers
are failing, or all of them, the health check system is doing
constant work with no large, rapid changes.

For example, if the health check system is monitoring 100,000
servers, the load on it is nominal under the normally light server
failure rate. However, if a major event makes half of those servers
unhealthy, then the health check system would be overwhelmed trying
to update notification systems and communicate state to its clients.
So instead the health check system should send the full snapshot of
the current state each time. 100,000 server health states, each
represented by a bit, would only be a 12.5-KB payload. Whether no
servers are failing, or all of them are, the health check system is
doing constant work, and large, rapid changes are not a threat to
the system stability. This is actually how Amazon Route 53 handles
health checks for endpoints (such as IP addresses) to determine how
end users are routed to them.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

- Do constant work so that systems do not fail when there are large,
rapid changes in load.
- Implement loosely coupled dependencies. Dependencies such as
queuing systems, streaming systems, workflows, and load balancers
are loosely coupled. Loose coupling helps isolate behavior of a
component from other components that depend on it, increasing
resiliency and agility.

[The
Amazon Builders' Library: Reliability, constant work, and a good cup of
coffee](https://aws.amazon.com/builders-library/reliability-and-constant-work/)
- [AWS re:Invent 2018: Close Loops and
Opening Minds: How to Take Control of Systems, Big and Small ARC337 (includes
constant work)](https://youtu.be/O8xLxNje30M?t=2482)

For the example of a health check system monitoring 100,000 servers, engineer
workloads so that payload sizes remain constant regardless of number of successes
or failures.

## Resources

**Related documents:**

- [Amazon EC2: Ensuring Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html)
- [The
Amazon Builders' Library: Challenges with distributed
systems](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/)
- [The
Amazon Builders' Library: Reliability, constant work, and a
good cup of coffee](https://aws.amazon.com/builders-library/reliability-and-constant-work/)

**Related videos:**

- [AWS New York
Summit 2019: Intro to Event-driven Architectures and Amazon EventBridge (MAD205)](https://youtu.be/tvELVa9D9qU)
- [AWS re:Invent 2018: Close Loops and Opening Minds: How to Take
Control of Systems, Big and Small ARC337 (includes constant
work)](https://youtu.be/O8xLxNje30M?t=2482)
- [AWS re:Invent
2018: Close Loops and Opening Minds: How to Take Control of
Systems, Big and Small ARC337 (includes loose coupling, constant work, static stability)](https://youtu.be/O8xLxNje30M)
- [AWS re:Invent
2019: Moving to event-driven architectures (SVS308)](https://youtu.be/h46IquqjF3E)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_prevent_interaction_failure_constant_work.html*

---

# REL04-BP04 Make mutating operations idempotent

An idempotent service promises that each request is processed
exactly once, such that making multiple identical requests has the
same effect as making a single request. This makes it easier for a
client to implement retries without fear that a request is
erroneously processed multiple times. To do this, clients can issue
API requests with an idempotency token, which is used whenever the
request is repeated. An idempotent service API uses the token to
return a response identical to the response that was returned the
first time that the request was completed, even if the underlying
state of the system has changed.

In a distributed system, it is relatively simple to perform an
action at most once (client makes only one request) or at least once
(keep requesting until client gets confirmation of success). It is
more difficult to guarantee an action is performed *exactly
once*, such that making multiple identical requests has
the same effect as making a single request. Using idempotency tokens
in APIs, services can receive a mutating request one or more times
without the need to create duplicate records or side effects.

**Desired outcome:** You have a
consistent, well-documented, and widely adopted approach for
ensuring idempotency across all components and services.

**Common anti-patterns:**

- You apply idempotency indiscriminately, even when not needed.
- You introduce overly complex logic for implementing idempotency.
- You use timestamps as keys for idempotency. This can cause
inaccuracies due to clock skew or due to multiple clients that
use the same timestamps to apply changes.
- You store entire payloads for idempotency. In this approach, you
save complete data payloads for every request and overwrite it
at each new request. This can degrade performance and affect
scalability.
- You generate keys inconsistently across services. Without
consistent keys, services may fail to recognize duplicate
requests, which results in unintended results.

**Benefits of establishing this best
practice:**

- Greater scalability: The system can handle retries and duplicate
requests without having to perform additional logic or complex
state management.
- Enhanced reliability: Idempotency helps services handle multiple
identical requests in a consistent manner, which reduces the
risk of unintended side effects or duplicate records. This is
especially crucial in distributed systems, where network
failures and retries are common.
- Improved data consistency: Because the same request produces the
same response, idempotency helps maintain data consistency
across distributed systems. This is essential to maintain the
integrity of transactions and operations.
- Error handling: Idempotency tokens make error handling more
straightforward. If a client does not receive a response due to
an issue, it can safely resend the request with the same
idempotency token.
- Operational transparency: Idempotency allows for better
monitoring and logging. Services can log requests with their
idempotency tokens, which makes it easier to trace and debug
issues.
- Simplified API contract: It can simplify the contract between
the client and server side systems and reduce the fear of
erroneous data processing.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

In a distributed system, performing an action at most once (the
client makes only one request) or at least once (the client keeps
requesting until success is confirmed) is relatively
straightforward. However, it's challenging to implement
*exactly once* behavior. To achieve this, your
clients should generate and provide an idempotency token for each
request.

By using idempotency tokens, a service can distinguish between new
requests and repeated ones. When a service receives a request with
an idempotency token, it checks if the token has already been
used. If the token has been used, the service retrieves and
returns the stored response. If the token is new, the service
processes the request, stores the response along with the token,
and then returns the response. This mechanism makes all responses
idempotent, which enhances the reliability and consistency of the
distributed system.

Idempotency is also an important behavior of event-driven
architectures. These architectures are typically backed by a
message queue such as Amazon SQS, Amazon MQ, Amazon Kinesis
Streams, or Amazon Managed Streaming for Apache Kafka (MSK). In some
circumstances, a message that was published only once may be
accidentally delivered more than once. When a publisher generates
and includes idempotency tokens in messages, it requests that the
processing of any duplicate message received doesn't result in a
repeated action for the same message. Consumers should keep track
of each token received and ignore messages that contain duplicate
tokens.

Services and consumers should also pass the received idempotency
token to any downstream services that it calls. Every downstream
service in the processing chain is similarly responsible for
making sure that idempotency is implemented to avoid the side
effect of processing a message more than once.

### Implementation steps

- **Identify idempotent
operations**

Determine which operations require idempotency. These
typically include POST,
PUT, and DELETE HTTP
methods and database insert, update, or delete operations.
Operations that do not mutate state, such as read-only
queries, usually do not require idempotency unless they have
side effects.
- **Use unique identifiers**

Include a unique token in each idempotent operation request
sent by the sender, either directly in the request or as
part of its metadata (for example, an HTTP header). This
allows the receiver to recognize and handle duplicate
requests or operations. Identifiers commonly used for tokens
include
[Universally
Unique Identifiers (UUIDs)](https://datatracker.ietf.org/doc/html/rfc9562) and

[K-Sortable
Unique Identifiers (KSUIDs)](https://github.com/segmentio/ksuid).
- **Track and manage state**

Maintain the state of each operation or request in your
workload. This can be achieved by storing the idempotency
token and the corresponding state (such as
pending, completed, or
failed) in a database, cache, or other
persistent store. This state information allows the workload
to identify and handle duplicate requests or operations.

Maintain consistency and atomicity by using appropriate
concurrency control mechanisms if needed, such as locks,
transactions, or optimistic concurrency controls. This
includes the process of recording the idempotent token and
running all mutating operations associated with servicing
the request. This helps prevent race conditions and verifies
that idempotent operations run correctly.

Regularly remove old idempotency tokens from the datastore
to manage storage and performance. If your storage system
supports it, consider using expiration timestamps for data
(often known as time to live, or TTL values). The likelihood
of idempotency token reuse diminishes over time.

Common AWS storage options typically used for storing
idempotency tokens and related state include:

**Amazon DynamoDB**:
DynamoDB is a NoSQL database service that provides
low-latency performance and high availability, which
makes it well-suited for the storage of
idempotency-related data. The key-value and document
data model of DynamoDB allows for efficient storage and
retrieval of idempotency tokens and associated state
information. DynamoDB can also expire idempotency tokens
automatically if your application sets a TTL value when
it inserts them.
- **Amazon ElastiCache**:
ElastiCache can store idempotency tokens with high
throughput, low latency, and at low cost. Both
ElastiCache (Redis) and ElastiCache (Memcached) can also
expire idempotency tokens automatically if your
application sets a TTL value when it inserts them.
- **Amazon Relational Database Service
(RDS):** You can use Amazon RDS to store idempotency
tokens and related state information, especially if your
application already uses a relational database for other
purposes.
- **Amazon Simple Storage Service (S3):** Amazon S3 is a highly scalable and durable object storage service that can be used to store idempotency tokens and related metadata. The versioning capabilities of S3 can be particularly useful for maintenance of the state of idempotent operations.

The choice of storage service typically depends on factors such as the volume of idempotency-related data, the required performance characteristics, the need for durability and availability, and how the idempotency mechanism integrates with the overall workload architecture.

- **Implement idempotent
operations**

Design your API and workload components to be idempotent.
Incorporate idempotency checks into your workload
components. Before you process a request or perform an
operation, check if the unique identifier has already been
processed. If it has, return the previous result instead of
executing the operation again. For example, if a client
sends a request to create a user, check if a user with the
same unique identifier already exists. If the user exists,
it should return the existing user information instead of
creating a new one. Similarly, if a queue consumer receives
a message with a duplicate idempotency token, the consumer
should ignore the message.

Create comprehensive test suites that validate the
idempotency of requests. They should cover a wide range of
scenarios, such as successful requests, failed requests, and
duplicate requests.

If your workload leverages AWS Lambda functions, consider
Powertools for AWS Lambda. Powertools for AWS Lambda is a
developer toolkit that helps implement serverless best
practices and increase developer velocity when you work with
AWS Lambda functions. In particular, it provides a utility
to convert your Lambda functions into idempotent operations
which are safe to retry.
- **Communicate idempotency
clearly**

Document your API and workload components to clearly
communicate the idempotent nature of the operations. This
helps clients understand the expected behavior and how to
interact with your workload reliably.
- **Monitor and audit**

Implement monitoring and auditing mechanisms to detect any
issues related to the idempotency of responses, such as
unexpected response variations or excessive duplicate
request handling. This can help you detect and investigate
any issues or unexpected behaviors in your workload.

## Resources

**Related best practices:**

- [REL05-BP03
Control and limit retry calls](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_limit_retries.html)
- [REL06-BP01
Monitor all components for the workload (Generation)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_monitor_resources.html)
- [REL06-BP03
Send notifications (Real-time processing and alarming)](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_monitor_aws_resources_notification_monitor.html))
- [REL08-BP02
Integrate functional testing as part of your deployment](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_functional_testing.html)

**Related documents:**

- [The
Amazon Builders' Library: Making retries safe with idempotent APIs](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/)
- [The
Amazon Builders' Library: Challenges with distributed systems](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/)
- [The
Amazon Builders' Library: Reliability, constant work, and a good cup of coffee](https://aws.amazon.com/builders-library/reliability-and-constant-work/)
- [Amazon Elastic Container Service: Ensuring idempotency](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/ECS_Idempotency.html)
- [How
do I make my Lambda function idempotent?](https://repost.aws/knowledge-center/lambda-function-idempotent)
- [Ensuring
idempotency in Amazon EC2 API requests](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html)

**Related videos:**

- [Building
Distributed Applications with Event-driven Architecture - AWS Online Tech Talks](https://www.youtube.com/watch?v=gA2-eqDVSng&t=1668s)
- [AWS re:Invent 2023 - Building next-generation applications with event-driven architecture](https://www.youtube.com/watch?v=KXR17uwLEC8)
- [AWS re:Invent 2023 - Advanced integration patterns & trade-offs for loosely coupled systems](https://www.youtube.com/watch?v=FGKGdUiZKto)
- [AWS re:Invent 2023 - Advanced event-driven patterns with Amazon EventBridge](https://www.youtube.com/watch?v=6X4lSPkn4ps)
- [AWS re:Invent
2018 - Close Loops and Opening Minds: How to Take Control of Systems, Big and Small ARC337 (includes loose coupling, constant work, static stability)](https://youtu.be/O8xLxNje30M)
- [AWS re:Invent
2019 - Moving to event-driven architectures (SVS308)](https://youtu.be/h46IquqjF3E)

**Related tools:**

- [Idempotency
with AWS Lambda Powertools (Java)](https://docs.powertools.aws.dev/lambda/java/utilities/idempotency/)
- [Idempotency
with AWS Lambda Powertools (Python)](https://docs.powertools.aws.dev/lambda/python/latest/utilities/idempotency/)
- [AWS Lambda Powertools GitHub page](https://github.com/aws-powertools/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_prevent_interaction_failure_idempotent.html*

---
