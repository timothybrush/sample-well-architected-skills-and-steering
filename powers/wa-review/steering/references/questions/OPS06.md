# OPS 6 — How do you mitigate deployment risks?

**Pillar**: Operational Excellence  
**Best Practices**: 4

---

# OPS06-BP01 Plan for unsuccessful changes

Plan to revert to a known good state, or remediate in the production environment if the deployment causes an undesired outcome. Having a policy to establish such a plan helps all teams develop strategies to recover from failed changes. Some example strategies are deployment and rollback steps, change policies, feature flags, traffic isolation, and traffic shifting. A single release may include multiple related component changes. The strategy should provide the ability to withstand or recover from a failure of any component change.

**Desired outcome:** You have prepared a detailed recovery plan for your change in the event it is unsuccessful. In addition, you have reduced the size of your release to minimize the potential impact on other workload components. As a result, you have reduced your business impact by shortening the potential downtime caused by a failed change and increased the flexibility and efficiency of recovery times.

**Common anti-patterns:**

- You performed a deployment and your application has become unstable but there appear to be active users on the system. You have to decide whether to rollback the change and impact the active users or wait to rollback the change knowing the users may be impacted regardless.
- After making a routine change, your new environments are accessible, but one of your subnets has become unreachable. You have to decide whether to rollback everything or try to fix the inaccessible subnet. While you are making that determination, the subnet remains unreachable.
- Your systems are not architected in a way that allows them to be updated with smaller releases. As a result, you have difficulty in reversing those bulk changes during a failed deployment.
- You do not use infrastructure as code (IaC) and you made manual updates to your infrastructure that resulted in an undesired configuration. You are unable to effectively track and revert the manual changes.
- Because you have not measured increased frequency of your deployments, your team is not incentivized to reduce the size of their changes and improve their rollback plans for each change, leading to more risk and increased failure rates.
- You do not measure the total duration of an outage caused by unsuccessful changes. Your team is unable to prioritize and improve its deployment process and recovery plan effectiveness.

**Benefits of establishing this best
practice:** Having a plan to recover from unsuccessful changes minimizes the mean time to recover (MTTR) and reduces your business impact.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

A consistent, documented policy and practice adopted by release teams allows an organization to plan what should happen if unsuccessful changes occur. The policy should allow for fixing forward in specific circumstances. In either situation, a fix forward or rollback plan should be well documented and tested before deployment to live production so that the time it takes to revert a change is minimized.

### Implementation steps

- Document the policies that require teams to have effective plans to reverse changes within a specified period.

Policies should specify when a fix-forward situation is allowed.
- Require a documented rollback plan to be accessible by all involved.
- Specify the requirements to rollback (for example, when it is found that unauthorized changes have been deployed).

- Analyze the level of impact of all changes related to each component of a workload.

Allow repeatable changes to be standardized, templated, and preauthorized if they follow a consistent workflow that enforces change policies.
- Reduce the potential impact of any change by making the size of the change smaller so recovery takes less time and causes less business impact.
- Ensure rollback procedures revert code to the known good state to avoid incidents where possible.

- Integrate tools and workflows to enforce your policies programatically.
- Make data about changes visible to other workload owners to improve the speed of diagnosis of any failed change that cannot be rolled back.

Measure success of this practice using visible change data and identify iterative improvements.

- Use monitoring tools to verify the success or failure of a deployment to speed up decision-making on rolling back.
- Measure your duration of outage during an unsuccessful change to continually improve your recovery plans.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS06-BP04 Automate testing and rollback](./ops_mit_deploy_risks_auto_testing_and_rollback.html)

**Related documents:**

- [AWS Builders Library | Ensuring Rollback Safety During Deployments](https://aws.amazon.com/builders-library/ensuring-rollback-safety-during-deployments/)
- [AWS Whitepaper | Change Management in the Cloud](https://docs.aws.amazon.com/whitepapers/latest/change-management-in-the-cloud/change-management-in-the-cloud.html)

**Related videos:**

- [re:Invent 2019 | Amazon’s approach to high-availability deployment](https://aws.amazon.com/builders-library/amazon-approach-to-high-availability-deployment/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_plan_for_unsucessful_changes.html*

---

# OPS06-BP02 Test deployments

Test release procedures in pre-production by using the same deployment configuration, security controls, steps, and procedures as in production. Validate that all deployed steps are completed as expected, such as inspecting files, configurations, and services. Further test all changes with functional, integration, and load tests, along with any monitoring such as health checks. By doing these tests, you can identify deployment issues early with an opportunity to plan and mitigate them prior to production.

You can create temporary parallel environments for testing every change. Automate the deployment of the test environments using infrastructure as code (IaC) to help reduce amount of work involved and ensure stability, consistency, and faster feature delivery.

**Desired outcome:** Your organization adopts a test-driven development culture that includes testing deployments. This ensures teams are focused on delivering business value rather than managing releases. Teams are engaged early upon identification of deployment risks to determine the appropriate course of mitigation.

**Common anti-patterns:**

- During production releases, untested deployments cause frequent issues that require troubleshooting and escalation.
- Your release contains infrastructure as code (IaC) that updates existing resources. You are unsure if the IaC runs successfully or causes impact to the resources.
- You deploy a new feature to your application. It doesn't work as intended and there is no visibility until it gets reported by impacted users.
- You update your certificates. You accidentally install the certificates to the wrong components, which goes undetected and impacts website visitors because a secure connection to the website can't be established.

**Benefits of establishing this best
practice:** Extensive testing in pre-production of deployment procedures, and the changes introduced by them, minimizes the potential impact to production caused by the deployments steps. This increases confidence during production release and minimizes operational support without slowing down velocity of the changes being delivered.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Testing your deployment process is as important as testing the changes that result from your deployment. This can be achieved by testing your deployment steps in a pre-production environment that mirrors production as closely as possible. Common issues, such as incomplete or incorrect deployment steps, or misconfigurations, can be caught as a result before going to production. In addition, you can test your recovery steps.

**Customer example**

As part of their continuous integration and continuous delivery (CI/CD) pipeline, AnyCompany Retail performs the defined steps needed to release infrastructure and software updates for its customers in a production-like environment. The pipeline is comprised of pre-checks to detect drift (detecting changes to resources performed outside of your IaC) in resources prior to deployment, as well as validate actions that the IaC takes upon its initiation. It validates deployment steps, like verifying that certain files and configurations are in place and services are in running states and are responding correctly to health checks on local host before re-registering with the load balancer. Additionally, all changes flag a number of automated tests, such as functional, security, regression, integration, and load tests.

### Implementation steps

- Perform pre-install checks to mirror the pre-production environment to production.

Use [drift detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html) to detect when resources have been changed outside of CloudFormation.
- Use [change sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html) to validate that the intent of a stack update matches the actions that CloudFormation takes when the change set is initiated.

- This triggers a manual approval step in [AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/approvals.html) to authorize the deployment to the pre-production environment.
- Use deployment configurations such as [AWS CodeDeploy AppSpec](https://docs.aws.amazon.com/codedeploy/latest/userguide/application-specification-files.html) files to define deployment and validation steps.
- Where applicable, [integrate AWS CodeDeploy with other AWS services](https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws.html) or [integrate AWS CodeDeploy with partner product and services](https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-partners.html).
- [Monitor deployments](https://docs.aws.amazon.com/codedeploy/latest/userguide/monitoring.html) using Amazon CloudWatch, AWS CloudTrail, and Amazon SNS event notifications.
- Perform post-deployment automated testing, including functional, security, regression, integration, and load testing.
- [Troubleshoot](https://docs.aws.amazon.com/codedeploy/latest/userguide/troubleshooting.html) deployment issues.
- Successful validation of preceding steps should initiate a manual approval workflow to authorize deployment to production.

**Level of effort for the implementation plan:** High

## Resources

**Related best practices:**

- [OPS05-BP02 Test and validate changes](./ops_dev_integ_test_val_chg.html)

**Related documents:**

- [AWS Builders' Library | Automating safe, hands-off deployments | Test Deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/#Test_deployments_in_pre-production_environments)
- [AWS Whitepaper | Practicing Continuous Integration and Continuous Delivery on AWS](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/testing-stages-in-continuous-integration-and-continuous-delivery.html)
- [The Story of Apollo - Amazon's Deployment Engine](https://www.allthingsdistributed.com/2014/11/apollo-amazon-deployment-engine.html)
- [How
to test and debug AWS CodeDeploy locally before you ship your
code](https://aws.amazon.com/blogs/devops/how-to-test-and-debug-aws-codedeploy-locally-before-you-ship-your-code/)
- [Integrating Network Connectivity Testing with Infrastructure Deployment](https://aws.amazon.com/blogs/networking-and-content-delivery/integrating-network-connectivity-testing-with-infrastructure-deployment/)

**Related videos:**

- [re:Invent 2020 | Testing software and systems at Amazon](https://www.youtube.com/watch?v=o1sc3cK9bMU)

**Related examples:**

- [Tutorial | Deploy and Amazon ECS service with a validation test](https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorial-ecs-deployment-with-hooks.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_test_val_chg.html*

---

# OPS06-BP03 Employ safe deployment strategies

Safe production roll-outs control the flow of beneficial changes with an aim to minimize any perceived impact for customers from those changes. The safety controls provide inspection mechanisms to validate desired outcomes and limit the scope of impact from any defects introduced by the changes or from deployment failures. Safe roll-outs may include strategies such as feature-flags, one-box, rolling (canary releases), immutable, traffic splitting, and blue/green deployments.

**Desired outcome:** Your organization uses a continuous integration continuous delivery (CI/CD) system that provides capabilities for automating safe rollouts. Teams are required to use appropriate safe roll-out strategies.

**Common anti-patterns:**

- You deploy an unsuccessful change to all of production all at once. As a result, all customers are impacted simultaneously.
- A defect introduced in a simultaneous deployment to all systems requires an emergency release. Correcting it for all customers takes several days.
- Managing production release requires planning and participation of several teams. This puts constraints on your ability to frequently update features for your customers.
- You perform a mutable deployment by modifying your existing systems. After discovering that the change was unsuccessful, you are forced to modify the systems again to restore the old version, extending your time to recovery.

**Benefits of establishing this best
practice:** Automated deployments balance speed of roll-outs against delivering beneficial changes consistently to customers. Limiting impact prevents costly deployment failures and maximizes teams ability to efficiently respond to failures.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Continuous-delivery failures can lead to reduced service availability and bad customer experiences. To maximize the rate of successful deployments, implement safety controls in the end-to-end release process to minimize deployment errors, with a goal of achieving zero deployment failures.

**Customer example**

AnyCompany Retail is on a mission to achieve minimal to zero downtime deployments, meaning that there's no perceivable impact to its users during deployments. To accomplish this, the company has established deployment patterns (see the following workflow diagram), such as rolling and blue/green deployments. All teams adopt one or more of these patterns in their CI/CD pipeline.

CodeDeploy workflow for Amazon EC2
CodeDeploy workflow for Amazon ECS
CodeDeploy workflow for Lambda

### Implementation steps

- Use an approval workflow to initiate the sequence of production roll-out steps upon promotion to production .
- Use an automated deployment system such as [AWS CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html). AWS CodeDeploy [deployment options](https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-steps.html) include in-place deployments for EC2/On-Premises and blue/green deployments for EC2/On-Premises, AWS Lambda, and Amazon ECS (see the preceding workflow diagram).

Where applicable, [integrate AWS CodeDeploy with other AWS services](https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws.html) or [integrate AWS CodeDeploy with partner product and services](https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-partners.html).

- Use blue/green deployments for databases such as [Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/blue-green-deployments.html) and [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/blue-green-deployments.html).
- [Monitor deployments](https://docs.aws.amazon.com/codedeploy/latest/userguide/monitoring.html) using Amazon CloudWatch, AWS CloudTrail, and Amazon Simple Notification Service (Amazon SNS) event notifications.
- Perform post-deployment automated testing including functional, security, regression, integration, and any load tests.
- [Troubleshoot](https://docs.aws.amazon.com/codedeploy/latest/userguide/troubleshooting.html) deployment issues.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS05-BP02 Test and validate changes](./ops_dev_integ_test_val_chg.html)
- [OPS05-BP09 Make frequent, small, reversible changes](./ops_dev_integ_freq_sm_rev_chg.html)
- [OPS05-BP10 Fully automate integration and deployment](./ops_dev_integ_auto_integ_deploy.html)

**Related documents:**

- [AWS Builders Library | Automating safe, hands-off deployments | Production deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/?did=ba_card&trk=ba_card#Production_deployments)
- [AWS Builders Library | My CI/CD pipeline is my release captain | Safe, automatic
production releases](https://aws.amazon.com//builders-library/cicd-pipeline/#Safe.2C_automatic_production_releases)
- [AWS Whitepaper | Practicing Continuous Integration and Continuous Delivery on AWS |
Deployment methods](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/deployment-methods.html)
- [AWS CodeDeploy User Guide](https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html)
- [Working with deployment configurations in AWS CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html)
- [Set up an API Gateway canary release deployment](https://docs.aws.amazon.com/apigateway/latest/developerguide/canary-release.html)
- [Amazon ECS Deployment Types](https://docs.aws.amazon.com/)
- [Fully Managed Blue/Green Deployments in Amazon Aurora and Amazon RDS](https://aws.amazon.com/blogs/aws/new-fully-managed-blue-green-deployments-in-amazon-aurora-and-amazon-rds/)
- [Blue/Green deployments with AWS Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.CNAMESwap.html)

**Related videos:**

- [re:Invent 2020 | Hands-off: Automating continuous delivery pipelines at Amazon](https://www.youtube.com/watch?v=ngnMj1zbMPY)
- [re:Invent 2019 | Amazon's Approach to high-availability deployment](https://www.youtube.com/watch?v=bCgD2bX1LI4)

**Related examples:**

- [Try a Sample Blue/Green Deployment in AWS CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/applications-create-blue-green.html)
- [Workshop | Building CI/CD pipelines for Lambda canary deployments using AWS CDK](https://catalog.workshops.aws/cdk-cicd-for-lambda-canary-deployment/en-US)
- [Workshop | Building your first DevOps Blue/Green pipeline with Amazon ECS](https://catalog.us-east-1.prod.workshops.aws/workshops/4b59b9fb-48b6-461c-9377-907b2e33c9df/en-US)
- [Workshop | Building your first DevOps Blue/Green pipeline with Amazon EKS](https://catalog.us-east-1.prod.workshops.aws/workshops/4eab6682-09b2-43e5-93d4-1f58fd6cff6e/en-US)
- [Workshop | EKS GitOps with ArgoCD](https://catalog.workshops.aws/eksgitops-argocd-githubactions)
- [Workshop | CI/CD on AWS Workshop](https://catalog.workshops.aws/cicdonaws/en-US)
- [Implementing cross-account CI/CD with AWS SAM for container-based Lambda functions](https://aws.amazon.com/blogs/compute/implementing-cross-account-cicd-with-aws-sam-for-container-based-lambda/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_deploy_mgmt_sys.html*

---

# OPS06-BP04 Automate testing and rollback

To increase the speed, reliability, and confidence of your deployment process, have a strategy for automated testing and rollback capabilities in pre-production and production environments. Automate testing when deploying to production to simulate human and system interactions that verify the changes being deployed. Automate rollback to revert back to a previous known good state quickly. The rollback should be initiated automatically on pre-defined conditions such as when the desired outcome of your change is not achieved or when the automated test fails. Automating these two activities improves your success rate for your deployments, minimizes recovery time, and reduces the potential impact to the business.

**Desired outcome:** Your automated tests and rollback strategies are integrated into your continuous integration, continuous delivery (CI/CD) pipeline. Your monitoring is able to validate against your success criteria and initiate automatic rollback upon failure. This minimizes any impact to end users and customers. For example, when all testing outcomes have been satisfied, you promote your code into the production environment where automated regression testing is initiated, leveraging the same test cases. If regression test results do not match expectations, then automated rollback is initiated in the pipeline workflow.

**Common anti-patterns:**

- Your systems are not architected in a way that allows them to be updated with smaller releases. As a result, you have difficulty in reversing those bulk changes during a failed deployment.
- Your deployment process consists of a series of manual steps. After you deploy changes to your workload, you start post-deployment testing. After testing, you realize that your workload is inoperable and customers are disconnected. You then begin rolling back to the previous version. All of these manual steps delay overall system recovery and cause a prolonged impact to your customers.
- You spent time developing automated test cases for functionality that is not frequently used in your application, minimizing the return on investment in your automated testing capability.
- Your release is comprised of application, infrastructure, patches and configuration updates that are independent from one another. However, you have a single CI/CD pipeline that delivers all changes at once. A failure in one component forces you to revert all changes, making your rollback complex and inefficient.
- Your team completes the coding work in sprint one and begins sprint two work, but your plan did not include testing until sprint three. As a result, automated tests revealed defects from sprint one that had to be resolved before testing of sprint two deliverables could be started and the entire release is delayed, devaluing your automated testing.
- Your automated regression test cases for the production release are complete, but you are not monitoring workload health. Since you have no visibility into whether or not the service has restarted, you are not sure if rollback is needed or if it has already occurred.

**Benefits of establishing this best
practice:** Automated testing increases the transparency of your testing process and your ability to cover more features in a shorter time period. By testing and validating changes in production, you are able to identify issues immediately. Improvement in consistency with automated testing tools allows for better detection of defects. By automatically rolling back to the previous version, the impact on your customers is minimized. Automated rollback ultimately inspires more confidence in your deployment capabilities by reducing business impact. Overall, these capabilities reduce time-to-delivery while ensuring quality.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Automate testing of deployed environments to confirm desired outcomes more quickly. Automate rollback to a previous known good state when pre-defined outcomes are not achieved to minimize recovery time and reduce errors caused by manual processes. Integrate testing tools with your pipeline workflow to consistently test and minimize manual inputs. Prioritize automating test cases, such as those that mitigate the greatest risks and need to be tested frequently with every change. Additionally, automate rollback based on specific conditions that are pre-defined in your test plan.

### Implementation steps

- Establish a testing lifecycle for your development lifecycle that defines each stage of the testing process from requirements planning to test case development, tool configuration, automated testing, and test case closure.

Create a workload-specific testing approach from your overall test strategy.
- Consider a continuous testing strategy where appropriate throughout the development lifecycle.

- Select automated tools for testing and rollback based on your business requirements and pipeline investments.
- Decide which test cases you wish to automate and which should be performed manually. These can be defined based on business value priority of the feature being tested. Align all team members to this plan and verify accountability for performing manual tests.

Apply automated testing capabilities to specific test cases that make sense for automation, such as repeatable or frequently run cases, those that require repetitive tasks, or those that are required across multiple configurations.
- Define test automation scripts as well as the success criteria in the automation tool so continued workflow automation can be initiated when specific cases fail.
- Define specific failure criteria for automated rollback.

- Prioritize test automation to drive consistent results with thorough test case development where complexity and human interaction have a higher risk of failure.
- Integrate your automated testing and rollback tools into your CI/CD pipeline.

Develop clear success criteria for your changes.
- Monitor and observe to detect these criteria and automatically reverse changes when specific rollback criteria are met.

- Perform different types of automated production testing, such as:

A/B testing to show results in comparison to the current version between two user testing groups.
- Canary testing that allows you to roll out your change to a subset of users before releasing it to all.
- Feature-flag testing which allows a single feature of the new version at a time to be flagged on and off from outside the application so that each new feature can be validated one at a time.
- Regression testing to verify new functionality with existing interrelated components.

- Monitor the operational aspects of the application, transactions, and interactions with other applications and components. Develop reports to show success of changes by workload so that you can identify what parts of the automation and workflow can be further optimized.

Develop test result reports that help you make quick decisions on whether or not rollback procedures should be invoked.
- Implement a strategy that allows for automated rollback based upon pre-defined failure conditions that result from one or more of your test methods.

- Develop your automated test cases to allow for reusability across future repeatable changes.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS06-BP01 Plan for unsuccessful changes](./ops_mit_deploy_risks_plan_for_unsucessful_changes.html)
- [OPS06-BP02 Test deployments](./ops_mit_deploy_risks_test_val_chg.html)

**Related documents:**

- [AWS Builders Library | Ensuring rollback safety during deployments](https://aws.amazon.com/builders-library/ensuring-rollback-safety-during-deployments/)
- [Redeploy
and rollback a deployment with AWS CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/deployments-rollback-and-redeploy.html)
- [8 best practices when automating your deployments with AWS CloudFormation](https://aws.amazon.com/blogs/infrastructure-and-automation/best-practices-automating-deployments-with-aws-cloudformation/)

**Related examples:**

- [Serverless UI testing using Selenium, AWS Lambda, AWS Fargate, and AWS Developer Tools](https://aws.amazon.com/blogs/devops/using-aws-codepipeline-aws-codebuild-and-aws-lambda-for-serverless-automated-ui-testing/)

**Related videos:**

- [re:Invent 2020 | Hands-off: Automating continuous delivery pipelines at Amazon](https://www.youtube.com/watch?v=ngnMj1zbMPY)
- [re:Invent 2019 | Amazon's Approach to high-availability deployment](https://www.youtube.com/watch?v=bCgD2bX1LI4)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_mit_deploy_risks_auto_testing_and_rollback.html*

---
