# REL 5 — How do you design interactions in a distributed system to mitigate or withstand failures?

**Pillar**: Reliability  
**Best Practices**: 7

---

# REL05-BP01 Implement graceful degradation to transform applicable hard dependencies into soft dependencies

Application components should continue to perform their core function even if dependencies become unavailable. They might be serving slightly stale data, alternate data, or even no data. This ensures overall system function is only minimally impeded by localized failures while delivering the central business value.

**Desired outcome:** When a component's dependencies are unhealthy, the component itself can still function, although in a degraded manner. Failure modes of components should be seen as normal operation. Workflows should be designed in such a way that such failures do not lead to complete failure or at least to predictable and recoverable states.

**Common anti-patterns:**

- Not identifying the core business functionality needed. Not testing that components are functional even during dependency failures.
- Serving no data on errors or when only one out of multiple dependencies is unavailable and partial results can still be returned.
- Creating an inconsistent state when a transaction partially fails.
- Not having an alternative way to access a central parameter store.
- Invalidating or emptying local state as a result of a failed refresh without considering the consequences of doing so.

**Benefits of establishing this best practice:** Graceful degradation improves the availability of the system as a whole and maintains the functionality of the most important functions even during failures.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implementing graceful degradation helps minimize the impact of dependency failures on component function. Ideally, a component detects dependency failures and works around them in a way that minimally impacts other components or customers.

Architecting for graceful degradation means considering potential failure modes during dependency design. For each failure mode, have a way to deliver most or at least the most critical functionality of the component to callers or customers. These considerations can become additional requirements that can be tested and verified. Ideally, a component is able to perform its core function in an acceptable manner even when one or multiple dependencies fail.

This is as much a business discussion as a technical one. All business requirements are important and should be fulfilled if possible. However, it still makes sense to ask what should happen when not all of them can be fulfilled. A system can be designed to be available and consistent, but under circumstances where one requirement must be dropped, which one is more important? For payment processing, it might be consistency. For a real-time application, it might be availability. For a customer facing website, the answer may depend on customer expectations.

What this means depends on the requirements of the component and what should be considered its core function. For example:

- An ecommerce website might display data from multiple different systems like personalized recommendations, highest ranked products, and status of customer orders on the landing page. When one upstream system fails, it still makes sense to display everything else instead of showing an error page to a customer.
- A component performing batch writes can still continue processing a batch if one of the individual operations fails. It should be simple to implement a retry mechanism. This can be done by returning information on which operations succeeded, which failed, and why they failed to the caller, or putting failed requests into a dead letter queue to implement asynchronous retries. Information about failed operations should be logged as well.
- A system that processes transactions must verify that either all or no individual updates are executed. For distributed transactions, the saga pattern can be used to roll back previous operations in case a later operation of the same transaction fails. Here, the core function is maintaining consistency.
- Time critical systems should be able to deal with dependencies not responding in a timely manner. In these cases, the circuit breaker pattern can be used. When responses from a dependency start timing out, the system can switch to a closed state where no additional call are made.
- An application may read parameters from a parameter store. It can be useful to create container images with a default set of parameters and use these in case the parameter store is unavailable.

Note that the pathways taken in case of component failure need to be tested and should be significantly simpler than the primary pathway. Generally, [fallback strategies should be avoided](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems/).

## Implementation steps

Identify external and internal dependencies. Consider what kinds of failures can occur in them. Think about ways that minimize negative impact on upstream and downstream systems and customers during those failures.

The following is a list of dependencies and how to degrade gracefully when they fail:

- **Partial failure of dependencies:** A component may make multiple requests to downstream systems, either as multiple requests to one system or one request to multiple systems each. Depending on the business context, different ways of handling for this may be appropriate (for more detail, see previous examples in Implementation guidance).
- **A downstream system is unable to process requests due to high load:** If requests to a downstream system are consistently failing, it does not make sense to continue retrying. This may create additional load on an already overloaded system and make recovery more difficult. The circuit breaker pattern can be utilized here, which monitors failing calls to a downstream system. If a high number of calls are failing, it will stop sending more requests to the downstream system and only occasionally let calls through to test whether the downstream system is available again.
- **A parameter store is unavailable:** To transform a parameter store, soft dependency caching or sane defaults included in container or machine images may be used. Note that these defaults need to be kept up-to-date and included in test suites.
- **A monitoring service or other non-functional dependency is unavailable:** If a component is intermittently unable to send logs, metrics, or traces to a central monitoring service, it is often best to still execute business functions as usual. Silently not logging or pushing metrics for a long time is often not acceptable. Also, some use cases may require complete auditing entries to fulfill compliance requirements.
- **A primary instance of a relational database may be unavailable:** Amazon Relational Database Service, like almost all relational databases, can only have one primary writer instance. This creates a single point of failure for write workloads and makes scaling more difficult. This can partially be mitigated by using a Multi-AZ configuration for high availability or Amazon Aurora Serverless for better scaling. For very high availability requirements, it can make sense to not rely on the primary writer at all. For queries that only read, read replicas can be used, which provide redundancy and the ability to scale out, not just up. Writes can be buffered, for example in an Amazon Simple Queue Service queue, so that write requests from customers can still be accepted even if the primary is temporarily unavailable.

## Resources

**Related documents:**

- [Amazon API Gateway: Throttle API Requests for Better
Throughput](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html)
- [CircuitBreaker
(summarizes Circuit Breaker from “Release It!” book)](https://martinfowler.com/bliki/CircuitBreaker.html)
- [Error
Retries and Exponential Backoff in AWS](https://docs.aws.amazon.com/general/latest/gr/api-retries.html)
- [Michael
Nygard “Release It! Design and Deploy Production-Ready
Software”](https://pragprog.com/titles/mnee2/release-it-second-edition/)
- [The
Amazon Builders' Library: Avoiding fallback in distributed
systems](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems)
- [The
Amazon Builders' Library: Avoiding insurmountable queue
backlogs](https://aws.amazon.com/builders-library/avoiding-insurmountable-queue-backlogs)
- [The
Amazon Builders' Library: Caching challenges and
strategies](https://aws.amazon.com/builders-library/caching-challenges-and-strategies/)
- [The
Amazon Builders' Library: Timeouts, retries, and backoff with
jitter](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/)

**Related videos:**

- [Retry,
backoff, and jitter: AWS re:Invent 2019: Introducing The
Amazon Builders’ Library (DOP328)](https://youtu.be/sKRdemSirDM?t=1884)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_graceful_degradation.html*

---

# REL05-BP02 Throttle requests

Throttle requests to mitigate resource exhaustion due to unexpected increases in demand. Requests below throttling rates are processed while those over the defined limit are rejected with a return message indicating the request was throttled.

**Desired outcome:** Large volume spikes either from sudden customer traffic increases, flooding attacks, or retry storms are mitigated by request throttling, allowing workloads to continue normal processing of supported request volume.

**Common anti-patterns:**

- API endpoint throttles are not implemented or are left at default values without considering expected volumes.
- API endpoints are not load tested or throttling limits are not tested.
- Throttling request rates without considering request size or complexity.
- Testing maximum request rates or maximum request size, but not testing both together.
- Resources are not provisioned to the same limits established in testing.
- Usage plans have not been configured or considered for application to application (A2A) API consumers.
- Queue consumers that horizontally scale do not have maximum concurrency settings configured.
- Rate limiting on a per IP address basis has not been implemented.

**Benefits of establishing this best practice:** Workloads that set throttle limits are able to operate normally and process accepted request load successfully under unexpected volume spikes. Sudden or sustained spikes of requests to APIs and queues are throttled and do not exhaust request processing resources. Rate limits throttle individual requestors so that high volumes of traffic from a single IP address or API consumer will not exhaust resources impact other consumers.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Services should be designed to process a known capacity of requests; this capacity can be established through load testing. If request arrival rates exceed limits, the appropriate response signals that a request has been throttled. This allows the consumer to handle the error and retry later.

When your service requires a throttling implementation, consider implementing the token bucket algorithm, where a token counts for a request. Tokens are refilled at a throttle rate per second and emptied asynchronously by one token per request.

*The token bucket algorithm.*

[Amazon API Gateway](https://aws.amazon.com/api-gateway/) implements the token bucket algorithm according to account and region limits and can be configured per-client with usage plans. Additionally, [Amazon Simple Queue Service (Amazon SQS)](https://aws.amazon.com/sqs/) and [Amazon Kinesis](https://aws.amazon.com/kinesis/) can buffer requests to smooth out the request rate, and allow higher throttling rates for requests that can be addressed. Finally, you can implement rate limiting with [AWS WAF](https://aws.amazon.com/waf/) to throttle specific API consumers that generate unusually high load.

## Implementation steps

You can configure API Gateway with throttling limits for your APIs and return `429 Too Many Requests` errors when limits are exceeded. You can use AWS WAF with your AWS AppSync and API Gateway endpoints to enable rate limiting on a per IP address basis. Additionally, where your system can tolerate asynchronous processing, you can put messages into a queue or stream to speed up responses to service clients, which allows you to burst to higher throttle rates.

With asynchronous processing, when you’ve configured Amazon SQS as an event source for AWS Lambda, you can [configure maximum concurrency](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency) to avoid high event rates from consuming available account concurrent execution quota needed for other services in your workload or account.

While API Gateway provides a managed implementation of the token bucket, in cases where you cannot use API Gateway, you can take advantage of language specific open-source implementations (see related examples in Resources) of the token bucket for your services.

- Understand and configure [API Gateway throttling limits](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html) at the account level per region, API per stage, and API key per usage plan levels.
- Apply [AWS WAF rate limiting rules](https://aws.amazon.com/blogs/security/three-most-important-aws-waf-rate-based-rules/) to API Gateway and AWS AppSync endpoints to protect against floods and block malicious IPs. Rate limiting rules can also be configured on AWS AppSync API keys for A2A consumers.
- Consider whether you require more throttling control than rate limiting for AWS AppSync APIs, and if so, configure an API Gateway in front of your AWS AppSync endpoint.
- When Amazon SQS queues are set up as triggers for Lambda queue consumers, set [maximum concurrency](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency) to a value that processes enough to meet your service level objectives but does not consume concurrency limits impacting other Lambda functions. Consider setting reserved concurrency on other Lambda functions in the same account and region when you consume queues with Lambda.
- Use API Gateway with native service integrations to Amazon SQS or Kinesis to buffer requests.
- If you cannot use API Gateway, look at language specific libraries to implement the token bucket algorithm for your workload. Check the examples section and do your own research to find a suitable library.
- Test limits that you plan to set, or that you plan to allow to be increased, and document the tested limits.
- Do not increase limits beyond what you establish in testing. When increasing a limit, verify that provisioned resources are already equivalent to or greater than those in test scenarios before applying the increase.

## Resources

**Related best practices:**

- [REL04-BP03 Do constant work](./rel_prevent_interaction_failure_constant_work.html)
- [REL05-BP03 Control and limit retry calls](./rel_mitigate_interaction_failure_limit_retries.html)

**Related documents:**

- [Amazon API Gateway: Throttle API Requests for Better
Throughput](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html)
- [AWS WAF: Rate-based rule statement](https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-rate-based.html)
- [Introducing maximum concurrency of AWS Lambda when using Amazon SQS as an event source](https://aws.amazon.com/blogs/compute/introducing-maximum-concurrency-of-aws-lambda-functions-when-using-amazon-sqs-as-an-event-source/)
- [AWS Lambda: Maximum Concurrency](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency)

**Related examples:**

- [The three most important AWS WAF rate-based rules](https://aws.amazon.com/blogs/security/three-most-important-aws-waf-rate-based-rules/)
- [Java Bucket4j](https://github.com/bucket4j/bucket4j)
- [Python token-bucket](https://pypi.org/project/token-bucket/)
- [Node token-bucket](https://www.npmjs.com/package/tokenbucket)
- [.NET System Threading Rate Limiting](https://www.nuget.org/packages/System.Threading.RateLimiting)

**Related videos:**

- [Implementing GraphQL API security best practices with AWS AppSync](https://www.youtube.com/watch?v=1ASMLeJ_15U)

**Related tools:**

- [Amazon API Gateway](https://aws.amazon.com/api-gateway/)
- [AWS AppSync](https://aws.amazon.com/appsync/)
- [Amazon SQS](https://aws.amazon.com/sqs/)
- [Amazon Kinesis](https://aws.amazon.com/kinesis/)
- [AWS WAF](https://aws.amazon.com/waf/)
- [Virtual Waiting Room on AWS](https://aws.amazon.com/solutions/implementations/virtual-waiting-room-on-aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_throttle_requests.html*

---

# REL05-BP03 Control and limit retry calls

Use exponential backoff to retry requests at progressively longer intervals between each retry. Introduce jitter between retries to randomize retry intervals. Limit the maximum number of retries.

**Desired outcome:** Typical components in a distributed software system include servers, load balancers, databases, and DNS servers. During normal operation, these components can respond to requests with errors that are temporary or limited, and also errors that would be persistent regardless of retries. When clients make requests to services, the requests consume resources including memory, threads, connections, ports, or any other limited resources. Controlling and limiting retries is a strategy to release and minimize consumption of resources so that system components under strain are not overwhelmed.

When client requests time out or receive error responses, they should determine whether or not to retry. If they do retry, they do so with exponential backoff with jitter and a maximum retry value. As a result, backend services and processes are given relief from load and time to self-heal, resulting in faster recovery and successful request servicing.

**Common anti-patterns:**

- Implementing retries without adding exponential backoff, jitter, and maximum retry values. Backoff and jitter help avoid artificial traffic spikes due to unintentionally coordinated retries at common intervals.
- Implementing retries without testing their effects or assuming retries are already built into an SDK without testing retry scenarios.
- Failing to understand published error codes from dependencies, leading to retrying all errors, including those with a clear cause that indicates lack of permission, configuration error, or another condition that predictably will not resolve without manual intervention.
- Not addressing observability practices, including monitoring and alerting on repeated service failures so that underlying issues are made known and can be addressed.
- Developing custom retry mechanisms when built-in or third-party retry capabilities suffice.
- Retrying at multiple layers of your application stack in a manner which compounds retry attempts further consuming resources in a retry storm. Be sure to understand how these errors affect your application the dependencies you rely on, then implement retries at only one level.
- Retrying service calls that are not idempotent, causing unexpected side effects like duplicated results.

**Benefits of establishing this best practice:** Retries help clients acquire desired results when requests fail but also consume more of a server’s time to get the successful responses they want. When failures are rare or transient, retries work well. When failures are caused by resource overload, retries can make things worse. Adding exponential backoff with jitter to client retries allows servers to recover when failures are caused by resource overload. Jitter avoids alignment of requests into spikes, and backoff diminishes load escalation caused by adding retries to normal request load. Finally, it’s important to configure a maximum number of retries or elapsed time to avoid creating backlogs that produce metastable failures.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Control and limit retry calls. Use exponential backoff to retry after progressively longer intervals. Introduce jitter to randomize retry intervals and limit the maximum number of retries.

Some AWS SDKs implement retries and exponential backoff by default. Use these built-in AWS implementations where applicable in your workload. Implement similar logic in your workload when calling services that are idempotent and where retries improve your client availability. Decide what the timeouts are and when to stop retrying based on your use case. Build and exercise testing scenarios for those retry use cases.

## Implementation steps

- Determine the optimal layer in your application stack to implement retries for the services your application relies on.
- Be aware of existing SDKs that implement proven retry strategies with exponential backoff and jitter for your language of choice, and favor these over writing your own retry implementations.
- Verify that [services are idempotent](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/) before implementing retries. Once retries are implemented, be sure they are both tested and regularly exercise in production.
- When calling AWS service APIs, use the [AWS SDKs](https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html) and [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-retries.html) and understand the retry configuration options. Determine if the defaults work for your use case, test, and adjust as needed.

## Resources

**Related best practices:**

- [REL04-BP04 Make mutating operations idempotent](./rel_prevent_interaction_failure_idempotent.html)
- [REL05-BP02 Throttle requests](./rel_mitigate_interaction_failure_throttle_requests.html)
- [REL05-BP04 Fail fast and limit queues](./rel_mitigate_interaction_failure_fail_fast.html)
- [REL05-BP05 Set client timeouts](./rel_mitigate_interaction_failure_client_timeouts.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)

**Related documents:**

- [Error
Retries and Exponential Backoff in AWS](https://docs.aws.amazon.com/general/latest/gr/api-retries.html)
- [The
Amazon Builders' Library: Timeouts, retries, and backoff with
jitter](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/)
- [Exponential Backoff and Jitter](https://aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/)
- [Making retries safe with idempotent APIs](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/)

**Related examples:**

- [Spring Retry](https://github.com/spring-projects/spring-retry)
- [Resilience4j Retry](https://resilience4j.readme.io/docs/retry)

**Related videos:**

- [Retry,
backoff, and jitter: AWS re:Invent 2019: Introducing The
Amazon Builders’ Library (DOP328)](https://youtu.be/sKRdemSirDM?t=1884)

**Related tools:**

- [AWS SDKs and Tools: Retry behavior](https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html)
- [AWS Command Line Interface: AWS CLI retries](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-retries.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_limit_retries.html*

---

# REL05-BP04 Fail fast and limit queues

When a service is unable to respond successfully to a request, fail fast. This allows resources associated with a request to be released, and permits a service to recover if it’s running out of resources. Failing fast is a well-established software design pattern that can be leveraged to build highly reliable workloads in the cloud. Queuing is also a well-established enterprise integration pattern that can smooth load and allow clients to release resources when asynchronous processing can be tolerated. When a service is able to respond successfully under normal conditions but fails when the rate of requests is too high, use a queue to buffer requests. However, do not allow a buildup of long queue backlogs that can result in processing stale requests that a client has already given up on.

**Desired outcome:** When systems experience resource contention, timeouts, exceptions, or grey failures that make service level objectives unachievable, fail fast strategies allow for faster system recovery. Systems that must absorb traffic spikes and can accommodate asynchronous processing can improve reliability by allowing clients to quickly release requests by using queues to buffer requests to backend services. When buffering requests to queues, queue management strategies are implemented to avoid insurmountable backlogs.

**Common anti-patterns:**

- Implementing message queues but not configuring dead letter queues (DLQ) or alarms on DLQ volumes to detect when a system is in failure.
- Not measuring the age of messages in a queue, a measurement of latency to understand when queue consumers are falling behind or erroring out causing retrying.
- Not clearing backlogged messages from a queue, when there is no value in processing these messages if the business need no longer exists.
- Configuring first in first out (FIFO) queues when last in first out (LIFO) queues would better serve client needs, for example when strict ordering is not required and backlog processing is delaying all new and time sensitive requests resulting in all clients experiencing breached service levels.
- Exposing internal queues to clients instead of exposing APIs that manage work intake and place requests into internal queues.
- Combining too many work request types into a single queue which can exacerbate backlog conditions by spreading resource demand across request types.
- Processing complex and simple requests in the same queue, despite needing different monitoring, timeouts and resource allocations.
- Not validating inputs or using assertions to implement fail fast mechanisms in software that bubble up exceptions to higher level components that can handle errors gracefully.
- Not removing faulty resources from request routing, especially when failures are grey emitting both successes and failures due to crashing and restarting, intermittent dependency failure, reduced capacity, or network packet loss.

**Benefits of establishing this best practice:** Systems that fail fast are easier to debug and fix, and often expose issues in coding and configuration before releases are published into production. Systems that incorporate effective queueing strategies provide greater resilience and reliability to traffic spikes and intermittent system fault conditions.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Fail fast strategies can be coded into software solutions as well as configured into infrastructure. In addition to failing fast, queues are a straightforward yet powerful architectural technique to decouple system components smooth load. [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) provides capabilities to monitor for and alarm on failures. Once a system is known to be failing, mitigation strategies can be invoked, including failing away from impaired resources. When systems implement queues with [Amazon SQS](https://aws.amazon.com/sqs/) and other queue technologies to smooth load, they must consider how to manage queue backlogs, as well as message consumption failures.

## Implementation steps

- Implement programmatic assertions or specific metrics in your software and use them to explicitly alert on system issues. Amazon CloudWatch helps you create metrics and alarms based on application log pattern and SDK instrumentation.
- Use CloudWatch metrics and alarms to fail away from impaired resources that are adding latency to processing or repeatedly failing to process requests.
- Use asynchronous processing by designing APIs to accept requests and append requests to internal queues using Amazon SQS and then respond to the message-producing client with a success message so the client can release resources and move on with other work while backend queue consumers process requests.
- Measure and monitor for queue processing latency by producing a CloudWatch metric each time you take a message off a queue by comparing now to message timestamp.
- When failures prevent successful message processing or traffic spikes in volumes that cannot be processed within service level agreements, sideline older or excess traffic to a spillover queue. This allows priority processing of new work, and older work when capacity is available. This technique is an approximation of LIFO processing and allows normal system processing for all new work.
- Use dead letter or redrive queues to move messages that can’t be processed out of the backlog into a location that can be researched and resolved later
- Either retry or, when tolerable, drop old messages by comparing now to the message timestamp and discarding messages that are no longer relevant to the requesting client.

## Resources

**Related best practices:**

- [REL04-BP02 Implement loosely coupled dependencies](./rel_prevent_interaction_failure_loosely_coupled_system.html)
- [REL05-BP02 Throttle requests](./rel_mitigate_interaction_failure_throttle_requests.html)
- [REL05-BP03 Control and limit retry calls](./rel_mitigate_interaction_failure_limit_retries.html)
- [REL06-BP02 Define and calculate metrics (Aggregation)](./rel_monitor_aws_resources_notification_aggregation.html)
- [REL06-BP07 Monitor end-to-end tracing of requests through your system](./rel_monitor_aws_resources_end_to_end.html)

**Related documents:**

- [Avoiding insurmountable queue backlogs](https://aws.amazon.com/builders-library/avoiding-insurmountable-queue-backlogs/)
- [Fail
Fast](https://www.martinfowler.com/ieeeSoftware/failFast.pdf)
- [How can I prevent an increasing backlog of messages in my Amazon SQS queue?](https://repost.aws/knowledge-center/sqs-message-backlog)
- [Elastic Load Balancing: Zonal Shift](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/zonal-shift.html)
- [Amazon Application Recovery Controller: Routing control for traffic failover](https://docs.aws.amazon.com/r53recovery/latest/dg/getting-started-routing-controls.html)

**Related examples:**

- [Enterprise Integration Patterns: Dead Letter Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DeadLetterChannel.html)

**Related videos:**

- [AWS re:Invent 2022 - Operating highly available Multi-AZ applications](https://www.youtube.com/watch?v=mwUV5skJJ0s)

**Related tools:**

- [Amazon SQS](https://aws.amazon.com/sqs/)
- [Amazon MQ](https://aws.amazon.com/amazon-mq/)
- [AWS IoT Core](https://aws.amazon.com/iot-core/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_fail_fast.html*

---

# REL05-BP05 Set client timeouts

Set timeouts appropriately on connections and requests, verify them systematically, and do not rely on default values as they are not aware of workload specifics.

**Desired outcome:** Client timeouts should consider the cost to the client, server, and workload associated with waiting for requests that take abnormal amounts of time to complete. Since it is not possible to know the exact cause of any timeout, clients must use knowledge of services to develop expectations of probable causes and appropriate timeouts

Client connections time out based on configured values. After encountering a timeout, clients make decisions to back off and retry or open a [circuit breaker](https://martinfowler.com/bliki/CircuitBreaker.html). These patterns avoid issuing requests that may exacerbate an underlying error condition.

**Common anti-patterns:**

- Not being aware of system timeouts or default timeouts.
- Not being aware of normal request completion timing.
- Not being aware of possible causes for requests to take abnormally long to complete, or the costs to client, service, or workload performance associated with waiting on these completions.
- Not being aware of the probability of impaired network causing a request to fail only once timeout is reached, and the costs to client and workload performance for not adopting a shorter timeout.
- Not testing timeout scenarios both for connections and requests.
- Setting timeouts too high, which can result in long wait times and increase resource utilization.
- Setting timeouts too low, resulting in artificial failures.
- Overlooking patterns to deal with timeout errors for remote calls like circuit breakers and retries.
- Not considering monitoring for service call error rates, service level objectives for latency, and latency outliers. These metrics can provide insight to aggressive or permissive timeouts

**Benefits of establishing this best practice:** Remote call timeouts are configured and systems are designed to handle timeouts gracefully so that resources are conserved when remote calls respond abnormally slow and timeout errors are handled gracefully by service clients.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Set both a connection timeout and a request timeout on any service dependency call and generally on any call across processes. Many frameworks offer built-in timeout capabilities, but be careful, as some have default values that are infinite or higher than acceptable for your service goals. A value that is too high reduces the usefulness of the timeout because resources continue to be consumed while the client waits for the timeout to occur. A value that is too low can generate increased traffic on the backend and increased latency because too many requests are retried. In some cases, this can lead to complete outages because all requests are being retried.

Consider the following when determining timeout strategies:

- Requests may take longer than normal to process because of their content, impairments in a target service, or a networking partition failure.
- Requests with abnormally expensive content could consume unnecessary server and client resources. In this case, timing out these requests and not retrying can preserve resources. Services should also protect themselves from abnormally expensive content with throttles and server-side timeouts.
- Requests that take abnormally long due to a service impairment can be timed out and retried. Consideration should be given to service costs for the request and retry, but if the cause is a localized impairment, a retry is not likely to be expensive and will reduce client resource consumption. The timeout may also release server resources depending on the nature of the impairment.
- Requests that take a long time to complete because the request or response has failed to be delivered by the network can be timed out and retried. Because the request or response was not delivered, failure would have been the outcome regardless of the length of timeout. Timing out in this case will not release server resources, but it will release client resources and improve workload performance.

Take advantage of well-established design patterns like retries and circuit breakers to handle timeouts gracefully and support fail-fast approaches. [AWS SDKs](https://docs.aws.amazon.com/index.html#sdks) and [AWS CLI](https://aws.amazon.com/cli/) allow for configuration of both connection and request timeouts and for retries with exponential backoff and jitter. [AWS Lambda](https://aws.amazon.com/lambda/) functions support configuration of timeouts, and with [AWS Step Functions](https://aws.amazon.com/step-functions/), you can build low code circuit breakers that take advantage of pre-built integrations with AWS services and SDKs. [AWS App Mesh](https://aws.amazon.com/app-mesh/) Envoy provides timeout and circuit breaker capabilities.

## Implementation steps

- Configure timeouts on remote service calls and take advantage of built-in language timeout features or open source timeout libraries.
- When your workload makes calls with an AWS SDK, review the documentation for language specific timeout configuration.

[Python](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html)
- [PHP](https://docs.aws.amazon.com/aws-sdk-php/v3/api/class-Aws.DefaultsMode.Configuration.html)
- [.NET](https://docs.aws.amazon.com/sdk-for-net/v3/developer-guide/retries-timeouts.html)
- [Ruby](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/timeout-duration.html)
- [Java](https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/best-practices.html#bestpractice5)
- [Go](https://aws.github.io/aws-sdk-go-v2/docs/configuring-sdk/retries-timeouts/#timeouts)
- [Node.js](https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/Config.html)
- [C++](https://docs.aws.amazon.com/sdk-for-cpp/v1/developer-guide/client-config.html)

- When using AWS SDKs or AWS CLI commands in your workload, configure default timeout values by setting the AWS [configuration defaults](https://docs.aws.amazon.com/sdkref/latest/guide/feature-smart-config-defaults.html) for `connectTimeoutInMillis` and `tlsNegotiationTimeoutInMillis`.
- Apply [command line options](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html) `cli-connect-timeout` and `cli-read-timeout` to control one-off AWS CLI commands to AWS services.
- Monitor remote service calls for timeouts, and set alarms on persistent errors so that you can proactively handle error scenarios.
- Implement [CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html) and [CloudWatch anomaly detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html) on call error rates, service level objectives for latency, and latency outliers to provide insight into managing overly aggressive or permissive timeouts.
- Configure timeouts on [Lambda functions](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-timeout-console).
- API Gateway clients must implement their own retries when handling timeouts. API Gateway supports a [50 millisecond to 29 second integration timeout](https://docs.aws.amazon.com/apigateway/latest/developerguide/limits.html#api-gateway-execution-service-limits-table) for downstream integrations and does not retry when integration requests timeout.
- Implement the [circuit breaker](https://martinfowler.com/bliki/CircuitBreaker.html) pattern to avoid making remote calls when they are timing out. Open the circuit to avoid failing calls and close the circuit when calls are responding normally.
- For container based workloads, review [App Mesh Envoy](https://docs.aws.amazon.com/app-mesh/latest/userguide/envoy.html) features to leverage built in timeouts and circuit breakers.
- Use AWS Step Functions to build low code circuit breakers for remote service calls, especially where calling AWS native SDKs and supported Step Functions integrations to simplify your workload.

## Resources

**Related best practices:**

- [REL05-BP03 Control and limit retry calls](./rel_mitigate_interaction_failure_limit_retries.html)
- [REL05-BP04 Fail fast and limit queues](./rel_mitigate_interaction_failure_fail_fast.html)
- [REL06-BP07 Monitor end-to-end tracing of requests through your system](./rel_monitor_aws_resources_end_to_end.html)

**Related documents:**

- [AWS SDK: Retries and Timeouts](https://docs.aws.amazon.com/sdk-for-net/v3/developer-guide/retries-timeouts.html)
- [The
Amazon Builders' Library: Timeouts, retries, and backoff with
jitter](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/)
- [Amazon API Gateway quotas and important notes](https://docs.aws.amazon.com/apigateway/latest/developerguide/limits.html)
- [AWS Command Line Interface: Command line options](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html)
- [AWS SDK for Java 2.x: Configure API Timeouts](https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/best-practices.html#bestpractice5)
- [AWS Botocore using the config object and Config Reference](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html#using-the-config-object)
- [AWS SDK for .NET: Retries and Timeouts](https://docs.aws.amazon.com/sdk-for-net/v3/developer-guide/retries-timeouts.html)
- [AWS Lambda: Configuring Lambda function options](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html)

**Related examples:**

- [Using the circuit breaker pattern with AWS Step Functions and Amazon DynamoDB](https://aws.amazon.com/blogs/compute/using-the-circuit-breaker-pattern-with-aws-step-functions-and-amazon-dynamodb/)
- [Martin Fowler: CircuitBreaker](https://martinfowler.com/bliki/CircuitBreaker.html?ref=wellarchitected)

**Related tools:**

- [AWS SDKs](https://docs.aws.amazon.com/index.html#sdks)
- [AWS Lambda](https://aws.amazon.com/lambda/)
- [Amazon SQS](https://aws.amazon.com/sqs/)
- [AWS Step Functions](https://aws.amazon.com/step-functions/)
- [AWS Command Line Interface](https://aws.amazon.com/cli/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_client_timeouts.html*

---

# REL05-BP06 Make systems stateless where possible

Systems should either not require state, or should offload state
such that between different client requests, there is no dependence
on locally stored data on disk and in memory. This allows servers to
be replaced at will without causing an availability impact.

When users or services interact with an application, they often
perform a series of interactions that form a session. A session is
unique data for users that persists between requests while they use
the application. A stateless application is an application that does
not need knowledge of previous interactions and does not store
session information.

Once designed to be stateless, you can then use serverless compute
services, such as AWS Lambda or AWS Fargate.

In addition to server replacement, another benefit of stateless
applications is that they can scale horizontally because any of the
available compute resources (such as EC2 instances and AWS Lambda
functions) can service any request.

**Benefits of establishing this best
practice:** Systems that are designed to be stateless are
more adaptable to horizontal scaling, making it possible to add or
remove capacity based on fluctuating traffic and demand. They are
also inherently resilient to failures and provide flexibility and
agility in application development.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Make your applications stateless. Stateless applications allow
horizontal scaling and are tolerant to the failure of an
individual node. Analyze and understand the components of your
application that maintain state within the architecture. This
helps you assess the potential impact of transitioning to a
stateless design. A stateless architecture decouples user data and
offloads the session data. This provides the flexibility to scale
each component independently to meet varying workload demands and
optimize resource utilization.

### Implementation steps

- Identify and understand the stateful components in your
application.
- Decouple data by separating and managing user data from the
core application logic.

[Amazon Cognito](https://aws.amazon.com/cognito/) can decouple user data from application
code by using features, such as
[identity
pools](https://docs.aws.amazon.com/cognito/latest/developerguide/getting-started-with-identity-pools.html),
[user
pools](https://docs.aws.amazon.com/cognito/latest/developerguide/getting-started-with-cognito-user-pools.html), and
[Amazon Cognito Sync](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sync.html).
- You can use
[AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) decouple user data by storing
secrets in a secure, centralized location. This means
that the application code doesn't need to store secrets,
which makes it more secure.
- Consider using
[Amazon S3](https://aws.amazon.com/s3/) to store large, unstructured data, such as
images and documents. Your application can retrieve this
data when required, eliminating the need to store it in
memory.
- Use
[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) to store information such as user
profiles. Your application can query this data in
near-real time.

- Offload session data to a database, cache, or external
files.

[Amazon ElastiCache](https://aws.amazon.com/elasticache/), Amazon DynamoDB,
[Amazon Elastic File System](https://aws.amazon.com/efs/) (Amazon EFS), and
[Amazon MemoryDB](https://aws.amazon.com/memorydb/) are examples of AWS services
that you can use to offload session data.

- Design a stateless architecture after you identify which
state and user data need to be persisted with your storage
solution of choice.

## Resources

**Related best practices:**

- [REL11-BP03
Automate healing on all layers](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_auto_healing_system.html)

**Related documents:**

- [The
Amazon Builders' Library: Avoiding fallback in distributed
systems](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems)
- [The
Amazon Builders' Library: Avoiding insurmountable queue
backlogs](https://aws.amazon.com/builders-library/avoiding-insurmountable-queue-backlogs)
- [The
Amazon Builders' Library: Caching challenges and
strategies](https://aws.amazon.com/builders-library/caching-challenges-and-strategies/)
- [Best
Practices for Stateless Web Tier on AWS](https://docs.aws.amazon.com/whitepapers/latest/best-practices-wordpress/stateless-web-tier.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_stateless.html*

---

# REL05-BP07 Implement emergency levers

Emergency levers are rapid processes that can mitigate availability
impact on your workload.

Emergency levers work by disabling, throttling, or changing the behavior of components or dependencies using known and tested mechanisms. This can alleviate workload impairments caused by resource exhaustion due to unexpected increases in demand and reduce the impact of failures in non-critical components within your workload.

**Desired outcome:** By implementing emergency levers, you can establish known-good processes to maintain the availability of critical components in your workload. The workload should degrade gracefully and continue to perform its business-critical functions during the activation of an emergency lever. For more detail on graceful degradation, see [REL05-BP01 Implement graceful degradation to transform applicable hard dependencies into soft dependencies](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_graceful_degradation.html).

**Common anti-patterns:**

- Failure of non-critical dependencies impacts the availability of your core workload.
- Not testing or verifying critical component behavior during non-critical component impairment.
- No clear and deterministic criteria defined for activation or deactivation of an emergency lever.

**Benefits of establishing this best practice:** Implementing emergency levers can improve the availability of the critical components in your workload by providing your resolvers with established processes to respond to unexpected spikes in demand or failures of non-critical dependencies.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- Identify critical components in your workload.
- Design and architect the critical components in your workload to withstand failure of non-critical components.
- Conduct testing to validate the behavior of your critical components during the failure of non-critical components.
- Define and monitor relevant metrics or triggers to initiate emergency lever procedures.
- Define the procedures (manual or automated) that comprise the emergency lever.

### Implementation steps

- Identify business-critical components in your workload.

Each technical component in your workload should be mapped to its relevant business function and ranked as critical or non-critical. For examples of critical and non-critical functionality at Amazon, see [Any Day Can Be Prime Day: How Amazon.com Search Uses Chaos Engineering to Handle Over 84K Requests Per Second](https://community.aws/posts/how-search-uses-chaos-engineering).
- This is both a technical and business decision, and varies by organization and workload.

- Design and architect the critical components in your workload to withstand failure of non-critical components.

During dependency analysis, consider all potential failure modes, and verify that your emergency lever mechanisms deliver the critical functionality to downstream components.

- Conduct testing to validate the behavior of your critical components during activation of your emergency levers.

Avoid bimodal behavior. For more detail, see [REL11-BP05 Use static stability to prevent bimodal behavior](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_static_stability.html).

- Define, monitor, and alert on relevant metrics to initiate the emergency lever procedure.

Finding the right metrics to monitor depends on your workload. Some example metrics are latency or the number of failed request to a dependency.

- Define the procedures, manual or automated, that comprise the emergency lever.

This may include mechanisms such as [load shedding](https://aws.amazon.com/builders-library/using-load-shedding-to-avoid-overload/), [throttling requests](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_throttle_requests.html), or implementing [graceful degradation](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_graceful_degradation.html).

## Resources

**Related best practices:**

- [REL05-BP01 Implement graceful degradation to transform applicable hard dependencies into soft dependencies](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_graceful_degradation.html)
- [REL05-BP02 Throttle requests](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_mitigate_interaction_failure_throttle_requests.html)
- [REL11-BP05 Use static stability to prevent bimodal behavior](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_withstand_component_failures_static_stability.html)

**Related documents:**

- [Automating safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)
- [Any Day Can Be Prime Day: How Amazon.com Search Uses Chaos Engineering to Handle Over 84K Requests Per Second](https://community.aws/posts/how-search-uses-chaos-engineering)

**Related videos:**

- [AWS re:Invent 2020: Reliability, consistency, and confidence through immutability](https://www.youtube.com/watch?v=jUSYnRztttY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_emergency_levers.html*

---
