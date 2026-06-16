# SEC 2 — How do you manage identities for people and machines?

**Pillar**: Security  
**Best Practices**: 6

---

# SEC02-BP01 Use strong sign-in mechanisms

Sign-ins (authentication using sign-in credentials) can present
risks when not using mechanisms like multi-factor authentication
(MFA), especially in situations where sign-in credentials have been
inadvertently disclosed or are easily guessed. Use strong sign-in
mechanisms to reduce these risks by requiring MFA and strong
password policies.

**Desired outcome:** Reduce the risks
of unintended access to credentials in AWS by using strong sign-in
mechanisms for [AWS Identity and Access Management (IAM)](https://aws.amazon.com/iam/) users, the
[AWS account root user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html),
[AWS IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html), and
third-party identity providers. This means requiring MFA, enforcing
strong password policies, and detecting anomalous login behavior.

**Common anti-patterns:**

- Not enforcing a strong password policy for your identities
including complex passwords and MFA.
- Sharing the same credentials among different users.
- Not using detective controls for suspicious sign-ins.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

There are several ways for human identities to sign in to AWS. It
is an AWS best practice to rely on a centralized identity provider
using federation (direct SAML 2.0 federation between AWS IAM and
the centralized IdP or using AWS IAM Identity Center) when
authenticating to AWS. In this case, establish a secure sign-in
process with your identity provider or Microsoft Active Directory.

When you first open an AWS account, you begin with an AWS account
root user. You should only use the account root user to set up
access for your users (and for
[tasks
that require the root user](https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html)). It's important to turn on
multi-factor authentication (MFA) for the account root user
immediately after opening your AWS account and to secure the root
user using the
[AWS best practice guide](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_aws_account.html).

AWS IAM Identity Center is designed for workforce users, and you
can create and manage user identities within the service and
secure the sign-in process with MFA. AWS Cognito, on the other
hand, is designed for customer identity and access management
(CIAM), which provides user pools and identity providers for
external user identities in your applications.

If you create users in AWS IAM Identity Center, secure the sign-in
process in that service and
[turn
on MFA](https://docs.aws.amazon.com/singlesignon/latest/userguide/enable-mfa.html). For external user identities in your applications,
you can use
[Amazon Cognito user pools](https://docs.aws.amazon.com/cognito/index.html) and secure the sign-in process in that
service or through one of the supported identity providers in
Amazon Cognito user pools.

Additionally, for users in AWS IAM Identity Center, you can use
[AWS Verified Access](https://docs.aws.amazon.com/verified-access/latest/ug/what-is-verified-access.html) to provide an additional layer of security
by verifying the user's identity and device posture before they
are granted access to AWS resources.

If you are using
[AWS Identity and Access Management (IAM)](https://aws.amazon.com/iam/) users, secure the sign-in process
using IAM.

You can use both AWS IAM Identity Center and direct IAM federation
simultaneously to manage access to AWS. You can use IAM federation
to manage access to the AWS Management Console and services and IAM Identity Center to manage access to business applications like Quick or Amazon Q Business.

Regardless of the sign-in method, it's critical to enforce a
strong sign-in policy.

### Implementation steps

The following are general strong sign-in recommendations. The
actual settings you configure should be set by your company
policy or use a standard like
[NIST
800-63](https://pages.nist.gov/800-63-3/sp800-63b.html).

- Require MFA. It's an
[IAM
best practice to require MFA](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#enable-mfa-for-privileged-users) for human identities and
workloads. Turning on MFA provides an additional layer of
security requiring that users provide sign-in credentials
and a one-time password (OTP) or a cryptographically
verified and generated string from a hardware device.
- Enforce a minimum password length, which is a primary factor
in password strength.
- Enforce password complexity to make passwords more difficult
to guess.
- Allow users to change their own passwords.
- Create individual identities instead of shared credentials.
By creating individual identities, you can give each user a
unique set of security credentials. Individual users provide
the ability to audit each user's activity.

IAM Identity Center recommendations:

- IAM Identity Center provides a predefined
[password
policy](https://docs.aws.amazon.com/singlesignon/latest/userguide/password-requirements.html) when using the default directory that
establishes password length, complexity, and reuse
requirements.
- [Turn
on MFA](https://docs.aws.amazon.com/singlesignon/latest/userguide/mfa-enable-how-to.html) and configure the context-aware or always-on
setting for MFA when the identity source is the default
directory, AWS Managed Microsoft AD, or AD Connector.
- Allow users to
[register
their own MFA devices](https://docs.aws.amazon.com/singlesignon/latest/userguide/how-to-allow-user-registration.html).

Amazon Cognito user pools directory recommendations:

- Configure the
[Password
strength](https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-policies.html) settings.
- [Require
MFA](https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-mfa.html) for users.
- Use the Amazon Cognito user pools
[advanced
security settings](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html) for features like
[adaptive
authentication](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html) which can block suspicious sign-ins.

IAM user recommendations:

- Ideally you are using IAM Identity Center or direct
federation. However, you might have the need for IAM users.
In that case,
[set
a password policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html) for IAM users. You can use the
password policy to define requirements such as minimum
length or whether the password requires non-alphabetic
characters.
- Create an IAM policy to
[enforce
MFA sign-in](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_users-self-manage-mfa-and-creds.html#tutorial_mfa_step1) so that users are allowed to manage their
own passwords and MFA devices.

## Resources

**Related best practices:**

- [SEC02-BP03 Store and use
secrets securely](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_secrets.html)
- [SEC02-BP04 Rely on a
centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html)
- [SEC03-BP08 Share
resources securely within your organization](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_share_securely.html)

**Related documents:**

- [AWS IAM Identity Center Password Policy](https://docs.aws.amazon.com/singlesignon/latest/userguide/password-requirements.html)
- [IAM user password policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html)
- [Setting
the AWS account root user password](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html)
- [Amazon Cognito password policy](https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-policies.html)
- [AWS credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- [IAM
security best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

**Related videos:**

- [Managing user
permissions at scale with AWS IAM Identity Center](https://youtu.be/aEIqeFCcK7E)
- [Mastering
identity at every layer of the cake](https://www.youtube.com/watch?v=vbjFjMNVEpc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_enforce_mechanisms.html*

---

# SEC02-BP02 Use temporary credentials

When doing any type of authentication, it's best to use temporary
credentials instead of long-term credentials to reduce or eliminate
risks, such as credentials being inadvertently disclosed, shared, or
stolen.

**Desired outcome:** To reduce the
risk of long-term credentials, use temporary credentials wherever
possible for both human and machine identities. Long-term
credentials create many risks, such as exposure through uploads to
public repositories. By using temporary credentials, you
significantly reduce the chances of credentials becoming
compromised.

**Common anti-patterns:**

- Developers using long-term access keys from IAM users rather
than obtaining temporary credentials from the CLI using
federation.
- Developers embedding long-term access keys in their code and
uploading that code to public Git repositories.
- Developers embedding long-term access keys in mobile apps that
are then made available in app stores.
- Users sharing long-term access keys with other users, or
employees leaving the company with long-term access keys still
in their possession.
- Using long-term access keys for machine identities when
temporary credentials could be used.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Use temporary security credentials instead of long-term
credentials for all AWS API and CLI requests. API and CLI requests
to AWS services must, in nearly every case, be signed using
[AWS access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html). These requests can be signed with either
temporary or long-term credentials. The only time you should use
long-term credentials, also known as long-term access keys, is if
you are using an
[IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html) or the
[AWS account root user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html). When you federate to AWS or assume an
[IAM
role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) through other methods, temporary credentials are
generated. Even when you access the AWS Management Console using
sign-in credentials, temporary credentials are generated for you
to make calls to AWS services. There are few situations where you
need long-term credentials and you can accomplish nearly all tasks
using temporary credentials.

Avoiding the use of long-term credentials in favor of temporary
credentials should go hand in hand with a strategy of reducing the
usage of IAM users in favor of federation and IAM roles. While IAM users have been used for both human and machine identities in the
past, we now recommend not using them to avoid the risks in using
long-term access keys.

### Implementation steps

#### Human identities

For workforce identities like employees, administrators,
developers, and operators:

- You should [rely on a
centralized identity provider](https://docs.aws.amazon.com//wellarchitected/latest/security-pillar/sec_identities_identity_provider.html) and
[require
human users to use federation with an identity provider to
access AWS using temporary credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#bp-users-federation-idp). Federation
for your users can be done either with
[direct
federation to each AWS account](https://aws.amazon.com/identity/federation/) or using
[AWS IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) and the identity provider of
your choice. Federation provides a number of advantages
over using IAM users in addition to eliminating long-term
credentials. Your users can also request temporary
credentials from the command line for
[direct
federation](https://aws.amazon.com/blogs/security/how-to-implement-federated-api-and-cli-access-using-saml-2-0-and-ad-fs/) or by using
[IAM Identity Center](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html). This means that there are few uses
cases that require IAM users or long-term credentials for
your users.

For third-party identities:

- When granting third parties,
such as software as a service (SaaS) providers, access to
resources in your AWS account, you can use
[cross-account
roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html) and
[resource-based
policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html). Additionally, you can use the
[Amazon Cognito OAuth 2.0 grant](https://docs.aws.amazon.com/cognito/latest/developerguide/federation-endpoints-oauth-grants.html) client credentials flow for B2B
SaaS customers or partners.

User identities that access your AWS resources through web
browsers, client applications, mobile apps, or interactive
command-line tools:

- If you need to grant applications for
consumers or customers access to your AWS resources, you can
use
[Amazon Cognito identity pools](https://docs.aws.amazon.com/cognito/latest/developerguide/identity-pools.html) or
[Amazon Cognito user pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html) to provide temporary credentials.
The permissions for the credentials are configured through IAM
roles. You can also define a separate IAM role with limited
permissions for guest users who are not authenticated.

#### Machine identities

For machine identities, you might need to use long-term
credentials. In these cases, you should
[require
workloads to use temporary credentials with IAM roles to
access AWS](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#bp-workloads-use-roles).

- For
[Amazon Elastic Compute Cloud](https://aws.amazon.com/pm/ec2/) (Amazon EC2), you can use
[roles
for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html).
- [AWS Lambda](https://aws.amazon.com/lambda/) allows you to configure a
[Lambda
execution role to grant the service permissions](https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html) to
perform AWS actions using temporary credentials. There are
many other similar models for AWS services to grant
temporary credentials using IAM roles.
- For IoT devices, you can use the
[AWS IoT Core credential provider](https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html) to request temporary
credentials.
- For on-premises systems or systems that run outside of AWS
that need access to AWS resources, you can use
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html).

There are scenarios where temporary credentials are not
supported, which require the use of long-term credentials. In
these situations, [audit and
rotate these credentials periodically](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_audit.html) and
[rotate
access keys regularly](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#rotate-credentials). For highly restricted IAM user
access keys, consider the following additional security
measures:

- Grant highly restricted permissions:

Adhere to the principle of least privilege (be
specific about actions, resources, and conditions).
- Consider granting the IAM user only the
AssumeRole operation for one
specific role. Depending on the on-premise
architecture, this approach helps isolate and secure
the long-term IAM credentials.

- Limit the allowed network sources and IP addresses in the
IAM role trust policy.
- Monitor usage and set up alerts for unused permissions or
misuse (using AWS CloudWatch Logs metric filters and
alarms).
- Enforce
[permission
boundaries](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) (service control policies (SCPs) and
permission boundaries complement each other - SCPs are
coarse-grained, while permission boundaries are
fine-grained).
- Implement a process to provision and securely store (in an
on-premise vault) the credentials.

Some other options for scenarios requiring long-term
credentials include:

- Build your own token vending API (using Amazon API Gateway).
- For scenarios where you must use long-term credentials or
credentials other than AWS access keys (such as database
logins), you can use a service designed to handle the
management of secrets, such as
[AWS Secrets Manager](https://aws.amazon.com/secrets-manager/). Secrets Manager simplifies the
management, rotation, and secure storage of encrypted
secrets. Many AWS services support a
[direct
integration](https://docs.aws.amazon.com/secretsmanager/latest/userguide/integrating.html) with Secrets Manager.
- For multi-cloud integrations, you can use identity
federation based on your source credential service
provider (CSP) credentials (see
[AWS STS AssumeRoleWithWebIdentity](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html)).

For more information about rotating long-term credentials, see
[rotating
access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_RotateAccessKey).

## Resources

**Related best practices:**

- [SEC02-BP03 Store and use
secrets securely](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_secrets.html)
- [SEC02-BP04 Rely on a
centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html)
- [SEC03-BP08 Share
resources securely within your organization](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_share_securely.html)

**Related documents:**

- [Temporary
Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)
- [AWS Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- [IAM
Security Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [IAM
Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
- [IAM Identity Center](https://aws.amazon.com/iam/identity-center/)
- [Identity
Providers and Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html)
- [Rotating
Access Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_RotateAccessKey)
- [Security
Partner Solutions: Access and Access Control](https://aws.amazon.com/security/partner-solutions/#access-control)
- [The
AWS Account Root User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html)
- [Access
AWS using a Google Cloud Platform native workload
identity](https://aws.amazon.com/blogs/security/access-aws-using-a-google-cloud-platform-native-workload-identity/)
- [How
to access AWS resources from Microsoft Entra ID tenants using
AWS Security Token Service](https://aws.amazon.com/blogs/security/how-to-access-aws-resources-from-microsoft-entra-id-tenants-using-aws-security-token-service/)

**Related videos:**

- [Managing user
permissions at scale with AWS IAM Identity Center](https://youtu.be/aEIqeFCcK7E)
- [Mastering
identity at every layer of the cake](https://www.youtube.com/watch?v=vbjFjMNVEpc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_unique.html*

---

# SEC02-BP03 Store and use secrets securely

A workload requires an automated capability to prove its identity to
databases, resources, and third-party services. This is accomplished
using secret access credentials, such as API access keys, passwords,
and OAuth tokens. Using a purpose-built service to store, manage,
and rotate these credentials helps reduce the likelihood that those
credentials become compromised.

**Desired outcome:** Implementing a
mechanism for securely managing application credentials that
achieves the following goals:

- Identifying what secrets are required for the workload.
- Reducing the number of long-term credentials required by
replacing them with short-term credentials when possible.
- Establishing secure storage and automated rotation of remaining
long-term credentials.
- Auditing access to secrets that exist in the workload.
- Continual monitoring to verify that no secrets are embedded in
source code during the development process.
- Reduce the likelihood of credentials being inadvertently
disclosed.

**Common anti-patterns:**

- Not rotating credentials.
- Storing long-term credentials in source code or configuration
files.
- Storing credentials at rest unencrypted.

**Benefits of establishing this best
practice:**

- Secrets are stored encrypted at rest and in transit.
- Access to credentials is gated through an API (think of it as a
*credential vending machine*).
- Access to a credential (both read and write) is audited and
logged.
- Separation of concerns: credential rotation is performed by a
separate component, which can be segregated from the rest of the
architecture.
- Secrets are automatically distributed on-demand to software
components and rotation occurs in a central location.
- Access to credentials can be controlled in a fine-grained
manner.

**Level of risk exposed if this best practice
is not established**: High

## Implementation guidance

In the past, credentials used to authenticate to databases,
third-party APIs, tokens, and other secrets might have been
embedded in source code or in environment files. AWS provides
several mechanisms to store these credentials securely,
automatically rotate them, and audit their usage.

The best way to approach secrets management is to follow the
guidance of remove, replace, and rotate. The most secure
credential is one that you do not have to store, manage, or
handle. There might be credentials that are no longer necessary to
the functioning of the workload that can be safely removed.

For credentials that are still required for the proper functioning
of the workload, there might be an opportunity to replace a
long-term credential with a temporary or short-term credential.
For example, instead of hard-coding an AWS secret access key,
consider replacing that long-term credential with a temporary
credential using IAM roles.

Some long-lived secrets might not be able to be removed or
replaced. These secrets can be stored in a service such as
[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html), where they can be centrally stored,
managed, and rotated on a regular basis.

An audit of the workload's source code and configuration files can
reveal many types of credentials. The following table summarizes
strategies for handling common types of credentials:

Credential type

Description

Suggested strategy

IAM access keys

AWS IAM access and secret keys used to assume IAM roles
inside of a workload

Replace: Use
[IAM
roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios.html) assigned to the compute instances (such as
[Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html) or
[AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html)) instead. For interoperability with
third parties that require access to resources in your AWS account, ask if they support
[AWS cross-account access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_third-party.html). For mobile apps,
consider using temporary credentials through
[Amazon Cognito identity pools (federated identities)](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html).
For workloads running outside of AWS, consider
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) or
[AWS Systems Manager Hybrid Activations](https://docs.aws.amazon.com/systems-manager/latest/userguide/activations.html). For
containers see
[Amazon ECS task IAM role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html) or
[Amazon EKS node IAM role](https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html).

SSH keys

Secure Shell private keys used to log into Linux EC2
instances, manually or as part of an automated process

Replace: Use
[AWS Systems Manager](https://aws.amazon.com/blogs/mt/vr-beneficios-session-manager/) or
[EC2
Instance Connect](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html) to provide programmatic and human
access to EC2 instances using IAM roles.

Application and database credentials

Passwords – plain text string

Rotate: Store credentials in
[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html) and establish automated rotation if
possible.

Amazon RDS and Aurora Admin Database credentials

Passwords – plain text string

Replace: Use the
[Secrets Manager integration with Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-secrets-manager.html) or
[Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/rds-secrets-manager.html). In addition, some RDS database types can
use IAM roles instead of passwords for some use cases (for
more detail, see
[IAM
database authentication](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)).

OAuth tokens

Secret tokens – plain text string

Rotate: Store tokens in
[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html) and configure automated rotation.

API tokens and keys

Secret tokens – plain text string

Rotate: Store in
[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html) and establish automated rotation if
possible.

A common anti-pattern is embedding IAM access keys inside source
code, configuration files, or mobile apps. When an IAM access key
is required to communicate with an AWS service, use
[temporary
(short-term) security credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html). These short-term
credentials can be provided through
[IAM
roles for EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) instances,
[execution
roles](https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html) for Lambda functions,
[Cognito
IAM roles](https://docs.aws.amazon.com/cognito/latest/developerguide/iam-roles.html) for mobile user access, and
[IoT
Core policies](https://docs.aws.amazon.com/iot/latest/developerguide/iot-policies.html) for IoT devices. When interfacing with third
parties, prefer
[delegating
access to an IAM role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_third-party.html) with the necessary access to your
account's resources rather than configuring an IAM user and
sending the third party the secret access key for that user.

There are many cases where the workload requires the storage of
secrets necessary to interoperate with other services and
resources.
[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html) is purpose built to securely manage these
credentials, as well as the storage, use, and rotation of API
tokens, passwords, and other credentials.

AWS Secrets Manager provides five key capabilities to ensure the
secure storage and handling of sensitive credentials:
[encryption
at rest](https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html),

[encryption
in transit](https://docs.aws.amazon.com/secretsmanager/latest/userguide/data-protection.html),

[comprehensive
auditing](https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html),

[fine-grained
access control](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html), and

[extensible
credential rotation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html). Other secret management services from
AWS Partners or locally developed solutions that provide similar
capabilities and assurances are also acceptable.

When you retrieve a secret, you can use the Secrets Manager client
side caching components to cache it for future use. Retrieving a
cached secret is faster than retrieving it from Secrets Manager.
Additionally, because there is a cost for calling Secrets Manager
APIs, using a cache can reduce your costs. For all of the ways you
can retrieve secrets, see
[Get
secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html).

Note
Some languages may
require you to implement your own in-memory encryption for client
side caching.

### Implementation steps

- Identify code paths containing hard-coded credentials using
automated tools such as
[Amazon CodeGuru](https://aws.amazon.com/codeguru/features/).

Use Amazon CodeGuru to scan your code repositories. Once
the review is complete, filter on
Type=Secrets in CodeGuru to find
problematic lines of code.

- Identify credentials that can be removed or replaced.

Identify credentials no longer needed and mark for
removal.
- For AWS Secret Keys that are embedded in source code,
replace them with IAM roles associated with the
necessary resources. If part of your workload is outside
AWS but requires IAM credentials to access AWS
resources, consider
[IAM
Roles Anywhere](https://aws.amazon.com/blogs/security/extend-aws-iam-roles-to-workloads-outside-of-aws-with-iam-roles-anywhere/) or
[AWS Systems Manager Hybrid Activations](https://docs.aws.amazon.com/systems-manager/latest/userguide/activations.html).

- For other third-party, long-lived secrets that require the
use of the rotate strategy, integrate Secrets Manager into
your code to retrieve third-party secrets at runtime.

The CodeGuru console can automatically
[create
a secret in Secrets Manager](https://aws.amazon.com/blogs/aws/codeguru-reviewer-secrets-detector-identify-hardcoded-secrets/) using the discovered
credentials.
- Integrate secret retrieval from Secrets Manager into
your application code.

Serverless Lambda functions can use a
language-agnostic
[Lambda
extension](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets_lambda.html).
- For EC2 instances or containers, AWS provides
example
[client-side
code for retrieving secrets from Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html) in several popular programming
languages.

- Periodically review your code base and re-scan to verify no
new secrets have been added to the code.

Consider using a tool such as
[git-secrets](https://github.com/awslabs/git-secrets)
to prevent committing new secrets to your source code
repository.

- [Monitor
Secrets Manager activity](https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html) for indications of
unexpected usage, inappropriate secret access, or attempts
to delete secrets.
- Reduce human exposure to credentials. Restrict access to
read, write, and modify credentials to an IAM role dedicated
for this purpose, and only provide access to assume the role
to a small subset of operational users.

## Resources

**Related best practices:**

- [SEC02-BP02 Use temporary
credentials](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_unique.html)
- [SEC02-BP05 Audit and rotate
credentials periodically](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_audit.html)

**Related documents:**

- [Getting
Started with AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html)
- [Identity
Providers and Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html)
- [Amazon CodeGuru Introduces Secrets Detector](https://aws.amazon.com/blogs/aws/codeguru-reviewer-secrets-detector-identify-hardcoded-secrets/)
- [How
AWS Secrets Manager uses AWS Key Management Service](https://docs.aws.amazon.com/kms/latest/developerguide/services-secrets-manager.html)
- [Secret
encryption and decryption in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html)
- [Secrets Manager blog entries](https://aws.amazon.com/blogs/security/tag/aws-secrets-manager/)
- [Amazon RDS announces integration with AWS Secrets Manager](https://aws.amazon.com/about-aws/whats-new/2022/12/amazon-rds-integration-aws-secrets-manager/)

**Related videos:**

- [Best Practices
for Managing, Retrieving, and Rotating Secrets at Scale](https://youtu.be/qoxxRlwJKZ4)
- [Find
Hard-Coded Secrets Using Amazon CodeGuru Secrets
Detector](https://www.youtube.com/watch?v=ryK3PN--oJs)
- [Securing
Secrets for Hybrid Workloads Using AWS Secrets Manager](https://www.youtube.com/watch?v=k1YWhogGVF8)

**Related workshops:**

- [Store,
retrieve, and manage sensitive credentials in AWS Secrets Manager](https://catalog.us-east-1.prod.workshops.aws/workshops/92e466fd-bd95-4805-9f16-2df07450db42/en-US)
- [AWS Systems Manager Hybrid Activations](https://mng.workshop.aws/ssm/capability_hands-on_labs/hybridactivations.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_secrets.html*

---

# SEC02-BP04 Rely on a centralized identity provider

For workforce identities (employees and contractors), rely on an
identity provider that allows you to manage identities in a
centralized place. This makes it easier to manage access across
multiple applications and systems, because you are creating,
assigning, managing, revoking, and auditing access from a single
location.

**Desired outcome:** You have a
centralized identity provider where you centrally manage workforce
users, authentication policies (such as requiring multi-factor
authentication (MFA)), and authorization to systems and applications
(such as assigning access based on a user's group membership or
attributes). Your workforce users sign in to the central identity
provider and federate (single sign-on) to internal and external
applications, removing the need for users to remember multiple
credentials. Your identity provider is integrated with your human
resources (HR) systems so that personnel changes are automatically
synchronized to your identity provider. For example, if someone
leaves your organization, you can automatically revoke access to
federated applications and systems (including AWS). You have enabled
detailed audit logging in your identity provider and are monitoring
these logs for unusual user behavior.

**Common anti-patterns:**

- You do not use federation and single-sign on. Your workforce
users create separate user accounts and credentials in multiple
applications and systems.
- You have not automated the lifecycle of identities for workforce
users, such as by integrating your identity provider with your
HR systems. When a user leaves your organization or changes
roles, you follow a manual process to delete or update their
records in multiple applications and systems.

**Benefits of establishing this best
practice:** By using a centralized identity provider, you
have a single place to manage workforce user identities and
policies, the ability to assign access to applications to users and
groups, and the ability to monitor user sign-in activity. By
integrating with your human resources (HR) systems, when a user
changes roles, these changes are synchronized to the identity
provider and automatically updates their assigned applications and
permissions. When a user leaves your organization, their identity is
automatically disabled in the identity provider, revoking their
access to federated applications and systems.

**Level of risk exposed if this best practice
is not established**: High

## Implementation guidance

**Guidance for workforce users accessing
AWS** Workforce users like employees and contractors in
your organization may require access to AWS using the AWS Management Console or AWS Command Line Interface (AWS CLI) to
perform their job functions. You can grant AWS access to your
workforce users by federating from your centralized identity
provider to AWS at two levels: direct federation to each AWS account or federating to multiple accounts in your
[AWS organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html).

To federate your workforce users directly with each AWS account,
you can use a centralized identity provider to federate to
[AWS Identity and Access Management](https://aws.amazon.com/iam/) in that account. The flexibility of IAM
allows you to enable a separate
[SAML
2.0](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml.html) or an
[Open
ID Connect (OIDC)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html) Identity Provider for each AWS account
and use federated user attributes for access control. Your
workforce users will use their web browser to sign in to the
identity provider by providing their credentials (such as
passwords and MFA token codes). The identity provider issues a
SAML assertion to their browser that is submitted to the AWS Management Console sign in URL to allow the user to single sign-on
to the
[AWS Management Console by assuming an IAM Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html). Your users can
also obtain temporary AWS API credentials for use in the
[AWS CLI](https://aws.amazon.com/cli/) or
[AWS SDKs](https://aws.amazon.com/developer/tools/) from
[AWS STS](https://docs.aws.amazon.com/STS/latest/APIReference/welcome.html) by
[assuming
the IAM role using a SAML assertion](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithSAML.html) from the identity
provider.

To federate your workforce users with multiple accounts in your
AWS organization, you can use
[AWS IAM Identity Center](https://aws.amazon.com/single-sign-on/) to centrally manage access
for your workforce users to AWS accounts and applications. You
enable Identity Center for your organization and configure your
identity source. IAM Identity Center provides a default identity
source directory which you can use to manage your users and
groups. Alternatively, you can choose an external identity source
by
[connecting
to your external identity provider](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-idp.html) using SAML
2.0 and
[automatically
provisioning](https://docs.aws.amazon.com/singlesignon/latest/userguide/provision-automatically.html) users and groups using SCIM, or
[connecting
to your Microsoft AD Directory](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-ad.html) using
[Directory Service](https://aws.amazon.com/directoryservice/). Once an identity source is configured,
you can assign access to users and groups to AWS accounts by
defining least-privilege policies in your
[permission
sets](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html). Your workforce users can authenticate through your
central identity provider to sign in to the
[AWS access portal](https://docs.aws.amazon.com/singlesignon/latest/userguide/using-the-portal.html) and single-sign on to the AWS accounts and
cloud applications assigned to them. Your users can configure the
[AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html) to authenticate with Identity Center and get
credentials to run AWS CLI commands. Identity Center also allows
single-sign on access to AWS applications such as
[Amazon SageMaker AI Studio](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-users.html) and
[AWS IoT Sitewise Monitor portals](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-getting-started.html).

After you follow the preceding guidance, your workforce users will
no longer need to use IAM users and groups for normal operations
when managing workloads on AWS. Instead, your users and groups are
managed outside of AWS and users are able to access AWS resources
as a *federated identity*. Federated identities
use the groups defined by your centralized identity provider. You
should identify and remove IAM groups, IAM users, and long-lived
user credentials (passwords and access keys) that are no longer
needed in your AWS accounts. You can
[find
unused credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html) using
[IAM
credential reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html),
[delete
the corresponding IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html) and
[delete
IAM groups.](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_delete.html) You can apply a
[Service
Control Policy (SCP)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) to your organization that helps
prevent the creation of new IAM users and groups, enforcing that
access to AWS is via federated identities.

Note
You are responsible for handling the rotation of SCIM
access tokens as described in the
[Automatic
provisioning](https://docs.aws.amazon.com/singlesignon/latest/userguide/provision-automatically.html) documentation. Additionally, you are
responsible for rotating the certificates supporting your
identity federation.

**Guidance for users of your
applications** You can manage the identities of users of
your applications, such as a mobile app, using
[Amazon Cognito](https://aws.amazon.com/cognito/) as your centralized identity provider.
Amazon Cognito enables authentication, authorization, and user
management for your web and mobile apps. Amazon Cognito provides
an identity store that scales to millions of users, supports
social and enterprise identity federation, and offers advanced
security features to help protect your users and business. You can
integrate your custom web or mobile application with Amazon Cognito to add user authentication and access control to your
applications in minutes. Built on open identity standards such as
SAML and Open ID Connect (OIDC), Amazon Cognito supports various
compliance regulations and integrates with frontend and backend
development resources.

### Implementation steps

**Steps for workforce users accessing
AWS**

- Federate your workforce users to AWS using a centralized
identity provider using one of the following approaches:

Use IAM Identity Center to enable single sign-on to
multiple AWS accounts in your AWS organization by
federating with your identity provider.
- Use IAM to connect your identity provider directly to
each AWS account, enabling federated fine-grained
access.

- Identify and remove IAM users and groups that are replaced
by federated identities.

**Steps for users of your
applications**

- Use Amazon Cognito as a centralized identity provider
towards your applications.
- Integrate your custom applications with Amazon Cognito using
OpenID Connect and OAuth. You can develop your custom
applications using the Amplify libraries that provide simple
interfaces to integrate with a variety of AWS services, such
as Amazon Cognito for authentication.

## Resources

**Related best practices:**

- [SEC02-BP06 Employ user groups
and attributes](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_groups_attributes.html)
- [SEC03-BP02 Grant
least privilege access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_least_privileges.html)
- [SEC03-BP06 Manage
access based on lifecycle](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_lifecycle.html)

**Related documents:**

- [Identity
federation in AWS](https://aws.amazon.com/identity/federation/)
- [Security
best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [AWS Identity and Access Management Best practices](https://aws.amazon.com/iam/resources/best-practices/)
- [Getting
started with IAM Identity Center delegated
administration](https://aws.amazon.com/blogs/security/getting-started-with-aws-sso-delegated-administration/)
- [How
to use customer managed policies in IAM Identity Center for
advanced use cases](https://aws.amazon.com/blogs/security/how-to-use-customer-managed-policies-in-aws-single-sign-on-for-advanced-use-cases/)
- [AWS CLI v2: IAM Identity Center credential provider](https://docs.aws.amazon.com/sdkref/latest/guide/feature-sso-credentials.html)

**Related videos:**

- [AWS re:Inforce
2022 - AWS Identity and Access Management (IAM) deep
dive](https://youtu.be/YMj33ToS8cI)
- [AWS re:Invent
2022 - Simplify your existing workforce access with IAM Identity Center](https://youtu.be/TvQN4OdR_0Y)
- [AWS re:Invent
2018: Mastering Identity at Every Layer of the Cake](https://youtu.be/vbjFjMNVEpc)

**Related examples:**

- [Workshop:
Using AWS IAM Identity Center to achieve strong identity
management](https://catalog.us-east-1.prod.workshops.aws/workshops/590f8439-42c7-46a1-8e70-28ee41498b3a/en-US)

**Related tools:**

- [AWS Security Competency Partners: Identity and Access
Management](https://aws.amazon.com/security/partner-solutions/)
- [saml2aws](https://github.com/Versent/saml2aws)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html*

---

# SEC02-BP05 Audit and rotate credentials periodically

Audit and rotate credentials periodically to limit how long the
credentials can be used to access your resources. Long-term
credentials create many risks, and these risks can be reduced by
rotating long-term credentials regularly.

**Desired outcome:** Implement
credential rotation to help reduce the risks associated with
long-term credential usage. Regularly audit and remediate
non-compliance with credential rotation policies.

**Common anti-patterns:**

- Not auditing credential use.
- Using long-term credentials unnecessarily.
- Using long-term credentials and not rotating them regularly.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When you cannot rely on temporary credentials and require
long-term credentials, audit credentials to verify that defined
controls like
[multi-factor
authentication](https://aws.amazon.com/iam/features/mfa/) (MFA) are enforced, rotated regularly, and
have the appropriate access level.

Periodic validation, preferably through an automated tool, is
necessary to verify that the correct controls are enforced. For
human identities, you should require users to change their
passwords periodically and retire access keys in favor of
temporary credentials. As you move from AWS Identity and Access Management (IAM) users to centralized identities, you can
[generate
a credential report](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html) to audit your users.

We also recommend that you enforce and monitor MFA in your
identity provider. You can set up
[AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html), or use
[AWS Security Hub CSPM Security Standards](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-iam-3), to monitor if users have
configured MFA. Consider using
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) to provide temporary credentials for machine
identities. In situations when using IAM roles and temporary
credentials is not possible, frequent auditing and rotating access
keys is necessary.

### Implementation steps

- **Regularly audit
credentials:** Auditing the identities that are
configured in your identity provider and IAM helps verify
that only authorized identities have access to your
workload. Such identities can include, but are not limited
to, IAM users, AWS IAM Identity Center users, Active
Directory users, or users in a different upstream identity
provider. For example, remove people that leave the
organization, and remove cross-account roles that are no
longer required. Have a process in place to periodically
audit permissions to the services accessed by an IAM entity.
This helps you identify the policies you need to modify to
remove any unused permissions. Use credential reports and
[AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html) to
audit IAM credentials and permissions. You can use
[Amazon CloudWatch to set up alarms for specific API calls](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudwatch-alarms-for-cloudtrail.html)
called within your AWS environment.
[Amazon GuardDuty can also alert you to unexpected activity](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_finding-types-iam.html),
which might indicate overly permissive access or unintended
access to IAM credentials.
- **Rotate credentials
regularly:** When you are unable to use temporary
credentials, rotate long-term IAM access keys regularly
(maximum every 90 days). If an access key is unintentionally
disclosed without your knowledge, this limits how long the
credentials can be used to access your resources. For
information about rotating access keys for IAM users, see
[Rotating
access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_RotateAccessKey).
- **Review IAM permissions:**
To improve the security of your AWS account, regularly
review and monitor each of your IAM policies. Verify that
policies adhere to the principle of least privilege.
- **Consider automating IAM resource
creation and updates:**
[IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) automates many IAM tasks, such as
role and policy management. Alternatively, AWS CloudFormation can be used to automate the deployment of IAM
resources, including roles and policies, to reduce the
chance of human error because the templates can be verified
and version controlled.
- **Use IAM Roles Anywhere to replace
IAM users for machine identities:**
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) allows you to use roles in areas that
you traditionally could not, such as on-premise servers. IAM
Roles Anywhere uses a trusted
[X.509
certificate](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/trust-model.html#signature-verification) to authenticate to AWS and receive
temporary credentials. Using IAM Roles Anywhere avoids the
need to rotate these credentials, as long-term credentials
are no longer stored in your on-premises environment. Please
note that you will need to monitor and rotate the X.509
certificate as it approaches expiration.

## Resources

**Related best practices:**

- [SEC02-BP02 Use temporary
credentials](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_unique.html)
- [SEC02-BP03 Store and use
secrets securely](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_secrets.html)

**Related documents:**

- [Getting
Started with AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html)
- [IAM
Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Identity
Providers and Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html)
- [Security
Partner Solutions: Access and Access Control](https://aws.amazon.com/security/partner-solutions/#access-control)
- [Temporary
Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)
- [Getting
credential reports for your AWS account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html)

**Related videos:**

- [Best Practices
for Managing, Retrieving, and Rotating Secrets at Scale](https://youtu.be/qoxxRlwJKZ4)
- [Managing user
permissions at scale with AWS IAM Identity Center](https://youtu.be/aEIqeFCcK7E)
- [Mastering
identity at every layer of the cake](https://www.youtube.com/watch?v=vbjFjMNVEpc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_audit.html*

---

# SEC02-BP06 Employ user groups and attributes

Defining permissions according to user groups and attributes helps
reduce the number and complexity of policies, making it simpler to
achieve the principle of least privilege. You can use user groups to
manage the permissions for many people in one place based on the
function they perform in your organization. Attributes, such as
department, project, or location, can provide an additional layer of
permission scope when people perform a similar function but for
different subsets of resources.

**Desired outcome:** You can apply
changes in permissions based on function to all users who perform
that function. Group membership and attributes govern user
permissions, reducing the need to manage permissions at the
individual user level. The groups and attributes you define in your
identity provider (IdP) are propagated automatically to your AWS
environments.

**Common anti-patterns:**

- Managing permissions for individual users and duplicating across
many users.
- Defining groups at too high a level, granting overly-broad
permissions.
- Defining groups at too granular a level, creating duplication
and confusion about membership.
- Using groups with duplicate permissions across subsets of
resources when attributes can be used instead.
- Not managing groups, attributes, and memberships through a
standardized identity provider integrated with your AWS
environments.
- Using role chaining when using AWS IAM Identity Center sessions

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

AWS permissions are defined in documents called
*policies* that are associated with a
principal, such as a user, group, role, or resource. You can scale
permissions management by organizing permissions assignments
(group, permissions, account) based on job-function, workload, and
SDLC environment. For your workforce, this allows you to define
groups based on the function your users perform for your
organization, rather than based on the resources being accessed.
For example, a WebAppDeveloper group may have a
policy attached for configuring services like Amazon CloudFront
within a development account. An
`AutomationDeveloper` group may have some
overlapping permissions with the
`WebAppDeveloper` group. These common permissions
can be captured in a separate policy and associated with both
groups, rather than having users from both functions belong to a
`CloudFrontAccess` group.

In addition to groups, you can use *attributes*
to further scope access. For example, you may have a
Project attribute for users in your
`WebAppDeveloper` group to scope access to
resources specific to their project. Using this technique removes
the need to have different groups for application developers
working on different projects if their permissions are otherwise
the same. The way you refer to attributes in permission policies
is based on their source, whether they are defined as part of your
federation protocol (such as SAML, OIDC, or SCIM), as custom SAML
assertions, or set within IAM Identity Center.

### Implementation steps

- Establish where you will define groups and attributes:

Following the guidance in
[SEC02-BP04 Rely on a
centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html), you can determine
whether you need to define groups and attributes within
your identity provider, within IAM Identity Center, or
using IAM user groups in a specific account.

- Define groups:

Determine your groups based on function and scope of
access required. Consider using a hierarchical structure
or naming conventions to organize groups effectively.
- If defining within IAM Identity Center, create groups
and associate the desired level of access using
permission sets.
- If defining within an external identity provider,
determine if the provider supports the SCIM protocol and
consider enabling automatic provisioning within IAM Identity Center. This capability synchronizes the
creation, membership, and deletion of groups between
your provider and IAM Identity Center.

- Define attributes:

If you use an external identity provider, both the SCIM
and SAML 2.0 protocols provide certain attributes by
default. Additional attributes can be defined and passed
using SAML assertions with the
`https://aws.amazon.com/SAML/Attributes/PrincipalTag`
attribute name. Refer to your identity provider's
documentation for guidance on defining and configuring
custom attributes.
- If you define roles within IAM Identity Center, enable
the attribute-based access control (ABAC) feature, and
define attributes as desired. Consider attributes that
align with your organization's structure or resource
tagging strategy.

If you require IAM role chaining from IAM Roles assumed through
IAM Identity center, values like
`source-identity` and
`principal-tags` will not propagate. For more
detail, see
[Enable
and configure attributes for access control](https://docs.aws.amazon.com/singlesignon/latest/userguide/configure-abac.html).

- Scope permissions based on groups and attributes:

Consider including conditions in your permission
policies that compare the attributes of your principal
with the attributes of the resources being accessed. For
example, you can define a condition to allow access to a
resource only if the value of a
`PrincipalTag` condition key matches
the value of a `ResourceTag` key of the
same name.
- When defining ABAC policies, follow the guidance in the
[ABAC
authorization](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html) best practices and examples.
- Regularly review and update your group and attribute
structure as your organization's needs evolve to ensure
optimal permissions management.

## Resources

**Related best practices:**

- [SEC02-BP04 Rely on a
centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_identity_provider.html)
- [SEC03-BP02 Grant
least privilege access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_least_privileges.html)
- [COST02-BP04
Implement groups and roles](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_govern_usage_groups_roles.html)

**Related documents:**

- [IAM
Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Manage
Identities in IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-sso.html)
- [What
Is ABAC for AWS?](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_attribute-based-access-control.html)
- [ABAC
In IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/configure-abac.html)
- [ABAC
Policy Examples](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_examples_aws_abac.html)

**Related videos:**

- [Managing user
permissions at scale with AWS IAM Identity Center](https://youtu.be/aEIqeFCcK7E)
- [Mastering
identity at every layer of the cake](https://www.youtube.com/watch?v=vbjFjMNVEpc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_groups_attributes.html*

---
