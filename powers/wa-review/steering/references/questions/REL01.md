# REL 1 — How do you manage Service Quotas and constraints?

**Pillar**: Reliability  
**Best Practices**: 6

---

# REL01-BP01 Aware of service quotas and constraints

Be aware of your default quotas and manage your quota increase requests for your workload architecture.
Know which cloud resource constraints, such as disk or network, are potentially impactful.

**Desired outcome:**
Customers can prevent service degradation or disruption in their AWS accounts by
implementing proper guidelines for monitoring key metrics, infrastructure reviews,
and automation remediation steps to verify that services quotas and constraints are
not reached that could cause service degradation or disruption.

**Common anti-patterns:**

- Deploying a workload without understanding the hard or soft quotas and their limits for the services used.
- Deploying a replacement workload without analyzing and reconfiguring the necessary quotas or contacting Support in advance.
- Assuming that cloud services have no limits and the services can be used without consideration to rates, limits, counts, quantities.
- Assuming that quotas will automatically be increased.
- Not knowing the process and timeline of quota requests.
- Assuming that the default cloud service quota is the identical for every service compared across regions.
- Assuming that service constraints can be breached and the systems will auto-scale or add increase the limit beyond the resource’s constraints
- Not testing the application at peak traffic in order to stress the utilization of its resources.
- Provisioning the resource without analysis of the required resource size.
- Overprovisioning capacity by choosing resource types that go well beyond actual need or expected peaks.
- Not assessing capacity requirements for new levels of traffic in advance of a new customer event or deploying a new technology.

**Benefits of establishing this best
practice:** Monitoring and automated management of service quotas and resource constraints
can proactively reduce failures. Changes in traffic patterns for a customer’s service can cause a
disruption or degradation if best practices are not followed. By monitoring and managing these values
across all regions and all accounts, applications can have improved resiliency under adverse or
unplanned events.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Service Quotas is an AWS service that helps you manage your quotas for over
250 AWS services from one location. Along with looking up the quota values,
you can also request and track quota increases from the Service Quotas console
or using the AWS SDK. AWS Trusted Advisor offers a service quotas check that
displays your usage and quotas for some aspects of some services. The default
service quotas per service are also in the AWS documentation per respective
service (for example, see [Amazon VPC Quotas](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html)).

Some service limits, like rate limits on throttled APIs are set within the
Amazon API Gateway itself by configuring a usage plan. Some limits that are set as
configuration on their respective services include Provisioned IOPS, Amazon RDS
storage allocated, and Amazon EBS volume allocations.
Amazon Elastic Compute Cloud has its own service limits dashboard
that can help you manage your instance, Amazon Elastic Block Store,
and Elastic IP address limits. If you have a use case where service quotas
impact your application’s performance and they are not adjustable to your
needs, then contact Support to see if there are mitigations.

Service quotas can be Region specific or can also be global in nature.
Using an AWS service that reaches its quota will not act as expected in
normal usage and may cause service disruption or degradation. For example,
a service quota limits the number of DL Amazon EC2 instances used in a Region. That limit may be reached during a traffic scaling event using Auto Scaling groups (ASG).

Service quotas for each account should be assessed for usage on a regular
basis to determine what the appropriate service limits might be for that
account. These service quotas exist as operational guardrails, to prevent
accidentally provisioning more resources than you need. They also serve
to limit request rates on API operations to protect services from abuse.

Service constraints are different from service quotas. Service constraints
represent a particular resource’s limits as defined by that resource type.
These might be storage capacity (for example, gp2 has a size limit of 1 GB - 16 TB)
or disk throughput. It is essential that a resource type’s
constraint be engineered and constantly assessed for usage that might reach
its limit. If a constraint is reached unexpectedly, the account’s applications
or services may be degraded or disrupted.

If there is a use case where service quotas impact an application’s performance
and they cannot be adjusted to required needs, contact Support to see if
there are mitigations. For more detail on adjusting fixed quotas, see
[REL01-BP03 Accommodate fixed service quotas and constraints through architecture](./rel_manage_service_limits_aware_fixed_limits.html).

There are a number of AWS services and tools to help monitor and manage Service Quotas.
The service and tools should be leveraged to provide automated or manual checks of quota levels.

- AWS Trusted Advisor offers a service quota check that displays your usage and quotas
for some aspects of some services. It can aid in identifying services that are near quota.
- AWS Management Console provides methods to display services quota values, manage,
request new quotas, monitor status of quota requests, and display history of quotas.
- AWS CLI and CDKs offer programmatic methods to automatically manage and monitor service quota levels and usage.

**Implementation steps**

For Service Quotas:

- [Review AWS Service Quotas.](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- To be aware of your existing service quotas, determine the services (like IAM Access Analyzer) that are used.
There are approximately 250 AWS services controlled by service quotas. Then, determine the specific service
quota name that might be used within each account and Region. There are approximately 3000 service quota names per Region.
- Augment this quota analysis with AWS Config to find all
[AWS resources](https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html) used in your AWS accounts.
- Use [AWS CloudFormation data](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-view-stack-data-resources.html) to determine your AWS resources used.
Look at the resources that were created either in the
AWS Management Console or with the [list-stack-resources](https://docs.aws.amazon.com/cli/latest/reference/cloudformation/list-stack-resources.html) AWS CLI command.
You can also see resources configured to be deployed in the template itself.
- Determine all the services your workload requires by looking at the deployment code.
- Determine the service quotas that apply. Use the programmatically accessible information from Trusted Advisor and Service Quotas.
- Establish an automated monitoring method
(see [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
and [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html))
to alert and inform if services quotas are near or have reached their limit.
- Establish an automated and programmatic method to check if a service quota has
been changed in one region but not in other regions in the same account
(see [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
and [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html)).
- Automate scanning application logs and metrics to determine if there
are any quota or service constraint errors. If these errors are present,
send alerts to the monitoring system.
- Establish engineering procedures to calculate the required change in quota
(see [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html))
once it has been identified that larger quotas are required for specific services.
- Create a provisioning and approval workflow to request changes in service quota.
This should include an exception workflow in case of request deny or partial approval.
- Create an engineering method to review service quotas prior to
provisioning and using new AWS services before rolling out to
production or loaded environments. (for example, load testing account).

For service constraints:

- Establish monitoring and metrics methods to alert for resources reading close
to their resource constraints. Leverage CloudWatch as appropriate for metrics
or log monitoring.
- Establish alert thresholds for each resource that has a constraint that is
meaningful to the application or system.
- Create workflow and infrastructure management procedures to change the
resource type if the constraint is near utilization. This workflow should
include load testing as a best practice to verify that new type is the
correct resource type with the new constraints.
- Migrate identified resource to the recommended new resource type, using
existing procedures and processes.

## Resources

**Related best practices:**

- [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
- [REL01-BP03 Accommodate fixed service quotas and constraints through architecture](./rel_manage_service_limits_aware_fixed_limits.html)
- [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html)
- [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html)
- [REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover](./rel_manage_service_limits_suff_buffer_limits.html)
- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Well-Architected Framework’s Reliability Pillar: Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/best-practice-checklist/)
- [AWS limit monitor on AWS answers](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [Amazon EC2 Service Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [How to Request Quota Increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html)
- [Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html)
- [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [AWS for Data](https://aws.amazon.com/data/)
- [What is Continuous Integration?](https://aws.amazon.com/devops/continuous-integration/)
- [What is Continuous Delivery?](https://aws.amazon.com/devops/continuous-delivery/)
- [APN Partner: partners that can help with configuration management](https://partners.amazonaws.com/search/partners?keyword=Configuration+Management&ref=wellarchitected)
- [Managing the account lifecycle in account-per-tenant SaaS environments on AWS](https://aws.amazon.com/blogs/mt/managing-the-account-lifecycle-in-account-per-tenant-saas-environments-on-aws/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [View AWS Trusted Advisor recommendations at scale with AWS Organizations](https://aws.amazon.com/blogs/mt/organizational-view-for-trusted-advisor/)
- [Automating Service Limit Increases and Enterprise Support with AWS Control Tower](https://aws.amazon.com/blogs/mt/automating-service-limit-increases-enterprise-support-aws-control-tower/)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [View and Manage Quotas for AWS Services Using Service Quotas](https://www.youtube.com/watch?v=ZTwfIIf35Wc)
- [AWS IAM Quotas Demo](https://www.youtube.com/watch?v=srJ4jr6M9YQ)

**Related tools:**

- [Amazon CodeGuru Reviewer](https://aws.amazon.com/codeguru/)
- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)
- [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS CDK](https://aws.amazon.com/cdk/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_aware_quotas_and_constraints.html*

---

# REL01-BP02 Manage service quotas across accounts and regions

If you are using multiple accounts or Regions,
request the appropriate quotas in all environments
in which your production workloads run.

**Desired outcome:** Services and applications
should not be affected by service quota exhaustion for configurations that
span accounts or Regions or that have resilience designs using zone, Region,
or account failover.

**Common anti-patterns:**

- Allowing resource usage in one isolation Region
to grow with no mechanism to maintain capacity in the
other ones.
- Manually setting all quotas independently in isolation Regions.
- Not considering the effect of resiliency architectures
(like active or passive) in future quota needs during a
degradation in the non-primary Region.
- Not evaluating quotas regularly and making necessary
changes in every Region and account the workload runs.
- Not leveraging [quota request templates](https://docs.aws.amazon.com/servicequotas/latest/userguide/organization-templates.html)
to request increases across multiple Regions and accounts.
- Not updating service quotas due to incorrectly
thinking that increasing quotas has cost implications
like compute reservation requests.

**Benefits of establishing this best
practice:** Verifying that you can handle your
current load in secondary regions or accounts if regional
services become unavailable. This can help reduce the number
of errors or levels of degradations that occur during region
loss.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Service quotas are tracked per account. Unless otherwise
noted, each quota is AWS Region-specific. In addition to
the production environments, also manage quotas in all
applicable non-production environments so that testing
and development are not hindered. Maintaining a high
degree of resiliency requires that service quotas are
assessed continually (whether automated or manual).

With more workloads spanning Regions due to the implementation
of designs using *Active/Active*,
*Active/Passive – Hot*,
*Active/Passive-Cold*, and
*Active/Passive-Pilot Light* approaches,
it is essential to understand all Region and account quota levels.
Past traffic patterns are not always a good indicator if the
service quota is set correctly.

Equally important, the service quota name limit is not always
the same for every Region. In one Region, the value could be
five, and in another region the value could be ten. Management
of these quotas must span all the same services, accounts, and
Regions to provide consistent resilience under load.

Reconcile all the service quota differences across different
Regions (Active Region or Passive Region) and create processes
to continually reconcile these differences. The testing plans
of passive Region failovers are rarely scaled to peak active
capacity, meaning that game day or table top exercises can
fail to find differences in service quotas between Regions
and also then maintain the correct limits.

*Service quota drift*, the condition where service quota limits
for a specific named quota is changed in one Region and not
all Regions, is very important to track and assess. Changing
the quota in Regions with traffic or potentially could carry
traffic should be considered.

- Select relevant accounts and Regions based on your service requirements, latency,
regulatory, and disaster recovery (DR) requirements.
- Identify service quotas across all relevant accounts, Regions, and
Availability Zones. The limits are scoped to account and Region. These
values should be compared for differences.

**Implementation steps**

- Review Service Quotas values that might have
breached beyond the a risk level of usage.
AWS Trusted Advisor provides alerts for 80% and 90%
threshold breaches.
- Review values for service quotas in any Passive
Regions (in an Active/Passive design). Verify
that load will successfully run in secondary
Regions in the event of a failure in the primary
Region.
- Automate assessing if any service quota drift has
occurred between Regions in the same account and
act accordingly to change the limits.
- If the customer Organizational Units (OU) are structured
in the supported manner, service quota templates should
be updated to reflect changes in any quotas that should
be applied to multiple Regions and accounts.

Create a template and associate Regions to the quota change.
- Review all existing service quota templates for any changes
required (Region, limits, and accounts).

## Resources

**Related best practices:**

- [REL01-BP01 Aware of service quotas and constraints](./rel_manage_service_limits_aware_quotas_and_constraints.html)
- [REL01-BP03 Accommodate fixed service quotas and constraints through architecture](./rel_manage_service_limits_aware_fixed_limits.html)
- [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html)
- [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html)
- [REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover](./rel_manage_service_limits_suff_buffer_limits.html)
- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Well-Architected Framework’s Reliability Pillar: Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/best-practice-checklist/)
- [AWS limit monitor on AWS answers](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [Amazon EC2 Service Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [How to Request Quota Increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html)
- [Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html)
- [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [AWS for Data](https://aws.amazon.com/data/)
- [What is Continuous Integration?](https://aws.amazon.com/devops/continuous-integration/)
- [What is Continuous Delivery?](https://aws.amazon.com/devops/continuous-delivery/)
- [APN Partner: partners that can help with configuration management](https://partners.amazonaws.com/search/partners?keyword=Configuration+Management&ref=wellarchitected)
- [Managing the account lifecycle in account-per-tenant SaaS environments on AWS](https://aws.amazon.com/blogs/mt/managing-the-account-lifecycle-in-account-per-tenant-saas-environments-on-aws/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [View AWS Trusted Advisor recommendations at scale with AWS Organizations](https://aws.amazon.com/blogs/mt/organizational-view-for-trusted-advisor/)
- [Automating Service Limit Increases and Enterprise Support with AWS Control Tower](https://aws.amazon.com/blogs/mt/automating-service-limit-increases-enterprise-support-aws-control-tower/)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [View and Manage Quotas for AWS Services Using Service Quotas](https://www.youtube.com/watch?v=ZTwfIIf35Wc)
- [AWS IAM Quotas Demo](https://www.youtube.com/watch?v=srJ4jr6M9YQ)

**Related services:**

- [Amazon CodeGuru Reviewer](https://aws.amazon.com/codeguru/)
- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)
- [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS CDK](https://aws.amazon.com/cdk/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_limits_considered.html*

---

# REL01-BP03 Accommodate fixed service quotas and constraints through architecture

Be aware of unchangeable service quotas, service constraints, and physical resource limits. Design architectures for applications and services to prevent these limits from impacting reliability.

Examples include network bandwidth, serverless function invocation payload size, throttle burst rate for of an API gateway, and concurrent user connections to a database.

**Desired outcome:** The application or service performs as expected under normal and high traffic conditions. They have been designed to work within the limitations for that resource’s fixed constraints or service quotas.

**Common anti-patterns:**

- Choosing a design that uses a resource of a service, unaware that there are design constraints that will cause this design to fail as you scale.
- Performing benchmarking that is unrealistic and will reach service fixed quotas during the testing. For example, running tests at a burst limit but for an extended amount of time.
- Choosing a design that cannot scale or be modified if fixed service quotas are to be exceeded. For example, an SQS payload size of 256KB.
- Observability has not been designed and implemented to monitor and alert on thresholds for service quotas that might be at risk during high traffic events

**Benefits of establishing this best
practice:** Verifying that the application will run under all projected services load levels without disruption or degradation.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Unlike soft service quotas or resources that be replaced with higher capacity units, AWS services’ fixed quotas cannot be changed. This means that all these type of AWS services must be evaluated for potential hard capacity limits when used in an application design.

Hard limits are shown in the Service Quotas console. If the columns shows `ADJUSTABLE = No`, the service has a hard limit. Hard limits are also shown in some resources configuration pages. For example, Lambda has specific hard limits that cannot be adjusted.

As an example, when designing a python application to run in a Lambda function, the application should be evaluated to determine if there is any chance of Lambda running longer than 15 minutes. If the code may run more than this service quota limit, alternate technologies or designs must be considered. If this limit is reached after production deployment, the application will suffer degradation and disruption until it can be remediated. Unlike soft quotas, there is no method to change to these limits even under emergency Severity 1 events.

Once the application has been deployed to a testing environment, strategies should be used to find if any hard limits can be reached. Stress testing, load testing, and chaos testing should be part of the introduction test plan.

**Implementation steps**

- Review the complete list of AWS services that could be used in the application design phase.
- Review the soft quota limits and hard quota limits for all these services. Not all limits are shown in the Service Quotas console. Some services [describe these limits in alternate locations](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html).
- As you design your application, review your workload’s business and technology drivers, such as business outcomes, use case, dependent systems, availability targets, and disaster recovery objects. Let your business and technology drivers guide the process to identify the distributed system that is right for your workload.
- Analyze service load across Regions and accounts. Many hard limits are regionally based for services. However, some limits are account based.
- Analyze resilience architectures for resource usage during a zonal failure and Regional failure. In the progression of multi-Region designs using active/active, active/passive – hot, active/passive - cold, and active/passive - pilot light approaches, these failure cases will cause higher usage. This creates a potential use case for hitting hard limits.

## Resources

**Related best practices:**

- [REL01-BP01 Aware of service quotas and constraints](./rel_manage_service_limits_aware_quotas_and_constraints.html)
- [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
- [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html)
- [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html)
- [REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover](./rel_manage_service_limits_suff_buffer_limits.html)
- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Well-Architected Framework’s Reliability Pillar: Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/best-practice-checklist/)
- [AWS limit monitor on AWS answers](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [Amazon EC2 Service Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [How to Request Quota Increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html)
- [Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html)
- [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [AWS for Data](https://aws.amazon.com/data/)
- [What is Continuous Integration?](https://aws.amazon.com/devops/continuous-integration/)
- [What is Continuous Delivery?](https://aws.amazon.com/devops/continuous-delivery/)
- [APN Partner: partners that can help with configuration management](https://partners.amazonaws.com/search/partners?keyword=Configuration+Management&ref=wellarchitected)
- [Managing the account lifecycle in account-per-tenant SaaS environments on AWS](https://aws.amazon.com/blogs/mt/managing-the-account-lifecycle-in-account-per-tenant-saas-environments-on-aws/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [View AWS Trusted Advisor recommendations at scale with AWS Organizations](https://aws.amazon.com/blogs/mt/organizational-view-for-trusted-advisor/)
- [Automating Service Limit Increases and Enterprise Support with AWS Control Tower](https://aws.amazon.com/blogs/mt/automating-service-limit-increases-enterprise-support-aws-control-tower/)
- [Actions, resources, and condition keys for Service Quotas](https://docs.aws.amazon.com/service-authorization/latest/reference/list_servicequotas.html)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [View and Manage Quotas for AWS Services Using Service Quotas](https://www.youtube.com/watch?v=ZTwfIIf35Wc)
- [AWS IAM Quotas Demo](https://www.youtube.com/watch?v=srJ4jr6M9YQ)
- [AWS re:Invent 2018: Close Loops and Opening Minds: How to Take Control of Systems, Big and Small](https://www.youtube.com/watch?v=O8xLxNje30M)

**Related tools:**

- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)
- [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS CDK](https://aws.amazon.com/cdk/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_aware_fixed_limits.html*

---

# REL01-BP04 Monitor and manage quotas

Evaluate your potential usage and increase your quotas
appropriately, allowing for planned growth in usage.

**Desired outcome:** Active and automated systems that manage and monitor have been deployed. These operations solutions ensure that quota usage thresholds are nearing being reached. These would be proactively remediated by requested quota changes.

**Common anti-patterns:**

- Not configuring monitoring to check for service quota thresholds
- Not configuring monitoring for hard limits, even though those values cannot be changed.
- Assuming that amount of time required to request and secure a soft quota change is immediate or a short period.
- Configuring alarms for when service quotas are being approached, but having no process on how to respond to an alert.
- Only configuring alarms for services supported by AWS Service Quotas and not monitoring other AWS services.
- Not considering quota management for multiple Region resiliency designs, like active/active, active/passive – hot, active/passive - cold, and active/passive - pilot light approaches.
- Not assessing quota differences between Regions.
- Not assessing the needs in every Region for a specific quota increase request.
- Not leveraging [templates for multi-Region quota management](https://docs.aws.amazon.com/servicequotas/latest/userguide/organization-templates.html).

**Benefits of establishing this best
practice:** Automatic tracking of the AWS Service Quotas
and monitoring your usage against those quotas will allow you to see
when you are approaching a quota limit. You can also use this
monitoring data to help limit any degradations due to quota exhaustion.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

For supported services, you can monitor your quotas by configuring various different services that can assess and then send alerts or alarms. This can aid in monitoring usage and can alert you to approaching quotas. These alarms can be invoked from AWS Config, Lambda functions, Amazon CloudWatch, or from AWS Trusted Advisor. You can also use metric filters on CloudWatch Logs to search and extract patterns in logs to determine if usage is approaching quota thresholds.

**Implementation steps**

For monitoring:

- Capture current resource consumption (for example, buckets or instances). Use service API operations, such as the Amazon EC2 `DescribeInstances` API, to collect current resource consumption.
- Capture your current quotas that are essential and applicable to the services using:

AWS Service Quotas
- AWS Trusted Advisor
- AWS documentation
- AWS service-specific pages
- AWS Command Line Interface (AWS CLI)
- AWS Cloud Development Kit (AWS CDK)

- Use AWS Service Quotas, an AWS service that helps you manage your quotas for over 250 AWS services from one location.
- Use Trusted Advisor service limits to monitor your current service limits at various thresholds.
- Use the service quota history (console or AWS CLI) to check on regional increases.
- Compare service quota changes in each Region and each account to create equivalency, if required.

For management:

- Automated: Set up an AWS Config custom rule to scan service quotas across Regions and compare for differences.
- Automated: Set up a scheduled Lambda function to scan service quotas across Regions and compare for differences.
- Manual: Scan services quota through AWS CLI, API, or AWS Console to scan service quotas across Regions and compare for differences. Report the differences.
- If differences in quotas are identified between Regions, request a quota change, if required.
- Review the result of all requests.

## Resources

**Related best practices:**

- [REL01-BP01 Aware of service quotas and constraints](./rel_manage_service_limits_aware_quotas_and_constraints.html)
- [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
- [REL01-BP03 Accommodate fixed service quotas and constraints through architecture](./rel_manage_service_limits_aware_fixed_limits.html)
- [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html)
- [REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover](./rel_manage_service_limits_suff_buffer_limits.html)
- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Well-Architected Framework’s Reliability Pillar: Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/best-practice-checklist/)
- [AWS limit monitor on AWS answers](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [Amazon EC2 Service Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [How to Request Quota Increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html)
- [Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html)
- [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [AWS for Data](https://aws.amazon.com/data/)
- [What is Continuous Integration?](https://aws.amazon.com/devops/continuous-integration/)
- [What is Continuous Delivery?](https://aws.amazon.com/devops/continuous-delivery/)
- [APN Partner: partners that can help with configuration management](https://partners.amazonaws.com/search/partners?keyword=Configuration+Management&ref=wellarchitected)
- [Managing the account lifecycle in account-per-tenant SaaS environments on AWS](https://aws.amazon.com/blogs/mt/managing-the-account-lifecycle-in-account-per-tenant-saas-environments-on-aws/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [View AWS Trusted Advisor recommendations at scale with AWS Organizations](https://aws.amazon.com/blogs/mt/organizational-view-for-trusted-advisor/)
- [Automating Service Limit Increases and Enterprise Support with AWS Control Tower](https://aws.amazon.com/blogs/mt/automating-service-limit-increases-enterprise-support-aws-control-tower/)
- [Actions, resources, and condition keys for Service Quotas](https://docs.aws.amazon.com/service-authorization/latest/reference/list_servicequotas.html)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [View and Manage Quotas for AWS Services Using Service Quotas](https://www.youtube.com/watch?v=ZTwfIIf35Wc)
- [AWS IAM Quotas Demo](https://www.youtube.com/watch?v=srJ4jr6M9YQ)
- [AWS re:Invent 2018: Close Loops and Opening Minds: How to Take Control of Systems, Big and Small](https://www.youtube.com/watch?v=O8xLxNje30M)

**Related tools:**

- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)
- [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS CDK](https://aws.amazon.com/cdk/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_monitor_manage_limits.html*

---

# REL01-BP05 Automate quota management

Service quotas, also referred to as limits in AWS services, are the
maximum values for the resources in your AWS account. Each AWS
service defines a set of quotas and their default values. To provide
your workload access to all the resources it needs, you might need
to increase your service quota values.

Growth in workload consumption of AWS resources can threaten
workload stability and impact the user experience if quotas are
exceeded. Implement tools to alert you when your workload approaches
the limits and consider creating quota increase requests
automatically.

**Desired outcome:** Quotas are
appropriately configured for the workloads running in each AWS account and Region.

**Common anti-patterns:**

- You fail to consider and adjust quotas appropriately to meet
workload requirements.
- You track quotas and usage using methods that can become
outdated, such as with spreadsheets.
- You only update service limits on periodic schedules.
- Your organization lacks operational processes to review existing
quotas and request service quota increases when necessary.

**Benefits of establishing this best
practice:**

- Enhanced workload resiliency: You prevent errors caused by
exceeding AWS resource quotas.
- Simplified disaster recovery: You can reuse automated quota
management mechanisms built in the primary Region during DR
setup in another AWS Region.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

View current quotas and track ongoing quota consumption through
mechanisms such as AWS Service Quotas console, AWS Command Line Interface (AWS CLI), and AWS SDKs. You can also integrate your
configuration management databases (CMDB) and IT service
management (ITSM) systems with the AWS Service Quota APIs.

Generate automated alerts if quota usage reaches your defined
thresholds, and define a process for submitting quota increase
requests when you receive alerts. If the underlying workload is
critical to your business, you can automate quota increase
requests, but carefully test the automation to avoid the risk of
runaway action such as a growth feedback loop.

Smaller quota increases are often automatically approved. Larger
quota requests may need to be manually processed by AWS support
and can take additional time to review and process. Allow for
additional time to process multiple requests or large increase
requests.

### Implementation steps

- Implement automated monitoring of service quotas, and issue
alerts if your workload's resource utilization growth
approaches your quota limits. For example,
[Quota
Monitor](https://docs.aws.amazon.com/solutions/latest/quota-monitor-for-aws/solution-overview.html) for AWS can provide automated monitoring of
service quotas. This tool integrates with AWS Organizations
and deploys using Cloudformation StackSets so that new
accounts are automatically monitored on creation.
- Use features such as
[Service Quotas request templates](https://docs.aws.amazon.com/servicequotas/latest/userguide/organization-templates.html) or
[AWS Control Tower](https://www.youtube.com/watch?v=3WUShZ4lZGE) to simplify Service Quotas setup for
new accounts.
- Build dashboards of your current service quota use across
all AWS accounts and regions and reference them as necessary
to prevent exceeding your quotas.
[Trusted
Advisor Organizational (TAO) Dashboard](https://aws.amazon.com/blogs/mt/a-detailed-overview-of-trusted-advisor-organizational-dashboard/), part of the
[Cloud
Intelligence Dashboards](https://catalog.workshops.aws/awscid/en-US), can get you quickly started
with such a dashboard.
- Track service limit increase requests.
[Consolidated
Insights from Multiple Accounts(CIMA)](https://github.com/aws-samples/case-insights-for-multi-accounts) can provide an
Organization-level view of all your requests.
- Test alert generation and any quota increase request
automation by setting lower quota thresholds in
non-production accounts. Do not conduct these tests in a
production account.

## Resources

**Related best practices:**

- [OPS10-BP07
Automate responses to events](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_auto_event_response.html)

**Related documents:**

- [APN
Partner: partners that can help with configuration
management](https://aws.amazon.com/partners/find/results/?keyword=Configuration+Management)
- [AWS Marketplace: CMDB products that help track limits](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://docs.aws.amazon.com/awssupport/latest/user/trusted-advisor-check-reference.html)
- [Quota
Monitor Solution on AWS - AWS Solution](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [What
is Service Quotas request templates?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [Automating
Service Limit Increases and Enterprise Support with AWS Control Tower](https://www.youtube.com/watch?v=3WUShZ4lZGE)

**Related tools:**

- [Quota
Monitor for AWS](https://github.com/aws-solutions/quota-monitor-for-aws)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_automated_monitor_limits.html*

---

# REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover

This article explains how to maintain space between the resource quota and your usage, and how it can benefit your organization. After you finish using a resource, the usage quota may continue to account for that resource. This can result in a failing or inaccessible resource. Prevent resource failure by verifying that your quotas cover the overlap of inaccessible resources and their replacements. Consider cases like network failure, Availability Zone failure, or Region failures when calculating this gap.

**Desired outcome:** Small or large failures in resources or resource accessibility can be covered within the current service thresholds. Zone failures, network failures, or even Regional failures have been considered in the resource planning.

**Common anti-patterns:**

- Setting service quotas based on current needs without accounting for failover scenarios.
- Not considering the principals of static stability when calculating the peak quota for a service.
- Not considering the potential of inaccessible resources in calculating total quota needed for each Region.
- Not considering AWS service fault isolation boundaries for some services and their potential abnormal usage patterns.

**Benefits of establishing this best
practice:** When service disruption events impact application availability, use the cloud to implement strategies to recover from these events. An example strategy is creating additional resources to replace inaccessible resources to accommodate failover conditions without exhausting your service limit.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

When evaluating a quota limit, consider failover cases that might occur due to some degradation. Consider the following failover cases.

- A disrupted or inaccessible VPC.
- An inaccessible subnet.
- A degraded Availability Zone that impacts resource accessibility.
- Networking routes or ingress and egress points are blocked or changed.
- A degraded Region that impacts resource accessibility.
- A subset of resources affected by a failure in a Region or an Availability Zone.

The decision to failover is unique for each situation, as the business impact can vary. Address resource capacity planning in the failover location and the resources’ quotas before deciding to failover an application or service.

Consider higher than normal peaks of activity when reviewing quotas for each service. These peaks might be related to resources that are inaccessible due to networking or permissions, but are still active. Unterminated active resources count against the service quota limit.

**Implementation steps**

- Maintain space between your service quota and your maximum usage to accommodate for a failover or loss of accessibility.
- Determine your service quotas. Account for typical deployment patterns, availability requirements, and consumption growth.
- Request quota increases if necessary. Anticipate a wait time for the quota increase request.
- Determine your reliability requirements (also known as your number of nines).
- Understand potential fault scenarios such as loss of a component, an Availability Zone, or a Region.
- Establish your deployment methodology (examples include canary, blue/green, red/black, and rolling).
- Include an appropriate buffer to the current quota limit. An example buffer could be 15%.
- Include calculations for static stability (Zonal and Regional) where appropriate.
- Plan consumption growth and monitor your consumption trends.
- Consider the static stability impact for your most critical workloads. Assess resources
conforming to a statically stable system in all Regions and Availability Zones.
- Consider using On-Demand Capacity Reservations to schedule capacity ahead of any failover. This is a useful strategy to implement for critical business schedules to reduce potential risks of obtaining the correct quantity and type of resources during failover.

## Resources

**Related best practices:**

- [REL01-BP01 Aware of service quotas and constraints](./rel_manage_service_limits_aware_quotas_and_constraints.html)
- [REL01-BP02 Manage service quotas across accounts and regions](./rel_manage_service_limits_limits_considered.html)
- [REL01-BP03 Accommodate fixed service quotas and constraints through architecture](./rel_manage_service_limits_aware_fixed_limits.html)
- [REL01-BP04 Monitor and manage quotas](./rel_manage_service_limits_monitor_manage_limits.html)
- [REL01-BP05 Automate quota management](./rel_manage_service_limits_automated_monitor_limits.html)
- [REL03-BP01 Choose how to segment your workload](./rel_service_architecture_monolith_soa_microservice.html)
- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP01 Monitor all components of the workload to detect failures](./rel_withstand_component_failures_monitoring_health.html)
- [REL11-BP03 Automate healing on all layers](./rel_withstand_component_failures_auto_healing_system.html)
- [REL12-BP04 Test resiliency using chaos engineering](./rel_testing_resiliency_failure_injection_resiliency.html)

**Related documents:**

- [AWS Well-Architected Framework’s Reliability Pillar: Availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/availability.html)
- [AWS Service Quotas (formerly referred to as service limits)](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [AWS Trusted Advisor Best Practice Checks (see the Service Limits
section)](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/best-practice-checklist/)
- [AWS limit monitor on AWS answers](https://aws.amazon.com/answers/account-management/limit-monitor/)
- [Amazon EC2 Service Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
- [What
is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [How to Request Quota Increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html)
- [Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html)
- [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)
- [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/)
- [AWS Fault Isolation Boundaries](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/abstract-and-introduction.html)
- [Availability with redundancy](https://docs.aws.amazon.com/whitepapers/latest/availability-and-beyond-improving-resilience/availability-with-redundancy.html)
- [AWS for Data](https://aws.amazon.com/data/)
- [What is Continuous Integration?](https://aws.amazon.com/devops/continuous-integration/)
- [What is Continuous Delivery?](https://aws.amazon.com/devops/continuous-delivery/)
- [APN Partner: partners that can help with configuration management](https://partners.amazonaws.com/search/partners?keyword=Configuration+Management&ref=wellarchitected)
- [Managing the account lifecycle in account-per-tenant SaaS environments on AWS](https://aws.amazon.com/blogs/mt/managing-the-account-lifecycle-in-account-per-tenant-saas-environments-on-aws/)
- [Managing and monitoring API throttling in your workloads](https://aws.amazon.com/blogs/mt/managing-monitoring-api-throttling-in-workloads/)
- [View AWS Trusted Advisor recommendations at scale with AWS Organizations](https://aws.amazon.com/blogs/mt/organizational-view-for-trusted-advisor/)
- [Automating Service Limit Increases and Enterprise Support with AWS Control Tower](https://aws.amazon.com/blogs/mt/automating-service-limit-increases-enterprise-support-aws-control-tower/)
- [Actions, resources, and condition keys for Service Quotas](https://docs.aws.amazon.com/service-authorization/latest/reference/list_servicequotas.html)

**Related videos:**

- [AWS Live
re:Inforce 2019 - Service Quotas](https://youtu.be/O9R5dWgtrVo)
- [View and Manage Quotas for AWS Services Using Service Quotas](https://www.youtube.com/watch?v=ZTwfIIf35Wc)
- [AWS IAM Quotas Demo](https://www.youtube.com/watch?v=srJ4jr6M9YQ)
- [AWS re:Invent 2018: Close Loops and Opening Minds: How to Take Control of Systems, Big and Small](https://www.youtube.com/watch?v=O8xLxNje30M)

**Related tools:**

- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)
- [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon EventBridge](https://aws.amazon.com/eventbridge/)
- [Amazon DevOps Guru](https://aws.amazon.com/devops-guru/)
- [AWS Config](https://aws.amazon.com/config/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
- [AWS CDK](https://aws.amazon.com/cdk/)
- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [AWS Marketplace](https://aws.amazon.com/marketplace/search/results?searchTerms=CMDB)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_manage_service_limits_suff_buffer_limits.html*

---
