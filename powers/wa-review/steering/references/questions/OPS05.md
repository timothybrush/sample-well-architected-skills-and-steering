# OPS 5 — How do you reduce defects, ease remediation, and improve flow into production?

**Pillar**: Operational Excellence  
**Best Practices**: 10

---

# OPS05-BP01 Use version control

Use version control to activate tracking of changes and releases.

Many AWS services offer version control capabilities. Use a revision
or [source control](https://aws.amazon.com/devops/source-control/) system such as
[Git](https://aws.amazon.com/devops/source-control/git/) to manage code and other artifacts such as
version-controlled
[AWS CloudFormation](https://aws.amazon.com/cloudformation/) templates of your infrastructure.

**Desired outcome:** Your teams collaborate on code. When merged, the code is consistent and no changes are lost. Errors are easily reverted through correct versioning.

**Common anti-patterns:**

- You have been developing and storing your code on your
workstation. You have had an unrecoverable storage failure on
the workstation and your code is lost.
- After overwriting the existing code with your changes, you
restart your application and it is no longer operable. You are
unable to revert the change.
- You have a write lock on a report file that someone else needs
to edit. They contact you asking that you stop work on it so
that they can complete their tasks.
- Your research team has been working on a detailed analysis that
shapes your future work. Someone has accidentally saved
their shopping list over the final report. You are unable to
revert the change and have to recreate the report.

**Benefits of establishing this best
practice:** By using version control capabilities you can
easily revert to known good states and previous versions, and limit the
risk of assets being lost.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Maintain assets in version controlled repositories. Doing so supports tracking changes, deploying new versions, detecting changes to existing versions, and reverting to prior versions (for example, rolling back to a known good state in the event of a failure). Integrate the version control capabilities of your configuration management systems into your procedures.

## Resources

**Related best practices:**

- [OPS05-BP04 Use build and deployment management systems](./ops_dev_integ_build_mgmt_sys.html)

**Related videos:**

- [AWS re:Invent 2023 - How Lockheed Martin builds software faster, powered by DevSecOps](https://www.youtube.com/watch?v=Q1OSyxYkl5w)
- [AWS re:Invent 2023 - How GitHub operationalizes AI for team collaboration and productivity](https://www.youtube.com/watch?v=cOVvGaiusOI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_version_control.html*

---

# OPS05-BP02 Test and validate changes

Every change deployed must be tested to avoid errors in production.
This best practice is focused on testing changes from version
control to artifact build. Besides application code changes, testing
should include infrastructure, configuration, security controls, and
operations procedures. Testing takes many forms, from unit tests to
software component analysis (SCA). Move tests further to the left in
the software integration and delivery process results in higher
certainty of artifact quality.

Your organization must develop testing standards for all software
artifacts. Automated tests reduce toil and avoid manual test errors.
Manual tests may be necessary in some cases. Developers must have
access to automated test results to create feedback loops that
improve software quality.

**Desired outcome:** Your software
changes are tested before they are delivered. Developers have access
to test results and validations. Your organization has a testing
standard that applies to all software changes.

**Common anti-patterns:**

- You deploy a new software change without any tests. It fails to
run in production, which leads to an outage.
- New security groups are deployed with AWS CloudFormation without
being tested in a pre-production environment. The security
groups make your app unreachable for your customers.
- A method is modified but there are no unit tests. The software
fails when it is deployed to production.

**Benefits of establishing this best
practice:** Change fail rate of software deployments are
reduced. Software quality is improved. Developers have increased
awareness on the viability of their code. Security policies can be
rolled out with confidence to support organization's compliance.
Infrastructure changes such as automatic scaling policy updates are
tested in advance to meet traffic needs.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Testing is done on all changes, from application code to
infrastructure, as part of your continuous integration practice.
Test results are published so that developers have fast feedback.
Your organization has a testing standard that all changes must
pass.

Use the power of generative AI with Amazon Q Developer to improve
developer productivity and code quality. Amazon Q Developer includes
generation of code suggestions (based on large language models),
production of unit tests (including boundary conditions), and code
security enhancements through detection and remediation of security
vulnerabilities.

**Customer example**

As part of their continuous integration pipeline, AnyCompany
Retail conducts several types of tests on all software artifacts.
They practice test driven development so all software has unit
tests. Once the artifact is built, they run end-to-end tests.
After this first round of tests is complete, they run a static
application security scan, which looks for known vulnerabilities.
Developers receive messages as each testing gate is passed. Once
all tests are complete, the software artifact is stored in an
artifact repository.

### Implementation steps

- Work with stakeholders in your organization to develop a
testing standard for software artifacts. What standard tests
should all artifacts pass? Are there compliance or
governance requirements that must be included in the test
coverage? Do you need to conduct code quality tests? When
tests complete, who needs to know?

The
[AWS Deployment Pipeline Reference Architecture](https://pipelines.devops.aws.dev/)
contains an authoritative list of types of tests that
can be conducted on software artifacts as part of an
integration pipeline.

- Instrument your application with the necessary tests based
on your software testing standard. Each set of tests should
complete in under ten minutes. Tests should run as part of
an integration pipeline.

Use
[Amazon Q Developer](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/what-is.html), a generative AI tool that can help
create unit test cases (including boundary conditions),
generate functions using code and comments, and
implement well-known algorithms.
- Use
[Amazon CodeGuru Reviewer](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html) to test your application code
for defects.
- You can use
[AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html) to conduct tests on software artifacts.
- [AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html) can orchestrate your software tests
into a pipeline.

## Resources

**Related best practices:**

- [OPS05-BP01
Use version control](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_version_control.html)
- [OPS05-BP06
Share design standards](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_share_design_stds.html)
- [OPS05-BP07
Implement practices to improve code quality](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_code_quality.html)
- [OPS05-BP10
Fully automate integration and deployment](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_auto_integ_deploy.html)

**Related documents:**

- [Adopt
a test-driven development approach](https://docs.aws.amazon.com/prescriptive-guidance/latest/best-practices-cdk-typescript-iac/development-best-practices.html)
- [Accelerate
your Software Development Lifecycle with Amazon Q](https://aws.amazon.com/blogs/devops/accelerate-your-software-development-lifecycle-with-amazon-q/)
- [Amazon Q Developer, now generally available, includes previews of new
capabilities to reimagine developer experience](https://aws.amazon.com/blogs/aws/amazon-q-developer-now-generally-available-includes-new-capabilities-to-reimagine-developer-experience/)
- [The
Ultimate Cheat Sheet for Using Amazon Q Developer in Your
IDE](https://community.aws/content/2eYoqeFRqaVnk900emsknDfzhfW/the-ultimate-cheat-sheet-for-using-amazon-q-developer-in-your-ide)
- [Shift-Left
Workload, leveraging AI for Test Creation](https://community.aws/content/2gBZtC94gPzaCQRnt4P0rIYWuBx/shift-left-workload-leveraging-ai-for-test-creation)
- [Amazon Q Developer Center](https://aws.amazon.com/developer/generative-ai/amazon-q/)
- [10
ways to build applications faster with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/10-ways-to-build-applications-faster-with-amazon-codewhisperer/)
- [Looking
beyond code coverage with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/looking-beyond-code-coverage-with-amazon-codewhisperer/)
- [Best
Practices for Prompt Engineering with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/best-practices-for-prompt-engineering-with-amazon-codewhisperer/)
- [Automated
AWS CloudFormation Testing Pipeline with TaskCat and
CodePipeline](https://aws.amazon.com/blogs/devops/automated-cloudformation-testing-pipeline-with-taskcat-and-codepipeline/)
- [Building
end-to-end AWS DevSecOps CI/CD pipeline with open source SCA,
SAST, and DAST tools](https://aws.amazon.com/blogs/devops/building-end-to-end-aws-devsecops-ci-cd-pipeline-with-open-source-sca-sast-and-dast-tools/)
- [Getting
started with testing serverless applications](https://aws.amazon.com/blogs/compute/getting-started-with-testing-serverless-applications/)
- [My
CI/CD pipeline is my release captain](https://aws.amazon.com/builders-library/cicd-pipeline/)
- [Practicing
Continuous Integration and Continuous Delivery on AWS
Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/welcome.html)

**Related videos:**

- [Implement
an API with Amazon Q Developer Agent for Software
Development](https://www.youtube.com/watch?v=U4XEvJUvff4)
- [Installing,
Configuring, & Using Amazon Q Developer with JetBrains
IDEs (How-to)](https://www.youtube.com/watch?v=-iQfIhTA4J0)
- [Mastering
the art of Amazon CodeWhisperer - YouTube playlist](https://www.youtube.com/playlist?list=PLDqi6CuDzubxzL-yIqgQb9UbbceYdKhpK)
- [AWS re:Invent 2020: Testable infrastructure: Integration testing
on AWS](https://www.youtube.com/watch?v=KJC380Juo2w)
- [AWS Summit ANZ 2021 - Driving a test-first strategy with CDK and
test driven development](https://www.youtube.com/watch?v=1R7G_wcyd3s)
- [Testing
Your Infrastructure as Code with AWS CDK](https://www.youtube.com/watch?v=fWtuwGSoSOU)

**Related resources:**

- [AWS Deployment Pipeline Reference Architecture -
Application](https://pipelines.devops.aws.dev/application-pipeline/index.html)
- [AWS Kubernetes DevSecOps Pipeline](https://github.com/aws-samples/devsecops-cicd-containers)
- [Run
unit tests for a Node.js application from GitHub by using AWS CodeBuild](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/run-unit-tests-for-a-node-js-application-from-github-by-using-aws-codebuild.html)
- [Use
Serverspec for test-driven development of infrastructure
code](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/use-serverspec-for-test-driven-development-of-infrastructure-code.html)

**Related services:**

- [Amazon Q Developer](https://aws.amazon.com/q/developer/)
- [Amazon CodeGuru Reviewer](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html)
- [AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html)
- [AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_test_val_chg.html*

---

# OPS05-BP03 Use configuration management systems

Use configuration management systems to make and track configuration changes. These systems reduce errors caused by manual processes and reduce the level of effort to deploy changes.

Static configuration management sets values when initializing a resource that are expected to remain consistent throughout the resource’s lifetime. Dynamic configuration management sets values at initialization that can or are expected to change during the lifetime of a resource. For example, you could set a feature toggle to activate functionality in your code through a configuration change, or change the level of log detail during an incident.

Configurations should be deployed in a known and consistent state. You should use automated inspection to continually monitor resource configurations across environments and regions. These controls should be defined as code and management automated to ensure rules are consistently appplied across environments. Changes to configurations should be updated through agreed change control procedures and applied consistently, honoring version control. Application configuration should be managed independently of application and infrastructure code. This allows for consistent deployment across multiple environments. Configuration changes do not result in rebuilding or redeploying the application.

**Desired outcome:** You configure, validate, and deploy as part of your continuous integration, continuous delivery (CI/CD) pipeline. You monitor to validate configurations are correct. This minimizes any impact to end users and customers.

**Common anti-patterns:**

- You manually update the web server configuration across your
fleet and a number of servers become unresponsive due to update
errors.
- You manually update your application server fleet over the
course of many hours. The inconsistency in configuration during
the change causes unexpected behaviors.
- Someone has updated your security groups and your web servers
are no longer accessible. Without knowledge of what was changed
you spend significant time investigating the issue extending
your time to recovery.
- You push a pre-production configuration into production through CI/CD without validation. You expose users and customers to incorrect data and services.

**Benefits of establishing this best
practice:** Adopting configuration management systems reduces the level of effort to make and track changes, and the frequency of errors caused by manual procedures. Configuration management systems provide assurances with regards to governance, compliance, and regulatory requirements.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Configuration management systems are used to track and implement changes to application and environment configurations. Configuration management systems are also used to reduce errors caused by manual processes, make configuration changes repeatable and auditable, and reduce the level of effort.

On AWS, you can use
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html) to continually monitor your AWS resource
configurations
[across
accounts and Regions](https://docs.aws.amazon.com/config/latest/developerguide/aggregate-data.html). It helps you to track their
configuration history, understand how a configuration change would
affect other resources, and audit them against expected or desired
configurations using
[AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html) and
[AWS Config Conformance Packs](https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html).

For dynamic configurations in your applications running on
Amazon EC2 instances, AWS Lambda, containers, mobile applications, or IoT devices, you can use
[AWS AppConfig](https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html) to configure, validate, deploy, and monitor them across your environments.

### Implementation steps

- Identify configuration owners.

Make configurations owners aware of any compliance, governance, or regulatory needs.

- Identify configuration items and deliverables.

Configuration items are all application and environmental configurations affected by a deployment within your CI/CD pipeline.
- Deliverables include success criteria, validation, and what to monitor.

- Select tools for configuration management based on your business requirements and delivery pipeline.
- Consider weighted deployments such as canary deployments for significant configuration changes to minimize the impact of incorrect configurations.
- Integrate your configuration management into your CI/CD pipeline.
- Validate all changes pushed.

## Resources

**Related best practices:**

- [OPS06-BP01 Plan for unsuccessful changes](./ops_mit_deploy_risks_plan_for_unsucessful_changes.html)
- [OPS06-BP02 Test deployments](./ops_mit_deploy_risks_test_val_chg.html)
- [OPS06-BP03 Employ safe deployment strategies](./ops_mit_deploy_risks_deploy_mgmt_sys.html)
- [OPS06-BP04 Automate testing and rollback](./ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [AWS Landing Zone Accelerator](https://aws.amazon.com/solutions/implementations/landing-zone-accelerator-on-aws/)
- [AWS Config](https://aws.amazon.com/config/)
- [What is AWS Config?](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html)
- [AWS AppConfig](https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html)
- [What is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [AWS Developer Tools](https://aws.amazon.com/products/developer-tools/)
- [AWS CodeBuild](https://aws.amazon.com/codebuild/)
- [AWS CodePipeline](https://aws.amazon.com/codepipeline/)
- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)

**Related videos:**

- [AWS re:Invent 2022 - Proactive governance and compliance for AWS workloads](https://youtu.be/PpUnH9Y52X0?si=82wff87KHXcc6nbT)
- [AWS re:Invent 2020: Achieve compliance as code using AWS Config](https://youtu.be/m8vTwvbzOfw?si=my4DP0FLq1zwKjho)
- [Manage and Deploy Application Configurations with AWS AppConfig](https://youtu.be/ztIxMY3IIu0?si=ovYGsxWOBysyQrg0)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_conf_mgmt_sys.html*

---

# OPS05-BP04 Use build and deployment management systems

Use build and deployment management systems. These systems reduce errors caused by manual processes and reduce the level of effort to deploy changes.

In AWS, you can build continuous integration/continuous deployment
(CI/CD) pipelines using services such as
[AWS Developer Tools](https://aws.amazon.com/products/developer-tools/) (for example,
[AWS CodeBuild](https://aws.amazon.com/codebuild/),
[AWS CodePipeline](https://aws.amazon.com/codepipeline/), and
[AWS CodeDeploy](https://aws.amazon.com/codedeploy/)).

**Desired outcome:** Your build and deployment management systems support your organization's continuous integration continuous delivery (CI/CD) system that provide capabilities for automating safe rollouts with the correct configurations.

**Common anti-patterns:**

- After compiling your code on your development system, you copy
the executable onto your production systems and it fails to
start. The local log files indicates that it has failed due to
missing dependencies.
- You successfully build your application with new features in
your development environment and provide the code to quality
assurance (QA). It fails QA because it is missing static assets.
- On Friday, after much effort, you successfully built your
application manually in your development environment including
your newly coded features. On Monday, you are unable to repeat
the steps that allowed you to successfully build your
application.
- You perform the tests you have created for your new release.
Then you spend the next week setting up a test environment and
performing all the existing integration tests followed by the
performance tests. The new code has an unacceptable performance
impact and must be redeveloped and then retested.

**Benefits of establishing this best
practice:** By providing mechanisms to manage build and
deployment activities you reduce the level of effort to perform
repetitive tasks, free your team members to focus on their high
value creative tasks, and limit the introduction of error from
manual procedures.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Build and deployment management systems are used to track and implement change, reduce errors caused by manual processes, and reduce the level of effort required for safe deployments. Fully automate the integration and deployment pipeline from code check-in through build, testing, deployment, and validation. This reduces lead time, decreases cost, encourages increased frequency of change, reduces the level of effort, and increases collaboration.

### Implementation steps

*Diagram showing a CI/CD pipeline using AWS CodePipeline and related services*

- Use a version control system to store and manage assets (such as documents, source code, and binary files).
- Use CodeBuild to compile your source code, runs unit tests, and produces artifacts that are ready to deploy.
- Use CodeDeploy as a deployment service that automates application deployments to [Amazon EC2](https://aws.amazon.com/ec2/) instances, on-premises instances, [serverless AWS Lambda functions](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html), or [Amazon ECS](https://aws.amazon.com/ecs/).
- Monitor your deployments.

## Resources

**Related best practices:**

- [OPS06-BP04 Automate testing and rollback](./ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [AWS Developer Tools](https://aws.amazon.com/products/developer-tools/)
- [What
is AWS CodeBuild?](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html)
- [AWS CodeBuild](https://aws.amazon.com/codebuild/)
- [What
is AWS CodeDeploy?](https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html)

**Related videos:**

- [AWS re:Invent 2022 - AWS Well-Architected best practices for DevOps on AWS](https://youtu.be/hfXokRAyorA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_build_mgmt_sys.html*

---

# OPS05-BP05 Perform patch management

Perform patch management to gain features, address issues, and remain compliant with governance. Automate patch management to reduce errors caused by manual processes, scale, and reduce the level of effort to patch.

Patch and vulnerability management are part of your benefit and risk
management activities. It is preferable to have immutable
infrastructures and deploy workloads in verified known good states.
Where that is not viable, patching in place is the remaining option.

[AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/) is the authoritative source of information about planned lifecycle events and other action-required events that affect the health of your AWS Cloud resources. You should be aware of upcoming changes and updates that should be performed. Major planned lifecycle events are sent at least six months in advance.

[Amazon EC2 Image Builder](https://aws.amazon.com/image-builder/) provides pipelines to update machine images. As a part of patch management, consider [Amazon Machine Images](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html ) (AMIs) using an [AMI image pipeline](https://docs.aws.amazon.com/imagebuilder/latest/userguide/start-build-image-pipeline.html) or container images with a [Docker image pipeline](https://docs.aws.amazon.com/imagebuilder/latest/userguide/start-build-container-pipeline.html), while AWS Lambda provides patterns for [custom runtimes and additional libraries](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html) to remove vulnerabilities.

You should manage updates to [Amazon Machine Images](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) for Linux or Windows Server images using [Amazon EC2 Image Builder](https://aws.amazon.com/image-builder/). You can use [Amazon Elastic Container Registry (Amazon ECR)](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html) with your existing pipeline to manage Amazon ECS images and manage Amazon EKS images. Lambda includes [version management features](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html).

Patching should not be performed on production systems without first
testing in a safe environment. Patches should only be applied if
they support an operational or business outcome. On AWS, you can use
[AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html) to automate the process of
patching managed systems and schedule the activity using
[Systems Manager Maintenance Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-maintenance.html).

**Desired outcome:** Your AMI and container images are patched, up-to-date, and ready for launch. You are able to track the status of all deployed images and know patch compliance. You are able to report on current status and have a process to meet your compliance needs.

**Common anti-patterns:**

- You are given a mandate to apply all new security patches within
two hours resulting in multiple outages due to application
incompatibility with patches.
- An unpatched library results in unintended consequences as
unknown parties use vulnerabilities within it to access your
workload.
- You patch the developer environments automatically without
notifying the developers. You receive multiple complaints from
the developers that their environment cease to operate as
expected.
- You have not patched the commercial off-the-shelf software on a
persistent instance. When you have an issue with the software
and contact the vendor, they notify you that version is not
supported and you have to patch to a specific level to
receive any assistance.
- A recently released patch for the encryption software you used
has significant performance improvements. Your unpatched system
has performance issues that remain in place as a result of not
patching.
- You are notified of a zero-day vulnerability requiring an emergency fix and you have to patch all your environments manually.
- You are not aware of critical actions needed to maintain your resources, such as mandatory version updates because you do not review upcoming planned lifecycle events and other information. You lose critical time for planning and execution, resulting in emergency changes for your teams and potential impact or unexpected downtime.

**Benefits of establishing this best
practice:** By establishing a patch management process, including your criteria for patching and methodology for distribution across your environments, you can scale and report on patch levels. This provides assurances around security patching and ensure clear visibility on the status of known fixes being in place. This encourages adoption of desired features and capabilities, the rapid removal of issues, and sustained compliance with governance. Implement patch management systems and automation to reduce the level of effort to deploy patches and limit errors caused by manual processes.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Patch systems to remediate issues, to gain desired features or capabilities, and to remain compliant with governance policy and vendor support requirements. In immutable systems, deploy with the appropriate patch set to achieve the desired result. Automate the patch management mechanism to reduce the elapsed time to patch, to avoid errors caused by manual processes, and lower the level of effort to patch.

### Implementation steps

For Amazon EC2 Image Builder:

- Using Amazon EC2 Image Builder, specify pipeline details:

Create an image pipeline and name it
- Define pipeline schedule and time zone
- Configure any dependencies

- Choose a recipe:

Select existing recipe or create a new one
- Select image type
- Name and version your recipe
- Select your base image
- Add build components and add to target registry

- Optional - define your infrastructure configuration.
- Optional - define configuration settings.
- Review settings.
- Maintain recipe hygiene regularly.

For Systems Manager Patch Manager:

- Create a patch baseline.
- Select a patching operations method.
- Enable compliance reporting and scanning.

## Resources

**Related best practices:**

- [OPS06-BP04 Automate testing and rollback](./ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [What is Amazon EC2 Image Builder](https://docs.aws.amazon.com/imagebuilder/latest/userguide/what-is-image-builder.html)
- [Create an image pipeline using the Amazon EC2 Image Builder](https://docs.aws.amazon.com/imagebuilder/latest/userguide/start-build-image-pipeline.html)
- [Create a container image pipeline](https://docs.aws.amazon.com/imagebuilder/latest/userguide/start-build-container-pipeline.html)
- [AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html)
- [Working with Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-console.html)
- [Working with patch compliance reports](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-compliance-reports.html)
- [AWS Developer Tools](https://aws.amazon.com/products/developer-tools)

**Related videos:**

- [CI/CD
for Serverless Applications on AWS](https://www.youtube.com/watch?v=tEpx5VaW4WE)
- [Design with
Ops in Mind](https://youtu.be/uh19jfW7hw4)

**Related examples:**
- [AWS Systems Manager Patch Manager tutorials](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-tutorials.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_patch_mgmt.html*

---

# OPS05-BP06 Share design standards

Share best practices across teams to increase awareness and maximize the benefits of development efforts. Document them and keep them up to date as your architecture evolves. If shared standards are enforced in your organization, it’s critical that mechanisms exist to request additions, changes, and exceptions to standards. Without this option, standards become a constraint on innovation.

**Desired outcome:** Design standards are shared across teams in your organizations. They are documented and kept up-to-date as best practices evolve.

**Common anti-patterns:**

- Two development teams have each created a user authentication service. Your users must maintain a separate set of credentials for each part of the system they want to access.
- Each team manages their own infrastructure. A new compliance requirement forces a change to your infrastructure and each team implements it in a different way.

**Benefits of establishing this best
practice:** Using shared standards supports the adoption of best practices and maximizes the benefits of development efforts. Documenting and updating design standards keeps your organization up-to-date with best practices and security and compliance requirements.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Share existing best practices, design standards, checklists, operating procedures, guidance, and governance requirements across teams. Have procedures to request changes, additions, and exceptions to design standards to support improvement and innovation. Make teams are aware of published content. Have a mechanism to keep design standards up-to-date as new best practices emerge.

**Customer example**

AnyCompany Retail has a cross-functional architecture team that creates software architecture patterns. This team builds the architecture with compliance and governance built in. Teams that adopt these shared standards get the benefits of having compliance and governance built in. They can quickly build on top of the design standard. The architecture team meets quarterly to evaluate architecture patterns and update them if necessary.

### Implementation steps

- Identify a cross-functional team that owns developing and updating design standards. This team should work with stakeholders across your organization to develop design standards, operating procedures, checklists, guidance, and governance requirements. Document the design standards and share them within your organization.

[AWS Service Catalog](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/introduction.html) can be used to create portfolios representing design standards using infrastructure as code. You can share portfolios across accounts.

- Have a mechanism in place to keep design standards up-to-date as new best practices are identified.
- If design standards are centrally enforced, have a process to request changes, updates, and exemptions.

**Level of effort for the implementation plan:** Medium. Developing a process to create and share design standards can take coordination and cooperation with stakeholders across your organization.

## Resources

**Related best practices:**

- [OPS01-BP03 Evaluate governance requirements](./ops_priorities_governance_reqs.html) - Governance requirements influence design standards.
- [OPS01-BP04 Evaluate compliance requirements](./ops_priorities_compliance_reqs.html) - Compliance is a vital input in creating design standards.
- [OPS07-BP02 Ensure a consistent review of operational readiness](./ops_ready_to_support_const_orr.html) - Operational readiness checklists are a mechanism to implement design standards when designing your workload.
- [OPS11-BP01 Have a process for continuous improvement](./ops_evolve_ops_process_cont_imp.html) - Updating design standards is a part of continuous improvement.
- [OPS11-BP04 Perform knowledge management](./ops_evolve_ops_knowledge_management.html) - As part of your knowledge management practice, document and share design standards.

**Related documents:**

- [Automate AWS Backups with AWS Service Catalog](https://aws.amazon.com/blogs/mt/automate-aws-backups-with-aws-service-catalog/)
- [AWS Service Catalog Account Factory-Enhanced](https://aws.amazon.com/blogs/mt/aws-service-catalog-account-factory-enhanced/)
- [How Expedia Group built Database as a Service (DBaaS) offering using AWS Service Catalog](https://aws.amazon.com/blogs/mt/how-expedia-group-built-database-as-a-service-dbaas-offering-using-aws-service-catalog/)
- [Maintain visibility over the use of cloud architecture patterns](https://aws.amazon.com/blogs/architecture/maintain-visibility-over-the-use-of-cloud-architecture-patterns/)
- [Simplify sharing your AWS Service Catalog portfolios in an AWS Organizations setup](https://aws.amazon.com/blogs/mt/simplify-sharing-your-aws-service-catalog-portfolios-in-an-aws-organizations-setup/)

**Related videos:**

- [AWS Service Catalog – Getting Started](https://www.youtube.com/watch?v=A9kKy6WhqVA)
- [AWS re:Invent 2020: Manage your AWS Service Catalog portfolios like an expert](https://www.youtube.com/watch?v=lVfXkWHAtR8)

**Related examples:**

- [AWS Service Catalog Reference Architecture](https://github.com/aws-samples/aws-service-catalog-reference-architectures)
- [AWS Service Catalog Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/d40750d7-a330-49be-9945-cde864610de9/en-US)

**Related services:**

- [AWS Service Catalog](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/introduction.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_share_design_stds.html*

---

# OPS05-BP07 Implement practices to improve code quality

Implement practices to improve code quality and minimize defects.
Some examples include test-driven development, code reviews,
standards adoption, and pair programming. Incorporate these
practices into your continuous integration and delivery process.

**Desired outcome:** Your
organization uses best practices like code reviews or pair
programming to improve code quality. Developers and operators adopt
code quality best practices as part of the software development
lifecycle.

**Common anti-patterns:**

- You commit code to the main branch of your application without a
code review. The change automatically deploys to production and
causes an outage.
- A new application is developed without any unit, end-to-end, or
integration tests. There is no way to test the application
before deployment.
- Your teams make manual changes in production to address defects.
Changes do not go through testing or code reviews and are not
captured or logged through continuous integration and delivery
processes.

**Benefits of establishing this best
practice:** By adopting practices to improve code quality,
you can help minimize issues introduced to production. Code quality
best practices include pair programming, code
reviews, and implementation of AI productivity tools.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Implement practices to improve code quality to minimize defects
before they are deployed. Use practices like test-driven
development, code reviews, and pair programming to increase the
quality of your development.

Use the power of generative AI with Amazon Q Developer to improve
developer productivity and code quality. Amazon Q Developer includes
generation of code suggestions (based on large language models),
production of unit tests (including boundary conditions), and code
security enhancements through detection and remediation of security
vulnerabilities.

**Customer example**

AnyCompany Retail adopts several practices to improve code
quality. They have adopted test-driven development as the standard
for writing applications. For some new features, they will have
developers pair program together during a sprint. Every pull
request goes through a code review by a senior developer before
being integrated and deployed.

### Implementation steps

- Adopt code quality practices like test-driven development,
code reviews, and pair programming into your continuous
integration and delivery process. Use these techniques to
improve software quality.

Use
[Amazon Q Developer](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/what-is.html), a generative AI tool that can help
create unit test cases (including boundary conditions),
generate functions using code and comments, implement
well-known algorithms, detect security policy violations
and vulnerabilities in your code, detect secrets, scan
infrastructure as code (IaC), document code, and learn
third-party code libraries more quickly.
- [Amazon CodeGuru Reviewer](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html) can provide programming
recommendations for Java and Python code using machine
learning.

**Level of effort for the implementation
plan:** Medium. There are many ways of implementing
this best practice, but getting organizational adoption may be
challenging.

## Resources

**Related best practices:**

- [OPS05-BP02
Test and validate changes](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_test_val_chg.html)
- [OPS05-BP06
Share design standards](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_share_design_stds.html)

**Related documents:**

- [Adopt
a test-driven development approach](https://docs.aws.amazon.com/prescriptive-guidance/latest/best-practices-cdk-typescript-iac/development-best-practices.html)
- [Accelerate
your Software Development Lifecycle with Amazon Q](https://aws.amazon.com/blogs/devops/accelerate-your-software-development-lifecycle-with-amazon-q/)
- [Amazon Q Developer, now generally available, includes previews of new
capabilities to reimagine developer experience](https://aws.amazon.com/blogs/aws/amazon-q-developer-now-generally-available-includes-new-capabilities-to-reimagine-developer-experience/)
- [The
Ultimate Cheat Sheet for Using Amazon Q Developer in Your
IDE](https://community.aws/content/2eYoqeFRqaVnk900emsknDfzhfW/the-ultimate-cheat-sheet-for-using-amazon-q-developer-in-your-ide)
- [Shift-Left
Workload, leveraging AI for Test Creation](https://community.aws/content/2gBZtC94gPzaCQRnt4P0rIYWuBx/shift-left-workload-leveraging-ai-for-test-creation)
- [Amazon Q Developer Center](https://aws.amazon.com/developer/generative-ai/amazon-q/)
- [10
ways to build applications faster with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/10-ways-to-build-applications-faster-with-amazon-codewhisperer/)
- [Looking
beyond code coverage with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/looking-beyond-code-coverage-with-amazon-codewhisperer/)
- [Best
Practices for Prompt Engineering with Amazon CodeWhisperer](https://aws.amazon.com/blogs/devops/best-practices-for-prompt-engineering-with-amazon-codewhisperer/)
- [Agile
Software Guide](https://martinfowler.com/agile.html)
- [My
CI/CD pipeline is my release captain](https://aws.amazon.com/builders-library/cicd-pipeline/)
- [Automate
code reviews with Amazon CodeGuru Reviewer](https://aws.amazon.com/blogs/devops/automate-code-reviews-with-amazon-codeguru-reviewer/)
- [Adopt
a test-driven development approach](https://docs.aws.amazon.com/prescriptive-guidance/latest/best-practices-cdk-typescript-iac/development-best-practices.html)
- [How
DevFactory builds better applications with Amazon CodeGuru](https://aws.amazon.com/blogs/machine-learning/how-devfactory-builds-better-applications-with-amazon-codeguru/)
- [On
Pair Programming](https://martinfowler.com/articles/on-pair-programming.html)
- [RENGA
Inc. automates code reviews with Amazon CodeGuru](https://aws.amazon.com/blogs/machine-learning/renga-inc-automates-code-reviews-with-amazon-codeguru/)
- [The
Art of Agile Development: Test-Driven Development](http://www.jamesshore.com/v2/books/aoad1/test_driven_development)
- [Why
code reviews matter (and actually save time!)](https://www.atlassian.com/agile/software-development/code-reviews)

**Related videos:**

- [Implement
an API with Amazon Q Developer Agent for Software
Development](https://www.youtube.com/watch?v=U4XEvJUvff4)
- [Installing,
Configuring, & Using Amazon Q Developer with JetBrains
IDEs (How-to)](https://www.youtube.com/watch?v=-iQfIhTA4J0)
- [Mastering
the art of Amazon CodeWhisperer - YouTube playlist](https://www.youtube.com/playlist?list=PLDqi6CuDzubxzL-yIqgQb9UbbceYdKhpK)
- [AWS re:Invent 2020: Continuous improvement of code quality with
Amazon CodeGuru](https://www.youtube.com/watch?v=iX1i35H1OVw)
- [AWS Summit ANZ 2021 - Driving a test-first strategy with CDK and
test driven development](https://www.youtube.com/watch?v=1R7G_wcyd3s)

**Related services:**

- [Amazon Q Developer](https://aws.amazon.com/q/developer/)
- [Amazon CodeGuru Reviewer](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html)
- [Amazon CodeGuru Profiler](https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_code_quality.html*

---

# OPS05-BP08 Use multiple environments

Use multiple environments to experiment, develop, and test your
workload. Use increasing levels of controls as environments approach
production to gain confidence your workload operates as intended
when deployed.

**Desired outcome:** You have multiple environments that reflect your compliance and governance needs. You test and promote code through environments on your path to production.

- Your organization does this through the establishment of a landing zone, which provides governance, controls, account automations, networking, security, and operational observability. Manage these landing zone capabilities by using multiple environments. A common example is a sandbox organization for developing and testing changes to an [AWS Control Tower](https://aws.amazon.com/controltower/)-based landing zone, which includes [AWS IAM Identity Center](https://aws.amazon.com/iam/identity-center/) and policies such as [service control policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html). All of these elements can significantly impact the access to and operation of AWS accounts within the landing zone.
- In addition to these services, your teams extend the landing zones capabilites with solutions published by AWS and AWS partners or as custom solutions developed within your organization. Examples of solutions published by AWS include [Customizations for AWS Control Tower (CfCT)](https://aws.amazon.com/solutions/implementations/customizations-for-aws-control-tower/) and [AWS Control Tower Account Factory for Terraform (AFT)](https://docs.aws.amazon.com/controltower/latest/userguide/aft-overview.html).
- Your organization applies the same principles of testing, promoting code, and policy changes for the landing zone through environments on your path to production. This strategy provides a stable and secure landing zone environment for your application and workload teams.

**Common anti-patterns:**

- You are performing development in a shared development
environment and another developer overwrites your code changes.
- The restrictive security controls on your shared development
environment are preventing you from experimenting with new
services and features.
- You perform load testing on your production systems and cause an
outage for your users.
- A critical error resulting in data loss has occurred in
production. In your production environment, you attempt to
recreate the conditions that lead to the data loss so that you
can identify how it happened and prevent it from happening
again. To prevent further data loss during testing, you are
forced to make the application unavailable to your users.
- You are operating a multi-tenant service and are unable to
support a customer request for a dedicated environment.
- You may not always test, but when you do, you test in your production environment.
- You believe that the simplicity of a single environment
overrides the scope of impact of changes within the environment.
- You upgrade a key landing zone capability, but the change impairs your team's ability to vend accounts for either new projects or your existing workloads.
- You apply new controls to your AWS accounts, but the change impacts your workload team's ability to deploy changes within their AWS accounts.

**Benefits of establishing this best
practice:** When you deploy multiple environments, you can support multiple simultaneous development, testing, and production environments without creating conflicts between developers or user communities. For complex capabilities such as landing zones, it significantly reduces the risk of changes, simplifies the improvement process, and reduces the risk of critical updates to the environment. Organizations that use landing zones naturally benefit from multi-accounts in their AWS environment, with account structure, governance, network, and security configurations. Over time, as your organization grows, the landing zone can evolve to secure and organize your workloads and resources.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Use multiple environments and provide developers sandbox environments with minimized controls to aid in experimentation. Provide individual development environments to help work in parallel, increasing development agility. Implement more rigorous controls in the environments approaching production to allow developers to innovate. Use infrastructure as code and configuration management systems to deploy environments that are configured consistent with the controls present in production to ensure systems operate as expected when deployed. When environments are not in use, turn them off to avoid costs associated with idle resources (for example, development systems on evenings and weekends). Deploy production equivalent environments when load testing to improve valid results.

Teams such as platform engineering, networking, and security operations often manage capabilies at the organization level with distinct requirements. A separation of accounts alone is insufficient to provide and maintain separate environments for experimentation, development, and testing. In such cases, create separate instances of AWS Organizations.

## Resources

**Related documents:**

- [Instance Scheduler on AWS](https://aws.amazon.com/solutions/implementations/instance-scheduler-on-aws/)
- [What
is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [Organizing Your AWS Environment Using Multiple Accounts - Multiple organizations - Test changes to your overall AWS environment](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/multiple-organizations.html#test-changes-to-your-overall-aws-environment)
- [AWS Control Tower Guide](https://catalog.workshops.aws/control-tower)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_multi_env.html*

---

# OPS05-BP09 Make frequent, small, reversible changes

Frequent, small, and reversible changes reduce the scope and impact of a change. When used in conjunction with change management systems, configuration management systems, and build and delivery systems frequent, small, and reversible changes reduce the scope and impact of a change. This results in more effective troubleshooting and faster remediation with the option to roll back changes.

**Common anti-patterns:**

- You deploy a new version of your application quarterly with a change window that means a core service is turned off.
- You frequently make changes to your database schema without tracking changes in your management systems.
- You perform manual in-place updates, overwriting existing installations and configurations, and have no clear roll-back plan.

**Benefits of establishing this best
practice:** Development efforts are faster by deploying small changes frequently. When the changes are small, it is much easier to identify if they have unintended consequences, and they are easier to reverse. When the changes are reversible, there is less risk to implementing the change, as recovery is simplified. The change process has a reduced risk and the impact of a failed change is reduced.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Use frequent, small, and reversible changes to reduce the scope and impact of a change. This eases troubleshooting, helps with faster remediation, and provides the option to roll back a change. It also increases the rate at which you can deliver value to the business.

## Resources

**Related best practices:**

- [OPS05-BP03 Use configuration management systems](./ops_dev_integ_conf_mgmt_sys.html)
- [OPS05-BP04 Use build and deployment management systems](./ops_dev_integ_build_mgmt_sys.html)
- [OPS06-BP04 Automate testing and rollback](./ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [Implementing Microservices on AWS](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/microservices-on-aws.html)
- [Microservices - Observability](https://docs.aws.amazon.com/whitepapers/latest/microservices-on-aws/observability.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_freq_sm_rev_chg.html*

---

# OPS05-BP10 Fully automate integration and deployment

Automate build, deployment, and testing of the workload. This
reduces errors caused by manual processes and reduces the effort to
deploy changes.

Apply metadata using
[Resource
Tags](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html) and
[AWS Resource Groups](https://docs.aws.amazon.com/ARG/latest/APIReference/Welcome.html) following a consistent
[tagging
strategy](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/) to aid in identification of your resources. Tag your
resources for organization, cost accounting, access controls, and
targeting the run of automated operations activities.

**Desired outcome:** Developers use tools to deliver code and promote through to production. Developers do not have to log into the AWS Management Console to deliver updates. There is a full audit trail of change and configuration, meeting the needs of governance and compliance. Processes are repeatable and are standardized across teams. Developers are free to focus on development and code pushes, increasing productivity.

**Common anti-patterns:**

- On Friday, you finish authoring the new code for your feature
branch. On Monday, after running your code quality test scripts
and each of your unit tests scripts, you check in your code
for the next scheduled release.
- You are assigned to code a fix for a critical issue impacting a
large number of customers in production. After testing the fix,
you commit your code and email change management to request
approval to deploy it to production.
- As a developer, you log into the AWS Management Console to create a new development environment using non-standard methods and systems.

**Benefits of establishing this best
practice:** By implementing automated build and deployment management systems, you reduce errors caused by manual processes and reduce the effort to deploy changes helping your team members to focus on delivering business value. You increase the speed of delivery as you promote through to production.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

You use build and deployment management systems to track and implement change, to reduce errors caused by manual processes, and reduce the level of effort. Fully automate the integration and deployment pipeline from code check-in through build, testing, deployment, and validation. This reduces lead time, encourages increased frequency of change, reduces the level of effort, increases the speed to market, results in increased productivity, and increases the security of your code as you promote through to production.

## Resources

**Related best practices:**

- [OPS05-BP03 Use configuration management systems](./ops_dev_integ_conf_mgmt_sys.html)
- [OPS05-BP04 Use build and deployment management systems](./ops_dev_integ_build_mgmt_sys.html)

**Related documents:**

- [What
is AWS CodeBuild?](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html)
- [What
is AWS CodeDeploy?](https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html)

**Related videos:**

- [AWS re:Invent 2022 - AWS Well-Architected best practices for DevOps on AWS](https://youtu.be/hfXokRAyorA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_auto_integ_deploy.html*

---
