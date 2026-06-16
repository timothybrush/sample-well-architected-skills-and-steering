# REL 3 — How do you design your workload service architecture?

**Pillar**: Reliability  
**Best Practices**: 3

---

# REL03-BP01 Choose how to segment your workload

Workload segmentation is important when determining the resilience requirements of your application.
Monolithic architecture should be avoided whenever possible. Instead, carefully consider which
application components can be broken out into microservices. Depending on your application requirements,
this may end up being a combination of a service-oriented architecture (SOA) with microservices where
possible. Workloads that are capable of statelessness are more capable of being deployed as microservices.

**Desired outcome:** Workloads should be supportable, scalable, and as
loosely coupled as possible.

When making choices about how to segment your workload, balance the benefits against the complexities.
What is right for a new product racing to first launch is different than what a workload built to scale
from the start needs. When refactoring an existing monolith, you will need to consider how well the application
will support a decomposition towards statelessness. Breaking services into smaller pieces allows small,
well-defined teams to develop and manage them. However, smaller services can introduce complexities which
include possible increased latency, more complex debugging, and increased operational burden.

**Common anti-patterns:**

- The [microservice Death Star](https://mrtortoise.github.io/architecture/lean/design/patterns/ddd/2018/03/18/deathstar-architecture.html) is a situation in
which the atomic components become so highly interdependent that a failure of one results in
a much larger failure, making the components as rigid and fragile as a monolith.

**Benefits of establishing this practice:**

- More specific segments lead to greater agility, organizational flexibility, and scalability.
- Reduced impact of service interruptions.
- Application components may have different availability requirements, which can be supported by a more atomic segmentation.
- Well-defined responsibilities for teams supporting the workload.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Choose your architecture type based on how you will segment your workload. Choose an SOA
or microservices architecture (or in some rare cases, a monolithic architecture). Even if you choose to start with a
monolith architecture, you must ensure that it’s modular and can ultimately evolve to SOA or microservices as your
product scales with user adoption. SOA and microservices offer respectively smaller segmentation, which is preferred as a
modern scalable and reliable architecture, but there are trade-offs to consider, especially when deploying a microservice
architecture.

One primary trade-off is that you now have a distributed compute architecture that can make it harder to achieve user
latency requirements and there is additional complexity in the debugging and tracing of user interactions. You can use
AWS X-Ray to assist you in solving this problem. Another effect to consider is increased operational complexity as you
increase the number of applications that you are managing, which requires the deployment of multiple independency
components.

*Monolithic, service-oriented, and microservices architectures*

## Implementation steps

- Determine the appropriate architecture to refactor or build your application.
SOA and microservices offer respectively smaller segmentation, which is
preferred as a modern scalable and reliable architecture. SOA can be a
good compromise for achieving smaller segmentation while avoiding some of
the complexities of microservices. For more details, see [Microservice Trade-Offs](https://martinfowler.com/articles/microservice-trade-offs.html).
- If your workload is amenable to it, and your organization can support it, you
should use a microservices architecture to achieve the best agility and reliability.
For more details, see [Implementing
Microservices on AWS.](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/introduction.html)
- Consider following the [Strangler Fig pattern](https://martinfowler.com/bliki/StranglerFigApplication.html) to refactor a monolith into
smaller components. This involves gradually replacing specific application components with
new applications and services. [AWS Migration Hub Refactor Spaces](https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/userguide/what-is-mhub-refactor-spaces.html) acts as the starting point for incremental refactoring. For
more details, see [Seamlessly migrate on-premises legacy workloads using a strangler pattern](https://aws.amazon.com/blogs/architecture/seamlessly-migrate-on-premises-legacy-workloads-using-a-strangler-pattern/).
- Implementing microservices may require a service discovery mechanism to allow these
distributed services to communicate with each other. [AWS App Mesh](https://docs.aws.amazon.com/app-mesh/latest/userguide/what-is-app-mesh.html) can be used
with service-oriented architectures to provide reliable discovery and access of services.
[AWS Cloud Map](https://aws.amazon.com/cloud-map/) can also be used for dynamic, DNS-based
service discovery.
- If you’re migrating from a monolith to SOA, [Amazon MQ](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/welcome.html) can help bridge
the gap as a service bus when redesigning legacy applications in the cloud.
- For existing monoliths with a single, shared database, choose how to reorganize the
data into smaller segments. This could be by business unit, access pattern, or data
structure. At this point in the refactoring process, you should choose to move forward
with a relational or non-relational (NoSQL) type of database. For more details, see [From SQL to NoSQL](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SQLtoNoSQL.html).

**Level of effort for the implementation plan:** High

## Resources

**Related best practices:**

- [REL03-BP02 Build services focused on specific business domains and functionality](./rel_service_architecture_business_domains.html)

**Related documents:**

- [Amazon API Gateway: Configuring a REST API Using OpenAPI](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api.html)
- [What is Service-Oriented
Architecture?](https://aws.amazon.com/what-is/service-oriented-architecture/)
- [Bounded
Context (a central pattern in Domain-Driven Design)](https://martinfowler.com/bliki/BoundedContext.html)
- [Implementing
Microservices on AWS](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/introduction.html)
- [Microservice
Trade-Offs](https://martinfowler.com/articles/microservice-trade-offs.html)
- [Microservices
- a definition of this new architectural term](https://www.martinfowler.com/articles/microservices.html)
- [Microservices
on AWS](https://aws.amazon.com/microservices/)
- [What
is AWS App Mesh?](https://docs.aws.amazon.com/app-mesh/latest/userguide/what-is-app-mesh.html)

**Related examples:**

- [Iterative App Modernization Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/f2c0706c-7192-495f-853c-fd3341db265a/en-US/intro)

**Related videos:**

- [Delivering Excellence with
Microservices on AWS](https://www.youtube.com/watch?v=otADkIyugzY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_service_architecture_monolith_soa_microservice.html*

---

# REL03-BP02 Build services focused on specific business domains and functionality

Service-oriented architectures (SOA) define services with well-delineated functions defined by business needs. Microservices use domain models and bounded context to draw service boundaries along business context boundaries. Focusing on business domains and functionality helps teams define independent reliability requirements for their services. Bounded contexts isolate and encapsulate business logic, allowing teams to better reason about how to handle failures.

**Desired outcome:** Engineers and business stakeholders jointly define bounded contexts and use them to design systems as services that fulfill specific business functions. These teams use established practices like event storming to define requirements. New applications are designed as services well-defined boundaries and loosely coupling. Existing monoliths are decomposed into [bounded contexts](https://martinfowler.com/bliki/BoundedContext.html) and system designs move towards SOA or microservice architectures. When monoliths are refactored, established approaches like bubble contexts and monolith decomposition patterns are applied.

Domain-oriented services are executed as one or more processes that don’t share state. They independently respond to fluctuations in demand and handle fault scenarios in light of domain specific requirements.

**Common anti-patterns:**

- Teams are formed around specific technical domains like UI and UX, middleware, or database instead of specific business domains.
- Applications span domain responsibilities. Services that span bounded contexts can be more difficult to maintain, require larger testing efforts, and require multiple domain teams to participate in software updates.
- Domain dependencies, like domain entity libraries, are shared across services such that changes for one service domain require changes to other service domains
- Service contracts and business logic don’t express entities in a common and consistent domain language, resulting in translation layers that complicate systems and increase debugging efforts.

**Benefits of establishing this best practice:** Applications are designed as independent services bounded by business domains and use a common business language. Services are independently testable and deployable. Services meet domain specific resiliency requirements for the domain implemented.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Domain-driven design (DDD) is the foundational approach of designing and building software around business domains. It’s helpful to work with an existing framework when building services focused on business domains. When working with existing monolithic applications, you can take advantage of decomposition patterns that provide established techniques to modernize applications into services.

*Domain-driven design*

## Implementation steps

- Teams can hold [event storming](https://serverlessland.com/event-driven-architecture/visuals/event-storming) workshops to quickly identify events, commands, aggregates and domains in a lightweight sticky note format.
- Once domain entities and functions have been formed in a domain context, you can divide your domain into services using [bounded context](https://martinfowler.com/bliki/BoundedContext.html), where entities that share similar features and attributes are grouped together. With the model divided into contexts, a template for how to boundary microservices emerges.

For example, the Amazon.com website entities might include package, delivery, schedule, price, discount, and currency.
- Package, delivery, and schedule are grouped into the shipping context, while price, discount, and currency are grouped into the pricing context.

- [Decomposing monoliths into microservices](https://docs.aws.amazon.com/prescriptive-guidance/latest/modernization-decomposing-monoliths/welcome.html) outlines patterns for refactoring microservices. Using patterns for decomposition by business capability, subdomain, or transaction aligns well with domain-driven approaches.
- Tactical techniques such as the [bubble context](https://www.domainlanguage.com/wp-content/uploads/2016/04/GettingStartedWithDDDWhenSurroundedByLegacySystemsV1.pdf) allow you to introduce DDD in existing or legacy applications without up-front rewrites and full commitments to DDD. In a bubble context approach, a small bounded context is established using a service mapping and coordination, or [anti-corruption layer](https://serverlessland.com/event-driven-architecture/visuals/messages-between-bounded-context), which protects the newly defined domain model from external influences.

After teams have performed domain analysis and defined entities and service contracts, they can take advantage of AWS services to implement their domain-driven design as cloud-based services.

- Start your development by defining tests that exercise business rules of your domain. Test-driven development (TDD) and behavior-driven development (BDD) help teams keep services focused on solving business problems.
- Select the [AWS services](https://aws.amazon.com/microservices/) that best meet your business domain requirements and [microservice architecture](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/microservices-on-aws.html):

[AWS Serverless](https://aws.amazon.com/serverless/) allows your team focus on specific domain logic instead of managing servers and infrastructure.
- [Containers at AWS](https://aws.amazon.com/containers/) simplify the management of your infrastructure, so you can focus on your domain requirements.
- [Purpose built databases](https://aws.amazon.com/products/databases/) help you match your domain requirements to the best fit database type.

- [Building hexagonal architectures on AWS](https://docs.aws.amazon.com/prescriptive-guidance/latest/hexagonal-architectures/welcome.html) outlines a framework to build business logic into services working backwards from a business domain to fulfill functional requirements and then attach integration adapters. Patterns that separate interface details from business logic with AWS services help teams focus on domain functionality and improve software quality.

## Resources

**Related best practices:**

- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL03-BP03 Provide service contracts per API](./rel_service_architecture_api_contracts.html)

**Related documents:**

- [AWS Microservices](https://aws.amazon.com/microservices/)
- [Implementing
Microservices on AWS](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/introduction.html)
- [How
to break a Monolith into Microservices](https://martinfowler.com/articles/break-monolith-into-microservices.html)
- [Getting
Started with DDD when Surrounded by Legacy Systems](https://domainlanguage.com/wp-content/uploads/2016/04/GettingStartedWithDDDWhenSurroundedByLegacySystemsV1.pdf)
- [Domain-Driven Design: Tackling Complexity in the Heart of Software](https://www.amazon.com/gp/product/0321125215)
- [Building hexagonal architectures on AWS](https://docs.aws.amazon.com/prescriptive-guidance/latest/hexagonal-architectures/welcome.html)
- [Decomposing monoliths into microservices](https://docs.aws.amazon.com/prescriptive-guidance/latest/modernization-decomposing-monoliths/welcome.html)
- [Event Storming](https://serverlessland.com/event-driven-architecture/visuals/event-storming)
- [Messages Between Bounded Contexts](https://serverlessland.com/event-driven-architecture/visuals/messages-between-bounded-context)
- [Microservices](https://www.martinfowler.com/articles/microservices.html)
- [Test-driven development](https://en.wikipedia.org/wiki/Test-driven_development)
- [Behavior-driven development](https://en.wikipedia.org/wiki/Behavior-driven_development)

**Related examples:**

- [Designing Cloud Native Microservices on AWS (from DDD/EventStormingWorkshop)](https://github.com/aws-samples/designing-cloud-native-microservices-on-aws/tree/main)

**Related tools:**

- [AWS Cloud Databases](https://aws.amazon.com/products/databases/)
- [Serverless on AWS](https://aws.amazon.com/serverless/)
- [Containers at AWS](https://aws.amazon.com/containers/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_service_architecture_business_domains.html*

---

# REL03-BP03 Provide service contracts per API

Service contracts are documented agreements between API producers and consumers defined in a machine-readable API definition. A contract versioning strategy allows consumers to continue using the existing API and migrate their applications to a newer API when they are ready. Producer deployment can happen any time as long as the contract is followed. Service teams can use the technology stack of their choice to satisfy the API contract.

**Desired outcome:** Applications built with service-oriented or microservice architectures are able to operate independently while having integrated runtime dependency. Changes deployed to an API consumer or producer do not interrupt the stability of the overall system when both sides follow a common API contract. Components that communicate over service APIs can perform independent functional releases, upgrades to runtime dependencies, or fail over to a disaster recovery (DR) site with little or no impact to each other. In addition, discrete services are able to independently scale absorbing resource demand without requiring other services to scale in unison.

**Common anti-patterns:**

- Creating service APIs without strongly typed schemas. This results in APIs that cannot be used to generate API bindings and payloads that can’t be programmatically validated.
- Not adopting a versioning strategy, which forces API consumers to update and release or fail when service contracts evolve.
- Error messages that leak details of the underlying service implementation rather than describe integration failures in the domain context and language.
- Not using API contracts to develop test cases and mock API implementations to allow for independent testing of service components.

**Benefits of establishing this best practice:** Distributed systems composed of components that communicate over API service contracts can improve reliability. Developers can catch potential issues early in the development process with type checking during compilation to verify that requests and responses follow the API contract and required fields are present. API contracts provide a clear self-documenting interface for APIs and provider better interoperability between different systems and programming languages.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Once you have identified business domains and determined your workload segmentation, you can develop your service APIs. First, define machine-readable service contracts for APIs, and then implement an API versioning strategy. When you are ready to integrate services over common protocols like REST, GraphQL, or asynchronous events, you can incorporate AWS services into your architecture to integrate your components with strongly-typed API contracts.

**AWS services for service API contrats**

Incorporate AWS services including [Amazon API Gateway](https://aws.amazon.com/api-gateway/), [AWS AppSync](https://aws.amazon.com/appsync/), and [Amazon EventBridge](https://aws.amazon.com/eventbridge/) into your architecture to use API service contracts in your application. Amazon API Gateway helps you integrate with directly native AWS services and other web services. API Gateway supports the [OpenAPI specification](https://github.com/OAI/OpenAPI-Specification) and versioning. AWS AppSync is a managed [GraphQL](https://graphql.org/) endpoint you configure by defining a GraphQL schema to define a service interface for queries, mutations and subscriptions. Amazon EventBridge uses event schemas to define events and generate code bindings for your events.

## Implementation steps

- First, define a contract for your API. A contract will express the capabilities of an API as well as define strongly typed data objects and fields for the API input and output.
- When you configure APIs in API Gateway, you can import and export OpenAPI Specifications for your endpoints.

[Importing an OpenAPI definition](https://docs.aws.amazon.com/apigateway/latest/developerguide/import-edge-optimized-api.html) simplifies the creation of your API and can be integrated with AWS infrastructure as code tools like the [AWS Serverless Application Model](https://aws.amazon.com/serverless/sam/) and [AWS Cloud Development Kit (AWS CDK)](https://aws.amazon.com/cdk/).
- [Exporting an API definition](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-export-api.html) simplifies integrating with API testing tools and provides services consumer an integration specification.

- You can define and manage GraphQL APIs with AWS AppSync by [defining a GraphQL schema](https://docs.aws.amazon.com/appsync/latest/devguide/designing-your-schema.html) file to generate your contract interface and simplify interaction with complex REST models, multiple database tables or legacy services.
- [AWS Amplify](https://aws.amazon.com/amplify/) projects that are integrated with AWS AppSync generate strongly typed JavaScript query files for use in your application as well as an AWS AppSync GraphQL client library for [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) tables.
- When you consume service events from Amazon EventBridge, events adhere to schemas that already exist in the schema registry or that you define with the OpenAPI Spec. With a schema defined in the registry, you can also generate client bindings from the schema contract to integrate your code with events.
- Extending or version your API. Extending an API is a simpler option when adding fields that can be configured with optional fields or default values for required fields.

JSON based contracts for protocols like REST and GraphQL can be a good fit for contract extension.
- XML based contracts for protocols like SOAP should be tested with service consumers to determine the feasibility of contract extension.

- When versioning an API, consider implementing proxy versioning where a facade is used to support versions so that logic can be maintained in a single codebase.

With API Gateway you can use [request and response mappings](https://docs.aws.amazon.com/apigateway/latest/developerguide/request-response-data-mappings.html#transforming-request-response-body) to simplify absorbing contract changes by establishing a facade to provide default values for new fields or to strip removed fields from a request or response. With this approach the underlying service can maintain a single codebase.

## Resources

**Related best practices:**

- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL03-BP02 Build services focused on specific business domains and functionality](./rel_service_architecture_business_domains.html)
- [REL04-BP02 Implement loosely coupled dependencies](./rel_prevent_interaction_failure_loosely_coupled_system.html)
- [REL05-BP03 Control and limit retry calls](./rel_mitigate_interaction_failure_limit_retries.html)
- [REL05-BP05 Set client timeouts](./rel_mitigate_interaction_failure_client_timeouts.html)

**Related documents:**

- [What Is An API (Application Programming Interface)?](https://aws.amazon.com/what-is/api/)
- [Implementing Microservices on AWS](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/microservices-on-aws.html)
- [Microservice Trade-Offs](https://martinfowler.com/articles/microservice-trade-offs.html)
- [Microservices - a definition of this new architectural term](https://www.martinfowler.com/articles/microservices.html)
- [Microservices on AWS](https://aws.amazon.com/microservices/)
- [Working with API Gateway extensions to OpenAPI](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html)
- [OpenAPI-Specification](https://github.com/OAI/OpenAPI-Specification)
- [GraphQL: Schemas and Types](https://graphql.org/learn/schema/)
- [Amazon EventBridge code bindings](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-schema-code-bindings.html)

**Related examples:**

- [Amazon API Gateway: Configuring a REST API Using OpenAPI](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api.html)
- [Amazon API Gateway to Amazon DynamoDB CRUD application using OpenAPI](https://serverlessland.com/patterns/apigw-ddb-openapi-crud?ref=search)
- [Modern application integration patterns in a serverless age: API Gateway Service Integration](https://catalog.us-east-1.prod.workshops.aws/workshops/be7e1ee7-b91f-493d-93b0-8f7c5b002479/en-US/labs/asynchronous-request-response-poll/api-gateway-service-integration)
- [Implementing header-based API Gateway versioning with Amazon CloudFront](https://aws.amazon.com/blogs/compute/implementing-header-based-api-gateway-versioning-with-amazon-cloudfront/)
- [AWS AppSync: Building a client application](https://docs.aws.amazon.com/appsync/latest/devguide/building-a-client-app.html#aws-appsync-building-a-client-app)

**Related videos:**

- [Using OpenAPI in AWS SAM to manage API Gateway](https://www.youtube.com/watch?v=fet3bh0QA80)

**Related tools:**

- [Amazon API Gateway](https://aws.amazon.com/api-gateway/)
- [AWS AppSync](https://aws.amazon.com/appsync/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_service_architecture_api_contracts.html*

---
