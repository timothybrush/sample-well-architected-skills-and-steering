# SEC 1 — How do you securely operate your workload?

**Pillar**: Security  
**Best Practices**: 8

---

# SEC01-BP01 Separate workloads using accounts

Establish common guardrails and isolation between environments
(such as production, development, and test) and workloads through
a multi-account strategy. Account-level separation is strongly
recommended, as it provides a strong isolation boundary for
security, billing, and access.

**Desired outcome:** An account structure that isolates cloud
operations, unrelated workloads, and environments into separate accounts, increasing security
across the cloud infrastructure.

**Common anti-patterns:**

- Placing multiple unrelated workloads with different data sensitivity levels into the
same account.
- Poorly defined organizational unit (OU) structure.

**Benefits of establishing this best practice:**

- Decreased scope of impact if a workload is inadvertently accessed.
- Central governance of access to AWS services, resources, and Regions.
- Maintain security of the cloud infrastructure with policies and centralized
administration of security services.
- Automated account creation and maintenance process.
- Centralized auditing of your infrastructure for compliance and regulatory
requirements.

**Level of risk exposed if this best practice is not established**:
High

## Implementation guidance

AWS accounts provide a security isolation boundary between
workloads or resources that operate at different sensitivity
levels. AWS provides tools to manage your cloud workloads at
scale through a multi-account strategy to leverage this
isolation boundary. For guidance on the concepts, patterns,
and implementation of a multi-account strategy on AWS, see
[Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html).

When you have multiple AWS accounts under central management,
your accounts should be organized into a hierarchy defined by
layers of organizational units (OUs). Security controls can
then be organized and applied to the OUs and member accounts,
establishing consistent preventative controls on member
accounts in the organization. The security controls are
inherited, allowing you to filter permissions available to
member accounts located at lower levels of an OU hierarchy. A
good design takes advantage of this inheritance to reduce the
number and complexity of security policies required to achieve
the desired security controls for each member account.

[AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html) and
[AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html) are two services that you can use to
implement and manage this multi-account structure in your AWS
environment. AWS Organizations allows you to organize accounts
into a hierarchy defined by one or more layers of OUs, with
each OU containing a number of member accounts.
[Service
control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) (SCPs) allow the organization
administrator to establish granular preventative controls on
member accounts, and
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/config-rule-multi-account-deployment.html) can be used to establish proactive and detective
controls on member accounts. Many AWS services
[integrate
with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html) to provide delegated
administrative controls and performing service-specific tasks
across all member accounts in the organization.

Layered on top of AWS Organizations,
[AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html) provides a one-click best practices setup
for a multi-account AWS environment with a
[landing
zone](https://docs.aws.amazon.com/controltower/latest/userguide/aws-multi-account-landing-zone.html). The landing zone is the entry point to the
multi-account environment established by Control Tower.
Control Tower provides several
[benefits](https://aws.amazon.com/blogs/architecture/fast-and-secure-account-governance-with-customizations-for-aws-control-tower/)
over AWS Organizations. Three benefits that provide improved
account governance are:

- Integrated mandatory security controls that are automatically applied to accounts
admitted into the organization.
- Optional controls that can be turned on or off for a given set of OUs.
- [AWS Control Tower Account Factory](https://docs.aws.amazon.com/controltower/latest/userguide/account-factory.html) provides automated
deployment of accounts containing pre-approved baselines and
configuration options inside your organization.

**Implementation steps**

- **Design an organizational unit
structure:** A properly designed organizational
unit structure reduces the management burden required to
create and maintain service control policies and other
security controls. Your organizational unit structure should
be
[aligned
with your business needs, data sensitivity, and workload
structure](https://aws.amazon.com/blogs/mt/best-practices-for-organizational-units-with-aws-organizations/).
- **Create a landing zone for your
multi-account environment:** A landing zone
provides a consistent security and infrastructure foundation
from which your organization can quickly develop, launch,
and deploy workloads. You can use a
[custom-built
landing zone or AWS Control Tower](https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-aws-environment/building-landing-zones.html) to orchestrate your
environment.
- **Establish guardrails:**
Implement consistent security guardrails for your
environment through your landing zone. AWS Control Tower
provides a list of
[mandatory](https://docs.aws.amazon.com/controltower/latest/userguide/mandatory-controls.html)
and
[optional](https://docs.aws.amazon.com/controltower/latest/userguide/optional-controls.html)
controls that can be deployed. Mandatory controls are
automatically deployed when implementing Control Tower.
Review the list of highly recommended and optional controls,
and implement controls that are appropriate to your needs.
- **Restrict access to newly added
Regions**: For new AWS Regions, IAM resources such
as users and roles are only propagated to the Regions that
you specify. This action can be performed through the
[console
when using Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/region-deny.html), or by adjusting
[IAM
permission policies in AWS Organizations](https://aws.amazon.com/blogs/security/setting-permissions-to-enable-accounts-for-upcoming-aws-regions/).
- **Consider AWS
[CloudFormation
StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/what-is-cfnstacksets.html)**: StackSets help you deploy
resources including IAM policies, roles, and groups into
different AWS accounts and Regions from an approved
template.

## Resources

**Related best practices:**

- [SEC02-BP04 Rely on a centralized identity provider](./sec_identities_identity_provider.html)

**Related documents:**

- [AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [AWS Security Audit Guidelines](https://docs.aws.amazon.com/general/latest/gr/aws-security-audit-guide.html)
- [IAM
Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Use
CloudFormation StackSets to provision resources across
multiple AWS accounts and regions](https://aws.amazon.com/blogs/aws/use-cloudformation-stacksets-to-provision-resources-across-multiple-aws-accounts-and-regions/)
- [Organizations
FAQ](https://aws.amazon.com/organizations/faqs/)
- [AWS Organizations terminology and concepts](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html)
- [Best
Practices for Service Control Policies in an AWS Organizations Multi-Account Environment](https://aws.amazon.com/blogs/industries/best-practices-for-aws-organizations-service-control-policies-in-a-multi-account-environment/)
- [AWS Account Management Reference Guide](https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html)
- [Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)

**Related videos:**

- [Enable AWS
adoption at scale with automation and governance](https://youtu.be/GUMSgdB-l6s)
- [Security
Best Practices the Well-Architected Way](https://youtu.be/u6BCVkXkPnM)
- [Building
and Governing Multiple Accounts using AWS Control Tower](https://www.youtube.com/watch?v=agpyuvRv5oo)
- [Enable Control Tower for Existing
Organizations](https://www.youtube.com/watch?v=CwRy0t8nfgM)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_multi_accounts.html*

---

# SEC01-BP02 Secure account root user and properties

The root user is the most privileged user in an AWS account, with
full administrative access to all resources within the account, and
in some cases cannot be constrained by security policies. Deactivating
programmatic access to the root user, establishing appropriate
controls for the root user, and avoiding routine use of the root
user helps reduce the risk of inadvertent exposure of the root
credentials and subsequent compromise of the cloud environment.

**Desired outcome:**Securing the root user helps reduce the
chance that accidental or intentional damage can occur through the misuse of root user
credentials. Establishing detective controls can also alert the appropriate personnel when
actions are taken using the root user.

**Common anti-patterns:**

- Using the root user for tasks other than the few that require root user credentials.
- Neglecting to test contingency plans on a regular basis to verify the functioning of
critical infrastructure, processes, and personnel during an emergency.
- Only considering the typical account login flow and neglecting to consider or test
alternate account recovery methods.
- Not handling DNS, email servers, and telephone providers as part of the critical
security perimeter, as these are used in the account recovery flow.

**Benefits of establishing this best practice:** Securing access to
the root user builds confidence that actions in your account are controlled and audited.

**Level of risk exposed if this best practice is not established**:
High

## Implementation guidance

AWS offers many tools to help secure your account. However,
because some of these measures are not turned on by default, you
must take direct action to implement them. Consider these
recommendations as foundational steps to securing your AWS account. As you implement these steps it’s important that you
build a process to continuously assess and monitor the security
controls.

When you first create an AWS account, you begin with one identity
that has complete access to all AWS services and resources in the
account. This identity is called the AWS account root user. You
can sign in as the root user using the email address and password
that you used to create the account. Due to the elevated access
granted to the AWS root user, you must limit use of the AWS root
user to perform tasks that
[specifically
require it](https://docs.aws.amazon.com/general/latest/gr/aws_tasks-that-require-root.html). The root user login credentials must be closely
guarded, and multi-factor authentication (MFA) should always be
used for the AWS account root user.

In addition to the normal authentication flow to log into your
root user using a username, password, and multi-factor
authentication (MFA) device, there are account recovery flows to
log into your AWS account root user given access to the email
address and phone number associated with your account. Therefore,
it is equally important to secure the root user email account
where the recovery email is sent and the phone number associated
with the account. Also consider potential circular dependencies
where the email address associated with the root user is hosted on
email servers or domain name service (DNS) resources from the same
AWS account.

When using AWS Organizations, there are multiple AWS accounts each
of which have a root user. One account is designated as the
management account and several layers of member accounts can then
be added underneath the management account. Prioritize securing
your management account’s root user, then address your member
account root users. The strategy for securing your management
account’s root user can differ from your member account root
users, and you can place preventative security controls on your
member account root users.

**Implementation steps**

The following implementation steps are recommended to establish controls for the root
user. Where applicable, recommendations are cross-referenced to [CIS AWS
Foundations benchmark version 1.4.0](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls-1.4.0.html). In addition to these steps, consult [AWS best
practice guidelines](https://aws.amazon.com/premiumsupport/knowledge-center/security-best-practices/) for securing your AWS account and resources.

**Preventative controls**

- Set up accurate [contact
information](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact-primary.html) for the account.

This information is used for the lost password recovery flow, lost MFA device
account recovery flow, and for critical security-related communications with your
team.
- Use an email address hosted by your corporate domain, preferably a distribution
list, as the root user’s email address. Using a distribution list rather than an
individual’s email account provides additional redundancy and continuity for access
to the root account over long periods of time.
- The phone number listed on the contact information should be a dedicated,
secure phone for this purpose. The phone number should not be listed or shared with
anyone.

- Do not create access keys for the root user. If access keys exist, remove them (CIS
1.4).

Eliminate any long-lived programmatic credentials (access and secret keys) for
the root user.
- If root user access keys already exist, you should transition processes using
those keys to use temporary access keys from an AWS Identity and Access Management (IAM) role, then [delete the root user access keys](https://docs.aws.amazon.com/accounts/latest/reference/root-user-access-key.html#root-user-delete-access-key).

- Determine if you need to store credentials for the root user.

If you are using AWS Organizations to create new member accounts, the initial password
for the root user on new member accounts is set to a random value that is not
exposed to you. Consider using the password reset flow from your AWS Organization
management account to [gain access to the member account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_access-as-root) if needed.
- For standalone AWS accounts or the management AWS Organization account,
consider creating and securely storing credentials for the root user. Use MFA for
the root user.

- Use preventative controls for member account root users in AWS multi-account
environments.

Consider using the [Disallow Creation of Root Access Keys for the Root User](https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-controls.html#disallow-root-access-keys) preventative
guard rail for member accounts.
- Consider using the [Disallow Actions as a Root User](https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-controls.html#disallow-root-auser-actions) preventative guard rail for member
accounts.

- If you need credentials for the root user:

Use a complex password.
- Turn on multi-factor authentication (MFA) for the root user, especially for
AWS Organizations management (payer) accounts (CIS 1.5).
- Consider hardware MFA devices for resiliency and security, as single use
devices can reduce the chances that the devices containing your MFA codes might be
reused for other purposes. Verify that hardware MFA devices powered by a battery are
replaced regularly. (CIS 1.6)

To configure MFA for the root user, follow the instructions for creating
either a [virtual MFA](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html#enable-virt-mfa-for-root) or [hardware MFA device](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_physical.html#enable-hw-mfa-for-root).

- Consider enrolling multiple MFA devices for backup. [Up to 8 MFA devices
are allowed per account](https://aws.amazon.com/blogs/security/you-can-now-assign-multiple-mfa-devices-in-iam/).

Note that enrolling more than one MFA device for the root user
automatically turns off the [flow for recovering
your account if the MFA device is lost](https://aws.amazon.com/premiumsupport/knowledge-center/reset-root-user-mfa/).

- Store the password securely, and consider circular dependencies if storing the
password electronically. Don’t store the password in such a way that would require
access to the same AWS account to obtain it.

- Optional: Consider establishing a periodic password rotation schedule for the root
user.

Credential management best practices depend on your regulatory and policy
requirements. Root users protected by MFA are not reliant on the password as a
single factor of authentication.
- [Changing
the root user password](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_change-root.html) on a periodic basis reduces the risk that an
inadvertently exposed password can be misused.

**Detective controls**

- Create alarms to detect use of the root credentials (CIS 1.7). [Amazon GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_settingup.html) can monitor and alert on root user API credential usage through the
[RootCredentialUsage](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_finding-types-iam.html#policy-iam-rootcredentialusage) finding.
- Evaluate and implement the detective controls included in the [AWS Well-Architected Security Pillar conformance pack for AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/operational-best-practices-for-wa-Security-Pillar.html), or if
using AWS Control Tower, the [strongly
recommended controls](https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-controls.html) available inside Control Tower.

**Operational guidance**

- Determine who in the organization should have access to the root user credentials.

Use a two-person rule so that no one individual has access to all necessary
credentials and MFA to obtain root user access.
- Verify that the organization, and not a single individual, maintains control
over the phone number and email alias associated with the account (which are used
for password reset and MFA reset flow).

- Use root user only by exception (CIS 1.7).

The AWS root user must not be used for everyday tasks, even administrative
ones. Only log in as the root user to perform [AWS tasks that require
root user](https://docs.aws.amazon.com/general/latest/gr/aws_tasks-that-require-root.html). All other actions should be performed by other users assuming
appropriate roles.

- Periodically check that access to the root user is functioning so that procedures
are tested prior to an emergency situation requiring the use of the root user
credentials.
- Periodically check that the email address associated with the account and those
listed under [Alternate
Contacts](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact-alternate.html) work. Monitor these email inboxes for security notifications you
might receive from ``. Also ensure any phone numbers
associated with the account are working.
- Prepare incident response procedures to respond to root account misuse. Refer to
the [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html) and the best practices in
the [Incident Response section of the Security Pillar whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/incident-response.html)
for more information on building an incident response strategy for your AWS account.

## Resources

**Related best practices:**

- [SEC01-BP01 Separate workloads using accounts](./sec_securely_operate_multi_accounts.html)
- [SEC02-BP01 Use strong sign-in mechanisms](./sec_identities_enforce_mechanisms.html)
- [SEC03-BP02 Grant least privilege access](./sec_permissions_least_privileges.html)
- [SEC03-BP03 Establish emergency access process](./sec_permissions_emergency_process.html)
- [SEC10-BP05 Pre-provision access](./sec_incident_response_pre_provision_access.html)

**Related documents:**

- [AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [AWS Security Audit Guidelines](https://docs.aws.amazon.com/general/latest/gr/aws-security-audit-guide.html)
- [IAM
Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Amazon GuardDuty – root credential usage alert](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_finding-types-iam.html#policy-iam-rootcredentialusage)
- [Step-by-step
guidance on monitoring for root credential use through
CloudTrail](https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-20)
- [MFA
tokens approved for use with AWS](https://aws.amazon.com/iam/features/mfa/)
- Implementing [break
glass access](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/break-glass-access.html) on AWS
- [Top
10 security items to improve in your AWS account](https://aws.amazon.com/blogs/security/top-10-security-items-to-improve-in-your-aws-account/)
- [What
do I do if I notice unauthorized activity in my AWS account?](https://aws.amazon.com/premiumsupport/knowledge-center/potential-account-compromise/)

**Related videos:**

- [Enable AWS
adoption at scale with automation and governance](https://youtu.be/GUMSgdB-l6s)
- [Security
Best Practices the Well-Architected Way](https://youtu.be/u6BCVkXkPnM)
- [Limiting use of AWS root
credentials](https://youtu.be/SMjvtxXOXdU?t=979) from AWS re:inforce 2022 – Security best practices with AWS
IAM

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_aws_account.html*

---

# SEC01-BP03 Identify and validate control objectives

Based on your compliance requirements and risks identified from your threat model, derive and validate the control objectives and controls that you need to apply to your workload. Ongoing validation of control objectives and controls help you measure the effectiveness of risk mitigation.

**Desired outcome:** The security control objectives of your business are well-defined and aligned to your compliance requirements. Controls are implemented and enforced through automation and policy and are continually evaluated for their effectiveness in achieving your objectives. Evidence of effectiveness at both a point in time and over a period of time are readily reportable to auditors.

**Common anti-patterns:**

- Regulatory requirements, market expectations, and industry standards for assurable security are not well-understood for your business
- Your cybersecurity frameworks and control objectives are misaligned to the requirements of your business
- The implementation of controls does not strongly align to your control objectives in a measurable way
- You do not use automation to report on the effectiveness of your controls

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

There are many common cybersecurity frameworks that can form the basis for your security control objectives. Consider the regulatory requirements, market expectations, and industry standards for your business to determine which frameworks best supports your needs. Examples include [AICPA SOC 2](https://aws.amazon.com/compliance/soc-faqs/), [HITRUST](https://aws.amazon.com/compliance/hitrust/), [PCI-DSS](https://aws.amazon.com/compliance/pci-dss-level-1-faqs/), [ISO 27001](https://aws.amazon.com/compliance/iso-27001-faqs/), and [NIST SP 800-53](https://aws.amazon.com/compliance/nist/).

For the control objectives you identify, understand how AWS services you consume help you to achieve those objectives. Use [AWS Artifact](https://aws.amazon.com/artifact/) to find documentation and reports aligned to your target frameworks that describe the scope of responsibility covered by AWS and guidance for the remaining scope that is your responsibility. For further service-specific guidance as they align to various framework control statements, see [AWS Customer Compliance Guides](https://d1.awsstatic.com/whitepapers/compliance/AWS_Customer_Compliance_Guides.pdf).

As you define the controls that achieve your objectives, codify enforcement using preventative controls, and automate mitigations using detective controls. Help prevent non-compliant resource configurations and actions across your AWS Organizations using [service control policies (SCP)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html). Implement rules in [AWS Config](https://aws.amazon.com/config/) to monitor and report on non-compliant resources, then switch rules to an enforcement model once confident in their behavior. To deploy sets of pre-defined and managed rules that align to your cybersecurity frameworks, evaluate the use of [AWS Security Hub CSPM standards](https://docs.aws.amazon.com/securityhub/latest/userguide/standards-reference.html) as your first option. The AWS Foundational Service Best Practices (FSBP) standard and the CIS AWS Foundations Benchmark are good starting points with controls that align to many objectives that are shared across multiple standard frameworks. Where Security Hub CSPM does not intrinsically have the control detections desired, it can be complemented using [AWS Config conformance packs](https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html).

Use [APN Partner Bundles](https://aws.amazon.com/partners/programs/gsca/bundles/) recommended by the AWS Global Security and Compliance Acceleration (GSCA) team to get assistance from security advisors, consulting agencies, evidence collection and reporting systems, auditors, and other complementary services when required.

### Implementation steps

- Evaluate common cybersecurity frameworks, and align your control objectives to the ones chosen.
- Obtain relevant documentation on guidance and responsibilities for your framework using AWS Artifact. Understand which parts of compliance fall on the AWS side of the shared responsibility model and which parts are your responsibility.
- Use SCPs, resource policies, role trust policies, and other guardrails to prevent non-compliant resource configurations and actions.
- Evaluate deploying Security Hub CSPM standards and AWS Config conformance packs that align to your control objectives.

## Resources

**Related best practices:**

- [SEC03-BP01
Define access requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_define.html)
- [SEC04-BP01 Configure
service and application logging](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_detect_investigate_events_app_service_logging.html)
- [SEC07-BP01
Understand your data classification scheme](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_data_classification_identify_data.html)
- [OPS01-BP03
Evaluate governance requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_priorities_governance_reqs.html)
- [OPS01-BP04
Evaluate compliance requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_priorities_compliance_reqs.html)
- [PERF01-BP05
Use policies and reference architectures](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_architecture_use_policies_and_reference_architectures.html)
- [COST02-BP01
Develop policies based on your organization
requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_govern_usage_policies.html)

**Related documents:**

- [AWS Customer Compliance Guides](https://d1.awsstatic.com/whitepapers/compliance/AWS_Customer_Compliance_Guides.pdf)

**Related tools:**

- [AWS Artifact](https://aws.amazon.com/artifact/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_control_objectives.html*

---

# SEC01-BP04 Stay up to date with security threats and recommendations

Stay up to date with the latest threats and mitigations by
monitoring industry threat intelligence publications and data feeds
for updates. Evaluate managed service offerings that automatically
update based on the latest threat data.

**Desired outcome:** You stay
informed as industry publications are updated with the latest
threats and recommendations.  You use automation to detect potential
vulnerabilities and exposures as you identify new threats. You take
mitigating action against these threats.  You adopt AWS services
that automatically update with the latest threat intelligence.

**Common anti-patterns:**

- Not having a reliable and repeatable mechanism to stay informed
of the latest threat intelligence.
- Maintaining manual inventory of your technology portfolio,
workloads, and dependencies that require human review for
potential vulnerabilities and exposures.
- Not having mechanisms in place to update your workloads and
dependencies to the latest versions available that provide known
threat mitigations.

**Benefits of establishing this best
practice:** Using threat intelligence sources to stay up to
date reduces the risk of missing out on important changes to the
threat landscape that can impact your business.  Having automation
in place to scan, detect, and remediate where potential
vulnerabilities or exposures exist in your workloads and their
dependencies can help you mitigate risks quickly and predictably,
compared to manual alternatives.  This helps control time and costs
related to vulnerability mitigation.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Review trusted threat intelligence publications to stay on top of
the threat landscape.  Consult the
[MITRE
ATT&CK](https://attack.mitre.org/) knowledge base for documentation on known
adversarial tactics, techniques, and procedures (TTPs). Review
MITRE's [Common
Vulnerabilities and Exposures](https://cve.org/) (CVE) list to stay informed
on known vulnerabilities in products you rely on. Understand
critical risks to web applications with the Open Worldwide
Application Security Project (OWASP)'s popular
[OWASP
Top 10](https://owasp.org/www-project-top-ten/) project.

Stay up to date on AWS security events and recommended remediation
steps with AWS
[Security
Bulletins](https://aws.amazon.com/security/security-bulletins/) for CVEs.

To reduce your overall effort and overhead of staying up to date,
consider using AWS services that automatically incorporate new
threat intelligence over time.  For example, [Amazon GuardDuty](https://aws.amazon.com/guardduty/)
stays up to date with industry threat intelligence for detecting
anomalous behaviors and threat signatures within your accounts.
[Amazon Inspector](https://aws.amazon.com/inspector/) automatically keeps a database of the CVEs it
uses for its continuous scanning features up to date.  Both [AWS WAF](https://aws.amazon.com/waf/) and [AWS Shield Advanced](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-summary.html) provide managed rule groups that are
updated automatically as new threats emerge.

Review the
[Well-Architected
operational excellence pillar](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html) for automated
fleet management and patching.

## Implementation steps

- Subscribe to updates for threat intelligence publications that
are relevant to your business and industry. Subscribe to the
AWS Security Bulletins.
- Consider adopting services that incorporate new threat
intelligence automatically, such as Amazon GuardDuty and
Amazon Inspector.
- Deploy a fleet management and patching strategy that aligns
with the best practices of the Well-Architected Operational
Excellence Pillar.

## Resources

**Related best practices:**

- [SEC01-BP07 Identify threats and prioritize mitigations using a threat model](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_threat_model.html)
- [OPS01-BP05
Evaluate threat landscape](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_priorities_eval_threat_landscape.html)
- [OPS11-BP01
Have a process for continuous improvement](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_evolve_ops_process_cont_imp.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_updated_threats.html*

---

# SEC01-BP05 Reduce security management scope

Determine if you can reduce your security scope by using AWS services that shift management of certain controls to AWS (*managed services*). These services can help reduce your security maintenance tasks, such as infrastructure provisioning, software setup, patching, or backups.

**Desired outcome:** You consider the scope of your security management when selecting AWS services for your workload. The cost of management overhead and maintenance tasks (the total cost of ownership, or TCO) is weighed against the cost of the services you select, in addition to other Well-Architected considerations. You incorporate AWS control and compliance documentation into your control evaluation and verification procedures.

**Common anti-patterns:**

- Deploying workloads without thoroughly understanding the shared responsibility model for the services you select.
- Hosting databases and other technologies on virtual machines without having evaluated a managed service equivalent.
- Not including security management tasks into the total cost of ownership of hosting technologies on virtual machines when compared to managed service options.

**Benefits of establishing this best practice:** Using managed services can reduce your overall burden of managing operational security controls, which can reduce your security risks and total cost of ownership. Time that would otherwise be spent on certain security tasks can be reinvested into tasks that provide more value to your business. Managed services can also reduce the scope of your compliance requirements by shifting some control requirements to AWS.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

There are multiple ways you can integrate the components of your workload on AWS. Installing and running technologies on Amazon EC2 instances often requires you to take on the largest share of the overall security responsibility. To help reduce the burden of operating certain controls, identify AWS managed services that reduce the scope of your side of the shared responsibility model and understand how you can use them in your existing architecture. Examples include using the [Amazon Relational Database Service (Amazon RDS)](https://aws.amazon.com/rds/) for deploying databases, [Amazon Elastic Kubernetes Service (Amazon EKS)](https://aws.amazon.com/eks/) or [Amazon Elastic Container Service (Amazon ECS)](https://aws.amazon.com/ecs/) for orchestrating containers, or using [serverless options](https://aws.amazon.com/serverless/). When building new applications, think through which services can help reduce time and cost when it comes to implementing and managing security controls.

Compliance requirements can also be a factor when selecting services. Managed services can shift the compliance of some requirements to AWS. Discuss with your compliance team about their degree of comfort with auditing the aspects of services you operate and manage and accepting control statements in relevant AWS audit reports. You can provide the audit artifacts found in [AWS Artifact](https://aws.amazon.com/artifact/) to your auditors or regulators as evidence of AWS security controls. You can also use the responsibility guidance provided by some of the AWS audit artifacts to design your architecture, along with the [AWS Customer Compliance Guides](https://d1.awsstatic.com/whitepapers/compliance/AWS_Customer_Compliance_Guides.pdf). This guidance helps determine the additional security controls you should put in place in order to support the specific use cases of your system.

When using managed services, be familiar with the process of updating their resources to newer versions (for example, updating the version of a database managed by Amazon RDS, or a programming language runtime for an AWS Lambda function). While the managed service may perform this operation for you, configuring the timing of the update and understanding the impact on your operations remains your responsibility. Tools like [AWS Health](https://aws.amazon.com/premiumsupport/technology/aws-health/) can help you track and manage these updates throughout your environments.

### Implementation steps

- Evaluate the components of your workload that can be replaced with a managed service.

If you are migrating a workload to AWS, consider the reduced management (time and expense) and reduction of risk when you assess if you should rehost, refactor, replatform, rebuild, or replace your workload. Sometimes additional investment at the start of a migration can have significant savings in the long run.

- Consider implementing managed services, like Amazon RDS, instead of installing and managing your own technology deployments.
- Use the responsibility guidance in AWS Artifact to help determine the security controls you should put in place for your workload.
- Keep an inventory of resources in use, and stay up-to-date with new services and approaches to identify new opportunities to reduce scope.

## Resources

**Related best practices:**

- [PERF02-BP01
Select the best compute options for your workload](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_compute_hardware_select_best_compute_options.html)
- [PERF03-BP01
Use a purpose-built data store that best supports your data
access and storage requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_data_use_purpose_built_data_store.html)
- [SUS05-BP03
Use managed services](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_hardware_a4.html)

**Related documents:**

- [Planned
lifecycle events for AWS Health](https://docs.aws.amazon.com/health/latest/ug/aws-health-planned-lifecycle-events.html)

**Related tools:**

- [AWS Health](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html)
- [AWS Artifact](https://aws.amazon.com/artifact/)
- [AWS Customer Compliance Guides](https://d1.awsstatic.com/whitepapers/compliance/AWS_Customer_Compliance_Guides.pdf)

**Related videos:**

- [How
do I migrate to an Amazon RDS or Aurora MySQL DB instance
using AWS DMS?](https://www.youtube.com/watch?v=vqgSdD5vkS0)
- [AWS re:Invent 2023 - Manage resource lifecycle events at scale
with AWS Health](https://www.youtube.com/watch?v=VoLLNL5j9NA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_reduce_management_scope.html*

---

# SEC01-BP06 Automate deployment of standard security controls

Apply modern DevOps practices as you develop and deploy security
controls that are standard across your AWS environments.  Define
standard security controls and configurations using Infrastructure
as Code (IaC) templates, capture changes in a version control
system, test changes as part of a CI/CD pipeline, and automate the
deployment of changes to your AWS environments.

**Desired outcome:** IaC templates
capture standardized security controls and commit them to a version
control system.  CI/CD pipelines are in places that detect changes
and automate testing and deploying your AWS environments.
Guardrails are in place to detect and alert on misconfigurations in
templates before proceeding to deployment.  Workloads are deployed
into environments where standard controls are in place.  Teams have
access to deploy approved service configurations through a
self-service mechanism.  Secure backup and recovery strategies are
in place for control configurations, scripts, and related data.

**Common anti-patterns:**

- Making changes to your standard security controls manually,
through a web console or command-line interface.
- Relying on individual workload teams to manually implement the
controls a central team defines.
- Relying on a central security team to deploy workload-level
controls at the request of a workload team.
- Allowing the same individuals or teams to develop, test, and
deploy security control automation scripts without proper
separation of duties or checks and balances.

**Benefits of establishing this best
practice:** Using templates to define your standard
security controls allows you to track and compare changes over time
using a version control system.  Using automation to test and deploy
changes creates standardization and predictability, increasing the
chances of a successful deployment and reducing manual repetitive
tasks.  Providing a self-serve mechanism for workload teams to
deploy approved services and configurations reduces the risk of
misconfiguration and misuse. This also helps them to incorporate
controls earlier in the development process.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

When following the practices described in
[SEC01-BP01 Separate workloads
using accounts](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_multi_accounts.html), you will end up with multiple AWS accounts
for different environments that you manage using AWS Organizations.  While each of these environments and workloads may
need distinct security controls, you can standardize some security
controls across your organization.  Examples include integrating
centralized identity providers, defining networks and firewalls,
and configuring standard locations for storing and analyzing logs.
In the same way you can use *infrastructure as
code* (IaC) to apply the same rigor of application code
development to infrastructure provisioning, you can use IaC to
define and deploy your standard security controls as well.

Wherever possible, define your security controls in a declarative
way, such as in
[AWS CloudFormation](https://aws.amazon.com/cloudformation/), and store them in a source control system.  Use DevOps practices to automate the deploying your
controls for more predictable releases, automated testing using
tools
like [AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html), and detecting drift between your
deployed controls and your desired configuration.  You can use
services such as
[AWS CodePipeline](https://aws.amazon.com/codepipeline/),
[AWS CodeBuild](https://aws.amazon.com/codebuild/), and
[AWS CodeDeploy](https://aws.amazon.com/codedeploy/) to construct a CI/CD pipeline. Consider the
guidance in
[Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/deployments-ou.html) to configure
these services in their own accounts that are separate from other
deployment pipelines.

You can also define templates to standardize defining and
deploying AWS accounts, services, and configurations.  This
technique allows a central security team to manage these
definitions and provide them to workload teams through a
self-service approach.  One way to achieve this is by using
[Service Catalog](https://aws.amazon.com/servicecatalog/), where you can publish templates as
*products* that workload teams can incorporate
into their own pipeline deployments.  If you are using
[AWS Control Tower](https://aws.amazon.com/controltower/), some templates and controls are available as
a starting point.  Control Tower also provides
the [Account
Factory](https://docs.aws.amazon.com/controltower/latest/userguide/af-customization-page.html) capability, allowing workload teams to create new
AWS accounts using the standards you define.  This capability
helps remove dependencies on a central team to approve and create
new accounts when they are identified as needed by your workload
teams.  You may need these accounts to isolate different workload
components based on reasons such as the function they serve, the
sensitivity of data being processed, or their behavior.

## Implementation steps

- Determine how you will store and maintain your templates in a
version control system.
- Create CI/CD pipelines to test and deploy your templates.
Define tests to check for misconfigurations and that
templates adhere to your company standards.
- Build a catalog of standardized templates for workload teams
to deploy AWS accounts and services according to your
requirements.
- Implement secure backup and recovery strategies for your
control configurations, scripts, and related data.

## Resources

**Related best practices:**

- [OPS05-BP01
Use version control](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_dev_integ_version_control.html)
- [OPS05-BP04
Use build and deployment management systems](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_dev_integ_build_mgmt_sys.html)
- [REL08-BP05
Deploy changes with automation](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_tracking_change_management_automated_changemgmt.html)
- [SUS06-BP01
Adopt methods that can rapidly introduce sustainability
improvements](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_dev_a2.html)

**Related documents:**

- [Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/deployments-ou.html)

**Related examples:**

- [Automate
account creation, and resource provisioning using Service Catalog, AWS Organizations, and AWS Lambda](https://aws.amazon.com/blogs/mt/automate-account-creation-and-resource-provisioning-using-aws-service-catalog-aws-organizations-and-aws-lambda/)
- [Strengthen
the DevOps pipeline and protect data with AWS Secrets Manager,
AWS KMS, and AWS Certificate Manager](https://aws.amazon.com/blogs/security/strengthen-the-devops-pipeline-and-protect-data-with-aws-secrets-manager-aws-kms-and-aws-certificate-manager/)

**Related tools:**

- [AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)
- [Landing
Zone Accelerator on AWS](https://github.com/awslabs/landing-zone-accelerator-on-aws)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_automate_security_controls.html*

---

# SEC01-BP07 Identify threats and prioritize mitigations using a threat model

Perform threat modeling to identify and maintain an up-to-date register of potential threats and associated mitigations for your workload. Prioritize your threats and adapt your security control mitigations to prevent, detect, and respond. Revisit and maintain this in the context of your workload, and the evolving security landscape.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

**What is threat modeling?**

“Threat modeling works to identify, communicate, and understand threats and mitigations within the context of protecting something of value.” – [The Open Web Application Security Project (OWASP) Application Threat Modeling](https://owasp.org/www-community/Threat_Modeling)

**Why should you threat model?**

Systems are complex, and are becoming increasingly more complex and capable over time, delivering more business value and increased customer satisfaction and engagement. This means that IT design decisions need to account for an ever-increasing number of use cases. This complexity and number of use-case permutations typically makes unstructured approaches ineffective for finding and mitigating threats. Instead, you need a systematic approach to enumerate the potential threats to the system, and to devise mitigations and prioritize these mitigations to make sure that the limited resources of your organization have the maximum impact in improving the overall security posture of the system.

Threat modeling is designed to provide this systematic approach, with the aim of finding and addressing issues early in the design process, when the mitigations have a low relative cost and effort compared to later in the lifecycle. This approach aligns with the industry principle of [shift-left security](https://owasp.org/www-project-devsecops-guideline/latest/00a-Overview). Ultimately, threat modeling integrates with an organization’s risk management process and helps drive decisions on which controls to implement by using a threat driven approach.

**When should threat modeling be performed?**

Start threat modeling as early as possible in the lifecycle of your workload, this gives you better flexibility on what to do with the threats you have identified. Much like software bugs, the earlier you identify threats, the more cost effective it is to address them. A threat model is a living document and should continue to evolve as your workloads change. Revisit your threat models over time, including when there is a major change, a change in the threat landscape, or when you adopt a new feature or service.

### Implementation steps

**How can we perform threat modeling?**

There are many different ways to perform threat modeling. Much like programming languages, there are advantages and disadvantages to each, and you should choose the way that works best for you. One approach is to start with [Shostack’s 4 Question Frame for Threat Modeling](https://github.com/adamshostack/4QuestionFrame), which poses open-ended questions to provide structure to your threat modeling exercise:

- **What are we working on?**

The purpose of this question is to help you understand and agree upon the system you are building and the details about that system that are relevant to security. Creating a model or diagram is the most popular way to answer this question, as it helps you to visualize what you are building, for example, using a [data flow diagram](https://en.wikipedia.org/wiki/Data-flow_diagram). Writing down assumptions and important details about your system also helps you define what is in scope. This allows everyone contributing to the threat model to focus on the same thing, and avoid time-consuming detours into out-of-scope topics (including out of date versions of your system). For example, if you are building a web application, it is probably not worth your time threat modeling the operating system trusted boot sequence for browser clients, as you have no ability to affect this with your design.
- **What can go wrong?**

This is where you identify threats to your system. Threats are accidental or intentional actions or events that have unwanted impacts and could affect the security of your system. Without a clear understanding of what could go wrong, you have no way of doing anything about it.

There is no canonical list of what can go wrong. Creating this list requires brainstorming and collaboration between all of the individuals within your team and [relevant personas involved](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/#tips) in the threat modeling exercise. You can aid your brainstorming by using a model for identifying threats, such as [STRIDE](https://en.wikipedia.org/wiki/STRIDE_(security)), which suggests different categories to evaluate: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of privilege. In addition, you might want to aid the brainstorming by reviewing existing lists and research for inspiration, including the [OWASP Top 10](https://owasp.org/www-project-top-ten/), [HiTrust Threat Catalog](https://hitrustalliance.net/hitrust-threat-catalogue/), and your organization’s own threat catalog.
- **What are we going to do about it?**

As was the case with the previous question, there is no canonical list of all possible mitigations. The inputs into this step are the identified threats, actors, and areas of improvement from the previous step.

Security and compliance is a [shared responsibility between you and AWS](https://aws.amazon.com/compliance/shared-responsibility-model/). It’s important to understand that when you ask “What are we going to do about it?”, that you are also asking “Who is responsible for doing something about it?”. Understanding the balance of responsibilities between you and AWS helps you scope your threat modeling exercise to the mitigations that are under your control, which are typically a combination of AWS service configuration options and your own system-specific mitigations.

For the AWS portion of the shared responsibility, you will find that [AWS services are in-scope of many compliance programs](https://aws.amazon.com/compliance/services-in-scope/). These programs help you to understand the robust controls in place at AWS to maintain security and compliance of the cloud. The audit reports from these programs are available for download for AWS customers from [AWS Artifact](https://aws.amazon.com/artifact/).

Regardless of which AWS services you are using, there’s always an element of customer responsibility, and mitigations aligned to these responsibilities should be included in your threat model. For security control mitigations for the AWS services themselves, you want to consider implementing security controls across domains, including domains such as identity and access management (authentication and authorization), data protection (at rest and in transit), infrastructure security, logging, and monitoring. The documentation for each AWS service has a [dedicated security chapter](https://docs.aws.amazon.com/security/) that provides guidance on the security controls to consider as mitigations. Importantly, consider the code that you are writing and its code dependencies, and think about the controls that you could put in place to address those threats. These controls could be things such as [input validation](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html), [session handling](https://owasp.org/www-project-mobile-top-10/2014-risks/m9-improper-session-handling), and [bounds handling](https://owasp.org/www-community/vulnerabilities/Buffer_Overflow). Often, the majority of vulnerabilities are introduced in custom code, so focus on this area.
- **Did we do a good job?**

The aim is for your team and organization to improve both the quality of threat models and the velocity at which you are performing threat modeling over time. These improvements come from a combination of practice, learning, teaching, and reviewing. To go deeper and get hands on, it’s recommended that you and your team complete the [Threat modeling the right way for builders training course](https://explore.skillbuilder.aws/learn/course/external/view/elearning/13274/threat-modeling-the-right-way-for-builders-workshop) or [workshop](https://catalog.workshops.aws/threatmodel/en-US). In addition, if you are looking for guidance on how to integrate threat modeling into your organization’s application development lifecycle, see [How to approach threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/) post on the AWS Security Blog.

**Threat Composer**

To aid and guide you in performing threat modeling, consider using the [Threat Composer](https://github.com/awslabs/threat-composer#threat-composer) tool, which aims to your reduce time-to-value when threat modeling. The tool helps you do the following:

- Write useful threat statements aligned to [threat grammar](https://catalog.workshops.aws/threatmodel/en-US/what-can-go-wrong/threat-grammar) that work in a natural non-linear workflow
- Generate a human-readable threat model
- Generate a machine-readable threat model to allow you treat threat models as code
- Help you to quickly identify areas of quality and coverage improvement using the Insights Dashboard

For further reference, visit Threat Composer and switch to the system-defined **Example Workspace**.

## Resources

**Related best practices:**

- [SEC01-BP03 Identify and validate control objectives](./sec_securely_operate_control_objectives.html)
- [SEC01-BP04 Stay up to date with security threats and recommendations](./sec_securely_operate_updated_threats.html)
- [SEC01-BP05 Reduce security management scope](./sec_securely_operate_reduce_management_scope.html)
- [SEC01-BP08 Evaluate and implement new security services and features regularly](./sec_securely_operate_implement_services_features.html)

**Related documents:**

- [How to approach threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/) (AWS Security Blog)
- [NIST: Guide to Data-Centric System Threat modeling](https://csrc.nist.gov/publications/detail/sp/800-154/draft)

**Related videos:**

- [AWS Summit ANZ 2021 - How to approach threat modeling](https://www.youtube.com/watch?v=GuhIefIGeuA)
- [AWS Summit ANZ 2022 - Scaling security – Optimise for fast and secure delivery](https://www.youtube.com/watch?v=DjNPihdWHeA)

**Related training:**

- [Threat modeling the right way for builders – AWS Skill Builder virtual self-paced training](https://explore.skillbuilder.aws/learn/course/external/view/elearning/13274/threat-modeling-the-right-way-for-builders-workshop)
- [Threat modeling the right way for builders – AWS Workshop](https://catalog.workshops.aws/threatmodel)

**Related tools:**

- [Threat Composer](https://github.com/awslabs/threat-composer#threat-composer)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_threat_model.html*

---

# SEC01-BP08 Evaluate and implement new security services and features regularly

Evaluate and implement security services and features from AWS and
AWS Partners that help you evolve the security posture of your
workload.

**Desired outcome:** You have a
standard practice in place that informs you of new features and
services released by AWS and AWS Partners. You evaluate how these
new capabilities influence the design of current and new controls
for your environments and workloads.

**Common anti-patterns:**

- You don't subscribe to AWS blogs and RSS feeds to learn of
relevant new features and services quickly
- You rely on news and updates about security services and
features from second-hand sources
- You don't encourage AWS users in your organization to stay
informed on the latest updates

**Benefits of establishing this best
practice:** When you stay on top of new security services
and features, you can make informed decisions about the
implementation of controls in your cloud environments and workloads.
These sources help raise awareness of the evolving security
landscape and how AWS services can be used to protect against new
and emerging threats.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

AWS informs customers of new security services and features
through several channels:

- [AWS What's
New](https://aws.amazon.com/new)
- [AWS News
Blog](https://aws.amazon.com/blogs/aws/)
- [AWS Security Blog](https://aws.amazon.com/blogs/security/)
- [AWS Security Bulletins](https://aws.amazon.com/security/security-bulletins/)
- [AWS documentation overview](https://aws.amazon.com/documentation/)

You can subscribe to an
[AWS Daily Feature Updates](https://aws.amazon.com/blogs/aws/subscribe-to-aws-daily-feature-updates-via-amazon-sns/) topic using Amazon Simple Notification Service (Amazon SNS) for a comprehensive daily
summary of updates. Some security services, such as
[Amazon GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_sns.html) and
[AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-announcements.html), provide their own SNS topics to stay informed
about new standards, findings, and other updates for those
particular services.

New services and features are also announced and described in
detail during
[conferences,
events, and webinars](https://aws.amazon.com/events/) conducted around the globe each year.
Of particular note is the annual
[AWS re:Inforce](https://reinforce.awsevents.com/) security conference and the more
general [AWS re:Invent](https://reinvent.awsevents.com/) conference. The previously-mentioned AWS news
channels share these conference announcements about security and
other services, and you can view deep dive educational breakout
sessions online at the
[AWS Events channel](https://www.youtube.com/c/AWSEventsChannel) on YouTube.

You can also ask your
[AWS account team](https://aws.amazon.com/startups/learn/meet-your-aws-account-team) about the latest security service updates and
recommendations. You can reach out to your team through the
[Sales
Support form](https://aws.amazon.com/contact-us/sales-support/) if you do not have their direct contact
information. Similarly, if you subscribed to
[AWS Enterprise Support,](https://aws.amazon.com/premiumsupport/plans/enterprise/)you will receive weekly updates from
your Technical Account Manager (TAM) and can schedule a regular
review meeting with them.

### Implementation steps

- Subscribe to the various blogs and bulletins with your
favorite RSS reader or to the Daily Features Updates SNS
topic.
- Evaluate which AWS events to attend to learn first-hand
about new features and services.
- Set up meetings with your AWS account team for any questions
about updating security services and features.
- Consider subscribing to Enterprise Support to have regular
consultations with a Technical Account Manager (TAM).

## Resources

**Related best practices:**

- [PERF01-BP01
Learn about and understand available cloud services and
features](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_architecture_understand_cloud_services_and_features.html)
- [COST01-BP07
Keep up-to-date with new service releases](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_cloud_financial_management_scheduled.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_implement_services_features.html*

---
