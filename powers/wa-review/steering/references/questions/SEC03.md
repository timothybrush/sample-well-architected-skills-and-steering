# SEC 3 — How do you manage permissions for people and machines?

**Pillar**: Security  
**Best Practices**: 9

---

# SEC03-BP01 Define access requirements

Each component or resource of your workload needs to be accessed by administrators, end
users, or other components. Have a clear definition of who or what should have access to each
component, choose the appropriate identity type and method of authentication and
authorization.

**Common anti-patterns:**

- Hard-coding or storing secrets in your application.
- Granting custom permissions for each user.
- Using long-lived credentials.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Each component or resource of your workload needs to be accessed by administrators, end
users, or other components. Have a clear definition of who or what should have access to each
component, choose the appropriate identity type and method of authentication and
authorization.

Regular access to AWS accounts within the organization should be provided using [federated access](https://aws.amazon.com/identity/federation/) or a centralized
identity provider. You should also centralize your identity management and ensure that there
is an established practice to integrate AWS access to your employee access lifecycle. For
example, when an employee changes to a job role with a different access level, their group
membership should also change to reflect their new access requirements.

When defining access requirements for non-human identities, determine which applications
and components need access and how permissions are granted. Using IAM roles built with the
least privilege access model is a recommended approach. [AWS Managed
policies](https://docs.aws.amazon.com/singlesignon/latest/userguide/security-iam-awsmanpol.html) provide predefined IAM policies that cover most common use cases.

AWS services, such as [AWS Secrets Manager](https://aws.amazon.com/blogs/security/identify-arrange-manage-secrets-easily-using-enhanced-search-in-aws-secrets-manager/) and [AWS Systems Manager
Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html), can help decouple secrets from the application or workload securely. In Secrets Manager, you can establish
automatic rotation for your credentials. You can use Systems Manager to reference parameters in your
scripts, commands, SSM documents, configuration, and automation workflows by using the unique
name that you specified when you created the parameter.

You can use
[AWS IAM Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) to obtain
[temporary
security credentials in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html) for workloads that run outside
of AWS. Your workloads can use the same
[IAM
policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) and
[IAM
roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) that you use with AWS applications to access AWS
resources.

Where possible, prefer short-term temporary credentials over
long-term static credentials. For scenarios in which you need
users with programmatic access and long-term credentials,
use [access
key last used information](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_RotateAccessKey) to rotate and remove access keys.

Users need programmatic access if they want to interact with AWS outside of the AWS Management Console. The way to grant programmatic access depends on the type of user that's accessing AWS.

To grant users programmatic access, choose one of the following options.

Which user needs programmatic access?
To
By

IAM
(Recommended) Use console credentials as temporary credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or AWS APIs.

Following the instructions for the interface that you want to use.

- For the AWS CLI, see [Login for AWS local development](https://docs.aws.amazon.com//cli/latest/userguide/cli-configure-sign-in.html) in
the *AWS Command Line Interface User Guide*.
- For AWS SDKs, see [Login for AWS local development](https://docs.aws.amazon.com//sdkref/latest/guide/access-login.html) in the
*AWS SDKs and Tools Reference Guide*.

Workforce identity

(Users managed in IAM Identity Center)

Use temporary credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or
AWS APIs.

Following the instructions for the interface that you want to use.

- For the AWS CLI, see [Configuring the AWS CLI to use AWS IAM Identity Center](https://docs.aws.amazon.com//cli/latest/userguide/cli-configure-sso.html) in the
*AWS Command Line Interface User Guide*.
- For AWS SDKs, tools, and AWS APIs, see [IAM Identity Center
authentication](https://docs.aws.amazon.com//sdkref/latest/guide/access-sso.html) in the *AWS SDKs and Tools Reference Guide*.

IAM
Use temporary credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or
AWS APIs.
Following the instructions in [Using temporary
credentials with AWS resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the *IAM User Guide*.

IAM

(Not recommended)
Use long-term credentials to sign programmatic requests
to the AWS CLI, AWS SDKs, or AWS APIs.

Following the instructions for the interface that you want to use.

- For the AWS CLI, see [Authenticating using IAM user credentials](https://docs.aws.amazon.com//cli/latest/userguide/cli-authentication-user.html) in
the *AWS Command Line Interface User Guide*.
- For AWS SDKs and tools, see [Authenticate using long-term credentials](https://docs.aws.amazon.com//sdkref/latest/guide/access-iam-users.html) in the
*AWS SDKs and Tools Reference Guide*.
- For AWS APIs, see [Managing access keys for
IAM users](https://docs.aws.amazon.com//IAM/latest/UserGuide/id_credentials_access-keys.html) in the *IAM User Guide*.

## Resources

**Related documents:**

- [Attribute-based
access control (ABAC)](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html)
- [AWS IAM Identity Center](https://aws.amazon.com/iam/identity-center/)
- [IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html)
- [AWS Managed policies for IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/security-iam-awsmanpol.html)
- [AWS IAM policy conditions](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html)
- [IAM use cases](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UseCases.html)
- [Remove
unnecessary credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#remove-credentials)
- [Working
with Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage.html)
- [How to control access to AWS resources based on AWS account, OU, or organization](https://aws.amazon.com/blogs/security/how-to-control-access-to-aws-resources-based-on-aws-account-ou-or-organization/)
- [Identify, arrange, and manage secrets easily using enhanced search in AWS Secrets Manager](https://aws.amazon.com/blogs/security/identify-arrange-manage-secrets-easily-using-enhanced-search-in-aws-secrets-manager/)

**Related videos:**

- [Become an IAM
Policy Master in 60 Minutes or Less](https://youtu.be/YQsK4MtsELU)
- [Separation of
Duties, Least Privilege, Delegation, and CI/CD](https://youtu.be/3H0i7VyTu70)
- [Streamlining
identity and access management for innovation](https://www.youtube.com/watch?v=3qK0b1UkaE8)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_define.html*

---

# SEC03-BP02 Grant least privilege access

Grant only the access that users require to perform specific actions
on specific resources under specific conditions. Use group and
identity attributes to dynamically set permissions at scale, rather
than defining permissions for individual users. For example, you can
allow a group of developers access to manage only resources for
their project. This way, if a developer leaves the project, their
access is automatically revoked without changing the underlying
access policies.

**Desired outcome:** Users have only
the minimum permissions required for their specific job functions.
You use separate AWS accounts to isolate developers from production
environments. When developers need to access production environments
for specific tasks, they are granted limited and controlled access
only for the duration of those tasks. Their production access is
immediately revoked after they complete the necessary work. You
conduct regular reviews of permissions and promptly revoke them when
no longer needed, such as when a user changes roles or leaves the
organization. You restrict administrator privileges to a small,
trusted group to reduce risk exposure. You give machine or system
accounts only the minimum permissions required to perform their
intended tasks.

**Common anti-patterns:**

- By default, you grant users administrator permissions.
- You use the root user account for daily activities.
- You create overly permissive policies without proper scoping.
- Your permissions reviews are infrequent, which leads to
permissions creep.
- You rely solely on attribute-based access control for
environment isolation or permissions management.

**Level of risk exposed if this best practice is not established:**
High

## Implementation guidance

The principle of
[least
privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) states that identities should only be permitted
to perform the smallest set of actions necessary to fulfill a
specific task. This balances usability, efficiency, and security.
Operating under this principle helps limit unintended access and
helps track who has access to what resources. IAM users and roles
have no permissions by default. The root user has full access by
default and should be tightly controlled, monitored, and used only
for
[tasks
that require root access](https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html).

IAM policies are used to explicitly grant permissions to IAM roles
or specific resources. For example, identity-based policies can be
attached to IAM groups, while S3 buckets can be controlled by
resource-based policies.

When you create an IAM policy, you can specify the service
actions, resources, and conditions that must be true for AWS to
allow or deny access. AWS supports a variety of conditions to help
you scope down access. For example, by using the
PrincipalOrgID
[condition
key](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html), you can deny actions if the requestor isn't a part of
your AWS Organization.

You can also control requests that AWS services make on your
behalf, such as AWS CloudFormation creating an AWS Lambda
function, using the CalledVia condition key.
You can layer different policy types to establish defense-in-depth
and limit the overall permissions of your users. You can also
restrict what permissions can be granted and under what
conditions. For example, you can allow your workload teams to
create their own IAM policies for systems they build, but only if
they apply a
[Permission
Boundary](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) to limit the maximum permissions they can grant.

### Implementation steps

- **Implement least privilege
policies**: Assign access policies with least
privilege to IAM groups and roles to reflect the user's role
or function that you have defined.
- **Isolate development and production
environments through separate AWS accounts**: Use
separate AWS accounts for development and production
environments, and control access between them using
[service
control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html), resource policies, and identity
policies.
- **Base policies on API
usage**: One way to determine the needed
permissions is to review AWS CloudTrail logs. You can use
this review to create permissions tailored to the actions
that the user actually performs within AWS.
[IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html) can
[automatically
generate](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html) an IAM policy based on access activity. You
can use IAM Access Advisor at the organization or account
level to
[track
the last accessed information for a particular
policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html).
- **Consider using
[AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html)**: When
you begin to create fine-grained permissions policies, it
can be helpful to use AWS managed policies for common job
roles, such as billing, database administrators, and data
scientists. These policies can help narrow the access that
users have while you determine how to implement the least
privilege policies.
- **Remove unnecessary
permissions:** Detect and remove unused IAM
entities, credentials, and permissions to achieve the
principle of least privilege. You can use
[IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-findings.html) to identify external and unused
access, and
[IAM Access Analyzer policy generation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html) can help fine-tune
permissions policies.
- **Ensure that users have limited
access to production environments:** Users should
only have access to production environments with a valid use
case. After the user performs the specific tasks that
required production access, access should be revoked.
Limiting access to production environments helps prevent
unintended production-impacting events and lowers the scope
of impact of unintended access.
- **Consider permissions
boundaries:** A
[permissions
boundary](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) is a feature for using a managed policy that
sets the maximum permissions that an identity-based policy
can grant to an IAM entity. An entity's permissions boundary
allows it to perform only the actions that are allowed by
both its identity-based policies and its permissions
boundaries.
- **Refine access using attribute-based
access control and resource tags**
[Attribute-based
access control (ABAC)](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html) using resource tags can be used
to refine permissions when supported. You can use an ABAC
model that compares principal tags to resource tags to
refine access based on custom dimensions you define. This
approach can simplify and reduce the number of permission
policies in your organization.

It is recommended that ABAC only be used for access
control when both the principals and resources are owned
by your AWS Organization. External parties may use the
same tag names and values as your organization for their
own principals and resources. If you rely solely on
these name-value pairs for granting access to external
party principals or resources, you may provide
unintended permissions.

- **Use service control policies for AWS Organizations:**
[Service
control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) centrally control the maximum
available permissions for member accounts in your
organization. Importantly, you can use service control
policies to restrict root user permissions in member
accounts. Also consider using AWS Control Tower, which
provides prescriptive managed controls that enrich AWS Organizations. You can also define your own controls within
Control Tower.
- **Establish a user lifecycle policy
for your organization:** User lifecycle policies
define tasks to perform when users are onboarded onto AWS,
change job role or scope, or no longer need access to AWS.
Perform permission reviews during each step of a user's
lifecycle to verify that permissions are properly
restrictive and to avoid permissions creep.
- **Establish a regular schedule to
review permissions and remove any unneeded
permissions:** You should regularly review user
access to verify that users do not have overly permissive
access.
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html) and IAM Access Analyzer can help during user
permissions audits.
- **Establish a job role
matrix:** A job role matrix visualizes the various
roles and access levels required within your AWS footprint.
With a job role matrix, you can define and separate
permissions based on user responsibilities within your
organization. Use groups instead of applying permissions
directly to individual users or roles.

## Resources

**Related documents:**

- [Grant
least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)
- [Permissions
boundaries for IAM entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
- [Techniques
for writing least privilege IAM policies](https://aws.amazon.com/blogs/security/techniques-for-writing-least-privilege-iam-policies/)
- [IAM Access Analyzer makes it easier to implement least privilege
permissions by generating IAM policies based on access
activity](https://aws.amazon.com/blogs/security/iam-access-analyzer-makes-it-easier-to-implement-least-privilege-permissions-by-generating-iam-policies-based-on-access-activity/)
- [Delegate
permission management to developers by using IAM permissions
boundaries](https://aws.amazon.com/blogs/security/delegate-permission-management-to-developers-using-iam-permissions-boundaries/)
- [Refining
Permissions using last accessed information](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
- [IAM
policy types and when to use them](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
- [Testing
IAM policies with the IAM policy simulator](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html)
- [Guardrails
in AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/guardrails.html)
- [Zero
Trust architectures: An AWS perspective](https://aws.amazon.com/blogs/security/zero-trust-architectures-an-aws-perspective/)
- [How
to implement the principle of least privilege with
CloudFormation StackSets](https://aws.amazon.com/blogs/security/how-to-implement-the-principle-of-least-privilege-with-cloudformation-stacksets/)
- [Attribute-based
access control (ABAC)](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html)
- [Reducing
policy scope by viewing user activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
- [View
role access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html)
- [Use
Tagging to Organize Your Environment and Drive
Accountability](https://docs.aws.amazon.com/aws-technical-content/latest/cost-optimization-laying-the-foundation/tagging.html)
- [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/)
- [Tagging
AWS resources](https://aws.amazon.com/premiumsupport/knowledge-center/tagging-resources/)

**Related videos:**

- [Next-generation
permissions management](https://www.youtube.com/watch?v=8vsD_aTtuTo)
- [Zero
Trust: An AWS perspective](https://www.youtube.com/watch?v=1p5G1-4s1r0)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_least_privileges.html*

---

# SEC03-BP03 Establish emergency access process

Create a process that allows for emergency access to your workloads
in the unlikely event of an issue with your centralized identity
provider.

You must design processes for different failure modes that may
result in an emergency event. For example, under normal
circumstances, your workforce users federate to the cloud using a
centralized identity provider
([SEC02-BP04](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html))
to manage their workloads. However, if your centralized identity
provider fails, or the configuration for federation in the cloud is
modified, then your workforce users may not be able to federate into
the cloud. An emergency access process allows authorized
administrators to access your cloud resources through alternate
means (such as an alternate form of federation or direct user
access) to fix issues with your federation configuration or your
workloads. The emergency access process is used until the normal
federation mechanism is restored.

**Desired outcome:**

- You have defined and documented the failure modes that count as
an emergency: consider your normal circumstances and the systems
your users depend on to manage their workloads. Consider how
each of these dependencies can fail and cause an emergency
situation. You may find the questions and best practices in the
[Reliability
pillar](https://docs.aws.amazon.com/wellarchitected/latest/framework/a-reliability.html) useful to identify failure modes and architect
more resilient systems to minimize the likelihood of failures.
- You have documented the steps that must be followed to confirm a
failure as an emergency. For example, you can require your
identity administrators to check the status of your primary and
standby identity providers and, if both are unavailable, declare
an emergency event for identity provider failure.
- You have defined an emergency access process specific to each
type of emergency or failure mode. Being specific can reduce the
temptation on the part of your users to overuse a general
process for all types of emergencies. Your emergency access
processes describe the circumstances under which each process
should be used, and conversely situations where the process
should not be used and points to alternate processes that may
apply.
- Your processes are well-documented with detailed instructions
and playbooks that can be followed quickly and efficiently.
Remember that an emergency event can be a stressful time for
your users and they may be under extreme time pressure, so
design your process to be as simple as possible.

**Common anti-patterns:**

- You do not have well-documented and well-tested emergency access
processes. Your users are unprepared for an emergency and follow
improvised processes when an emergency event arises.
- Your emergency access processes depend on the same systems (such
as a centralized identity provider) as your normal access
mechanisms. This means that the failure of such a system may
impact both your normal and emergency access mechanisms and
impair your ability to recover from the failure.
- Your emergency access processes are used in non-emergency
situations. For example, your users frequently misuse emergency
access processes as they find it easier to make changes directly
than submit changes through a pipeline.
- Your emergency access processes do not generate sufficient logs
to audit the processes, or the logs are not monitored to alert
for potential misuse of the processes.

**Benefits of establishing this best
practice:**

- By having well-documented and well-tested emergency access
processes, you can reduce the time taken by your users to
respond to and resolve an emergency event. This can result in
less downtime and higher availability of the services you
provide to your customers.
- You can track each emergency access request and detect and alert
on unauthorized attempts to misuse the process for non-emergency
events.

**Level of risk exposed if this best practice
is not established**: Medium

## Implementation guidance

This section provides guidance for creating emergency access
processes for several failure modes related to workloads deployed
on AWS, starting with common guidance that applies to all failure
modes and followed by specific guidance based on the type of
failure mode.

**Common guidance for all failure
modes**

Consider the following as you design an emergency access process
for a failure mode:

- Document the pre-conditions and assumptions of the process:
when the process should be used and when it should not be
used. It helps to detail the failure mode and document
assumptions, such as the state of other related systems. For
example, the process for the Failure Mode 2 assumes that the identity provider is
available, but the configuration on AWS is modified or has
expired.
- Pre-create resources needed by the emergency access process
([SEC10-BP05](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_pre_provision_access.html)).
For example, pre-create the emergency access AWS account with
IAM users and roles, and the cross-account IAM roles in all
the workload accounts. This verifies that these resources are
ready and available when an emergency event happens. By
pre-creating resources, you do not have a dependency on AWS
[control plane](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/control-planes-and-data-planes.html)
APIs (used to create and modify AWS resources) that may be
unavailable in an emergency. Further, by pre-creating IAM
resources, you do not need to account for
[potential
delays due to eventual consistency.](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency)
- Include emergency access processes as part of your incident
management plans
([SEC10-BP02](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_develop_management_plans.html)).
Document how emergency events are tracked and communicated to
others in your organization such as peer teams, your
leadership, and, when applicable, externally to your customers
and business partners.
- Define the emergency access request process in your existing
service request workflow system if you have one. Typically,
such workflow systems allow you to create intake forms to
collect information about the request, track the request
through each stage of the workflow, and add both automated and
manual approval steps. Relate each request with a
corresponding emergency event tracked in your incident
management system. Having a uniform system for emergency
accesses allows you to track those requests in a single
system, analyze usage trends, and improve your processes.
- Verify that your emergency access processes can only be
initiated by authorized users and require approvals from the
user's peers or management as appropriate. The approval
process should operate effectively both inside and outside
business hours. Define how requests for approval allow
secondary approvers if the primary approvers are unavailable
and are escalated up your management chain until approved.
- Implement robust logging, monitoring, and alerting mechanisms
for the emergency access process and mechanisms. Generate
detailed audit logs for all successful and failed attempts to
gain emergency access. Correlate the activity with ongoing
emergency events from your incident management system, and
initiate alerts when actions occur outside of expected time
periods or when the emergency access account is used during
normal operations. The emergency access account should only be
accessed during emergencies, as break-glass procedures can be
considered a backdoor. Integrate with your security
information and event management (SIEM) tool or
[AWS Security Hub CSPM](https://aws.amazon.com/security-hub/) to report and audit all activities during
the emergency access period. Upon returning to normal
operations, automatically rotate the emergency access
credentials, and notify the relevant teams.
- Test emergency access processes periodically to verify that
the steps are clear and grant the correct level of access
quickly and efficiently. Your emergency access processes
should be tested as part of incident response simulations
([SEC10-BP07](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_incident_response_run_game_days.html))
and disaster recovery tests
([REL13-BP03](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_for_recovery_dr_tested.html)).

**Failure Mode 1: Identity provider used to
federate to AWS is unavailable**

As described in
[SEC02-BP04
Rely on a centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html), we recommend
relying on a centralized identity provider to federate your
workforce users to grant access to AWS accounts. You can federate
to multiple AWS accounts in your AWS organization using IAM Identity Center, or you can federate to individual AWS accounts
using IAM. In both cases, workforce users authenticate with
your centralized identity provider before being redirected to an
AWS sign-in endpoint to single sign-on.

In the unlikely event that your centralized identity provider is
unavailable, your workforce users can't federate to AWS accounts
or manage their workloads. In this emergency event, you can
provide an emergency access process for a small set of
administrators to access AWS accounts to perform critical tasks
that cannot wait until your centralized identity providers are
back online. For example, your identity provider is unavailable
for 4 hours and during that period you need to modify the upper
limits of an Amazon EC2 Auto Scaling group in a Production account to
handle an unexpected spike in customer traffic. Your emergency
administrators should follow the emergency access process to gain
access to the specific production AWS account and make the
necessary changes.

The emergency access process relies on a pre-created emergency
access AWS account that is used solely for emergency access and
has AWS resources (such as IAM roles and IAM users) to support the
emergency access process. During normal operations, no one should
access the emergency access account and you must monitor and alert
on the misuse of this account (for more detail, see the preceding
Common guidance section).

The emergency access account has emergency access IAM roles with
permissions to assume cross-account roles in the AWS accounts that
require emergency access. These IAM roles are pre-created and
configured with trust policies that trust the emergency account's
IAM roles.

The emergency access process can use one of the following
approaches:

- You can pre-create a set of
[IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html) for your emergency administrators in the
emergency access account with associated strong passwords and
MFA tokens. These IAM users have permissions to assume the IAM
roles that then allow cross-account access to the AWS account
where emergency access is required. We recommend creating as
few such users as possible and assigning each user to a single
emergency administrator. During an emergency, an emergency
administrator user signs into the emergency access account
using their password and MFA token code, switches to the
emergency access IAM role in the emergency account, and
finally switches to the emergency access IAM role in the
workload account to perform the emergency change action. The
advantage of this approach is that each IAM user is assigned
to one emergency administrator and you can know which user
signed-in by reviewing CloudTrail events. The disadvantage is
that you have to maintain multiple IAM users with their
associated long-lived passwords and MFA tokens.
- You can use the emergency access
[AWS account root user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html) to sign into the emergency access
account, assume the IAM role for emergency access, and assume
the cross-account role in the workload account. We recommend
setting a strong password and multiple MFA tokens for the root
user. We also recommend storing the password and the MFA
tokens in a secure enterprise credential vault that enforces
strong authentication and authorization. You should secure the
password and MFA token reset factors: set the email address
for the account to an email distribution list that is
monitored by your cloud security administrators, and the phone
number of the account to a shared phone number that is also
monitored by security administrators. The advantage of this
approach is that there is one set of root user credentials to
manage. The disadvantage is that since this is a shared user,
multiple administrators have ability to sign in as the root
user. You must audit your enterprise vault log events to
identify which administrator checked out the root user
password.

**Failure Mode 2: Identity provider
configuration on AWS is modified or has expired**

To allow your workforce users to federate to AWS accounts, you can
configure the IAM Identity Center with an external identity
provider or create an IAM Identity Provider
([SEC02-BP04](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html)).
Typically, you configure these by importing a SAML meta-data XML
document provided by your identity provider. The meta-data XML
document includes a X.509 certificate corresponding to a private
key that the identity provider uses to sign its SAML assertions.

These configurations on the AWS-side may be modified or deleted by
mistake by an administrator. In another scenario, the X.509
certificate imported into AWS may expire and a new meta-data XML
with a new certificate has not yet been imported into AWS. Both
scenarios can break federation to AWS for your workforce users,
resulting in an emergency.

In such an emergency event, you can provide your identity
administrators access to AWS to fix the federation issues. For
example, your identity administrator uses the emergency access
process to sign into the emergency access AWS account, switches to
a role in the Identity Center administrator account, and updates
the external identity provider configuration by importing the
latest SAML meta-data XML document from your identity provider to
re-enable federation. Once federation is fixed, your workforce
users continue to use the normal operating process to federate
into their workload accounts.

You can follow the approaches detailed in the previous Failure
Mode 1 to create an emergency access
process. You can grant least-privilege permissions to your
identity administrators to access only the Identity Center
administrator account and perform actions on Identity Center in
that account.

**Failure Mode 3: Identity Center
disruption**

In the unlikely event of an IAM Identity Center or AWS Region
disruption, we recommend that you set up a configuration that you
can use to provide temporary access to the AWS Management Console.

The emergency access process uses direct federation from your
identity provider to IAM in an emergency account. For detail
on the process and design considerations, see
[Set
up emergency access to the AWS Management Console](https://docs.aws.amazon.com/singlesignon/latest/userguide/emergency-access.html).

### Implementation steps

**Common steps for all failure
modes**

- Create an AWS account dedicated to emergency access
processes. Pre-create the IAM resources needed in the
account such as IAM roles or IAM users, and optionally IAM
Identity Providers. Additionally, pre-create cross-account
IAM roles in the workload AWS accounts with trust
relationships with corresponding IAM roles in the emergency
access account. You can use
[CloudFormation
StackSets with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudformation.html) to create such
resources in the member accounts in your organization.

- Create AWS Organizations
[service
control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) (SCPs) to deny the deletion and
modification of the cross-account IAM roles in the member
AWS accounts.
- Enable CloudTrail for the emergency access AWS account and
send the trail events to a central S3 bucket in your log
collection AWS account. If you are using AWS Control Tower
to set up and govern your AWS multi-account environment,
then every account you create using AWS Control Tower or enroll
in AWS Control Tower has CloudTrail enabled by default and sent
to an S3 bucket in a dedicated log archive AWS account.
- Monitor the emergency access account for activity by
creating EventBridge rules that match on console login and
API activity by the emergency IAM roles. Send notifications
to your security operations center when activity happens
outside of an ongoing emergency event tracked in your
incident management system.

**Additional steps for Failure Mode 1:
Identity provider used to federate to AWS is unavailable and
Failure Mode 2: Identity provider configuration on AWS is
modified or has expired**

- Pre-create resources depending on the mechanism you choose
for emergency access:

**Using IAM users:**
pre-create the IAM users with strong passwords and
associated MFA devices.
- **Using the emergency account root
user:** configure the root user with a strong
password and store the password in your enterprise
credential vault. Associate multiple physical MFA
devices with the root user and store the devices in
locations that can be accessed quickly by members of
your emergency administrator team.

**Additional steps for Failure Mode 3:
Identity center disruption**

- As detailed in
[Set
up emergency access to the AWS Management Console](https://docs.aws.amazon.com/singlesignon/latest/userguide/emergency-access.html), in
the emergency access AWS account, create an IAM Identity
Provider to enable direct SAML federation from your identity
provider.
- Create emergency operations groups in your IdP with no
members.
- Create IAM roles corresponding to the emergency operations
groups in the emergency access account.

## Resources

**Related Well-Architected best
practices:**

- [SEC02-BP04
Rely on a centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_identities_identity_provider.html)
- [SEC03-BP02
Grant least privilege access](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_permissions_least_privileges.html)
- [SEC10-BP02
Develop incident management plans](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_incident_response_develop_management_plans.html)
- [SEC10-BP07
Run game days](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_incident_response_run_game_days.html)

**Related documents:**

- [Set
up emergency access to the AWS Management Console](https://docs.aws.amazon.com/singlesignon/latest/userguide/emergency-access.html)
- [Enabling
SAML 2.0 federated users to access the AWS Management Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html)
- [Break
glass access](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/break-glass-access.html)

**Related videos:**

- [AWS re:Invent
2022 - Simplify your existing workforce access with IAM Identity Center](https://youtu.be/TvQN4OdR_0Y)
- [AWS re:Inforce
2022 - AWS Identity and Access Management (IAM) deep dive](https://youtu.be/YMj33ToS8cI)

**Related examples:**

- [AWS Break Glass Role](https://github.com/awslabs/aws-break-glass-role)
- [AWS customer playbook framework](https://github.com/aws-samples/aws-customer-playbook-framework)
- [AWS incident response playbook samples](https://github.com/aws-samples/aws-incident-response-playbooks)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_emergency_process.html*

---

# SEC03-BP04 Reduce permissions continuously

As your teams determine what access is required, remove unneeded permissions and establish review processes to achieve least privilege permissions. Continually monitor and remove unused identities and permissions for both human and machine access.

**Desired outcome:** Permission policies should adhere to the least privilege principle. As job duties and roles become better defined, your permission policies need to be reviewed to remove unnecessary permissions. This approach lessens the scope of impact should credentials be inadvertently exposed or otherwise accessed without authorization.

**Common anti-patterns:**

- Defaulting to granting users administrator permissions.
- Creating policies that are overly permissive, but without full administrator privileges.
- Keeping permission policies after they are no longer needed.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

As teams and projects are just getting started, permissive permission policies might be used to inspire innovation and agility. For example, in a development or test environment, developers can be given access to a broad set of AWS services. We recommend that you evaluate access continuously and restrict access to only those services and service actions that are necessary to complete the current job. We recommend this evaluation for both human and machine identities. Machine identities, sometimes called system or service accounts, are identities that give AWS access to applications or servers. This access is especially important in a production environment, where overly permissive permissions can have a broad impact and potentially expose customer data.

AWS provides multiple methods to help identify unused users, roles, permissions, and credentials. AWS can also help analyze access activity of IAM users and roles, including associated access keys, and access to AWS resources such as objects in Amazon S3 buckets. AWS Identity and Access Management Access Analyzer policy generation can assist you in creating restrictive permission policies based on the actual services and actions a principal interacts with. [Attribute-based access control (ABAC)](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html) can help simplify permissions management, as you can provide permissions to users using their attributes instead of attaching permissions policies directly to each user.

### Implementation steps

- **Use [AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html):** IAM Access Analyzer helps identify resources in your organization and accounts, such as Amazon Simple Storage Service (Amazon S3) buckets or IAM roles that are [shared with an external entity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html).
- **Use [IAM Access Analyzer policy generation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html):** IAM Access Analyzer policy generation helps you [create fine-grained permission policies based on an IAM user or role’s access activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html#access-analyzer-policy-generation-howitworks).
- **Test permissions across lower
environments before production:** Start by using
the
[less
critical sandbox and development environments](https://docs.aws.amazon.com/prescriptive-guidance/latest/choosing-git-branch-approach/understanding-the-devops-environments.html) to test
the permissions required for various job functions using IAM Access Analyzer. Then, progressively tighten and validate
these permissions across the testing, quality assurance, and
staging environments before applying them to production. The
lower environments can have more relaxed permissions
initially, as service control policies (SCPs) enforce
guardrails by limiting the maximum permissions granted.
- **Determine an acceptable timeframe and usage policy for IAM users and roles:** Use the [last accessed timestamp](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor-view-data.html) to [identify unused users and roles](https://aws.amazon.com/blogs/security/identify-unused-iam-roles-remove-confidently-last-used-timestamp/) and remove them. Review service and action last accessed information to identify and [scope permissions for specific users and roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html). For example, you can use last accessed information to identify the specific Amazon S3 actions that your application role requires and restrict the role’s access to only those actions. Last accessed information features are available in the AWS Management Console and programmatically allow you to incorporate them into your infrastructure workflows and automated tools.
- **Consider [logging data events in AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html):** By default, CloudTrail does not log data events such as Amazon S3 object-level activity (for example, `GetObject` and `DeleteObject`) or Amazon DynamoDB table activities (for example, `PutItem` and `DeleteItem`). Consider using logging for these events to determine what users and roles need access to specific Amazon S3 objects or DynamoDB table items.

## Resources

**Related documents:**

- [Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)
- [Remove unnecessary credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#remove-credentials)
- [What is AWS CloudTrail?](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [Working with Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage.html)
- [Logging and monitoring DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/MonitoringDynamoDB.html)
- [Using CloudTrail event logging for Amazon S3 buckets and objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-cloudtrail-logging-for-s3.html)
- [Getting credential reports for your AWS account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html)

**Related videos:**

- [Become an IAM Policy Master in 60 Minutes or
Less](https://youtu.be/YQsK4MtsELU)
- [Separation of Duties, Least Privilege,
Delegation, and CI/CD](https://youtu.be/3H0i7VyTu70)
- [AWS re:Inforce 2022 - AWS Identity and Access Management (IAM) deep dive](https://www.youtube.com/watch?v=YMj33ToS8cI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_continuous_reduction.html*

---

# SEC03-BP05 Define permission guardrails for your organization

Use permission guardrails to reduce the scope of available
permissions that can be granted to principals. The permission policy
evaluation chain includes your guardrails to determine the
*effective permissions* of a principal when
making authorization decisions.  You can define guardrails using a
layer-based approach. Apply some guardrails broadly across your
entire organization and apply others granularly to temporary access
sessions.

**Desired outcome:** You have clear
isolation of environments using separate AWS accounts.  Service
control policies (SCPs) are used to define organization-wide
permission guardrails. Broader guardrails are set at the hierarchy
levels closest to your organization root, and more strict guardrails
are set closer to the level of individual accounts.

Where supported, resource policies define the conditions that a
principal must satisfy to gain access to a resource. Resource
policies also scope down the set of allowable actions, where
appropriate. Permission boundaries are placed on principals that
manage workload permissions, delegating permission management to
individual workload owners.

**Common anti-patterns:**

- Creating member AWS accounts within an
[AWS Organization](https://aws.amazon.com/organizations/), but not using SCPs to restrict the use and
permissions available to their root credentials.
- Assigning permissions based on least privilege, but not placing
guardrails on the maximum set of permissions that can be
granted.
- Relying on the *implicit deny* foundation of
AWS IAM to restrict permissions, trusting that policies will not
grant an undesired *explicit
allow* permission.
- Running multiple workload environments in the same AWS account,
and then relying on mechanisms such as VPCs, tags, or resource
policies to enforce permission boundaries.

**Benefits of establishing this best
practice:** Permission guardrails help build confidence
that undesired permissions cannot be granted, even when a permission
policy attempts to do so.  This can simplify defining and managing
permissions by reducing the maximum scope of permissions needing
consideration.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

We recommend you use a layer-based approach to define permission
guardrails for your organization. This approach systematically
reduces the maximum set of possible permissions as additional
layers are applied. This helps you grant access based on the
principle of least privilege, reducing the risk of unintended
access due to policy misconfiguration.

The first step to establish permission guardrails is to isolate
your workloads and environments into separate AWS accounts.
Principals from one account cannot access resources in another
account without explicit permission to do so, even when both
accounts are in the same AWS organization or under the same
[organizational
unit (OU)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html). You can use OUs to group accounts you want to
administer as a single unit.

The next step is to reduce the maximum set of permissions that you
can grant to principals within the member accounts of your
organization. You can
use [service
control policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) for this purpose, which you can
apply to either an OU or an account. SCPs can enforce common
access controls, such as restricting access to specific AWS Regions, help prevent resources from being deleted, or disabling
potentially risky service actions. SCPs that you apply to the root
of your organization only affect its member accounts, not the
management account.  SCPs only govern the principals within your
organization. Your SCPs don't govern principals outside your
organization that are accessing your resources.

If you are using
[AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html), you can leverage its
[controls](https://docs.aws.amazon.com/controltower/latest/userguide/how-control-tower-works.html#how-controls-work)
and
[landing
zones](https://docs.aws.amazon.com/controltower/latest/userguide/aws-multi-account-landing-zone.html) as the foundation for your permission guardrails and
multi-account environment. The landing zones provide a
pre-configured, secure baseline environment with separate accounts
for different workloads and applications. The guardrails enforce
mandatory controls around security, operations, and compliance
through a combination of Service Control Policies (SCPs), AWS Config rules, and other configurations. However, when using
Control Tower guardrails and landing zones alongside custom
Organization SCPs, it's crucial to follow the best practices
outlined in the AWS documentation to avoid conflicts and ensure
proper governance. Refer to the
[AWS Control Tower guidance for AWS Organizations](https://docs.aws.amazon.com/controltower/latest/userguide/orgs-guidance.html) for detailed
recommendations on managing SCPs, accounts, and organizational
units (OUs) within a Control Tower environment.

By adhering to these guidelines, you can effectively leverage
Control Tower's guardrails, landing zones, and custom SCPs while
mitigating potential conflicts and ensuring proper governance and
control over your multi-account AWS environment.

A further step is to use
[IAM
resource policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_resource-based) to scope the available actions that you
can take on the resources they govern, along with any conditions
that the acting principal must meet. This can be as broad as
allowing all actions so long as the principal is part of your
organization (using the
PrincipalOrgId [condition
key](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html)), or as granular as only allowing specific actions by a
specific IAM role. You can take a similar approach with conditions
in IAM role trust policies.  If a resource or role trust policy
explicitly names a principal in the same account as the role or
resource it governs, that principal does not need an attached IAM
policy that grants the same permissions.  If the principal is in a
different account from the resource, then the principal does need
an attached IAM policy that grants those permissions.

Often, a workload team will want to manage the permissions their
workload requires.  This may require them to create new IAM roles
and permission policies.  You can capture the maximum scope of
permissions the team is allowed to grant in an
[IAM
permission boundary](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html), and associate this document to an IAM
role the team can then use to manage their IAM roles and
permissions.  This approach can provide them the flexibility to
complete their work while mitigating risks of having IAM
administrative access.

A more granular step is to implement *privileged access
management* (PAM) and *temporary elevated
access management* (TEAM) techniques.  One example of
PAM is to require principals to perform multi-factor
authentication before taking privileged actions.  For more
information, see
[Configuring
MFA-protected API access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_configure-api-require.html). TEAM requires a solution that
manages the approval and timeframe that a principal is allowed to
have elevated access.  One approach is to temporarily add the
principal to the role trust policy for an IAM role that has
elevated access.  Another approach is to, under normal operation,
scope down the permissions granted to a principal by an IAM role
using a
[session
policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session), and then temporarily lift this restriction during
the approved time window. To learn more about solutions that AWS
and select partners validated, see
[Temporary
elevated access](https://docs.aws.amazon.com/singlesignon/latest/userguide/temporary-elevated-access.html).

### Implementation steps

- Isolate your workloads and environments into separate AWS accounts.
- Use SCPs to reduce the maximum set of permissions that can
be granted to principals within the member accounts of your
organization.

When defining SCPs to reduce the maximum set of
permissions that can be granted to principals within
your organization's member accounts, you can choose
between an *allow list* or
*deny list* approach. The allow list
strategy explicitly specifies the access that is allowed
and implicitly blocks all other access. The deny list
strategy explicitly specifies the access that isn't
allowed and allows all other access by default. Both
strategies have their advantages and trade-offs, and the
appropriate choice depends on your organization's
specific requirements and risk model. For more detail,
see
[Strategy
for using SCPs](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_strategies.html).
- Additionally, review the
[service
control policy examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html) to understand how to
construct SCPs effectively.

- Use IAM resource policies to scope down and specify
conditions for permitted actions on resources.  Use
conditions in IAM role trust policies to create restrictions
on assuming roles.
- Assign IAM permission boundaries to IAM roles that workload
teams can then use to manage their own workload IAM roles
and permissions.
- Evaluate PAM and TEAM solutions based on your needs.

## Resources

**Related documents:**

- [Data
perimeters on AWS](https://aws.amazon.com/identity/data-perimeters-on-aws/)
- [Establish
permissions guardrails using data perimeters](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_data-perimeters.html)
- [Policy
evaluation logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)

**Related examples:**

- [Service
control policy examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html)

**Related tools:**

- [AWS Solution: Temporary Elevated Access Management](https://aws-samples.github.io/iam-identity-center-team/)
- [Validated
security partner solutions for TEAM](https://docs.aws.amazon.com/singlesignon/latest/userguide/temporary-elevated-access.html#validatedpartners)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_define_guardrails.html*

---

# SEC03-BP06 Manage access based on lifecycle

Monitor and adjust the permissions granted to your principals
(users, roles, and groups) throughout their lifecycle within your
organization. Adjust group memberships as users change roles, and
remove access when a user leaves the organization.

**Desired outcome:** You monitor and
adjust permissions throughout the lifecycle of principals within the
organization, reducing risk of unnecessary privileges. You grant
appropriate access when you create a user. You modify access as the
user's responsibilities change, and you remove access when the user
is no longer active or has left the organization. You centrally
manage changes to your users, roles, and groups. You use automation
to propagate changes to your AWS environments.

**Common anti-patterns:**

- Granting excessive or broad access privileges to identities
upfront, beyond what is initially required.
- Not reviewing and adjusting access privileges as identities'
roles and responsibilities change over time.
- Leaving inactive or terminated identities with active access
privileges. This increases the risk of unauthorized access.
- Not leveraging automation to manage the lifecycle of identities.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Carefully manage and adjust access privileges that you grant to
identities (such as users, roles, groups) throughout their
lifecycle. This lifecycle includes the initial onboarding phase,
ongoing changes in roles and responsibilities, and eventual
offboarding or termination. Proactively manage access based on the
stage of the lifecycle to maintain the appropriate access level.
Adhere to the principle of least privilege to reduce the risk of
excessive or unnecessary access Privileges.

You can manage the lifecycle of IAM users directly within the AWS account, or through federation from your workforce identity
provider to
[AWS IAM Identity Center](https://aws.amazon.com/iam/identity-center/). For IAM users, you can create, modify,
and delete users and their associated permissions within the AWS account. For federated users, you can use IAM Identity Center to
manage their lifecycle by synchronizing user and group information
from your organization's identity provider using the
[System
for Cross-domain Identity Management](https://docs.aws.amazon.com/singlesignon/latest/developerguide/what-is-scim.html) (SCIM) protocol.

SCIM is an open standard protocol for automated provisioning and
deprovisioning of user identities across different systems. By
integrating your identity provider with IAM Identity Center using
SCIM, you can automatically synchronize user and group
information, helping to validate that access privileges are
granted, modified, or revoked based on changes in your
organization's authoritative identity source.

As the roles and responsibilities of employees change within your
organization, adjust their access privileges accordingly. You can
use IAM Identity Center's permission sets to define different job
roles or responsibilities and associate them with the appropriate
IAM policies and permissions. When an employee's role changes, you
can update their assigned permission set to reflect their new
responsibilities. Verify that they have the necessary access while
adhering to the principle of least privilege.

### Implementation steps

- Define and document an access management lifecycle process,
including procedures for granting initial access, periodic
reviews, and offboarding.
- Implement
[IAM
roles, groups, and permissions boundaries](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) to manage
access collectively and enforce maximum permissible access
levels.
- Integrate with a
[federated
identity provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html) (such as Microsoft Active
Directory, Okta, Ping Identity) as the authoritative source
for user and group information using IAM Identity Center.
- Use the
[SCIM](https://docs.aws.amazon.com/singlesignon/latest/developerguide/what-is-scim.html)
protocol to synchronize user and group information from the
identity provider into IAM Identity Center's Identity Store.
- Create
[permission
sets](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html) in IAM Identity Center that represent different
job roles or responsibilities within your organization.
Define the appropriate IAM policies and permissions for each
permission set.
- Implement regular access reviews, prompt access revocation,
and continuous improvement of the access management
lifecycle process.
- Provide training and awareness to employees on access
management best practices.

## Resources

**Related best practices:**

- [SEC02-BP04 Rely on a
centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_identities_identity_provider.html)

**Related documents:**

- [Manage
your identity source](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source.html)
- [Manage
identities in IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-sso.html)
- [Using
AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html)
- [IAM Access Analyzer policy generation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-policy-generation.html)

**Related videos:**

- [AWS re:Inforce 2023 - Manage temporary elevated access with AWS
IAM Identity Center](https://www.youtube.com/watch?v=a1Na2G7TTQ0)
- [AWS re:Invent 2022 - Simplify your existing workforce access with
IAM Identity Center](https://www.youtube.com/watch?v=TvQN4OdR_0Y&t=444s)
- [AWS re:Invent 2022 - Harness power of IAM policies & rein in
permissions w/Access Analyzer](https://www.youtube.com/watch?v=x-Kh8hKVX74&list=PL2yQDdvlhXf8bvQJuSP1DQ8vu75jdttlM&index=11)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_lifecycle.html*

---

# SEC03-BP07 Analyze public and cross-account access

Continually monitor findings that highlight public and cross-account access. Reduce public access and cross-account access to only the specific resources that require this access.

**Desired outcome:** Know which of your AWS resources are shared and with whom. Continually monitor and audit your shared resources to verify they are shared with only authorized principals.

**Common anti-patterns:**

- Not keeping an inventory of shared resources.
- Not following a process for approval of cross-account or public access to resources.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

If your account is in AWS Organizations, you can grant access to resources to the entire organization, specific organizational units, or individual accounts. If your account is not a member of an organization, you can share resources with individual accounts. You can grant direct cross-account access using resource-based policies — for example, [Amazon Simple Storage Service (Amazon S3) bucket policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-policies.html) — or by allowing a principal in another account to assume an IAM role in your account. When using resource policies, verify that access is only granted to authorized principals. Define a process to approve all resources which are required to be publicly available.

[AWS Identity and Access Management Access Analyzer](https://aws.amazon.com/iam/features/analyze-access/) uses [provable security](https://aws.amazon.com/security/provable-security/) to identify all access paths to a resource from outside of its account. It reviews resource policies continuously, and reports findings of public and cross-account access to make it simple for you to analyze potentially broad access. Consider configuring IAM Access Analyzer with AWS Organizations to verify that you have visibility to all your accounts. IAM Access Analyzer also allows you to [preview findings](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-access-preview.html) before deploying resource permissions. This allows you to validate that your policy changes grant only the intended public and cross-account access to your resources. When designing for multi-account access, you can use [trust policies](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/) to control in what cases a role can be assumed. For example, you could use the [PrincipalOrgId condition key to deny an attempt to assume a role from outside your AWS Organizations](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/).

[AWS Config can report resources](https://docs.aws.amazon.com/config/latest/developerguide/operational-best-practices-for-Publicly-Accessible-Resources.html) that are misconfigured, and
through AWS Config policy checks, can detect resources that have
public access configured. Services such as
[AWS Control Tower](https://aws.amazon.com/controltower/) and
[AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html) simplify deploying detective controls and
guardrails across AWS Organizations to identify and remediate
publicly exposed resources. For example, AWS Control Tower has a
managed guardrail which can detect if any
[Amazon EBS snapshots are restorable by AWS accounts](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html).

### Implementation steps

- **Consider using [AWS Config for AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html):** AWS Config allows you to aggregate findings from multiple accounts within an AWS Organizations to a delegated administrator account. This provides a comprehensive view, and allows you to [deploy AWS Config Rules across accounts to detect publicly accessible resources](https://docs.aws.amazon.com/config/latest/developerguide/config-rule-multi-account-deployment.html).
- **Configure AWS Identity and Access Management Access Analyzer:** IAM Access Analyzer helps you identify resources in your organization and accounts, such as Amazon S3 buckets or IAM roles that are [shared with an external entity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html).
- **Use auto-remediation in AWS Config to respond to changes in public access configuration of Amazon S3 buckets:** [You can automatically turn on the block public access settings for Amazon S3 buckets](https://aws.amazon.com/blogs/security/how-to-use-aws-config-to-monitor-for-and-respond-to-amazon-s3-buckets-allowing-public-access/).
- **Implement monitoring and alerting to
identify if Amazon S3 buckets have become public:**
You must have
[monitoring
and alerting](https://aws.amazon.com/blogs/aws/amazon-s3-update-cloudtrail-integration/) in place to identify when Amazon S3
Block Public Access is turned off, and if Amazon S3 buckets
become public. Additionally, if you are using AWS Organizations, you can create a
[service
control policy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) that prevents changes to Amazon S3
public access policies.
[AWS Trusted Advisor](https://docs.aws.amazon.com/awssupport/latest/user/trusted-advisor.html) checks for Amazon S3 buckets that
have open access permissions. Bucket permissions that grant,
upload, or delete access to everyone create potential
security issues by allowing anyone to add, modify, or remove
items in a bucket. The Trusted Advisor check examines
explicit bucket permissions and associated bucket policies
that might override the bucket permissions. You also can use
AWS Config to monitor your Amazon S3 buckets for public
access. For more information, see
[How
to Use AWS Config to Monitor for and Respond to Amazon S3
Buckets Allowing Public Access](https://aws.amazon.com/blogs/security/how-to-use-aws-config-to-monitor-for-and-respond-to-amazon-s3-buckets-allowing-public-access/).

When reviewing access controls for Amazon S3 buckets, it is
important to consider the nature of the data stored within them.
[Amazon Macie](https://docs.aws.amazon.com/macie/latest/user/findings-types.html) is a service designed to help you discover and
protect sensitive data, such as Personally Identifiable
Information (PII), Protected Health Information (PHI), and
credentials like private keys or AWS access keys.

## Resources

**Related documents:**

- [Using
AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html?ref=wellarchitected)
- [AWS Control Tower controls library](https://docs.aws.amazon.com/controltower/latest/userguide/controls-reference.html)
- [AWS Foundational
Security Best Practices standard](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp.html)
- [AWS Config
Managed Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html)
- [AWS Trusted Advisor
check reference](https://docs.aws.amazon.com/awssupport/latest/user/trusted-advisor-check-reference.html)
- [Monitoring AWS Trusted Advisor check results with Amazon EventBridge](https://docs.aws.amazon.com/awssupport/latest/user/cloudwatch-events-ta.html)
- [Managing AWS Config Rules Across All Accounts in Your Organization](https://docs.aws.amazon.com/config/latest/developerguide/config-rule-multi-account-deployment.html)
- [AWS Config and AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html)
- [Make your AMI publicly available for use in Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sharingamis-intro.html#block-public-access-to-amis)

**Related videos:**

- [Best Practices for securing
your multi-account environment](https://www.youtube.com/watch?v=ip5sn3z5FNg)
- [Dive Deep into
IAM Access Analyzer](https://www.youtube.com/watch?v=i5apYXya2m0)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_analyze_cross_account.html*

---

# SEC03-BP08 Share resources securely within your organization

As the number of workloads grows, you might need to share access to resources in those workloads or provision
the resources multiple times across multiple accounts. You might have constructs to compartmentalize your
environment, such as having development, testing, and production environments. However, having separation
constructs does not limit you from being able to share securely. By sharing components that overlap, you
can reduce operational overhead and allow for a consistent experience without guessing what you might have
missed while creating the same resource multiple times.

**Desired outcome:** Minimize unintended access by using secure methods to share
resources within your organization, and help with your data loss prevention initiative. Reduce your
operational overhead compared to managing individual components, reduce errors from manually creating
the same component multiple times, and increase your workloads’ scalability. You can benefit from decreased
time to resolution in multi-point failure scenarios, and increase your confidence in determining when a
component is no longer needed. For prescriptive guidance on analyzing externally shared resources,
see [SEC03-BP07 Analyze public and cross-account access](./sec_permissions_analyze_cross_account.html).

**Common anti-patterns:**

- Lack of process to continually monitor and automatically alert on unexpected external share.
- Lack of baseline on what should be shared and what should not.
- Defaulting to a broadly open policy rather than sharing explicitly when required.
- Manually creating foundational resources that overlap when required.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Architect your access controls and patterns to govern the consumption of shared resources securely and
only with trusted entities. Monitor shared resources and review shared resource access continuously,
and be alerted on inappropriate or unexpected sharing. Review
[Analyze public and cross-account access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_analyze_cross_account.html)
to help you establish governance to reduce the external access to only resources that require it, and to
establish a process to monitor continuously and alert automatically.

Cross-account sharing within AWS Organizations is supported by [a number of AWS services](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html),
such as [AWS Security Hub CSPM](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-securityhub.html),
[Amazon GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_organizations.html),
and [AWS Backup](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-backup.html).
These services allow for data to be shared to a central account, be accessible from a central account, or manage resources
and data from a central account. For example, AWS Security Hub CSPM can transfer findings from individual accounts to a
central account where you can view all the findings. AWS Backup can take a backup for a resource and share it
across accounts. You can use [AWS Resource Access Manager](https://aws.amazon.com/ram/) (AWS RAM) to share other
common resources, such as [VPC subnets and Transit Gateway attachments](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-vpc),
[AWS Network Firewall](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-network-firewall),
or [Amazon SageMaker AI pipelines](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html#shareable-sagemaker).

To restrict your account to only share resources within your organization, use
[service control policies (SCPs)](https://docs.aws.amazon.com/ram/latest/userguide/scp.html)
to prevent access to external principals. When sharing resources, combine identity-based controls and
network controls to [create a data perimeter for your organization](https://docs.aws.amazon.com/whitepapers/latest/building-a-data-perimeter-on-aws/building-a-data-perimeter-on-aws.html)
to help protect against unintended access. A data perimeter is a set of preventive guardrails to help verify
that only your trusted identities are accessing trusted resources from expected networks. These controls place
appropriate limits on what resources can be shared and prevent sharing or exposing resources that should not be
allowed. For example, as a part of your data perimeter, you can use VPC endpoint policies and the
`AWS:PrincipalOrgId` condition to ensure the identities accessing your Amazon S3 buckets
belong to your organization. It is important to note that
[SCPs do not apply to service-linked roles or AWS service principals](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html#scp-effects-on-permissions).

When using Amazon S3,
[turn off ACLs for your Amazon S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html)
and use IAM policies to define access control. For [restricting access to an Amazon S3 origin](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)
from [Amazon CloudFront](https://aws.amazon.com/cloudfront/), migrate from origin access identity (OAI) to origin access
control (OAC) which supports additional features including server-side encryption with
[AWS Key Management Service](https://aws.amazon.com/kms/).

In some cases, you might want to allow sharing resources outside of your organization or grant a third party
access to your resources. For prescriptive guidance on managing permissions to share resources externally,
see [Permissions management](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/permissions-management.html).

### Implementation steps

- **Use AWS Organizations:** AWS Organizations is an account management service that allows you to consolidate multiple AWS accounts
into an organization that you create and centrally manage. You can group your accounts into
organizational units (OUs) and attach different policies to each OU to help you meet your
budgetary, security, and compliance needs. You can also control how AWS artificial intelligence (AI)
and machine learning (ML) services can collect and store data, and use the multi-account management of
the AWS services integrated with Organizations.
- **Integrate AWS Organizations with AWS services:** When you use an AWS service to perform tasks on your behalf in the member accounts of your organization,
AWS Organizations creates an IAM service-linked role (SLR) for that service in each member account. You should
manage trusted access using the AWS Management Console, the AWS APIs, or the AWS CLI. For prescriptive guidance on
turning on trusted access, see [Using AWS Organizations with other AWS services](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
and [AWS services
that you can use with Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html).
- **Establish a data
perimeter:** A data perimeter provides a clear
boundary of trust and ownership. On AWS, it is typically
represented as your AWS organization managed by AWS Organizations, along with any on-premises networks or
systems that access your AWS resources. The goal of the data
perimeter is to verify that access is allowed if the
identity is trusted, the resource is trusted, and the
network is expected. However, establishing a data perimeter
is not a one-size-fits-all approach. Evaluate and adopt the
control objectives outlined in the
[Building
a Perimeter on AWS whitepaper](https://docs.aws.amazon.com/whitepapers/latest/building-a-data-perimeter-on-aws/welcome.html) based on your specific
security risk models and requirements. You should carefully
consider your unique risk posture and implement the
perimeter controls that align with your security needs.
- **Use resource sharing in AWS services and restrict accordingly:** Many AWS services allow you to share resources with another account, or target a resource in another
account, such as [Amazon Machine Images (AMIs)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
and [AWS Resource Access Manager (AWS RAM)](https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html).
Restrict the `ModifyImageAttribute` API to specify the trusted accounts to share the AMI with.
Specify the `ram:RequestedAllowsExternalPrincipals` condition when using AWS RAM to constrain sharing
to your organization only, to help prevent access from untrusted identities. For prescriptive guidance and
considerations, see [Resource sharing and external targets](https://docs.aws.amazon.com/whitepapers/latest/building-a-data-perimeter-on-aws/perimeter-implementation.html).
- **Use AWS RAM to share securely in an account or with other AWS accounts:** [AWS RAM](https://aws.amazon.com/ram/) helps you securely share the resources that you have
created with roles and users in your account and with other AWS accounts. In a multi-account
environment, AWS RAM allows you to create a resource once and share it with other accounts. This
approach helps reduce your operational overhead while providing consistency, visibility, and
auditability through integrations with Amazon CloudWatch and AWS CloudTrail, which you do not receive when
using cross-account access.

If you have resources that you shared previously using a resource-based policy, you can use the
[PromoteResourceShareCreatedFromPolicy API](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
or an equivalent to promote the resource share to a full AWS RAM resource share.

In some cases, you might need to take additional steps to share resources. For example,
to share an encrypted snapshot, you need to [share a AWS KMS key](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html#share-kms-key).

## Resources

**Related best practices:**

- [SEC03-BP07 Analyze public and cross-account access](./sec_permissions_analyze_cross_account.html)
- [SEC03-BP09 Share resources securely with a third party](./sec_permissions_share_securely_third_party.html)
- [SEC05-BP01 Create network layers](./sec_network_protection_create_layers.html)

**Related documents:**

- [Bucket owner granting cross-account permission to objects it does not
own](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-walkthroughs-managing-access-example4.html)
- [How to use Trust
Policies with IAM](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/)
- [Building Data Perimeter on AWS](https://docs.aws.amazon.com/whitepapers/latest/building-a-data-perimeter-on-aws/building-a-data-perimeter-on-aws.html)
- [How to use
an external ID when granting a third party access to your AWS resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)
- [AWS services you can use with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
- [Establishing a data perimeter on AWS: Allow only trusted identities to access company data](https://aws.amazon.com/blogs/security/establishing-a-data-perimeter-on-aws-allow-only-trusted-identities-to-access-company-data/)

**Related videos:**

- [Granular Access with
AWS Resource Access Manager](https://www.youtube.com/watch?v=X3HskbPqR2s)
- [Securing your data perimeter
with VPC endpoints](https://www.youtube.com/watch?v=iu0-o6hiPpI)
- [Establishing a data
perimeter on AWS](https://www.youtube.com/watch?v=SMi5OBjp1fI)

**Related tools:**

- [Data Perimeter Policy Examples](https://github.com/aws-samples/data-perimeter-policy-examples)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_share_securely.html*

---

# SEC03-BP09 Share resources securely with a third party

The security of your cloud environment doesn't stop at your
organization. Your organization might rely on a third party to
manage a portion of your data. The permission management for the
third-party managed system should follow the practice of
just-in-time access using the principle of least privilege with
temporary credentials. By working closely with a third party, you
can reduce the scope of impact and risk of unintended access
together.

**Desired outcome:** You avoid using
long-term AWS Identity and Access Management (IAM) credentials like
access keys and secret keys, as they pose a security risk if
misused. Instead, you use IAM roles and temporary credentials to
improve your security posture and minimize the operational overhead
of managing long-term credentials. When granting third-party access,
you use a universally unique identifier (UUID) as the external ID in
the IAM trust policy and keep the IAM policies attached to the role
under your control to ensure least privilege access. For
prescriptive guidance on analyzing externally shared resources, see
[SEC03-BP07 Analyze public and
cross-account access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_analyze_cross_account.html).

**Common anti-patterns:**

- Using the default IAM trust policy without any conditions.
- Using long-term IAM credentials and access keys.
- Reusing external IDs.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

You might want to allow sharing resources outside of AWS Organizations or grant a third party access to your account. For
example, a third party might provide a monitoring solution that
needs to access resources within your account. In those cases,
create an IAM cross-account role with only the privileges needed
by the third party. Additionally, define a trust policy using the
[external
ID condition](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html). When using an external ID, you or the third
party can generate a unique ID for each customer, third party, or
tenancy. The unique ID should not be controlled by anyone but you
after it's created. The third party must implement a process to
relate the external ID to the customer in a secure, auditable, and
reproduceable manner.

You can also use
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) to manage IAM roles for applications outside
of AWS that use AWS APIs.

If the third party no longer requires access to your environment,
remove the role. Avoid providing long-term credentials to a third
party. Maintain awareness of other AWS services that support
sharing, such as the AWS Well-Architected Tool allowing
[sharing
a workload](https://docs.aws.amazon.com/wellarchitected/latest/userguide/workloads-sharing.html) with other AWS accounts, and
[AWS Resource Access Manager](https://docs.aws.amazon.com/ram/latest/userguide/what-is.html) helping you securely share an AWS
resource you own with other accounts.

### Implementation steps

- **Use cross-account roles to provide
access to external accounts.**
[Cross-account
roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_third-party.html) reduce the amount of sensitive information that
is stored by external accounts and third parties for
servicing their customers. Cross-account roles allow you to
grant access to AWS resources in your account securely to a
third party, such as AWS Partners or other accounts in your
organization, while maintaining the ability to manage and
audit that access. The third party might be providing
service to you from a hybrid infrastructure or alternatively
pulling data into an offsite location.
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) helps you allow third-party workloads
to securely interact with your AWS workloads and further
reduce the need for long-term credentials.

You should not use long-term credentials or access keys
associated with users to provide external account access.
Instead, use cross-account roles to provide the
cross-account access.
- **Perform due diligence and ensure
secure access for third-party SaaS providers.**
When sharing resources with third-party SaaS providers,
perform thorough due diligence to ensure they have a secure
and responsible approach to accessing your AWS resources.
Evaluate their shared responsibility model to understand
what security measures they provide and what falls under
your responsibility. Ensure that the SaaS provider has a
secure and auditable process for accessing your resources,
including the use of
[external
IDs](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html) and least privilege access principles. The use of
external IDs helps address the
[confused
deputy problem](https://aws.amazon.com/blogs/security/how-to-use-external-id-when-granting-access-to-your-aws-resources/).

Implement security controls to ensure secure access and
adherence to the principle of least privilege when granting
access to third-party SaaS providers. This may include the
use of external IDs, universally unique identifiers (UUIDs),
and IAM trust policies that limit access to only what is
strictly necessary. Work closely with the SaaS provider to
establish secure access mechanisms, regularly review their
access to your AWS resources, and conduct audits to ensure
compliance with your security requirements.
- **Deprecate customer-provided
long-term credentials.** Deprecate the use of
long-term credentials and use cross-account roles or IAM
Roles Anywhere. If you must use long-term credentials,
establish a plan to migrate to role-based access. For
details on managing keys, see
[Identity
management](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/identity-management.html). Also, work with your AWS account team and
the third party to establish a risk mitigation runbook. For
prescriptive guidance on responding to and mitigating the
potential impact of a security incident, see
[Incident
response](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/incident-response.html).
- **Verify that setup has prescriptive
guidance or is automated.** The external ID is not
treated as a secret, but the external ID must not be an
easily guessable value, such as a phone number, name, or
account ID. Make the external ID a read-only field so that
the external ID cannot be changed for the purpose of
impersonating the setup.

You or the third party can generate the external ID. Define
a process to determine who is responsible for generating the
ID. Regardless of the entity creating the external ID, the
third party enforces uniqueness and formats consistently
across customers.

The policy created for cross-account access in your accounts
must follow the
[least-privilege
principle](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege). The third party must provide a role policy
document or automated setup mechanism that uses an AWS CloudFormation template or an equivalent for you. This
reduces the chance of errors associated with manual policy
creation and offers an auditable trail. For more information
on using an AWS CloudFormation template to create
cross-account roles, see
[Cross-Account
Roles](https://aws.amazon.com/blogs/apn/tag/cross-account-roles/).

The third party should provide an automated, auditable setup
mechanism. However, by using the role policy document
outlining the access needed, you should automate the setup
of the role. Using an AWS CloudFormation template or
equivalent, you should monitor for changes with drift
detection as part of the audit practice.
- **Account for changes.** Your
account structure, your need for the third party, or their
service offering being provided might change. You should
anticipate changes and failures, and plan accordingly with
the right people, process, and technology. Audit the level
of access you provide on a periodic basis, and implement
detection methods to alert you to unexpected changes.
Monitor and audit the use of the role and the datastore of
the external IDs. You should be prepared to revoke
third-party access, either temporarily or permanently, as a
result of unexpected changes or access patterns. Also,
measure the impact to your revocation operation, including
the time it takes to perform, the people involved, the cost,
and the impact to other resources.

For prescriptive guidance on detection methods, see the
[Detection best
practices](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/detection.html).

## Resources

**Related best practices:**

- [SEC02-BP02 Use
temporary credentials](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_unique.html)
- [SEC03-BP05 Define permission
guardrails for your organization](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_define_guardrails.html)
- [SEC03-BP06 Manage access
based on lifecycle](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_lifecycle.html)
- [SEC03-BP07 Analyze public and
cross-account access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_analyze_cross_account.html)
- [SEC04 Detection](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/detection.html)

**Related documents:**

- [Bucket
owner granting cross-account permission to objects it does not
own](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-walkthroughs-managing-access-example4.html)
- [How
to use trust policies with IAM roles](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/)
- [Delegate
access across AWS accounts using IAM roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html)
- [How
do I access resources in another AWS account using IAM?](https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-iam/)
- [Security
best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Cross-account
policy evaluation logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic-cross-account.html)
- [How
to use an external ID when granting access to your AWS
resources to a third party](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)
- [Collecting
Information from AWS CloudFormation Resources Created in
External Accounts with Custom Resources](https://aws.amazon.com/blogs/apn/collecting-information-from-aws-cloudformation-resources-created-in-external-accounts-with-custom-resources/)
- [Securely
Using External ID for Accessing AWS Accounts Owned by
Others](https://aws.amazon.com/blogs/apn/securely-using-external-id-for-accessing-aws-accounts-owned-by-others/)
- [Extend
IAM roles to workloads outside of IAM with IAM Roles
Anywhere](https://aws.amazon.com/blogs/security/extend-aws-iam-roles-to-workloads-outside-of-aws-with-iam-roles-anywhere/)

**Related videos:**

- [How
do I allow users or roles in a separate AWS account access to
my AWS account?](https://www.youtube.com/watch?v=20tr9gUY4i0)
- [AWS re:Invent 2018: Become an IAM Policy Master in 60 Minutes or
Less](https://www.youtube.com/watch?v=YQsK4MtsELU)
- [AWS Knowledge Center Live: IAM Best Practices and Design
Decisions](https://www.youtube.com/watch?v=xzDFPIQy4Ks)

**Related examples:**

- [Configure
cross-account access to Amazon DynamoDB](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/configure-cross-account-access-to-amazon-dynamodb.html)
- [AWS STS Network Query Tool](https://github.com/aws-samples/aws-sts-network-query-tool)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_share_securely_third_party.html*

---
