# SEC 10 — How do you anticipate, respond to, and recover from incidents?

**Pillar**: Security  
**Best Practices**: 8

---

# SEC10-BP01 Identify key personnel and external resources

Identify internal and external personnel, resources, and legal
obligations to help your organization respond to an incident.

**Desired outcome:** You have a list
of key personnel, their contact information, and the roles they play
when responding to a security event. You review this information
regularly and update it to reflect personnel changes from an
internal and external tools perspective. You consider all
third-party service providers and vendors while documenting this
information, including security partners, cloud providers, and
software-as-a-service (SaaS) applications. During a security event,
personnel are available with the appropriate level of
responsibility, context, and access to be able to respond and
recover.

**Common anti-patterns:**

- Not maintaining an updated list of key personnel with contact
information, their roles, and their responsibilities when
responding to security events.
- Assuming that everyone understands the people, dependencies,
infrastructure, and solutions when responding to and recovering
from an event.
- Not having a document or knowledge repository that represents
key infrastructure or application design.
- Not having proper onboarding processes for new employees to
effectively contribute to a security event response, such as
conducting event simulations.
- Not having an escalation path in place when key personnel are
temporarily unavailable or fail to respond during security
events.

**Benefits of establishing this best
practice:** This practice reduces the triage and response
time spent on identifying the right personnel and their roles during
an event. Minimize wasted time during an event by maintaining an
updated list of key personnel and their roles so you can bring the
right individuals to triage and recover from an event.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

**Identify key personnel in your organization:** Maintain a contact
list of personnel within your organization that you need to
involve. Regularly review and update this information in the event
of personnel movement, like organizational changes, promotions,
and team changes. This is especially important for key roles like
incident managers, incident responders, and communications lead.

- **Incident manager:** Incident managers have overall authority
during the event response.
- **Incident responders:** Incident responders are responsible for
investigation and remediation activities. These people can
differ based on the type of event, but are typically
developers and operation teams responsible for the impacted
application.
- **Communications lead:** The communications lead is responsible
for internal and external communications, especially with
public agencies, regulators, and customers.
- **Onboarding process:** Regularly train and onboard new employees
to equip them with the necessary skills and knowledge to
contribute effectively to incident response efforts.
Incorporate simulations and hands-on exercises as part of the
onboarding process to facilitate their preparedness
- **Subject matter experts (SMEs):** In the case of distributed and
autonomous teams, we recommend you identify an SME for mission
critical workloads. They offer insights into the operation and
data classification of critical workloads involved in the
event.

Example table format:

```
`| Role | Name | Contact Information | Responsibilities |
1 | ——– | ——- | ——- | ——- |
2 | Incident Manager | Jane Doe| jane.doe@example.com | Overall authority during response |
3 | Incident Responder | John Smith | john.smith@example.com | Investigation and remediation |
4 | Communications Lead | Emily Johnson | emily.johnson@example.com | Internal and external communications |
5 | Communications Lead | Michael Brown | michael.brown@example.com | Insights on critical workloads |`
```

Consider using
the [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/what-is-incident-manager.html) feature to capture key
contacts, define a response plan, automate on-call schedules, and
create escalation plans. Automate and rotate all staff through an
on-call schedule, so that responsibility for the workload is
shared across its owners. This promotes good practices, such as
emitting relevant metrics and logs as well as defining alarm
thresholds that matter for the workload.

**Identify external
partners:** Enterprises use tools built by independent
software vendors (ISVs), partners, and subcontractors to build
differentiating solutions for their customers. Engage key
personnel from these parties who can help respond to and recover
from an incident. We recommend you sign up for the appropriate
level of Support in order to get prompt access to AWS subject
matter experts through a support case. Consider similar
arrangements with all critical solutions providers for the
workloads. Some security events require publicly listed businesses
to notify relevant public agencies and regulators of the event and
impacts. Maintain and update contact information for the relevant
departments and responsible individuals.

## Implementation steps

- Set up an incident management solution.

Consider deploying Incident Manager in your Security
Tooling account.

- Define contacts in your incident management solution.

Define at least two types of contact channels for each
contact (such as SMS, phone, or email), to ensure
reachability during an incident.

- Define a response plan.

Identify the most appropriate contacts to engage during an
incident. Define escalation plans aligned to the roles of
personnel to be engaged, rather than individual contacts.
Consider including contacts that may be responsible for
informing external entities, even if they are not directly
engaged to resolve the incident.

## Resources

**Related best practices:**

- [OPS02-BP03
Operations activities have identified owners responsible for
their performance](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_ops_model_def_activity_owners.html)

**Related documents:**

- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html)

**Related examples:**

- [AWS customer playbook framework](https://github.com/aws-samples/aws-customer-playbook-framework)
- [Prepare for
and respond to security incidents in your AWS
environment](https://youtu.be/8uiO0Z5meCs)

**Related tools:**

- [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/what-is-incident-manager.html)

**Related videos:**

- [Amazon's
approach to security during development](https:/www.youtube.com/watch?v=NeR7FhHqDGQ)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_identify_personnel.html*

---

# SEC10-BP02 Develop incident management plans

The first document to develop for incident response is the incident response plan. The incident response plan is designed to be the foundation for your incident response program and strategy.

**Benefits of establishing this best practice:**
Developing thorough and clearly defined incident response processes is key to a successful and scalable incident response program. When a security event occurs, clear steps and workflows can help you to respond in a timely manner. You might already have existing incident response processes. Regardless of your current state, it’s important to update, iterate, and test your incident response processes regularly.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

An incident management plan is critical to respond, mitigate, and recover from the potential impact of security incidents. An incident management plan is a structured process for identifying, remediating, and responding in a timely matter to security incidents.

The cloud has many of the same operational roles and requirements
found in an on-premises environment. When you create an incident
management plan, it is important to factor response and recovery
strategies that best align with your business outcome and
compliance requirements. For example, if you operate workloads in
AWS that are FedRAMP compliant in the United States, follow the
recommendations in
[NIST
SP 800-61 Computer Security Handling Guide](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r2.pdf). Similarly, when
you operate workloads that store personally identifiable
information (PII), consider how to protect and respond to issues
related to data residency and use.

When building an incident management plan for your workloads in AWS, start
with the [AWS Shared Responsibility
Model](https://aws.amazon.com/compliance/shared-responsibility-model/) for building a defense-in-depth approach towards incident response. In this
model, AWS manages security of the cloud, and you are responsible for security in the cloud.
This means that you retain control and are responsible for the security controls you choose to
implement. The [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/welcome.html) details key concepts and foundational
guidance for building a cloud-centric incident management plan.

An effective incident management plan must be continually iterated upon, remaining current
with your cloud operations goal. Consider using the implementation plans detailed below as
you create and evolve your incident management plan.

### Implementation steps

- Define roles and responsibilities within your organization
for handling security events. This should involve
representatives from various departments, including:

Human resources (HR)
- Executive team
- Legal department
- Application owners and developers (subject matter
experts, or SMEs)

- Clearly outline who is responsible, accountable, consulted,
and informed (RACI) during an incident. Create a RACI chart
to facilitate quick and direct communication, and clearly
outline the leadership across different stages of an event.
- Involve application owners and developers (SMEs) during an
incident, as they can provide valuable information and
context to aid in measuring the impact. Build relationships
with these SMEs, and practice incident response scenarios
with them before an actual incident occurs.
- Involve trusted partners or external experts in the
investigation or response process, as they can provide
additional expertise and perspective.
- Align your incident management plans and roles with any
local regulations or compliance requirements that govern
your organization.
- Practice and test your incident response plans regularly,
and involve all the defined roles and responsibilities. This
helps streamline the process and verify you have a
coordinated and efficient response to security incidents.
- Review and update the roles, responsibilities, and RACI
chart periodically, or as your organizational structure or
requirements change.

**Understand AWS response teams and support**

- **AWS Support**

[Support](https://aws.amazon.com/premiumsupport/) offers a range of plans that provide access to tools and expertise that support the success and operational health of your AWS solutions. If you need technical support and more resources to help plan, deploy, and optimize your AWS environment, you can select a support plan that best aligns with your AWS use case.
- Consider the [Support Center](https://console.aws.amazon.com/support) in AWS Management Console (sign-in required) as the central point of contact to get support for issues that affect your AWS resources. Access to Support is controlled by AWS Identity and Access Management. For more information about getting access to Support features, see [Getting started with Support](https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#accessing-support).

- **AWS Customer Incident Response Team (CIRT)**

The AWS Customer Incident Response Team (CIRT) is a specialized 24/7 global AWS team that provides support to customers during active security events on the customer side of the [AWS Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/).
- When the AWS CIRT supports you, they provide assistance with triage and recovery for an active security event on AWS. They can assist in root cause analysis through the use of AWS service logs and provide you with recommendations for recovery. They can also provide security recommendations and best practices to help you avoid security events in the future.
- AWS customers can engage the AWS CIRT through an [Support case](https://docs.aws.amazon.com/awssupport/latest/user/case-management.html).

- [AWS Security Incident Response](https://aws.amazon.com/security-incident-response/)

Announced at re:Invent 2024, AWS Security Incident Response is a managed security incident response service that uses both modern triage technology and a human in the loop. The service ingests all GuardDuty findings and any third-party findings sent to AWS Security Hub CSPM for triage to alert the customer only on findings that require an investigation. The service also provides a portal to submit reactive cases in the event of a security event the customer notices and receive support from AWS' advanced incident response team.

- **DDoS response support**

AWS offers [AWS Shield](https://aws.amazon.com/shield/), which provides a managed distributed denial of service (DDoS) protection service that safeguards web applications running on AWS. Shield provides always-on detection and automatic inline mitigations that can minimize application downtime and latency, so there is no need to engage Support to benefit from DDoS protection. There are two tiers of Shield: AWS Shield Standard and AWS Shield Advanced. To learn about the differences between these two tiers, see [Shield features documentation](https://aws.amazon.com/shield/features/).

- **AWS Managed Services (AMS)**

[AWS Managed Services (AMS)](https://aws.amazon.com/managed-services/) provides ongoing management of your AWS infrastructure so you can focus on your applications. By implementing best practices to maintain your infrastructure, AMS helps reduce your operational overhead and risk. AMS automates common activities such as change requests, monitoring, patch management, security, and backup services, and provides full-lifecycle services to provision, run, and support your infrastructure.
- AMS takes responsibility for deploying a suite of security detective controls and provides a 24/7 first line of response to alerts. When an alert is initiated, AMS follows a standard set of automated and manual playbooks to verify a consistent response. These playbooks are shared with AMS customers during onboarding so that they can develop and coordinate a response with AMS.

**Develop the incident response plan**

The incident response plan is designed to be the foundation for your incident response program and strategy. The incident response plan should be in a formal document. An incident response plan typically includes these sections:

- **An incident response team overview:** Outlines the goals and functions of the incident response team.
- **Roles and responsibilities:** Lists the incident response stakeholders and details their roles when an incident occurs.
- **A communication plan:** Details contact information and how you communicate during an incident.
- **Backup communication methods:** It’s a best practice to have out-of-band communication as a backup for incident communication. An example of an application that provides a secure out-of-band communications channel is AWS Wickr.
- **Phases of incident response and actions to take:** Enumerates the phases of incident response (for example, detect, analyze, eradicate, contain, and recover), including high-level actions to take within those phases.
- **Incident severity and prioritization definitions:** Details how to classify the severity of an incident, how to prioritize the incident, and then how the severity definitions affect escalation procedures.

While these sections are common throughout companies of different sizes and industries, each organization’s incident response plan is unique. You need to build an incident response plan that works best for your organization.

## Resources

**Related best practices:**

- [SEC04 Detection](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/detection.html)

**Related documents:**

- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/welcome.html)
- [NIST:
Computer Security Incident Handling Guide](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_develop_management_plans.html*

---

# SEC10-BP03 Prepare forensic capabilities

Ahead of a security incident, consider developing forensics capabilities to support security event investigations.

**Level of risk exposed if this best practice
is not established:** Medium

Concepts from traditional on-premises forensics apply to AWS. For key information to start building forensics capabilities in the AWS Cloud, see [Forensic investigation environment strategies in the AWS Cloud](https://aws.amazon.com/blogs/security/forensic-investigation-environment-strategies-in-the-aws-cloud/).

Once you have your environment and AWS account structure set up for forensics, define the technologies required to effectively perform forensically sound methodologies across the four phases:

- **Collection:** Collect relevant AWS logs, such as AWS CloudTrail, AWS Config, VPC Flow Logs, and host-level logs. Collect snapshots, backups, and memory dumps of impacted AWS resources where available.
- **Examination:** Examine the data collected by extracting and assessing the relevant information.
- **Analysis:** Analyze the data collected in order to understand the incident and draw conclusions from it.
- **Reporting:** Present the information resulting from the analysis phase.

## Implementation steps

**Prepare your forensics environment**

[AWS Organizations](https://aws.amazon.com/organizations/) helps you centrally manage and govern an AWS environment as you grow and scale AWS resources. An AWS organization consolidates your AWS accounts so that you can administer them as a single unit. You can use organizational units (OUs) to group accounts together to administer as a single unit.

For incident response, it’s helpful to have an AWS account structure that supports the functions of incident response, which includes a *security OU* and a *forensics OU*. Within the security OU, you should have accounts for:

- **Log archival:** Aggregate logs in a log archival AWS account with limited permissions.
- **Security tools:** Centralize security services in a security tool AWS account. This account operates as the delegated administrator for security services.

Within the forensics OU, you have the option to implement a single forensics account or accounts for each Region that you operate in, depending on which works best for your business and operational model. If you create a forensics account per Region, you can block the creation of AWS resources outside of that Region and reduce the risk of resources being copied to an unintended region. For example, if you only operate in US East (N. Virginia) Region (`us-east-1`) and US West (Oregon) (`us-west-2`), then you would have two accounts in the forensics OU: one for `us-east-1` and one for `us-west-2`.

You can create a forensics AWS account for multiple Regions. You should exercise caution in copying AWS resources to that account to verify you’re aligning with your data sovereignty requirements. Because it takes time to provision new accounts, it is imperative to create and instrument the forensics accounts well ahead of an incident so that responders can be prepared to effectively use them for response.

The following diagram displays a sample account structure including a forensics OU with per-Region forensics accounts:

*Per-Region account structure for incident response*

**Capture backups and snapshots**

Setting up backups of key systems and databases are critical for recovering from a security incident and for forensics purposes. With backups in place, you can restore your systems to their previous safe state. On AWS, you can take snapshots of various resources. Snapshots provide you with point-in-time backups of those resources. There are many AWS services that can support you in backup and recovery. For detail on these services and approaches for backup and recovery, see [Backup and Recovery Prescriptive Guidance](https://docs.aws.amazon.com/prescriptive-guidance/latest/backup-recovery/services.html) and [Use backups to recover from security incidents](https://aws.amazon.com/blogs/security/use-backups-to-recover-from-security-incidents/).

Especially when it comes to situations such as ransomware, it’s critical for your backups to be well protected. For guidance on securing your backups, see [Top 10 security best practices for securing backups in AWS](https://aws.amazon.com/blogs/security/top-10-security-best-practices-for-securing-backups-in-aws/). In addition to securing your backups, you should regularly test your backup and restore processes to verify that the technology and processes you have in place work as expected.

**Automate forensics**

During a security event, your incident response team must be able to collect and analyze evidence quickly while maintaining accuracy for the time period surrounding the event (such as capturing logs related to a specific event or resource or collecting memory dump of an Amazon EC2 instance). It’s both challenging and time consuming for the incident response team to manually collect the relevant evidence, especially across a large number of instances and accounts. Additionally, manual collection can be prone to human error. For these reasons, you should develop and implement automation for forensics as much as possible.

AWS offers a number of automation resources for forensics, which are listed in the following Resources section. These resources are examples of forensics patterns that we have developed and customers have implemented. While they might be a useful reference architecture to start with, consider modifying them or creating new forensics automation patterns based on your environment, requirements, tools, and forensics processes.

## Resources

**Related documents:**

- [AWS Security Incident Response Guide - Develop Forensics Capabilities](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/develop-forensics-capabilities.html)
- [AWS Security Incident Response Guide - Forensics Resources](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/appendix-b-incident-response-resources.html#forensic-resources)
- [Forensic investigation environment strategies in the AWS Cloud](https://aws.amazon.com/blogs/security/forensic-investigation-environment-strategies-in-the-aws-cloud/)
- [How to automate forensic disk collection in AWS](https://aws.amazon.com/blogs/security/how-to-automate-forensic-disk-collection-in-aws/)
- [AWS Prescriptive Guidance - Automate incident response and forensics](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/automate-incident-response-and-forensics.html)

**Related videos:**

- [Automating Incident Response and Forensics](https://www.youtube.com/watch?v=f_EcwmmXkXk)

**Related examples:**

- [Automated Incident Response and Forensics Framework](https://github.com/awslabs/aws-automated-incident-response-and-forensics)
- [Automated Forensics Orchestrator for Amazon EC2](https://docs.aws.amazon.com/solutions/latest/automated-forensics-orchestrator-for-amazon-ec2/welcome.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_prepare_forensic.html*

---

# SEC10-BP04 Develop and test security incident response playbooks

A key part of preparing your incident response processes is
developing playbooks. Incident response playbooks provide
prescriptive guidance and steps to follow when a security event
occurs. Having clear structure and steps simplifies the response and
reduces the likelihood for human error.

**Level of risk exposed if this best practice is not established:** Medium

## Implementation guidance

Playbooks should be created for incident scenarios such as:

- **Expected incidents**:
Playbooks should be created for incidents you anticipate. This
includes threats like denial of service (DoS), ransomware, and
credential compromise.
- **Known security findings or
alerts**: Playbooks should be created to address your
known security findings and alerts, such as those from Amazon GuardDuty. When you receive a GuardDuty finding, the playbook
should provide clear steps to prevent mishandling or ignoring
the alert. For more remediation details and guidance, see
[Remediating
security issues discovered by GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_remediate.html).

Playbooks should contain technical steps for a security analyst to
complete in order to adequately investigate and respond to a
potential security incident.

AWS' Customer Incident Response Team (CIRT) has published a [GitHub repository containing incident response playbooks](https://github.com/aws-samples/aws-customer-playbook-framework/tree/main/docs), organized by threat scenario, type, and resource. These playbooks can be adapted to align with your existing incident response procedures or serve as a foundation for developing new ones.

### Implementation steps

Items to include in a playbook include:

- **Playbook overview**: What
risk or incident scenario does this playbook address? What
is the goal of the playbook?
- **Prerequisites**: What logs,
detection mechanisms, and automated tools are required for
this incident scenario? What is the expected notification?
- **Communication and escalation
information**: Who is involved and what is their
contact information? What are each of the stakeholders’
responsibilities?
- **Response steps**: Across
phases of incident response, what tactical steps should be
taken? What queries should an analyst run? What code should
be run to achieve the desired outcome?

**Detect**: How will the
incident be detected?
- **Analyze**: How will the
scope of impact be determined?
- **Contain**: How will the
incident be isolated to limit scope?
- **Eradicate**: How will
the threat be removed from the environment?
- **Recover**: How will the
affected system or resource be brought back into
production?

- **Expected outcomes**: After
queries and code are run, what is the expected result of the
playbook?

## Resources

**Related Well-Architected best
practices:**

- [SEC10-BP02 - Develop incident management plans](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_incident_response_develop_management_plans.html)

**Related documents:**

- [Framework
for Incident Response Playbooks](https://github.com/aws-samples/aws-customer-playbook-framework)
- [Develop
your own Incident Response Playbooks](https://github.com/aws-samples/aws-incident-response-playbooks-workshop)
- [Incident
Response Playbook Samples](https://github.com/aws-samples/aws-incident-response-playbooks)
- [Building
an AWS incident response runbook using Jupyter playbooks and
CloudTrail Lake](https://catalog.workshops.aws/incident-response-jupyter/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_playbooks.html*

---

# SEC10-BP05 Pre-provision access

Verify that incident responders have the correct access pre-provisioned in AWS to reduce
the time needed for investigation through to recovery.

**Common anti-patterns:**

- Using the root account for incident response.
- Altering existing accounts.
- Manipulating IAM permissions directly when providing just-in-time privilege elevation.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

AWS recommends reducing or eliminating reliance on long-lived credentials wherever
possible, in favor of temporary credentials and *just-in-time* privilege escalation
mechanisms. Long-lived credentials are prone to security risk and increase operational
overhead. For most management tasks, as well as incident response tasks, we recommend you implement [identity federation](https://aws.amazon.com/identity/federation/)
alongside [temporary
escalation for administrative access](https://aws.amazon.com/blogs/security/managing-temporary-elevated-access-to-your-aws-environment/). In this model, a user requests elevation to a
higher level of privilege (such as an incident response role) and, provided the user
is eligible for elevation, a request is sent to an approver. If the request is approved,
the user receives a set of temporary [AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) which can be used to complete their
tasks. After these credentials expire, the user must submit a new elevation request.

We recommend the use of temporary privilege escalation in the majority of incident response scenarios. The correct way to do this is to use the
[AWS Security Token Service](https://docs.aws.amazon.com/STS/latest/APIReference/welcome.html) and [session policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
to scope access.

There are scenarios where federated identities are unavailable, such as:

- Outage related to a compromised identity provider (IdP).
- Misconfiguration or human error causing broken federated access management system.
- Malicious activity such as a distributed denial of service (DDoS) event or rendering unavailability of the system.

In the preceding cases, there should be emergency *break glass* access configured to allow
investigation and timely remediation of incidents. We recommend that you use a [user,
group, or role with appropriate permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#lock-away-credentials) to perform tasks and access AWS resources. Use the root user only for
[tasks that require root user credentials](https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html).
To verify that incident responders have the correct level of access to AWS and other relevant systems, we recommend the pre-provisioning
of dedicated accounts. The accounts require privileged access, and must be
tightly controlled and monitored. The accounts must be built with the fewest privileges
required to perform the necessary tasks, and the level of access should be based on the
playbooks created as part of the incident management plan.

Use purpose-built and dedicated users and roles as a best practice. Temporarily escalating
user or role access through the addition of IAM policies both makes it unclear what access
users had during the incident, and risks the escalated privileges not being revoked.

It is important to remove as many dependencies as possible to verify that access can be
gained under the widest possible number of failure scenarios. To support this, create a
playbook to verify that incident response users are created as
users in a dedicated security account, and not managed through any existing Federation or
single sign-on (SSO) solution. Each individual responder must have their own named account.
The account configuration must enforce [strong password policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html) and multi-factor authentication (MFA).
If the incident response playbooks only require access to the AWS Management Console, the user should not
have access keys configured and should be explicitly disallowed from creating access keys.
This can be configured with IAM policies or service control policies (SCPs) as mentioned in
the AWS Security Best Practices for [AWS Organizations SCPs](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html). The users should have no privileges
other than the ability to assume incident response roles in other accounts.

During an incident it might be necessary to grant access to other internal or external individuals
to support investigation, remediation, or recovery activities. In this case, use the playbook
mechanism mentioned previously, and there must be a process to verify that any additional access is
revoked immediately after the incident is complete.

To verify that the use of incident response roles can be properly monitored and audited,
it is essential that the IAM accounts created for this purpose are not shared between
individuals, and that the AWS account root user is not used unless [required for a specific
task](https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html). If the root user is required (for example, IAM access to a specific account is unavailable),
use a separate process with a playbook available to verify availability of the root user sign-in credentials and
MFA token.

To configure the IAM policies for the incident response roles, consider using [IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html)
to generate policies based on AWS CloudTrail logs. To do this, grant administrator access to the
incident response role on a non-production account and run through your playbooks. Once
complete, a policy can be created that allows only the actions taken. This policy can then be
applied to all the incident response roles across all accounts. You might wish to create a separate
IAM policy for each playbook to allow easier management and auditing. Example playbooks could
include response plans for ransomware, data breaches, loss of production access, and other
scenarios.

Use the incident response accounts to assume dedicated incident response [IAM roles in
other AWS accounts](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_aws-accounts.html). These roles must be configured to only be assumable by users in the
security account, and the trust relationship must require that the calling principal has
authenticated using MFA. The roles must use tightly-scoped IAM policies to control access.
Ensure that all `AssumeRole` requests for these roles are logged in CloudTrail and alerted
on, and that any actions taken using these roles are logged.

It is strongly recommended that both the IAM accounts and the IAM roles are
clearly named to allow them to be easily found in CloudTrail logs. An example of this would be to
name the IAM accounts ``-BREAK-GLASS and
the IAM roles `BREAK-GLASS-ROLE`.

[CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html) is used to log API activity in your AWS accounts and should be used to [configure
alerts on usage of the incident response roles](https://aws.amazon.com/blogs/security/how-to-receive-notifications-when-your-aws-accounts-root-access-keys-are-used/). Refer to the blog post on configuring alerts
when root keys are used. The instructions can be modified to configure the [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) metric
filter-to-filter on `AssumeRole` events related to the incident response IAM role:

```
`{ $.eventName = "AssumeRole" && $.requestParameters.roleArn = "`" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != "AwsServiceEvent" }
```

As the incident response roles are likely to have a high level of access, it is important
that these alerts go to a wide group and are acted upon promptly.

During an incident, it is possible that a responder might require access to systems which are
not directly secured by IAM. These could include Amazon Elastic Compute Cloud instances, Amazon Relational Database Service databases, or
software-as-a-service (SaaS) platforms. It is strongly recommended that rather than using
native protocols such as SSH or RDP, [AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html) is used for all
administrative access to Amazon EC2 instances. This access can be controlled using IAM, which is
secure and audited. It might also be possible to automate parts of your playbooks using
[AWS Systems Manager Run Command documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/execute-remote-commands.html), which can reduce user error and improve
time to recovery. For access to databases and third-party tools, we recommend storing
access credentials in AWS Secrets Manager and granting access to the incident responder
roles.

Finally, the management of the incident response IAM accounts should be added to your
[Joiners, Movers, and Leavers processes](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/permissions-management.html) and reviewed and tested periodically to verify that
only the intended access is allowed.

## Resources

**Related documents:**

- [Managing temporary elevated access to your AWS environment](https://aws.amazon.com/blogs/security/managing-temporary-elevated-access-to-your-aws-environment/)
- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/welcome.html)
- [AWS Elastic Disaster Recovery](https://aws.amazon.com/disaster-recovery/)
- [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/what-is-incident-manager.html)
- [Setting an account password policy for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html)
- [Using multi-factor authentication (MFA) in AWS](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa.html)
- [Configuring Cross-Account Access with MFA](https://aws.amazon.com/blogs/security/how-do-i-protect-cross-account-access-using-mfa-2/)
- [Using IAM Access Analyzer to generate IAM policies](https://aws.amazon.com/blogs/security/use-iam-access-analyzer-to-generate-iam-policies-based-on-access-activity-found-in-your-organization-trail/)
- [Best Practices for AWS Organizations Service Control Policies in a Multi-Account Environment](https://aws.amazon.com/blogs/industries/best-practices-for-aws-organizations-service-control-policies-in-a-multi-account-environment/)
- [How to Receive Notifications When Your AWS Account’s Root Access Keys Are Used](https://aws.amazon.com/blogs/security/how-to-receive-notifications-when-your-aws-accounts-root-access-keys-are-used/)
- [Create fine-grained session permissions using IAM managed policies](https://aws.amazon.com/blogs/security/create-fine-grained-session-permissions-using-iam-managed-policies/)
- [Break
glass access](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/break-glass-access.html)

**Related videos:**

- [Automating Incident Response and Forensics in AWS](https://www.youtube.com/watch?v=f_EcwmmXkXk)
- [DIY guide to runbooks, incident reports, and
incident response](https://youtu.be/E1NaYN_fJUo)
- [Prepare for and respond to security incidents in your AWS environment](https://www.youtube.com/watch?v=8uiO0Z5meCs)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_pre_provision_access.html*

---

# SEC10-BP06 Pre-deploy tools

Verify that security personnel have the right tools pre-deployed to reduce the time for investigation through to recovery.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To automate security response and operations functions, you can use a comprehensive set of APIs and tools from AWS. You can fully automate identity management, network security, data protection, and monitoring capabilities and deliver them using popular software development methods that you already have in place. When you build security automation, your system can monitor, review, and initiate a response, rather than having people monitor your security position and manually react to events.

If your incident response teams continue to respond to alerts in the same way, they risk alert fatigue. Over time, the team can become desensitized to alerts and can either make mistakes handling ordinary situations or miss unusual alerts. Automation helps avoid alert fatigue by using functions that process the repetitive and ordinary alerts, leaving humans to handle the sensitive and unique incidents. Integrating anomaly detection systems, such as Amazon GuardDuty, AWS CloudTrail Insights, and Amazon CloudWatch Anomaly Detection, can reduce the burden of common threshold-based alerts.

You can improve manual processes by programmatically automating steps in the process. After you define the remediation pattern to an event, you can decompose that pattern into actionable logic, and write the code to perform that logic. Responders can then run that code to remediate the issue. Over time, you can automate more and more steps, and ultimately automatically handle whole classes of common incidents.

During a security investigation, you need to be able to review relevant logs to record and understand the full scope and timeline of the incident. Logs are also required for alert generation, indicating certain actions of interest have happened. It is critical to select, enable, store, and set up querying and retrieval mechanisms, and set up alerting. Additionally, an effective way to provide tools to search log data is [Amazon Detective](https://aws.amazon.com/detective/).

AWS oﬀers over 200 cloud services and thousands of features. We recommend that you review the services that can support and simplify your incident response strategy.

In addition to logging, you should develop and implement a [tagging strategy](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html). Tagging can help provide context around the purpose of an AWS resource. Tagging can also be used for automation.

### Implementation steps

**Select and set up logs for analysis and alerting**

See the following documentation on configuring logging for incident response:

- [Logging strategies for security incident response](https://aws.amazon.com/blogs/security/logging-strategies-for-security-incident-response/)
- [SEC04-BP01 Configure service and application logging](./sec_detect_investigate_events_app_service_logging.html)

**Enable security services to support detection and response**

AWS provides detective, preventative, and responsive capabilities, and other services can be used to architect custom security solutions. For a list of the most relevant services for security incident response, see [Cloud capability definitions](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/appendix-a-cloud-capability-definitions.html) and the [Security Incident Response home page](https://aws.amazon.com/security-incident-response/).

**Develop and implement a tagging strategy**

Obtaining contextual information on the business use case and relevant internal stakeholders surrounding an AWS resource can be difficult. One way to do this is in the form of tags, which assign metadata to your AWS resources and consist of a user-defined key and value. You can create tags to categorize resources by purpose, owner, environment, type of data processed, and other criteria of your choice.

Having a consistent tagging strategy can speed up response times and minimize time spent on organizational context by allowing you to quickly identify and discern contextual information about an AWS resource. Tags can also serve as a mechanism to initiate response automations. For more detail on what to tag, see [Tagging your AWS resources](https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html). You’ll want to first define the tags you want to implement across your organization. After that, you’ll implement and enforce this tagging strategy. For more detail on implementation and enforcement, see [Implement AWS resource tagging strategy using AWS Tag Policies and Service Control Policies (SCPs)](https://aws.amazon.com/blogs/mt/implement-aws-resource-tagging-strategy-using-aws-tag-policies-and-service-control-policies-scps/).

## Resources

**Related Well-Architected best practices:**

- [SEC04-BP01 Configure service and application logging](./sec_detect_investigate_events_app_service_logging.html)
- [SEC04-BP02 Capture logs, findings, and metrics in standardized locations](./sec_detect_investigate_events_logs.html)

**Related documents:**

- [Logging strategies for security incident response](https://aws.amazon.com/blogs/security/logging-strategies-for-security-incident-response/)
- [Incident response cloud capability definitions](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/appendix-a-cloud-capability-definitions.html)

**Related examples:**

- [Threat Detection and Response with Amazon GuardDuty and Amazon Detective](https://catalog.workshops.aws/guardduty/en-US)
- [Security Hub Workshop](https://catalog.workshops.aws/security)
- [Vulnerability Management with Amazon Inspector](https://catalog.workshops.aws/inspector/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_pre_deploy_tools.html*

---

# SEC10-BP07 Run simulations

As organizations grow and evolve over time, so does the threat landscape, making it important to continually review your incident response capabilities. Running simulations (also known as game days) is one method that can be used to perform this assessment. Simulations use real-world security event scenarios designed to mimic a threat actor’s tactics, techniques, and procedures (TTPs) and allow an organization to exercise and evaluate their incident response capabilities by responding to these mock cyber events as they might occur in reality.

**Benefits of establishing this best practice:** Simulations have a variety of benefits:

- Validating cyber readiness and developing the confidence of your incident responders.
- Testing the accuracy and efficiency of tools and workflows.
- Refining communication and escalation methods aligned with your incident response plan.
- Providing an opportunity to respond to less common vectors.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

There are three main types of simulations:

- **Tabletop exercises:** The tabletop approach to simulations is a discussion-based session involving the various incident response stakeholders to practice roles and responsibilities and use established communication tools and playbooks. Exercise facilitation can typically be accomplished in a full day in a virtual venue, physical venue, or a combination. Because it is discussion-based, the tabletop exercise focuses on processes, people, and collaboration. Technology is an integral part of the discussion, but the actual use of incident response tools or scripts is generally not a part of the tabletop exercise.
- **Purple team exercises:** Purple team exercises increase the level of collaboration between the incident responders (blue team) and simulated threat actors (red team). The blue team is comprised of members of the security operations center (SOC), but can also include other stakeholders that would be involved during an actual cyber event. The red team is comprised of a penetration testing team or key stakeholders that are trained in offensive security. The red team works collaboratively with the exercise facilitators when designing a scenario so that the scenario is accurate and feasible. During purple team exercises, the primary focus is on the detection mechanisms, the tools, and the standard operating procedures (SOPs) supporting the incident response efforts.
- **Red team exercises:** During a red team exercise, the offense (red team) conducts a simulation to achieve a certain objective or set of objectives from a predetermined scope. The defenders (blue team) will not necessarily have knowledge of the scope and duration of the exercise, which provides a more realistic assessment of how they would respond to an actual incident. Because red team exercises can be invasive tests, be cautious and implement controls to verify that the exercise does not cause actual harm to your environment.

Consider facilitating cyber simulations at a regular interval. Each exercise type can provide unique benefits to the participants and the organization as a whole, so you might choose to start with less complex simulation types (such as tabletop exercises) and progress to more complex simulation types (red team exercises). You should select a simulation type based on your security maturity, resources, and your desired outcomes. Some customers might not choose to perform red team exercises due to complexity and cost.

## Implementation steps

Regardless of the type of simulation you choose, simulations generally follow these implementation steps:

- **Define core exercise elements:** Define the simulation scenario and the objectives of the simulation. Both of these should have leadership acceptance.
- **Identify key stakeholders:** At a minimum, an exercise needs exercise facilitators and participants. Depending on the scenario, additional stakeholders such as legal, communications, or executive leadership might be involved.
- **Build and test the scenario:** The scenario might need to be redefined as it is being built if specific elements aren’t feasible. A finalized scenario is expected as the output of this stage.
- **Facilitate the simulation:** The type of simulation determines the facilitation used (a paper-based scenario compared to a highly technical, simulated scenario). The facilitators should align their facilitation tactics to the exercise objects and they should engage all exercise participants wherever possible to provide the most benefit.
- **Develop the after-action report (AAR):** Identify areas that went well, those that can use improvement, and potential gaps. The AAR should measure the effectiveness of the simulation as well as the team’s response to the simulated event so that progress can be tracked over time with future simulations.

## Resources

**Related documents:**

- [AWS Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/welcome.html)

**Related videos:**

- [AWS GameDay - Security Edition](https://www.youtube.com/watch?v=XnfDWID_OQs)
- [Running
effective security incident response simulations](https://www.youtube.com/watch?v=63EdzHT25_A)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_run_game_days.html*

---

# SEC10-BP08 Establish a framework for learning from incidents

Implementing a *lessons learned* framework and
root cause analysis capability can not only help improve incident
response capabilities, but also help prevent the incident from
recurring. By learning from each incident, you can help avoid
repeating the same mistakes, exposures, or misconfigurations, not
only improving your security posture, but also minimizing time lost
to preventable situations.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

It's important to implement a *lessons learned*
framework that establishes and achieves, at a
high level, the following points:

- When is a lessons learned held?
- What is involved in the lessons learned process?
- How is a lessons learned performed?
- Who is involved in the process and how?
- How will areas of improvement be identified?
- How will you ensure improvements are effectively tracked and
implemented?

The framework should not focus on or blame individuals, but
instead should focus on improving tools and processes.

### Implementation steps

Aside from the preceding high-level outcomes listed, it’s important
to make sure that you ask the right questions to derive the most
value (information that leads to actionable improvements) from
the process. Consider these questions to help get you started in
fostering your lessons learned discussions:

- What was the incident?
- When was the incident first identified?
- How was it identified?
- What systems alerted on the activity?
- What systems, services, and data were involved?
- What specifically occurred?
- What worked well?
- What didn't work well?
- Which process or procedures failed or failed to scale to
respond to the incident?
- What can be improved within the following areas:

**People**

Were the people who were needed to be contacted
actually available and was the contact list up to
date?
- Were people missing training or capabilities needed
to effectively respond and investigate the incident?
- Were the appropriate resources ready and available?

- **Process**

Were processes and procedures followed?
- Were processes and procedures documented and
available for this (type of) incident?
- Were required processes and procedures missing?
- Were the responders able to gain timely access to
the required information to respond to the issue?

- **Technology**

Did existing alerting systems effectively identify
and alert on the activity?
- How could we have reduced time-to-detection by 50%?
- Do existing alerts need improvement or new alerts
need to be built for this (type of) incident?
- Did existing tools allow for effective
investigation (search/analysis) of the incident?
- What can be done to help identify this (type of)
incident sooner?
- What can be done to help prevent this (type of)
incident from occurring again?
- Who owns the improvement plan and how will you test
that it has been implemented?
- What is the timeline for the additional
monitoring or preventative controls and processes to be
implemented and tested?

This list isn’t all-inclusive, but is intended to serve as a
starting point for identifying what the organization and
business needs are and how you can analyze them in order to most
effectively learn from incidents and continuously improve your
security posture. Most important is getting started by
incorporating lessons learned as a standard part of your
incident response process, documentation, and expectations
across the stakeholders.

## Resources

**Related documents:**

- [AWS Security Incident Response Guide - Establish a framework for
learning from incidents](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/establish-framework-for-learning.html)
- [NCSC
CAF guidance - Lessons learned](https://www.ncsc.gov.uk/collection/caf/caf-principles-and-guidance/d-2-lessons-learned)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_establish_incident_framework.html*

---
