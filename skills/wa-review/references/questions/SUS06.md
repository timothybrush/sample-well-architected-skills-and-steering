# SUS 6 — How do your organizational processes support your sustainability goals?

**Pillar**: Sustainability  
**Best Practices**: 5

---

# SUS06-BP01 Communicate and cascade your sustainability goals

Technology is a key enabler of sustainability. IT teams play a
crucial role in driving meaningful change towards your
organization's sustainability goals. These teams should clearly
understand the company's sustainability targets and work to
communicate and cascade those priorities across its operations.

**Common anti-patterns:**

- You don't know your organization's sustainability goals and how
they apply to your team.
- You have insufficient awareness and training about the
environmental impact of cloud workloads.
- You are unsure about the specific areas to prioritize.
- You do not involve your employees and customers in your
sustainability initiatives.

**Benefits of establishing this best
practice:** From optimization of infrastructure and systems
to use of innovative technologies, IT teams can reduce the
organization's carbon emissions and minimize resource consumption.
Communication of sustainability goals can provide the ability for IT
teams continuously improve and adapt to evolving sustainability
challenges. Additionally, these sustainable optimizations often
translate to cost savings as well, which strengthens the business
case.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The primary sustainability goals for IT teams should be to
optimize systems and solutions to increase resource efficiency and
minimize the organization's carbon footprint and overall
environmental impact. Shared services and initiatives like
training programs and operational dashboards can support
organizations as they optimize IT operations and build solutions
that can help significantly reduce the carbon footprint. The cloud
presents an opportunity not only to move physical infrastructure
and energy procurement responsibilities to the shared
responsibility of the cloud provider but also to continuously
optimize the resource efficiency of cloud-based services.

When teams use the cloud's inherent efficiency and shared
responsibility model, they can drive meaningful reductions in the
organization's environmental impact. This, in turn, can contribute
to the organization's overall sustainability goals and demonstrate
the value of these teams as strategic partners in the journey
towards a more sustainable future.

### Implementation steps

- **Define goals and
objectives:** Establish well-defined goals for your IT program. This involves getting input from
responsible stakeholders from different departments such as
IT, sustainability, and finance. These teams should define
measurable goals that align with your organization's
sustainability goals, including areas such carbon reduction
and resource optimization.
- **Understand the carbon accounting
boundaries of your business:** Understand how
carbon accounting methods like the Greenhouse Gas (GHG)
Protocol relate to your workloads in the cloud
(for more detail, see [Cloud
sustainability](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/cloud-sustainability.html)).
- **Use cloud solutions for carbon
accounting:** Use cloud solutions such as
[carbon
accounting solutions on AWS](https://aws.amazon.com/solutions/sustainability/carbon-accounting/) to track scope one, two,
and three for GHG emissions across your operations,
portfolios, and value chains. With these solutions,
organizations can streamline GHG emission data acquisition,
simplify reporting, and derive insights to inform their
climate strategies.
- **Monitor the carbon footprint of your
IT portfolio:** Track and report carbon emissions
of your IT systems. Use the
[AWS Customer Carbon Footprint Tool](https://aws.amazon.com/aws-cost-management/aws-customer-carbon-footprint-tool/) to track, measure,
review, and forecast the carbon emissions generated from
your AWS usage.
- **Communicate resource usage through
proxy metrics to your teams:** Track and report on
your
[resource
usage through proxy metrics](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/evaluate-specific-improvements.html). In the on-demand pricing
models of the cloud, resource usage is related to cost,
which is a generally-understandable metric. At a minimum,
use cost as a proxy metric to communicate the resource usage
and improvements by each team.

**Enable hourly granularity in
your Cost Explorer and create a
[Cost
and Usage Report (CUR)](https://aws.amazon.com/aws-cost-management/aws-cost-and-usage-reporting/):** The CUR
provides daily or hourly usage granularity, rates,
costs, and usage attributes for all AWS services. Use
[the
Cloud Intelligence Dashboards](https://catalog.workshops.aws/awscid/) and its
Sustainability Proxy Metrics Dashboard as a starting
point for the processing and visualization of cost and
usage based data. For more detail, see the following:
- [Measure
and track cloud efficiency with sustainability proxy
metrics, Part I: What are proxy metrics?](https://aws.amazon.com/blogs/aws-cloud-financial-management/measure-and-track-cloud-efficiency-with-sustainability-proxy-metrics-part-i-what-are-proxy-metrics/)
- [Measure
and track cloud efficiency with sustainability proxy
metrics, Part II: Establish a metrics pipeline](https://aws.amazon.com/blogs/aws-cloud-financial-management/measure-and-track-cloud-efficiency-with-sustainability-proxy-metrics-part-ii-establish-a-metrics-pipeline/)

- **Continuously optimize and
evaluate:** Use an
[improvement
process](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/improvement-process.html) to continuously optimize your IT systems,
including cloud workload for efficiency and sustainability.
Monitor carbon footprint before and after implementation of
optimization strategy. Use the reduction in carbon footprint
to assess the effectiveness.
- **Foster a sustainability
culture:** Use training programs (like
[AWS Skill Builder](https://explore.skillbuilder.aws/learn/external-ecommerce;view=none;redirectURL=?ctldoc-catalog-0=se-sustainability)) to educate your employees about
sustainability. Engage them in sustainability initiatives.
Share and celebrate their success stories. Use incentives to
award them if they achieve sustainability targets.

## Resources

**Related documents:**

- [Understanding
your carbon emission estimations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ccft-estimation.html)

**Related videos:**

- [AWS re:Invent 2023 - Accelerate data-driven circular economy
initiatives with AWS](https://www.youtube.com/watch?v=ivTJorpUTo0)
- [AWS re:Invent 2023 - Sustainability innovation in AWS Global
Infrastructure](https://www.youtube.com/watch?v=0EkcwLKeOQA)
- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and
future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [AWS re:Invent 2022 - Delivering sustainable, high-performing
architectures](https://www.youtube.com/watch?v=FBc9hXQfat0)
- [AWS re:Invent 2022 - Architecting sustainably and reducing your
AWS carbon footprint](https://www.youtube.com/watch?v=jsbamOLpCr8)
- [AWS re:Invent 2022 - Sustainability in AWS global
infrastructure](https://www.youtube.com/watch?v=NgMa8R9-Ywk)

**Related examples:**

- [Well-Architected
Lab - Turning cost & usage reports into efficiency
reports](https://catalog.workshops.aws/well-architected-sustainability/en-US/5-process-and-culture/cur-reports-as-efficiency-reports)

**Related trainings:**

- [Sustainability
Transformation on AWS](https://explore.skillbuilder.aws/learn/course/internal/view/elearning/15981/sustainability-transformation-with-aws?trk=f5740d24-133a-44e7-bdca-e6669e296419&sc_channel=el)
- [SimuLearn
- Sustainability Reporting](https://explore.skillbuilder.aws/learn/course/internal/view/elearning/20240/aws-simulearn-sustainability-reporting)
- [Decarbonization
with AWS](https://explore.skillbuilder.aws/learn/course/internal/view/elearning/19030/decarbonization-with-aws-introduction)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_dev_a1.html*

---

# SUS06-BP02 Adopt methods that can rapidly introduce sustainability improvements

Adopt methods and processes to validate potential improvements,
minimize testing costs, and deliver small improvements.

**Common anti-patterns:**

- Reviewing your application for sustainability is a task done
only once at the beginning of a project.
- Your workload has become stale, as the release process is too
cumbersome to introduce minor changes for resource efficiency.
- You do not have mechanisms to improve your workload for
sustainability.

**Benefits of establishing this best
practice:** By establishing a process to introduce and
track sustainability improvements, you will be able to continually
adopt new features and capabilities, remove issues, and improve
workload efficiency.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Test and validate potential sustainability improvements before
deploying them to production. Account for the cost of testing when
calculating potential future benefit of an improvement. Develop
low cost testing methods to deliver small improvements.

### Implementation steps

- **Understand and communicate your
organizational sustainability goals:** Understand
your organizational sustainability goals, such carbon
reduction or water stewardship. Translate these goals into
sustainability requirements for your cloud workloads.
Communicate these requirements to key stakeholders.
- **Add sustainability requirements to
your backlog:** Add requirements for sustainability
improvement to your development backlog.
- **Iterate and improve:** Use an
[iterative
improvement process](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/improvement-process.html) to identify, evaluate, prioritize,
test, and deploy these improvements.
- **Test using minimum viable product
(MVP):** Develop and test potential improvements
using the minimum viable representative components to reduce
the cost and environmental impact of testing.
- **Streamline the process:**
Continually improve and streamline your development processes.
As an example, Automate your software delivery process using
continuous integration and delivery (CI/CD) pipelines to test
and deploy potential improvements to reduce the level of
effort and limit errors caused by manual processes.
- **Training and awareness:** Run
training programs for your team members to educate them about
sustainability and how their activities impact your
organizational sustainability goals.
- **Assess and adjust:**
Continually assess the impact of improvements and make
adjustments as needed.

## Resources

**Related documents:**

- [AWS enables sustainability solutions](https://aws.amazon.com/sustainability/)

**Related videos:**

- [AWS re:Invent 2023 - Sustainable architecture: Past, present, and
future](https://www.youtube.com/watch?v=2xpUQ-Q4QcM)
- [AWS re:Invent 2022 - Delivering sustainable, high-performing
architectures](https://www.youtube.com/watch?v=FBc9hXQfat0)
- [AWS re:Invent 2022 - Architecting sustainably and reducing your
AWS carbon footprint](https://www.youtube.com/watch?v=jsbamOLpCr8)
- [AWS re:Invent 2022 - Sustainability in AWS global
infrastructure](https://www.youtube.com/watch?v=NgMa8R9-Ywk)
- [AWS re:Invent 2023 - What's new with AWS observability and
operations](https://www.youtube.com/watch?v=E8qQBMDJjso)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_dev_a2.html*

---

# SUS06-BP03 Keep your workload up-to-date

Keep your workload up-to-date to adopt efficient features, remove
issues, and improve the overall efficiency of your workload.

**Common anti-patterns:**

- You assume your current architecture is static and will not be
updated over time.
- You do not have any systems or a regular cadence to evaluate if
updated software and packages are compatible with your workload.

**Benefits of establishing this best
practice:** By establishing a process to keep your workload
up to date, you can adopt new features and capabilities, resolve
issues, and improve workload efficiency.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Up to date operating systems, runtimes, middlewares, libraries,
and applications can improve workload efficiency and make it
easier to adopt more efficient technologies. Up to date software
might also include features to measure the sustainability impact
of your workload more accurately, as vendors deliver features to
meet their own sustainability goals. Adopt a regular cadence to
keep your workload up to date with the latest features and
releases.

### Implementation steps

- **Define a process:** Use a
process and schedule to evaluate new features or instances for
your workload. Take advantage of agility in the cloud to
quickly test how new features can improve your workload to:

Reduce sustainability impacts.
- Gain performance efficiencies.
- Remove barriers for a planned improvement.
- Improve your ability to measure and manage sustainability
impacts.

- **Conduct an inventory:**
Inventory your workload software and architecture and identify
components that need to be updated.

You can use
[AWS Systems Manager Inventory](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-inventory.html) to collect operating
system (OS), application, and instance metadata from your
Amazon EC2 instances and quickly understand which
instances are running the software and configurations
required by your software policy and which instances need
to be updated.

- **Learn the update procedure:**
Understand how to update the components of your workload.

Workload component

How to update

Machine images

Use
[EC2 Image Builder](https://aws.amazon.com/image-builder/) to manage updates to
[Amazon
Machine Images (AMIs)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) for Linux or Windows server
images.

Container images

Use
[Amazon Elastic Container Registry (Amazon ECR)](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html) with your
existing pipeline to
[manage
Amazon Elastic Container Service (Amazon ECS)
images](https://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_on_ECS.html).

AWS Lambda

AWS Lambda includes
[version
management features.](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html)

- **Use automation:** Automate
updates to reduce the level of effort to deploy new features
and limit errors caused by manual processes.

You can use
[CI/CD](https://aws.amazon.com/blogs/devops/complete-ci-cd-with-aws-codecommit-aws-codebuild-aws-codedeploy-and-aws-codepipeline/)
to automatically update AMIs, container images, and other
artifacts related to your cloud application.
- You can use tools such as
[AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html) to automate the
process of system updates, and schedule the activity using
[AWS Systems Manager Maintenance Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-maintenance.html).

## Resources

**Related documents:**

- [AWS Architecture Center](https://aws.amazon.com/architecture)
- [What's
New with AWS](https://aws.amazon.com/new/?ref=wellarchitected&ref=wellarchitected)
- [AWS Developer Tools](https://aws.amazon.com/products/developer-tools/)

**Related videos:**

- [AWS re:Invent 2022 - Optimize your AWS workloads with
best-practice guidance](https://www.youtube.com/watch?v=t8yl1TrnuIk)
- [All
Things Patch: AWS Systems Manager](https://www.youtube.com/watch?v=PhIiVsCEBu8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_dev_a3.html*

---

# SUS06-BP04 Increase utilization of build environments

Increase the utilization of resources to develop, test, and build
your workloads.

**Common anti-patterns:**

- You manually provision or terminate your build environments.
- You keep your build environments running independent of test,
build, or release activities (for example, running an
environment outside of the working hours of your development
team members).
- You over-provision resources for your build environments.

**Benefits of establishing this best
practice:** By increasing the utilization of build
environments, you can improve the overall efficiency of your cloud
workload while allocating the resources to builders to develop,
test, and build efficiently.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Use automation and infrastructure-as-code to bring build
environments up when needed and take them down when not used. A
common pattern is to schedule periods of availability that
coincide with the working hours of your development team members.
Your test environments should closely resemble the production
configuration. However, look for opportunities to use instance
types with burst capacity, Amazon EC2 Spot Instances, automatic
scaling database services, containers, and serverless technologies
to align development and test capacity with use. Limit data volume
to just meet the test requirements. If using production data in
test, explore possibilities of sharing data from production and
not moving data across.

**Implementation steps**

- **Use infrastructure as code:**
Use infrastructure as code to provision your build
environments.
- **Use automation:** Use
automation to manage the lifecycle of your development and
test environments and maximize the efficiency of your build
resources.
- **Maximize utilization**: Use
strategies to maximize the utilization of development and test
environments.

Use minimum viable representative environments to develop
and test potential improvements.
- Use serverless technologies if possible.
- Use On-Demand Instances to supplement your developer
devices.
- Use instance types with burst capacity, Spot Instances,
and other technologies to align build capacity with use.
- Adopt native cloud services for secure instance shell
access rather than deploying fleets of bastion hosts.
- Automatically scale your build resources depending on your
build jobs.

## Resources

**Related documents:**

- [AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html)
- [Amazon EC2 Burstable performance instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html)
- [What
is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [What
is AWS CodeBuild?](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html)
- [Instance
Scheduler on AWS](https://aws.amazon.com/solutions/implementations/instance-scheduler-on-aws/)

**Related videos:**

- [AWS re:Invent 2023 - Continuous integration and delivery for
AWS](https://www.youtube.com/watch?v=25w9uJPt0SA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_dev_a4.html*

---

# SUS06-BP05 Use managed device farms for testing

Use managed device farms to efficiently test a new feature on a
representative set of hardware.

**Common anti-patterns:**

- You manually test and deploy your application on individual
physical devices.
- You do not use app testing service to test and interact with
your apps (for example, Android, iOS, and web apps) on real,
physical devices.

**Benefits of establishing this best
practice:** Using managed device farms for testing
cloud-enabled applications provides a number of benefits:

- They include more efficient features to test application on wide
range of devices.
- They eliminate the need for in-house infrastructure for testing.
- They offer diverse device types, including older and less
popular hardware, which eliminates the need for unnecessary
device upgrades.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Using Managed device farms can help you to streamline the testing
process for new features on a representative set of hardware.
Managed device farms offer diverse device types including older,
less popular hardware, and avoid customer sustainability impact
from unnecessary device upgrades.

### Implementation steps

- **Define testing
requirements**: Define your testing requirements and
plan (like test type, operating systems, and test schedule).

You can use
[Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html) to collect and analyze client-side
data and shape your testing plan.

- **Select a managed device
farm:** Select a managed device farm that can support
your testing requirements. For example, you can use
[AWS Device Farm](https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html) to test and understand the impact of your
changes on a representative set of hardware.
- **Use automation:** Use
automation and continuous integration/continuous deployment
(CI/CD) to schedule and run your tests.

[Integrating
AWS Device Farm with your CI/CD pipeline to run
cross-browser Selenium tests](https://aws.amazon.com/blogs/devops/integrating-aws-device-farm-with-ci-cd-pipeline-to-run-cross-browser-selenium-tests/)
- [Building
and testing iOS and iPadOS apps with AWS DevOps and mobile
services](https://aws.amazon.com/blogs/devops/building-and-testing-ios-and-ipados-apps-with-aws-devops-and-mobile-services/)

- **Review and adjust:**
Continually review your testing results and make necessary
improvements.

## Resources

**Related documents:**

- [AWS Device Farm
device list](https://awsdevicefarm.info/)
- [Viewing
the CloudWatch RUM dashboard](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-view-data.html)

**Related videos:**

- [AWS re:Invent 2023 - Improve your mobile and web app quality using
AWS Device Farm](https://www.youtube.com/watch?v=__93Tm0YCRg)
- [AWS re:Invent 2021 - Optimize applications through end user
insights with Amazon CloudWatch RUM](https://www.youtube.com/watch?v=NMaeujY9A9Y)

**Related examples:**

- [AWS Device Farm Sample App for Android](https://github.com/aws-samples/aws-device-farm-sample-app-for-android)
- [AWS Device Farm Sample App for iOS](https://github.com/aws-samples/aws-device-farm-sample-app-for-ios)
- [Appium
Web tests for AWS Device Farm](https://github.com/aws-samples/aws-device-farm-sample-web-app-using-appium-python)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_dev_a5.html*

---
