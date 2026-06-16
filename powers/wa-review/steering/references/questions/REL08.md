# REL 8 — How do you implement change?

**Pillar**: Reliability  
**Best Practices**: 5

---

# REL08-BP01 Use runbooks for standard activities such as deployment

Runbooks are the predefined procedures to achieve specific outcomes.
Use runbooks to perform standard activities, whether done manually
or automatically. Examples include deploying a workload, patching a
workload, or making DNS modifications.

For example, put processes in place
to [ensure
rollback safety during deployments](https://aws.amazon.com/builders-library/ensuring-rollback-safety-during-deployments). Ensuring that you can
roll back a deployment without any disruption for your customers is
critical in making a service reliable.

For runbook procedures, start with a valid effective manual process,
implement it in code, and invoke it to automatically run where
appropriate.

Even for sophisticated workloads that are highly automated, runbooks
are still useful
for [running
game days](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/test-reliability.html#GameDays) or meeting rigorous reporting and auditing
requirements.

Note that playbooks are used in response to specific incidents, and
runbooks are used to achieve specific outcomes. Often, runbooks are
for routine activities, while playbooks are used for responding to
non-routine events.

**Common anti-patterns:**

- Performing unplanned changes to configuration in production.
- Skipping steps in your plan to deploy faster, resulting in a
failed deployment.
- Making changes without testing the reversal of the change.

**Benefits of establishing this best
practice:** Effective change planning increases your
ability to successfully run the change because you are aware of
all the systems impacted. Validating your change in test
environments increases your confidence.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

- Provide consistent and prompt responses to well-understood events
by documenting procedures in runbooks.
- Use the principle of infrastructure as code to define your
infrastructure. By using AWS CloudFormation (or a trusted third
party) to define your infrastructure, you can use version control
software to version and track changes.

Use AWS CloudFormation (or a trusted third-party provider) to define your infrastructure.

[What is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)

- Create templates that are singular and decoupled, using good software design
principles.

Determine the permissions, templates, and responsible parties for
implementation.

[Controlling access with AWS Identity and Access Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html)

- Use a hosted source code management system based on a popular technology such as Git to store your source code and infrastructure as code (IaC) configuration.

## Resources

**Related documents:**

- [APN
Partner: partners that can help you create automated
deployment solutions](https://aws.amazon.com/partners/find/results/?keyword=devops)
- [AWS Marketplace: products that can be used to automate your
deployments](https://aws.amazon.com/marketplace/search/results?searchTerms=DevOps)
- [What
is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)

**Related examples:**

- [Automating
operations with Playbooks and Runbooks](https://wellarchitectedlabs.com/operational-excellence/200_labs/200_automating_operations_with_playbooks_and_runbooks/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_planned_changemgmt.html*

---

# REL08-BP02 Integrate functional testing as part of your deployment

Use techniques such as unit tests and integration tests that
validate required functionality.

Unit testing is the process where you test the smallest functional
unit of code to validate its behavior. Integration testing seeks to
validate that each application feature works according to the
software requirements. While unit tests focus on testing part of an
application in isolation, integration tests consider side effects
(for example, the effect of data being changed through a mutation
operation). In either case, tests should be integrated into a
deployment pipeline, and if success criteria are not met, the
pipeline is halted or rolled back. These tests are run in a
pre-production environment, which is staged prior to production in
the pipeline.

You achieve the best outcomes when these tests are run automatically
as part of build and deployment actions. For instance, with AWS CodePipeline, developers commit changes to a source repository where
CodePipeline automatically detects the changes. The application is
built, and unit tests are run. After the unit tests have passed, the
built code is deployed to staging servers for testing. From the
staging server, CodePipeline runs more tests, such as integration or
load tests. Upon the successful completion of those tests,
CodePipeline deploys the tested and approved code to production
instances.

**Desired outcome:** You use
automation to perform unit and integration tests to validate that
your code behaves as expected. These tests are integrated into the
deployment process, and a test failure aborts the deployment.

**Common anti-patterns:**

- You ignore or bypass test failures and plans during the
deployment process in order to accelerate the deployment
timeline.
- You manually perform tests outside the deployment pipeline.
- You skip testing steps in the automation through manual
emergency workflows.
- You run automated tests in an environment that does not closely
resemble the production environment.
- You build a test suite that is insufficiently flexible and is
difficult to maintain, update, or scale as the application
evolves.

**Benefits of establishing this best
practice:** Automated testing during the deployment process
catches issues early, which reduces the risk of a release to
production with bugs or unexpected behavior. Unit tests validate the
code behaves as desired and API contracts are honored. Integration
tests validate that the system operates according to specified
requirements. These types of tests verify the intended working order
of components such as user interfaces, APIs, databases, and source
code.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Adopt a test-driven development (TDD) approach to writing
software, where you develop test cases to specify and validate
your code. To start, create test cases for each function. If the
test fails, you write new code to pass the test. This approach
helps you validate the expected result of each function. Run unit
tests and validate that they pass before you commit code to a
source code repository.

Implement both unit and integration tests as part of the build,
test, and deployment stages of the CI/CD pipeline. Automate
testing, and automatically initiate tests whenever a new version
of the application is ready to be deployed. If success criteria
are not met, the pipeline is halted or rolled back.

If the application is a web or mobile app, perform automated
integration testing on multiple desktop browsers or real devices.
This approach is particularly useful to validate the compatibility
and functionality of mobile apps across a diverse range of
devices.

### Implementation steps

- Write unit tests before you write functional code
(*test-driven development*, or TDD).
Establish code guidelines so that writing and running unit
tests are a non-functional coding requirement.
- Create a suite of automated integration tests that cover the
identified testable functionalities. These tests should
simulate user interactions and validate the expected
outcomes.
- Create the necessary test environment to run the integration
tests. This may include staging or pre-production
environments that closely mimic the production environment.
- Set up your source, build, test, and deploy stages using the
AWS CodePipeline console or AWS Command Line Interface
(CLI).
- Deploy the application once the code has been built and
tested. AWS CodeDeploy can deploy it to your staging
(testing) and production environments. These environments
may include Amazon EC2 instances, AWS Lambda functions, or
on-premises servers. The same deployment mechanism should be
used to deploy the application to all environments.
- Monitor the progress of your pipeline and the status of each
stage. Use quality checks to block the pipeline based on the
status of your tests. You can also receive notifications for
any pipeline stage failure or pipeline completion.
- Continually monitor the results of the tests, and look for
patterns, regressions or areas that require more attention.
Use this information to improve the test suite, identify
areas of the application that need more robust testing, and
optimize the deployment process.

## Resources

**Related best practices:**

- [REL07-BP04
Load test your workload](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_adapt_to_changes_load_tested_adapt.html)
- [REL08-BP03
Integrate resiliency testing as part of your deployment](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_resiliency_testing.html)
- [REL12-BP04
Test resiliency using chaos engineering](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Prescriptive Guidance: Test automation](https://docs.aws.amazon.com/prescriptive-guidance/latest/performance-engineering-aws/test-automation.html)
- [Continuous
Delivery and Continuous Integration](https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-continuous-delivery-integration.html)
- [Indicators
for functional testing](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/indicators-for-functional-testing.html)
- [Monitoring
pipelines](https://docs.aws.amazon.com/codepipeline/latest/userguide/monitoring.html)
- [Use AWS CodePipeline with AWS CodeBuild to test code and run builds](https://docs.aws.amazon.com/codebuild/latest/userguide/how-to-create-pipeline.html)
- [AWS Device Farm](https://docs.aws.amazon.com/codepipeline/latest/userguide/action-reference-DeviceFarm.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_functional_testing.html*

---

# REL08-BP03 Integrate resiliency testing as part of your deployment

Integrate resiliency testing by consciously introducing failures in
your system to measure its capability in case of disruptive
scenarios. Resilience tests are different from unit and function
tests that are usually integrated in deployment cycles, as they
focus on the identification of unanticipated failures in your
system. While it is safe to start with resiliency testing
integration in pre-production, set a goal to implement these tests
in production as a part of your
[game
days](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/test-reliability.html#GameDays).

**Desired outcome**: Resiliency
testing helps build confidence in the system's ability to withstand
degradation in production. Experiments identify weak points that
could lead to failure, which helps you improve your system to
automatically and efficiently mitigate failure and degradation.

**Common anti-patterns:**

- Lack of observability and monitoring in deployment processes
- Reliance on humans to resolve system failures
- Poor quality analysis mechanisms
- Focus on known issues in a system and a lack of experimentation
to identify any unknowns
- Identification of failures, but no resolution
- No documentation of findings and runbooks

**Benefits of establishing best
practices:** Resilience testing integrated in your
deployments helps to identify unknown issues in the system that
otherwise go unnoticed, which can lead to downtime in production.
Identification of these unknowns in a system helps you document
findings, integrate testing into your CI/CD process, and build
runbooks, which simplify mitigation through efficient, repeatable
mechanisms.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The most common resiliency testing forms that can be integrated in
your system's deployments are disaster recovery and chaos
engineering.

- Include updates to your disaster recovery plans and standard
operating procedures (SOPs) with any significant deployment.
- Integrate reliability testing into your automated deployment
pipelines. Services such
as[AWS Resilience Hub](https://aws.amazon.com/resilience-hub/)can be
[integrated
into your CI/CD pipeline](https://aws.amazon.com/blogs/architecture/continually-assessing-application-resilience-with-aws-resilience-hub-and-aws-codepipeline/) to establish continuous
resilience assessments that are automatically evaluated as
part of every deployment.
- Define your applications in AWS Resilience Hub. Resilience
assessments generate code snippets that help you create
recovery procedures as AWS Systems Manager documents for your
applications and provide a list of recommended Amazon CloudWatch monitors and alarms.
- Once your DR plans and SOPs are updated, complete disaster
recovery testing to verify that they are effective. Disaster
recovery testing helps you determine if you can restore your
system after an event and return to normal operations. You can
simulate various disaster recovery strategies and identify
whether your planning is sufficient to meet your uptime
requirements. Common disaster recovery strategies include
backup and restore, pilot light, cold standby, warm standby,
hot standby, and active-active, and they all differ in cost
and complexity. Before disaster recovery testing, we recommend
that you define your recovery time objective (RTO) and
recovery point objective (RPO) to simplify the choice of
strategy to simulate. AWS offers disaster recovery tools like
[AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/) to help you get started with
your planning and testing.
- Chaos engineering experiments introduce disruptions to the
system, such as network outages and service failures. By
simulating with controlled failures, you can discover your
system's vulnerabilities while containing the impacts of the
injected failures. Just like the other strategies, run
controlled failure simulations in non-production environments
using services like
[AWS Fault Injection Service](https://aws.amazon.com/fis/) to gain confidence before deploying
in production.

## Resources

**Related documents:**

- [Experiment
with failure using resilience testing to build recovery
preparedness](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/qa.nt.6-experiment-with-failure-using-resilience-testing-to-build-recovery-preparedness.html)
- [Continually
assessing application resilience with AWS Resilience Hub and
AWS CodePipeline](https://aws.amazon.com/blogs/architecture/continually-assessing-application-resilience-with-aws-resilience-hub-and-aws-codepipeline/)
- [Disaster
recovery (DR) architecture on AWS, part 1: Strategies for
recovery in the cloud](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-i-strategies-for-recovery-in-the-cloud/)
- [Verify
the resilience of your workloads using Chaos
Engineering](https://aws.amazon.com/blogs/architecture/verify-the-resilience-of-your-workloads-using-chaos-engineering/)
- [Principles
of Chaos Engineering](https://principlesofchaos.org/)
- [Chaos
Engineering Workshop](https://disaster-recovery.workshop.aws/en/intro/concepts/chaos-engineering.html)

**Related videos:**

- [AWS re:Invent 2020: Testing Resilience using Chaos
Engineering](https://www.youtube.com/watch?v=OlobVYPkxgg)
- [Improve
Application Resilience with AWS Fault Injection Service](https://www.youtube.com/watch?v=N0aZZVVZiUw)
- [Prepare
& Protect Your Applications From Disruption With AWS Resilience Hub](https://www.youtube.com/watch?v=xa4BVl4N1Gw)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_resiliency_testing.html*

---

# REL08-BP04 Deploy using immutable infrastructure

Immutable infrastructure is a model that mandates that no updates,
security patches, or configuration changes happen in-place on
production workloads. When a change is needed, the architecture is
built onto new infrastructure and deployed into production.

Follow an immutable infrastructure deployment strategy to increase the reliability, consistency, and reproducibility in your workload deployments.

**Desired outcome:** With immutable infrastructure, no [in-place modifications](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/deployment-strategies.html#in-place-deployments) are allowed to run infrastructure resources within a workload. Instead, when a change is needed, a new set of updated infrastructure resources containing all the necessary changes are deployed in parallel to your existing resources. This deployment is validated automatically, and if successful, traffic is gradually shifted to the new set of resources.

This deployment strategy applies to software updates, security patches, infrastructure changes, configuration updates, and application updates, among others.

**Common anti-patterns:**

- Implementing in-place changes to running infrastructure resources.

**Benefits of establishing this best practice:**

- **Increased consistency across environments:** Since there are no differences in infrastructure resources across environments, consistency is increased and testing is simplified.
- **Reduction in configuration drifts:** By replacing infrastructure resources with a known and version-controlled configuration, the infrastructure is set to a known, tested, and trusted state, avoiding configuration drifts.
- **Reliable atomic deployments:** Deployments either complete successfully or nothing changes, increasing consistency and reliability in the deployment process.
- **Simplified deployments:** Deployments are simplified because they don't need to support upgrades. Upgrades are just new deployments.
- **Safer deployments with fast rollback and recovery processes:** Deployments are safer because the previous working version is not changed. You can roll back to it if errors are detected.
- **Enhanced security posture:** By not allowing changes to infrastructure, remote access mechanisms (such as SSH) can be disabled. This reduces the attack vector, improving your organization's security posture.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

**Automation**

When defining an immutable infrastructure deployment strategy, it is recommended to use [automation](https://aws.amazon.com/iam/) as much as possible to increase reproducibility and minimize the potential of human error. For more detail, see [REL08-BP05 Deploy changes with automation](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_automated_changemgmt.html) and [Automating safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/).

With [infrastructure as code (IaC)](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/infrastructure-as-code.html), infrastructure provisioning, orchestration, and deployment steps are defined in a programmatic, descriptive, and declarative way and stored in a source control system. Leveraging infrastructure as code makes it simpler to automate infrastructure deployment and helps achieve infrastructure immutability.

**Deployment patterns**

When a change in the workload is required, the immutable infrastructure deployment strategy mandates that a new set of infrastructure resources is deployed, including all necessary changes. It is important for this new set of resources to follow a rollout pattern that minimizes user impact. There are two main strategies for this deployment:

[Canary
deployment](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/canary-deployments.html): The practice of directing a small
number of your customers to the new version, usually running on a
single service instance (the canary). You then deeply scrutinize any
behavior changes or errors that are generated. You can remove
traffic from the canary if you encounter critical problems and send
the users back to the previous version. If the deployment is
successful, you can continue to deploy at your desired velocity,
while monitoring the changes for errors, until you are fully
deployed. AWS CodeDeploy can be configured with a [deployment
configuration](https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html) that allows a canary deployment.

[Blue/green
deployment](https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/bluegreen-deployments.html): Similar to the canary deployment,
except that a full fleet of the application is deployed in parallel.
You alternate your deployments across the two stacks (blue and
green). Once again, you can send traffic to the new version, and
fall back to the old version if you see problems with the
deployment. Commonly all traffic is switched at once, however you
can also use fractions of your traffic to each version to dial up
the adoption of the new version using the weighted DNS
routing capabilities of Amazon Route 53. AWS CodeDeploy and [AWS Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/relnotes/release-2020-05-18-ts-deploy.html) can be configured with a deployment configuration
that allows a blue/green deployment.

*Figure 8: Blue/green deployment with AWS Elastic Beanstalk
and Amazon Route 53*

**Drift detection**

*Drift* is defined as any change that causes an infrastructure resource to have a different state or configuration to what is expected. Any type of unmanaged configuration change goes against the notion of immutable infrastructure, and should be detected and remediated in order to have a successful implementation of immutable infrastructure.

### Implementation steps

- Disallow the in-place modification of running infrastructure resources.

You can use [AWS Identity and Access Management (IAM)](https://aws.amazon.com/iam/) to specify who or what can access services and resources in AWS, centrally manage fine-grained permissions, and analyze access to refine permissions across AWS.

- Automate the deployment of infrastructure resources to increase reproducibility and minimize the potential of human error.

As described in the [Introduction to DevOps on AWS whitepaper](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/automation.html), automation is a cornerstone with AWS services and is internally supported in all services, features, and offerings.
- *[Prebaking](https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/prebaking-vs.-bootstrapping-amis.html)* your Amazon Machine Image (AMI) can speed up the time to launch them. [EC2 Image Builder](https://aws.amazon.com/image-builder/) is a fully managed AWS service that helps you automate the creation, maintenance, validation, sharing, and deployment of customized, secure, and up-to-date Linux or Windows custom AMI.
- Some of the services that support automation are:

[AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) is a service to rapidly deploy and scale web applications developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, NGINX, Passenger, and IIS.
- [AWS Proton](https://aws.amazon.com/proton/) helps platform teams connect and coordinate all the different tools your development teams need for infrastructure provisioning, code deployments, monitoring, and updates. AWS Proton enables automated infrastructure as code provisioning and deployment of serverless and container-based applications.

- Leveraging infrastructure as code makes it easy to automate infrastructure deployment, and helps achieve infrastructure immutability. AWS provides services that enable the creation, deployment, and maintenance of infrastructure in a programmatic, descriptive, and declarative way.

[AWS CloudFormation](https://aws.amazon.com/cloudformation/) helps developers create AWS resources in an orderly and predictable fashion. Resources are written in text files using JSON or YAML format. The templates require a specific syntax and structure that depends on the types of resources being created and managed. You author your resources in JSON or YAML with any code editor, check it into a version control system, and then CloudFormation builds the specified services in safe, repeatable manner.
- [AWS Serverless Application Model (AWS SAM)](https://aws.amazon.com/serverless/sam/) is an open-source framework that you can use to build serverless applications on AWS. AWS SAM integrates with other AWS services, and is an extension of CloudFormation.
- [AWS Cloud Development Kit (AWS CDK)](https://aws.amazon.com/cdk/) is an open-source software development framework to model and provision your cloud application resources using familiar programming languages. You can use AWS CDK to model application infrastructure using TypeScript, Python, Java, and .NET. AWS CDK uses CloudFormation in the background to provision resources in a safe, repeatable manner.
- [AWS Cloud Control API](https://aws.amazon.com/cloudcontrolapi/) introduces a common set of Create, Read, Update, Delete, and List (CRUDL) APIs to help developers manage their cloud infrastructure in an easy and consistent way. The Cloud Control API common APIs allow developers to uniformly manage the lifecycle of AWS and third-party services.

- Implement deployment patterns that minimize user impact.

Canary deployments:

[Set up an API Gateway canary release deployment](https://docs.aws.amazon.com/apigateway/latest/developerguide/canary-release.html)
- [Create a pipeline with canary deployments for Amazon ECS using AWS App Mesh](https://aws.amazon.com/blogs/containers/create-a-pipeline-with-canary-deployments-for-amazon-ecs-using-aws-app-mesh/)

- Blue/green deployments: the [Blue/Green Deployments on AWS whitepaper](https://docs.aws.amazon.com/whitepapers/latest/blue-green-deployments/welcome.html) describes [example techniques](https://docs.aws.amazon.com/whitepapers/latest/blue-green-deployments/implementation-techniques.html) to implement blue/green deployment strategies.

- Detect configuration or state drifts. For more detail, see [Detecting unmanaged configuration changes to stacks and resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).

## Resources

**Related best practices:**

- [REL08-BP05 Deploy changes with automation](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_automated_changemgmt.html)

**Related documents:**

- [Automating safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)
- [Leveraging AWS CloudFormation to create an immutable infrastructure at Nubank](https://aws.amazon.com/blogs/mt/leveraging-immutable-infrastructure-nubank/)
- [Infrastructure as code](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/infrastructure-as-code.html)
- [Implementing an alarm to automatically detect drift in AWS CloudFormation stacks](https://docs.aws.amazon.com/blogs/mt/implementing-an-alarm-to-automatically-detect-drift-in-aws-cloudformation-stacks/)

**Related videos:**

- [AWS re:Invent 2020: Reliability, consistency, and confidence through immutability](https://www.youtube.com/watch?v=jUSYnRztttY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_immutable_infrastructure.html*

---

# REL08-BP05 Deploy changes with automation

Deployments and patching are automated to eliminate negative impact.

Making changes to production systems is one of the largest risk
areas for many organizations. We consider deployments a first-class
problem to be solved alongside the business problems that the
software addresses. Today, this means the use of automation wherever
practical in operations, including testing and deploying changes,
adding or removing capacity, and migrating data.

**Desired outcome:** You build
automated deployment safety into the release process with extensive
pre-production testing, automatic rollbacks, and staggered
production deployments. This automation minimizes the potential
impact on production caused by failed deployments, and developers no
longer need to actively watch deployments to production.

**Common anti-patterns:**

- You perform manual changes.
- You skip steps in your automation through manual emergency
workflows.
- You don't follow your established plans and processes in favor
of accelerated timelines.
- You perform rapid follow-on deployments without allowing for
bake time.

**Benefits of establishing this best
practice:** When you use automation to deploy all changes,
you remove the potential for introduction of human error and provide
the ability to test before you change production. Performing this
process prior to production push verifies that your plans are
complete. Additionally, automatic rollback into your release process
can identify production issues and return your workload to its
previously-working operational state.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Automate your deployment pipeline. Deployment pipelines allow you
to invoke automated testing and detection of anomalies, and either
halt the pipeline at a certain step before production deployment,
or automatically roll back a change. An integral part of this is
the adoption of the culture
of [continuous
integration and continuous delivery/deployment](https://en.wikipedia.org/wiki/CI/CD) (CI/CD),
where a commit or code change passes through various automated
stage gates from build and test stages to deployment on production
environments.

Although conventional wisdom suggests that you keep people in the
loop for the most difficult operational procedures, we suggest
that you automate the most difficult procedures for that very
reason.

### Implementation steps

You can automate deployments to remove manual operations by
following these steps:

- **Set up a code repository to store
your code securely:** Use a hosted source code management system based on a popular technology such as Git to store your source code and infrastructure as code (IaC) configuration.
- **Configure a continuous integration
service to compile your source code, run tests, and create
deployment artifacts:** To set up a build project
for this purpose, see
[Getting
started with AWS CodeBuild using the console](https://docs.aws.amazon.com/codebuild/latest/userguide/getting-started.html).
- **Set up a deployment service that
automates application deployments and handles the complexity
of application updates without reliance on error-prone
manual deployments:**
[AWS CodeDeploy](https://aws.amazon.com/codedeploy/) automates software deployments to a
variety of compute services, such as Amazon EC2,
[AWS Fargate](https://aws.amazon.com/fargate/),
[AWS Lambda](https://aws.amazon.com/lambda), and your on-premise servers. To configure
these steps, see
[Getting
started with CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-codedeploy.html).
- **Set up a continuous delivery service
that automates your release pipelines for quicker and more
reliable application and infrastructure updates:**
Consider using
[AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/getting-started-codepipeline.html) to help you automate your release
pipelines. For more detail, see
[CodePipeline
tutorials](https://docs.aws.amazon.com/codepipeline/latest/userguide/tutorials.html).

## Resources

**Related best practices:**

- [OPS05-BP04
Use build and deployment management systems](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_build_mgmt_sys.html)
- [OPS05-BP10
Fully automate integration and deployment](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_auto_integ_deploy.html)
- [OPS06-BP02
Test deployments](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_test_val_chg.html)
- [OPS06-BP04
Automate testing and rollback](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [Continuous
Delivery of Nested AWS CloudFormation Stacks Using AWS CodePipeline](https://aws.amazon.com/blogs/devops/continuous-delivery-of-nested-aws-cloudformation-stacks-using-aws-codepipeline)
- [APN
Partner: partners that can help you create automated
deployment solutions](https://aws.amazon.com/partners/find/results/?keyword=devops)
- [AWS Marketplace: products that can be used to automate your
deployments](https://aws.amazon.com/marketplace/search/results?searchTerms=DevOps)
- [Automate
chat messages with webhooks.](https://docs.aws.amazon.com/chime/latest/ug/webhooks.html)
- [The
Amazon Builders' Library: Ensuring rollback safety during
deployments](https://aws.amazon.com/builders-library/ensuring-rollback-safety-during-deployments)
- [The
Amazon Builders' Library: Going faster with continuous
delivery](https://aws.amazon.com/builders-library/going-faster-with-continuous-delivery/)
- [What
Is AWS CodePipeline?](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html)
- [What
Is CodeDeploy?](https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html)
- [AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html)
- [What
is Amazon SES?](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html)
- [What
is Amazon Simple Notification Service?](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)

**Related videos:**

- [AWS Summit
2019: CI/CD on AWS](https://youtu.be/tQcF6SqWCoY)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_tracking_change_management_automated_changemgmt.html*

---
