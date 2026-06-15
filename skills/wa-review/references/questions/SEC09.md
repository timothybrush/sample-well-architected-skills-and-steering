# SEC 9 — How do you protect your data in transit?

**Pillar**: Security  
**Best Practices**: 3

---

# SEC09-BP01 Implement secure key and certificate management

Transport Layer Security (TLS) certificates are used to secure
network communications and establish the identity of websites,
resources, and workloads over the internet, as well as private
networks.

**Desired outcome:** A secure certificate management system that
can provision, deploy, store, and renew certificates in a public key infrastructure (PKI). A
secure key and certificate management mechanism prevents certificate private key material from
disclosure and automatically renews the certificate on a periodic basis. It also integrates with other
services to provide secure network communications and identity for machine resources inside of
your workload. Key material should never be accessible to human identities.

**Common anti-patterns:**

- Performing manual steps during the certificate deployment or renewal
processes.
- Paying insufficient attention to certificate authority (CA)
hierarchy when designing a private CA.
- Using self-signed certificates for public resources.

**Benefits of establishing this best practice:**

- Simplify certificate management through automated deployment and
renewal
- Encourage encryption of data in transit using TLS certificates
- Increased security and auditability of certificate actions taken by
the certificate authority
- Organization of management duties at different layers of the CA
hierarchy

**Level of risk exposed if this best practice is not established:** High

## Implementation guidance

Modern workloads make extensive use of encrypted network
communications using PKI protocols
such as TLS. PKI certificate management
can be complex, but automated certificate provisioning,
deployment, and renewal can reduce the friction associated with
certificate management.

AWS provides two services to manage general-purpose PKI
certificates:
[AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html) and
[AWS Private Certificate Authority (AWS Private CA)](https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html). ACM is the
primary service that customers use to provision, manage, and
deploy certificates for use in both public-facing as well as
private AWS workloads. ACM issues private certificates using AWS Private CA and
[integrates](https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html)
with many other AWS managed services to provide secure TLS
certificates for workloads. ACM can also issue publicly trusted
certificates from
[Amazon
Trust Services](https://www.amazontrust.com/repository/). Public certificates from ACM can be used on
public facing workloads, as modern browsers and operating systems
trust these certificates by default.

AWS Private CA allows you to
establish your own root or subordinate certificate authority and
issue TLS certificates through an API. You can use these kinds of
certificates in scenarios where you control and manage the trust
chain on the client side of the TLS connection. In addition to TLS
use cases, AWS Private CA can be used to issue certificates to
Kubernetes pods, Matter device product attestations, code signing,
and other use cases with a
[custom
template](https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html). You can also use
[IAM
Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) to provide temporary IAM credentials to
on-premises workloads that have been issued X.509 certificates
signed by your Private CA.

In addition to ACM and AWS Private CA,
[AWS IoT Core](https://docs.aws.amazon.com/iot/latest/developerguide/what-is-aws-iot.html) provides specialized support for provisioning,
managing and deploying PKI certificates to IoT
devices. AWS IoT Core provides specialized mechanisms for
[onboarding
IoT devices](https://docs.aws.amazon.com/whitepapers/latest/device-manufacturing-provisioning/device-manufacturing-provisioning.html) into your public key infrastructure at scale.

Some AWS services, such as
[Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html) and
[Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html), offer their own capabilities for using
certificates to secure application connections. For example, both
API Gateway and Application Load Balancer (ALB) support mutual TLS
(mTLS) using client certificates that you create and export using
the AWS Management Console, CLI, or APIs.

**Considerations for establishing a private CA hierarchy**

When you need to establish a private CA, it's important to take
special care to properly design the CA hierarchy upfront. It's a
best practice to deploy each level of your CA hierarchy into
separate AWS accounts when creating a private CA hierarchy. This
intentional step reduces the surface area for each level in the CA
hierarchy, making it simpler to discover anomalies in CloudTrail
log data and reducing the scope of access or impact if there is
unauthorized access to one of the accounts. The root CA should reside in its own separate account and should only be used to issue one or more intermediate CA certificates.

Then, create one or more intermediate CAs in accounts separate
from the root CA's account to issue certificates for end users,
devices, or other workloads. Finally, issue certificates from your
root CA to the intermediate CAs, which will in turn issue
certificates to your end users or devices. For more information on
planning your CA deployment and designing your CA hierarchy,
including planning for resiliency, cross-region replication,
sharing CAs across your organization, and more, see
[Planning
your AWS Private CA deployment](https://docs.aws.amazon.com/privateca/latest/userguide/PcaPlanning.html).

### Implementation steps

- Determine the relevant AWS services required for your use
case:

Many use cases can leverage the existing AWS public key
infrastructure using
[AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html). ACM can
be used to deploy TLS certificates for web servers, load
balancers, or other uses for publicly trusted certificates.
- Consider [AWS Private CA](https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html) when you need
to establish your own private certificate authority
hierarchy or need access to exportable certificates. ACM can then be used to issue [many types
of end-entity certificates](https://docs.aws.amazon.com/privateca/latest/userguide/PcaIssueCert.html) using the AWS Private CA.
- For use cases where certificates must be provisioned at
scale for embedded Internet of things (IoT) devices,
consider [AWS IoT Core](https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html).
- Consider using native mTLS functionality in services
like
[Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html) or
[Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html).

- Implement automated certificate renewal whenever possible:

Use [ACM managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html) for
certificates issued by ACM along with
integrated AWS managed services.

- Establish logging and audit trails:

Enable
[CloudTrail
logs](https://docs.aws.amazon.com/privateca/latest/userguide/PcaCtIntro.html) to track access to the accounts holding
certificate authorities. Consider configuring log file
integrity validation in CloudTrail to verify the
authenticity of the log data.
- Periodically generate and review
[audit
reports](https://docs.aws.amazon.com/privateca/latest/userguide/PcaAuditReport.html) that list the certificates that your private
CA has issued or revoked. These reports can be exported to
an S3 bucket.
- When deploying a private CA, you will also need to establish
an S3 bucket to store the Certificate Revocation List (CRL).
For guidance on configuring this S3 bucket based on your
workload's requirements, see
[Planning
a certificate revocation list (CRL)](https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html).

## Resources

**Related best
practices:**

- [SEC02-BP02 Use temporary credentials](./sec_identities_unique.html)
- [SEC08-BP01 Implement secure key management](./sec_protect_data_rest_key_mgmt.html)
- [SEC09-BP03 Authenticate network communications](./sec_protect_data_transit_authentication.html)

**Related documents:**

- [How
to host and manage an entire private certificate
infrastructure in AWS](https://aws.amazon.com/blogs/security/how-to-host-and-manage-an-entire-private-certificate-infrastructure-in-aws/)
- [How
to secure an enterprise scale ACM Private CA hierarchy for
automotive and manufacturing](https://aws.amazon.com/blogs/security/how-to-secure-an-enterprise-scale-acm-private-ca-hierarchy-for-automotive-and-manufacturing/)
- [Private
CA best practices](https://docs.aws.amazon.com/privateca/latest/userguide/ca-best-practices.html)
- [How
to use AWS RAM to share your ACM Private CA
cross-account](https://aws.amazon.com/blogs/security/how-to-use-aws-ram-to-share-your-acm-private-ca-cross-account/)

**Related videos:**

- [Activating
AWS Certificate Manager Private CA (workshop)](https://www.youtube.com/watch?v=XrrdyplT3PE)

**Related examples:**

- [Private
CA workshop](https://catalog.workshops.aws/certificatemanager/en-US/introduction)
- [IOT
Device Management Workshop](https://iot-device-management.workshop.aws/en/) (including device
provisioning)

**Related tools:**

- [Plugin
to Kubernetes cert-manager to use AWS Private CA](https://github.com/cert-manager/aws-privateca-issuer)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_transit_key_cert_mgmt.html*

---

# SEC09-BP02 Enforce encryption in transit

Enforce your defined encryption requirements based on your organization’s policies, regulatory obligations and standards to help meet organizational, legal, and compliance requirements. Only use protocols with encryption when transmitting sensitive data outside of your virtual private cloud (VPC). Encryption helps maintain data confidentiality even when the data transits untrusted networks.

**Desired outcome:** You encrypt
network traffic between your resources and the internet to mitigate
unauthorized access to the data. You encrypt network traffic within
your internal AWS environment according to your security
requirements. You encrypt data in transit using secure TLS protocols
and cipher suites.

**Common anti-patterns:**

- Using deprecated versions of SSL, TLS, and cipher suite components (for example, SSL v3.0, 1024-bit RSA keys, and RC4 cipher).
- Allowing unencrypted (HTTP) traffic to or from public-facing resources.
- Not monitoring and replacing X.509 certificates prior to expiration.
- Using self-signed X.509 certificates for TLS.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS services provide HTTPS endpoints using TLS for communication,
providing encryption in transit when communicating with the AWS
APIs. Insecure HTTP protocols can be audited and blocked in a
Virtual Private Cloud (VPC) through the use of security groups.
HTTP requests can also be
[automatically
redirected to HTTPS](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html) in Amazon CloudFront or on an
[Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#redirect-actions). You can use an
[Amazon Simple Storage Service (Amazon S3) bucket policy](https://aws.amazon.com/blogs/storage/enforcing-encryption-in-transit-with-tls1-2-or-higher-with-amazon-s3/) to
restrict the ability to upload objects through HTTP, effectively
enforcing the use of HTTPS for object uploads to your bucket(s).
You have full control over your computing resources to implement
encryption in transit across your services. Additionally, you can
use VPN connectivity into your VPC from an external network or
[AWS Direct Connect](https://aws.amazon.com/directconnect/) to facilitate encryption of traffic. Verify
that your clients make calls to AWS APIs using at least TLS 1.2,
as
[AWS has deprecated the use of earlier versions of TLS as of February
2024](https://aws.amazon.com/blogs/security/tls-1-2-required-for-aws-endpoints/). We recommend you use TLS 1.3. If you have special
requirements for encryption in transit, you can find third-party
solutions available in the AWS Marketplace.

### Implementation steps

- **Enforce encryption in transit:** Your defined encryption requirements should be based on the latest standards and best practices and only allow secure protocols. For example, configure a security group to only allow the HTTPS protocol to an application load balancer or Amazon EC2 instance.
- **Configure secure protocols in edge services:** [Configure HTTPS with Amazon CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https.html) and use a [security profile appropriate for your security posture and use case](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/secure-connections-supported-viewer-protocols-ciphers.html#secure-connections-supported-ciphers).
- **Use a [VPN for external connectivity](https://docs.aws.amazon.com/vpc/latest/userguide/vpn-connections.html):** Consider using an IPsec VPN for securing point-to-point or network-to-network connections to help provide both data privacy and integrity.
- **Configure secure protocols in load balancers:** Select a security policy that provides the strongest cipher suites supported by the clients that will be connecting to the listener. [Create an HTTPS listener for your Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html).
- **Configure secure protocols in Amazon Redshift:** Configure your cluster to require a [secure socket layer (SSL) or transport layer security (TLS) connection](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html).
- **Configure secure protocols:** Review AWS service documentation to determine encryption-in-transit capabilities.
- **Configure secure access when uploading to Amazon S3 buckets:** Use Amazon S3 bucket policy controls to [enforce secure access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security-best-practices.html) to data.
- **Consider using [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/):** ACM allows you to provision, manage, and deploy public TLS certificates for use with AWS services.
- **Consider using [AWS Private Certificate Authority](https://aws.amazon.com/private-ca/) for private PKI needs:** AWS Private CA allows you to create private certificate authority (CA) hierarchies to issue end-entity X.509 certificates that can be used to create encrypted TLS channels.

## Resources

**Related documents:**

- [Using HTTPS with CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https.html)
- [Connect your VPC to remote networks using AWS Virtual Private Network](https://docs.aws.amazon.com/vpc/latest/userguide/vpn-connections.html)
- [Create an HTTPS listener for your Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html)
- [Tutorial: Configure SSL/TLS on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/SSL-on-amazon-linux-2.html)
- [Using SSL/TLS to encrypt a connection to a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html)
- [Configuring security options for connections](https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-ssl-support.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_transit_encrypt.html*

---

# SEC09-BP03 Authenticate network communications

Verify the identity of communications by using protocols that
support authentication, such as Transport Layer Security (TLS) or
IPsec.

Design your workload to use secure, authenticated network protocols whenever communicating between services, applications, or to users. Using network protocols that support authentication and authorization provides stronger control over network flows and reduces the impact of unauthorized access.

**Desired outcome:** A workload with well-defined data plane and control plane traffic flows between services. The traffic flows use authenticated and encrypted network protocols where technically feasible.

**Common anti-patterns:**

- Unencrypted or unauthenticated traffic flows within your workload.
- Reusing authentication credentials across multiple users or entities.
- Relying solely on network controls as an access control mechanism.
- Creating a custom authentication mechanism rather than relying on industry-standard authentication mechanisms.
- Overly permissive traffic flows between service components or other resources in the VPC.

**Benefits of establishing this best practice:**

- Limits the scope of impact for unauthorized access to one part of the workload.
- Provides a higher level of assurance that actions are only performed by authenticated entities.
- Improves decoupling of services by clearly defining and enforcing intended data transfer interfaces.
- Enhances monitoring, logging, and incident response through request attribution and well-defined communication interfaces.
- Provides defense-in-depth for your workloads by combining network controls with authentication and authorization controls.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Your workload’s network traffic patterns can be characterized into two categories:

- *East-west traffic* represents traffic flows between services that make up a workload.
- *North-south traffic* represents traffic flows between your workload and consumers.

While it is common practice to encrypt north-south traffic, securing east-west traffic using authenticated protocols is less common. Modern security practices recommend that network design alone does not grant a trusted relationship between two entities. When two services may reside within a common network boundary, it is still best practice to encrypt, authenticate, and authorize communications between those services.

As an example, AWS service APIs use the [AWS Signature Version 4 (SigV4)](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html) signature protocol to authenticate the caller, no matter what network the request originates from. This authentication ensures that AWS APIs can verify the identity that requested the action, and that identity can then be combined with policies to make an authorization decision to determine whether the action should be allowed or not.

Services such as [Amazon VPC Lattice](https://docs.aws.amazon.com/vpc-lattice/latest/ug/access-management-overview.html) and [Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/permissions.html) allow you use the same SigV4 signature protocol to add authentication and authorization to east-west traffic in your own workloads. If resources outside of your AWS environment need to communicate with services that require SigV4-based authentication and authorization, you can use [AWS Identity and Access Management (IAM) Roles Anywhere](https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html) on the non-AWS resource to acquire temporary AWS credentials. These credentials can be used to sign requests to services using SigV4 to authorize access.

Another common mechanism for authenticating east-west traffic is
TLS mutual authentication (mTLS). Many Internet of Things (IoT),
business-to-business applications, and microservices use mTLS to
validate the identity of both sides of a TLS communication through
the use of both client and server-side X.509 certificates. These
certificates can be issued by AWS Private Certificate Authority
(AWS Private CA). You can use services such as
[Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/rest-api-mutual-tls.html) to provide mTLS authentication for inter- or
intra-workload communication.
[Application Load Balancer also supports mTLS](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/mutual-authentication.html) for internal or external
facing workloads. While mTLS provides authentication information
for both sides of a TLS communication, it does not provide a
mechanism for authorization.

Finally, OAuth 2.0 and OpenID Connect (OIDC) are two protocols typically used for controlling access to services by users, but are now becoming popular for service-to-service traffic as well. API Gateway provides a [JSON Web Token (JWT) authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-jwt-authorizer.html), allowing workloads to restrict access to API routes using JWTs issued from OIDC or OAuth 2.0 identity providers. OAuth2 scopes can be used as a source for basic authorization decisions, but the authorization checks still need to be implemented in the application layer, and OAuth2 scopes alone cannot support more complex authorization needs.

### Implementation steps

- **Define and document your workload network flows:** The first step in implementing a defense-in-depth strategy is defining your workload’s traffic flows.

Create a data flow diagram that clearly defines how data is transmitted between different services that comprise your workload. This diagram is the first step to enforcing those flows through authenticated network channels.
- Instrument your workload in development and testing phases to validate that the data flow diagram accurately reflects the workload’s behavior at runtime.
- A data flow diagram can also be useful when performing a threat modeling exercise, as described in [SEC01-BP07 Identify threats and prioritize mitigations using a threat model](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_threat_model.html).

- **Establish network controls:** Consider AWS capabilities to establish network controls aligned to your data flows. While network boundaries should not be the only security control, they provide a layer in the defense-in-depth strategy to protect your workload.

Use [security groups](https://docs.aws.amazon.com/vpc/latest/userguide/security-groups.html) to establish define and restrict data flows between resources.
- Consider using [AWS PrivateLink](https://docs.aws.amazon.com/vpc/latest/privatelink/what-is-privatelink.html) to communicate with both AWS and third-party services that support AWS PrivateLink. Data sent through a AWS PrivateLink interface endpoint stays within the AWS network backbone and does not traverse the public Internet.

- **Implement authentication and authorization across services in your workload:** Choose the set of AWS services most appropriate to provide authenticated, encrypted traffic flows in your workload.

Consider [Amazon VPC Lattice](https://docs.aws.amazon.com/vpc-lattice/latest/ug/what-is-vpc-lattice.html) to secure service-to-service communication. VPC Lattice can use [SigV4 authentication combined with auth policies](https://docs.aws.amazon.com/vpc-lattice/latest/ug/auth-policies.html) to control service-to-service access.
- For service-to-service communication using mTLS,
consider
[API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/rest-api-mutual-tls.html),
[Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/mutual-authentication.html).
[AWS Private CA](https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html) can be used to establish a private CA
hierarchy capable of issuing certificates for use with
mTLS.
- When integrating with services using OAuth 2.0 or OIDC, consider [API Gateway using the JWT authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-jwt-authorizer.html).
- For communication between your workload and IoT devices, consider [AWS IoT Core](https://docs.aws.amazon.com/iot/latest/developerguide/client-authentication.html), which provides several options for network traffic encryption and authentication.

- **Monitor for unauthorized access:** Continually monitor for unintended communication channels, unauthorized principals attempting to access protected resources, and other improper access patterns.

If using VPC Lattice to manage access to your services, consider enabling and monitoring [VPC Lattice access logs](https://docs.aws.amazon.com/vpc-lattice/latest/ug/monitoring-access-logs.html). These access logs include information on the requesting entity, network information including source and destination VPC, and request metadata.
- Consider enabling [VPC flow logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) to capture metadata on network flows and periodically review for anomalies.
- Refer to the [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html) and the [Incident Response section](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/incident-response.html) of the AWS Well-Architected Framework security pillar for more guidance on planning, simulating, and responding to security incidents.

## Resources

**Related best practices:**

- [SEC03-BP07 Analyze public and cross-account access](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_permissions_analyze_cross_account.html)
- [SEC02-BP02 Use temporary credentials](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_identities_unique.html)
- [SEC01-BP07 Identify threats and prioritize mitigations using a threat model](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_threat_model.html)

**Related documents:**

- [Evaluating access control methods to secure Amazon API Gateway APIs](https://aws.amazon.com/blogs/compute/evaluating-access-control-methods-to-secure-amazon-api-gateway-apis/)
- [Configuring mutual TLS authentication for a REST API](https://docs.aws.amazon.com/apigateway/latest/developerguide/rest-api-mutual-tls.html)
- [How to secure API Gateway HTTP endpoints with JWT authorizer](https://aws.amazon.com/blogs/security/how-to-secure-api-gateway-http-endpoints-with-jwt-authorizer/)
- [Authorizing direct calls to AWS services using AWS IoT Core credential provider](https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html)
- [AWS Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/aws-security-incident-response-guide.html)

**Related videos:**

- [AWS re:invent 2022: Introducing VPC Lattice](https://www.youtube.com/watch?v=fRjD1JI0H5w)
- [AWS re:invent 2020: Serverless API authentication for HTTP APIs on AWS](https://www.youtube.com/watch?v=AW4kvUkUKZ0)

**Related examples:**

- [Amazon VPC Lattice Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/9e543f60-e409-43d4-b37f-78ff3e1a07f5/en-US)
- [Zero-Trust Episode 1 – The Phantom Service Perimeter workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/dc413216-deab-4371-9e4a-879a4f14233d/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_transit_authentication.html*

---
