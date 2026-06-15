# SEC 5 — How do you protect your network resources?

**Pillar**: Security  
**Best Practices**: 4

---

# SEC05-BP01 Create network layers

Segment your network topology into different layers based on logical
groupings of your workload components according to their data
sensitivity and access requirements. Distinguish between components
that require inbound access from the internet, such as public web
endpoints, and those that only need internal access, such as
databases.

**Desired outcome:** The layers of
your network are part of an integral defense-in-depth approach to
security that complements the identity authentication and
authorization strategy of your workloads. Layers are in place
according to data sensitivity and access requirements, with
appropriate traffic flow and control mechanisms.

**Common anti-patterns:**

- You create all resources in a single VPC or subnet.
- You construct your network layers without consideration of data
sensitivity requirements, component behaviors, or functionality.
- You use VPCs and subnets as defaults for all network layer
considerations, and you don't consider how AWS managed services
influence your topology.

**Benefits of establishing this best
practice:** Establishing network layers is the first step
in restricting unnecessary pathways through the network,
particularly those that lead to critical systems and data. This
makes it harder for unauthorized actors to gain access to your
network and navigate to additional resources within. Discrete
network layers beneficially reduce the scope of analysis for
inspection systems, such as for intrusion detection or malware
prevention. This reduces the potential for false positives and
unnecessary processing overhead.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When designing a workload architecture, it is common to separate
components into different layers based on their responsibility.
For example, a web application can have a presentation layer,
application layer, and data layer. You can
take a similar approach when designing your network topology.
Underlying network controls can help enforce your workload's data
access requirements. For example, in a three-tier web application
architecture, you can store your static presentation layer files
on [Amazon S3](https://aws.amazon.com/s3/) and serve them from a content delivery network (CDN),
such as [Amazon CloudFront](https://aws.amazon.com/cloudfront/). The application layer can have public
endpoints that an [Application Load Balancer (ALB)](https://aws.amazon.com/elasticloadbalancing/application-load-balancer/) serves in an
[Amazon VPC](https://aws.amazon.com/vpc/) public subnet (similar to a demilitarized zone, or
DMZ), with back-end services deployed into private subnets. The
data layer, that is hosting resources such as databases and shared
file systems, can reside in different private subnets from the
resources of your application layer. At each of these layer
boundaries (CDN, public subnet, private subnet), you can deploy
controls that allow only authorized traffic to traverse across
those boundaries.

Similar to modeling network layers based on the functional purpose
of your workload's components, also consider the sensitivity of
the data being processed. Using the web application example,
while all of your workload services may reside within the
application layer, different services may process data with
different sensitivity levels. In this case, dividing the
application layer using multiple private subnets, different VPCs
in the same AWS account, or even different VPCs in different AWS accounts for each level of data sensitivity may be appropriate
according to your control requirements.

A further consideration for network layers is the behavior
consistency of your workload's components. Continuing the
example, in the application layer you may have services that
accept inputs from end-users or external system integrations that
are inherently riskier than the inputs to other services. Examples
include file uploads, code scripts to run, email scanning and so
on. Placing these services in their own network layer helps
create a stronger isolation boundary around them, and can prevent
their unique behavior from creating false positive alerts in
inspection systems.

As part of your design, consider how using AWS managed services
influences your network topology. Explore how services such as
[Amazon VPC Lattice](https://aws.amazon.com/vpc/lattice/) can help make the interoperability of your
workload components across network layers easier. When using [AWS Lambda](https://aws.amazon.com/lambda/), deploy in your VPC subnets unless there are specific
reasons not to. Determine where VPC endpoints and [AWS PrivateLink](https://aws.amazon.com/privatelink/)
can simplify adhering to security policies that limit access to
internet gateways.

### Implementation steps

- Review your workload architecture. Logically group
components and services based on the functions they serve,
the sensitivity of data being processed, and their behavior.
- For components responding to requests from the internet,
consider using load balancers or other proxies to provide
public endpoints. Explore shifting security controls by
using managed services, such as CloudFront, [Amazon API Gateway](https://aws.amazon.com/api-gateway/), Elastic Load Balancing, and [AWS Amplify](https://aws.amazon.com/amplify/) to host
public endpoints.
- For components running in compute environments, such as
Amazon EC2 instances, [AWS Fargate](https://aws.amazon.com/fargate/) containers, or Lambda
functions, deploy these into private subnets based on your
groups from the first step.
- For fully managed AWS services, such as [Amazon DynamoDB](https://aws.amazon.com/dynamodb/),
[Amazon Kinesis](https://aws.amazon.com/kinesis/), or [Amazon SQS](https://aws.amazon.com/sqs/), consider using VPC
endpoints as the default for access over private IP
addresses.

## Resources

**Related best practices:**

- [REL02
Plan your network topology](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/plan-your-network-topology.html)
- [PERF04-BP01
Understand how networking impacts performance](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_networking_understand_how_networking_impacts_performance.html)

**Related videos:**

- [AWS re:Invent 2023 - AWS networking foundations](https://www.youtube.com/watch?v=8nNurTFy-h4)

**Related examples:**

- [VPC
examples](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-examples-intro.html)
- [Access
container applications privately on Amazon ECS by using AWS Fargate, AWS PrivateLink, and a Network Load Balancer](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/access-container-applications-privately-on-amazon-ecs-by-using-aws-fargate-aws-privatelink-and-a-network-load-balancer.html)
- [Serve
static content in an Amazon S3 bucket through a VPC by using
Amazon CloudFront](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/serve-static-content-in-an-amazon-s3-bucket-through-a-vpc-by-using-amazon-cloudfront.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_network_protection_create_layers.html*

---

# SEC05-BP02 Control traffic flow within your network layers

Within the layers of your network, use further segmentation to
restrict traffic only to the flows necessary for each workload.
First, focus on controlling traffic between the internet or other
external systems to a workload and your environment
(*north-south* traffic). Afterwards, look at
flows between different components and systems
(*east-west* traffic).

**Desired outcome:** You permit only
the network flows necessary for the components of your workloads to
communicate with each other and their clients and any other services
they depend on. Your design factors in considerations such as public
compared to private ingress and egress, data classification,
regional regulations, and protocol requirements. Wherever possible,
you favor point-to-point flows over network peering as part of a
*principle of least privilege* design.

**Common anti-patterns:**

- You take a perimeter-based approach to network security and only
control traffic flow at the boundary of your network layers.
- You assume all traffic within a network layer is authenticated
and authorized.
- You apply controls for either your ingress traffic or your
egress traffic, but not both.
- You rely solely on your workload components and network controls
to authenticate and authorize traffic.

**Benefits of establishing this best
practice:** This practice helps reduce the risk of
unauthorized movement within your network and adds an extra layer of
authorization to your workloads. By performing traffic flow control,
you can restrict the scope of impact of a security incident and
speed up detection and response.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

While network layers help establish the boundaries around
components of your workload that serve a similar function, data
sensitivity level, and behavior, you can create a much
finer-grained level of traffic control by using techniques to
further segment components within these layers that follows the
principle of least privilege. Within AWS, network layers are
primarily defined using subnets according to IP address ranges
within an Amazon VPC. Layers can also be defined using different
VPCs, such as for grouping microservice environments by business
domain. When using multiple VPCs, mediate routing using an [AWS Transit Gateway](https://aws.amazon.com/transit-gateway/). While this provides traffic control at a Layer 4
level (IP address and port ranges) using security groups and route
tables, you can gain further control using additional services,
such as [AWS PrivateLink](https://aws.amazon.com/privatelink/), [Amazon Route 53 Resolver DNS Firewall](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-dns-firewall.html),
[AWS Network Firewall](https://aws.amazon.com/network-firewall/), and [AWS WAF](https://aws.amazon.com/waf/).

Understand and inventory the data flow and communication
requirements of your workloads in terms of connection-initiating
parties, ports, protocols, and network layers. Evaluate the
protocols available for establishing connections and transmitting
data to select ones that achieve your protection requirements (for
example, HTTPS rather than HTTP). Capture these requirements at
both the boundaries of your networks and within each layer. Once
these requirements are identified, explore options to only allow
the required traffic to flow at each connection point. A good
starting point is to use *security
groups* within your VPC, as they can be attached to
resources that uses an Elastic Network Interface (ENI), such
Amazon EC2 instances, Amazon ECS tasks, Amazon EKS pods, or Amazon RDS databases. Unlike a Layer 4 firewall, a security group can
have a rule that allows traffic from another security group by its
identifier, minimizing updates as resources within the group
change over time. You can also filter traffic using both inbound
and outbound rules using security groups.

When traffic moves between VPCs, it's common to use VPC peering
for simple routing or the AWS Transit Gateway for complex routing.
With these approaches, you facilitate traffic flows between the
range of IP addresses of both the source and destination networks.
However, if your workload only requires traffic flows between
specific components in different VPCs, consider using a
point-to-point connection using
[AWS PrivateLink](https://aws.amazon.com/privatelink/). To do this, identify which service should act
as the producer and which should act as the consumer. Deploy a
compatible load balancer for the producer, turn on PrivateLink
accordingly, and then accept a connection request by the
consumer. The producer service is then assigned a private IP
address from the consumer's VPC that the consumer can use to make
subsequent requests. This approach reduces the need to peer the
networks. Include the costs for data processing and load balancing
as part of evaluating PrivateLink.

While security groups and PrivateLink help control the flow
between the components of your workloads, another major
consideration is how to control which DNS domains your resources
are allowed to access (if any). Depending on the DHCP
configuration of your VPCs, you can consider two different AWS
services for this purpose. Most customers use the default Route 53
Resolver DNS service (also called Amazon DNS server or
AmazonProvidedDNS) available to VPCs at the +2 address of its CIDR
range. With this approach, you can create DNS Firewall rules and
associate them to your VPC that determine what actions to take for
the domain lists you supply.

If you are not using the Route 53 Resolver, or if you want to
complement the Resolver with deeper inspection and flow control
capabilities beyond domain filtering, consider deploying an AWS Network Firewall. This service inspects individual packets using
either stateless or stateful rules to determine whether to deny or
allow the traffic. You can take a similar approach for filtering
inbound web traffic to your public endpoints using AWS WAF. For
further guidance on these services, see [SEC05-BP03 Implement
inspection-based protection](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_network_protection_inspection.html).

### Implementation steps

- Identify the required data flows between the components of
your workloads.
- Apply multiple controls with a defense-in-depth approach for
both inbound and outbound traffic, including the use of
security groups, and route tables.
- Use firewalls to define fine-grained control over network
traffic in, out, and across your VPCs, such as the Route 53
Resolver DNS Firewall, AWS Network Firewall, and AWS WAF.
Consider using the
[AWS Firewall Manager](https://aws.amazon.com/firewall-manager/) for centrally configuring and
managing your firewall rules across your organization.

## Resources

**Related best practices:**

- [REL03-BP01
Choose how to segment your workload](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_service_architecture_monolith_soa_microservice.html)
- [SEC09-BP02
Enforce encryption in transit](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_data_transit_encrypt.html)

**Related documents:**

- [Security
best practices for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-best-practices.html)
- [AWS Network Optimization Tips](https://aws.amazon.com/blogs/networking-and-content-delivery/aws-network-optimization-tips/)
- [Guidance
for Network Security on AWS](https://aws.amazon.com/solutions/guidance/network-security-on-aws/)
- [Secure
your VPC's outbound network traffic in the AWS Cloud](https://docs.aws.amazon.com/prescriptive-guidance/latest/secure-outbound-network-traffic/welcome.html)

**Related tools:**

- [AWS Firewall Manager](https://aws.amazon.com/firewall-manager/)

**Related videos:**

- [AWS Transit Gateway reference architectures for many VPCs](https://youtu.be/9Nikqn_02Oc)
- [Application
Acceleration and Protection with Amazon CloudFront, AWS WAF,
and AWS Shield](https://youtu.be/0xlwLEccRe0)
- [AWS re:Inforce 2023: Firewalls and where to put them](https://www.youtube.com/watch?v=lTJxWAiQrHM)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_network_protection_layered.html*

---

# SEC05-BP03 Implement inspection-based protection

Set up traffic inspection points between your network layers to make
sure data in transit matches the expected categories and patterns.
Analyze traffic flows, metadata, and patterns to help identify,
detect, and respond to events more effectively.

**Desired outcome:** Traffic that
traverses between your network layers are inspected and authorized.
Allow and deny decisions are based on explicit rules, threat
intelligence, and deviations from baseline behaviors.  Protections
become stricter as traffic moves closer to sensitive data.

**Common anti-patterns:**

- Relying solely on firewall rules based on ports and protocols.
Not taking advantage of intelligent systems.
- Authoring firewall rules based on specific current threat
patterns that are subject to change.
- Only inspecting traffic where traffic transits from private to
public subnets, or from public subnets to the Internet.
- Not having a baseline view of your network traffic to compare
for behavior anomalies.

**Benefits of establishing this best
practice:** Inspection systems allow you to author
intelligent rules, such as allowing or denying traffic only when
certain conditions within the traffic data exist. Benefit from
managed rule sets from AWS and partners, based on the latest threat
intelligence, as the threat landscape changes over time.  This
reduces the overhead of maintaining rules and researching indicators
of compromise, reducing the potential for false positives.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Have fine-grained control over both your stateful and stateless
network traffic using AWS Network Firewall, or other
[Firewalls](https://aws.amazon.com/marketplace/search/results?searchTerms=firewalls)
and
[Intrusion
Prevention Systems](https://aws.amazon.com/marketplace/search/results?searchTerms=Intrusion+Prevention+Systems) (IPS) on AWS Marketplace that you can
deploy behind a [Gateway Load Balancer (GWLB)](https://aws.amazon.com/elasticloadbalancing/gateway-load-balancer/).  AWS Network Firewall supports
[Suricata-compatible](https://docs.aws.amazon.com/network-firewall/latest/developerguide/stateful-rule-groups-ips.html)
open source IPS specifications to help protect your workload.

Both the AWS Network Firewall and vendor solutions that use a GWLB
support different inline inspection deployment models.  For
example, you can perform inspection on a per-VPC basis, centralize
in an inspection VPC, or deploy in a hybrid model where east-west
traffic flows through an inspection VPC and Internet ingress is
inspected per-VPC.  Another consideration is whether the solution
supports unwrapping Transport Layer Security (TLS), enabling deep
packet inspection for traffic flows initiated in either direction.
For more information and in-depth details on these configurations,
see the
[AWS Network Firewall Best Practice guide](https://aws.github.io/aws-security-services-best-practices/guides/network-firewall/).

If you are using solutions that perform out-of-band inspections,
such as pcap analysis of packet data from network interfaces
operating in promiscuous mode, you can
configure [VPC
traffic mirroring](https://docs.aws.amazon.com/vpc/latest/mirroring/what-is-traffic-mirroring.html). Mirrored traffic counts towards the
available bandwidth of your interfaces and is subject to the same
data transfer charges as non-mirrored traffic. You can see if
virtual versions of these appliances are available on the
[AWS Marketplace](https://aws.amazon.com/marketplace/solutions/infrastructure-software/cloud-networking), which may support inline deployment behind a
GWLB.

For components that transact over HTTP-based protocols, protect
your application from common threats with a web application
firewall (WAF). [AWS WAF](https://aws.amazon.com/waf) is a web application firewall that lets you monitor and
block HTTP(S) requests that match your configurable rules before
sending to Amazon API Gateway, Amazon CloudFront, AWS AppSync or
an Application Load Balancer. Consider deep packet inspection when
you evaluate the deployment of your web application firewall, as
some require you to terminate TLS before traffic inspection. To
get started with AWS WAF, you can use
[AWS Managed Rules](https://docs.aws.amazon.com/waf/latest/developerguide/getting-started.html#getting-started-wizard-add-rule-group) in combination with your own, or use existing
[partner
integrations](https://aws.amazon.com/waf/partners/).

You can centrally manage AWS WAF, AWS Shield Advanced, AWS Network Firewall, and Amazon VPC security groups across your AWS
Organization
with [AWS Firewall Manager](https://aws.amazon.com/firewall-manager/).

## Implementation steps

- Determine if you can scope inspection rules broadly, such as
through an inspection VPC, or if you require a more granular
per-VPC approach.
- For inline inspection solutions:

If using AWS Network Firewall, create rules, firewall
policies, and the firewall itself. Once these have been
configured, you can
[route
traffic to the firewall endpoint](https://aws.amazon.com/blogs/networking-and-content-delivery/deployment-models-for-aws-network-firewall/) to enable
inspection.
- If using a third-party appliance with a Gateway Load
Balancer (GWLB), deploy and configure your appliance in
one or more availability zones. Then, create your GWLB,
the endpoint service, endpoint, and configure routing for
your traffic.

- For out-of-band inspection solutions:

Turn on VPC Traffic Mirroring on interfaces where inbound
and outbound traffic should be mirrored. You can use
Amazon EventBridge rules to invoke an AWS Lambda function
to turn on traffic mirroring on interfaces when new
resources are created. Point the traffic mirroring
sessions to the Network Load Balancer in front of your
appliance that processes traffic.

- For inbound web traffic solutions:

To configure AWS WAF, start by configuring a web access
control list (web ACL). The web ACL is a collection of
rules with a serially processed default action (ALLOW or
DENY) that defines how your WAF handles traffic. You can
create your own rules and groups or use AWS managed rule
groups in your web ACL.
- Once your web ACL is configured, associate the web ACL
with an AWS resource (like an Application Load Balancer,
API Gateway REST API, or CloudFront distribution) to begin
protecting web traffic.

## Resources

**Related documents:**

- [What
is Traffic Mirroring?](https://docs.aws.amazon.com/vpc/latest/mirroring/what-is-traffic-mirroring.html)
- [Implementing
inline traffic inspection using third-party security
appliances](https://docs.aws.amazon.com/prescriptive-guidance/latest/inline-traffic-inspection-third-party-appliances/welcome.html)
- [AWS Network Firewall example architectures with routing](https://docs.aws.amazon.com/network-firewall/latest/developerguide/architectures.html)
- [Centralized
inspection architecture with AWS Gateway Load Balancer and AWS Transit Gateway](https://aws.amazon.com/blogs/networking-and-content-delivery/centralized-inspection-architecture-with-aws-gateway-load-balancer-and-aws-transit-gateway/)

**Related examples:**

- [Best
practices for deploying Gateway Load Balancer](https://aws.amazon.com/blogs/networking-and-content-delivery/best-practices-for-deploying-gateway-load-balancer/)
- [TLS
inspection configuration for encrypted egress traffic and AWS Network Firewall](https://aws.amazon.com/blogs/security/tls-inspection-configuration-for-encrypted-egress-traffic-and-aws-network-firewall/)

**Related tools:**

- [AWS Marketplace IDS/IPS](https://aws.amazon.com/marketplace/search/results?prevFilters=%257B%2522id%2522%3A%25220ed48363-5064-4d47-b41b-a53f7c937314%2522%257D&searchTerms=ids%2Fips)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_network_protection_inspection.html*

---

# SEC05-BP04 Automate network protection

Automate the deployment of your network protections using DevOps
practices, such as *infrastructure as code* (IaC)
and CI/CD pipelines.  These practices can help you track changes in
your network protections through a version control system, reduce
the time it takes to deploy changes, and help detect if your network
protections drift from your desired configuration.

**Desired outcome:** You define
network protections with templates and commit them into a version
control system.  Automated pipelines are initiated when new changes
are made that orchestrates their testing and deployment.  Policy
checks and other static tests are in place to validate changes
before deployment.  You deploy changes into a staging environment to
validate the controls are operating as expected.  Deployment into
your production environments is also performed automatically once
controls are approved.

**Common anti-patterns:**

- Relying on individual workload teams to each define their
complete network stack, protections, and automations.  Not
publishing standard aspects of the network stack and protections
centrally for workload teams to consume.
- Relying on a central network team to define all aspects of the
network, protections, and automations.  Not delegating
workload-specific aspects of the network stack and protections
to that workload's team.
- Striking the right balance between centralization and delegation
between a network team and workload teams, but not applying
consistent testing and deployment standards across your IaC
templates and CI/CD pipelines.  Not capturing required
configurations in tooling that checks your templates for
adherence.

**Benefits of establishing this best
practice:** Using templates to define your network
protections allows you to track and compare changes over time with a
version control system.  Using automation to test and deploy changes
creates standardization and predictability, increasing the chances
of a successful deployment and reducing repetitive manual
configurations.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

A number of network protection controls described in
[SEC05-BP02 Control traffic flows
within your network layers](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_network_protection_layered.html) and
[SEC05-BP03 Implement
inspection-based protection](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_network_protection_inspection.html) come with managed rules systems
that can update automatically based on the latest threat
intelligence.  Examples of protecting your web endpoints include
[AWS WAF managed rules](https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups.html) and
[AWS Shield Advanced automatic application layer DDoS
mitigation](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-automatic-app-layer-response.html).
Use [AWS Network Firewall managed rule groups](https://docs.aws.amazon.com/network-firewall/latest/developerguide/nwfw-managed-rule-groups.html) to stay up to date
with low-reputation domain lists and threat signatures as well.

Beyond managed rules, we recommend you use DevOps practices to
automate deploying your network resources, protections, and the
rules you specify.  You can capture these definitions in
[AWS CloudFormation](https://aws.amazon.com/cloudformation/) or another *infrastructure as
code* (IaC) tool of your choice, commit them to a
version control system, and deploy them using CI/CD pipelines.
Use this approach to gain the traditional benefits of DevOps for
managing your network controls, such as more predictable releases,
automated testing using tools like
[AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html), and detecting drift between your
deployed environment and your desired configuration.

Based on the decisions you made as part of
[SEC05-BP01 Create network
layers](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_network_protection_create_layers.html), you may have a central management approach to
creating VPCs that are dedicated for ingress, egress, and
inspection flows.  As described in the
[AWS Security Reference Architecture (AWS SRA)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture), you can define
these VPCs in a dedicated
[Network
infrastructure account](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/network.html).  You can use similar techniques to
centrally define the VPCs used by your workloads in other
accounts, their security groups, AWS Network Firewall deployments,
Route 53 Resolver rules and DNS Firewall configurations, and other
network resources.  You can share these resources with your other
accounts with the
[AWS Resource Access Manager](https://docs.aws.amazon.com/ram/latest/userguide/what-is.html).  With this approach, you can
simplify the automated testing and deployment of your network
controls to the Network account, with only one destination to
manage.  You can do this in a hybrid model, where you deploy and
share certain controls centrally and delegate other controls to
the individual workload teams and their respective accounts.

## Implementation steps

- Establish ownership over which aspects of the network and
protections are defined centrally, and which your workload
teams can maintain.
- Create environments to test and deploy changes to your network
and its protections.  For example, use a Network Testing
account and a Network Production account.
- Determine how you will store and maintain your templates in a
version control system.  Store central templates in a
repository that is distinct from workload repositories, while
workload templates can be stored in repositories specific to
that workload.
- Create CI/CD pipelines to test and deploy templates.  Define
tests to check for misconfigurations and that templates adhere
to your company standards.

## Resources

**Related best practices:**

- [SEC01-BP06
Automate deployment of standard security controls](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_automate_security_controls)

**Related documents:**

- [AWS Security Reference Architecture - Network account](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/network.html)

**Related examples:**

- [AWS Deployment Pipeline Reference Architecture](https://pipelines.devops.aws.dev/)
- [NetDevSecOps
to modernize AWS networking deployments](https://aws.amazon.com/blogs/networking-and-content-delivery/netdevsecops-to-modernize-aws-networking-deployments/)
- [Integrating
AWS CloudFormation security tests with AWS Security Hub CSPM and
AWS CodeBuild reports](https://aws.amazon.com/blogs/security/integrating-aws-cloudformation-security-tests-with-aws-security-hub-and-aws-codebuild-reports/)

**Related tools:**

- [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
- [AWS CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)
- [cfn_nag](https://github.com/stelligent/cfn_nag)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_network_auto_protect.html*

---
