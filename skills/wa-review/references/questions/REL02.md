# REL 2 — How do you plan your network topology?

**Pillar**: Reliability  
**Best Practices**: 5

---

# REL02-BP01 Use highly available network connectivity for your workload public endpoints

Building highly available network connectivity to public endpoints of your workloads can help you reduce downtime due to loss of connectivity and improve the availability and SLA of your workload. To achieve this, use highly available DNS, content delivery networks (CDNs), API gateways, load balancing, or reverse proxies.

**Desired outcome:** It is critical to plan, build, and operationalize highly available network connectivity for your public endpoints. If your workload becomes unreachable due to a loss in connectivity, even if your workload is running and available, your customers will see your system as down. By combining the highly available and resilient network connectivity for your workload’s public endpoints, along with a resilient architecture for your workload itself, you can provide the best possible availability and service level for your customers.

AWS Global Accelerator, Amazon CloudFront, Amazon API Gateway, AWS Lambda Function URLs, AWS AppSync APIs, and Elastic Load Balancing (ELB) all provide highly available public endpoints. Amazon Route 53 provides a highly available DNS service for domain name resolution to verify that your public endpoint addresses can be resolved.

You can also evaluate AWS Marketplace software appliances for load balancing and proxying.

**Common anti-patterns:**

- Designing a highly available workload without planning out DNS and network connectivity for high availability.
- Using public internet addresses on individual instances or containers and managing the connectivity to them with DNS.
- Using IP addresses instead of domain names for locating services.
- Not testing out scenarios where connectivity to your public endpoints is lost.
- Not analyzing network throughput needs and distribution patterns.
- Not testing and planning for scenarios where internet network connectivity to your public endpoints of your workload might be interrupted.
- Providing content (like web pages, static assets, or media files) to a large geographic area and not using a content delivery network.
- Not planning for distributed denial of service (DDoS) attacks. DDoS attacks risk shutting out legitimate traffic and lowering availability for your users.

**Benefits of establishing this best
practice:** Designing for highly available and resilient network connectivity ensures that your workload is accessible and available to your users.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

At the core of building highly available network connectivity to your public endpoints is the routing of the traffic. To verify your traffic is able to reach the endpoints, the DNS must be able to resolve the domain names to their corresponding IP addresses. Use a highly available and scalable [Domain Name System (DNS)](https://aws.amazon.com/route53/what-is-dns/) such as Amazon Route 53 to manage your domain’s DNS records. You can also use health checks provided by Amazon Route 53. The health checks verify that your application is reachable, available, and functional, and they can be set up in a way that they mimic your user’s behavior, such as requesting a web page or a specific URL. In case of failure, Amazon Route 53 responds to DNS resolution requests and directs the traffic to only healthy endpoints. You can also consider using Geo DNS and Latency Based Routing capabilities offered by Amazon Route 53.

To verify that your workload itself is highly available, use Elastic Load Balancing (ELB). Amazon Route 53 can be used to target traffic to ELB, which distributes the traffic to the target compute instances. You can also use Amazon API Gateway along with AWS Lambda for a serverless solution. Customers can also run workloads in multiple AWS Regions. With [multi-site active/active pattern](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-i-strategies-for-recovery-in-the-cloud/), the workload can serve traffic from multiple Regions. With a multi-site active/passive pattern, the workload serves traffic from the active region while data is replicated to the secondary region and becomes active in the event of a failure in the primary region. Route 53 health checks can then be used to control DNS failover from any endpoint in a primary Region to an endpoint in a secondary Region, verifying that your workload is reachable and available to your users.

Amazon CloudFront provides a simple API for distributing content with low latency and high data transfer rates by serving requests using a network of edge locations around the world. Content delivery networks (CDNs) serve customers by serving content located or cached at a location near to the user. This also improves availability of your application as the load for content is shifted away from your servers over to CloudFront’s [edge locations](https://aws.amazon.com/products/networking/edge-networking/). The edge locations and regional edge caches hold cached copies of your content close to your viewers resulting in quick retrieval and increasing reachability and availability of your workload.

For workloads with users spread out geographically, AWS Global Accelerator helps you improve the availability and performance of the applications. AWS Global Accelerator provides Anycast static IP addresses that serve as a fixed entry point to your application hosted in one or more AWS Regions. This allows traffic to ingress onto the AWS global network as close to your users as possible, improving reachability and availability of your workload. AWS Global Accelerator also monitors the health of your application endpoints by using TCP, HTTP, and HTTPS health checks. Any changes in the health or configuration of your endpoints permit redirection of user traffic to healthy endpoints that deliver the best performance and availability to your users. In addition, AWS Global Accelerator has a fault-isolating design that uses two static IPv4 addresses that are serviced by independent network zones increasing the availability of your applications.

To help protect customers from DDoS attacks, AWS provides AWS Shield Standard. Shield Standard comes automatically turned on and protects from common infrastructure (layer 3 and 4) attacks like SYN/UDP floods and reflection attacks to support high availability of your applications on AWS. For additional protections against more sophisticated and larger attacks (like UDP floods), state exhaustion attacks (like TCP SYN floods), and to help protect your applications running on Amazon Elastic Compute Cloud (Amazon EC2), Elastic Load Balancing (ELB), Amazon CloudFront, AWS Global Accelerator, and Route 53, you can consider using AWS Shield Advanced. For protection against Application layer attacks like HTTP POST or GET floods, use AWS WAF. AWS WAF can use IP addresses, HTTP headers, HTTP body, URI strings, SQL injection, and cross-site scripting conditions to determine if a request should be blocked or allowed.

**Implementation steps**

- Set up highly available DNS: Amazon Route 53 is a highly available and scalable [domain name system (DNS)](https://aws.amazon.com/route53/what-is-dns/) web service. Route 53 connects user requests to internet applications running on AWS or on-premises. For more information, see [configuring Amazon Route 53 as your DNS service](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring.html).
- Setup health checks: When using Route 53, verify that only healthy targets are resolvable. Start by [creating Route 53 health checks and configuring DNS failover](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html). The following aspects are important to consider when setting up health checks:

[How Amazon Route 53 determines whether a health check is healthy](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html)
- [Creating, updating, and deleting health checks](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html)
- [Monitoring health check status and getting notifications](https://docs.aws.amazon.com/)
- [Best practices for Amazon Route 53 DNS](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-monitor-view-status.html)

- [Connect your DNS service to your endpoints.](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/best-practices-dns.html)

When using Elastic Load Balancing as a target for your traffic, create an [alias record](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html) using Amazon Route 53 that points to your load balancer’s regional endpoint. During the creation of the alias record, set the Evaluate target health option to Yes.
- For serverless workloads or private APIs when API Gateway is used, use [Route 53 to direct traffic to API Gateway](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-api-gateway.html).

- Decide on a content delivery network.

For delivering content using edge locations closer to the user, start by understanding [how CloudFront delivers content](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowCloudFrontWorks.html).
- Get started with a [simple CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.SimpleDistribution.html). CloudFront then knows where you want the content to be delivered from, and the details about how to track and manage content delivery. The following aspects are important to understand and consider when setting up CloudFront distribution:

[How caching works with CloudFront edge locations](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cache-hit-ratio-explained.html)
- [Increasing the proportion of requests that are served directly from the CloudFront caches (cache hit ratio)](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cache-hit-ratio.html)
- [Using Amazon CloudFront Origin Shield](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-shield.html)
- [Optimizing high availability with CloudFront origin failover](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/high_availability_origin_failover.html)

- Set up application layer protection: AWS WAF helps you protect against common web exploits and bots that can affect availability, compromise security, or consume excessive resources. To get a deeper understanding, review [how AWS WAF works](https://docs.aws.amazon.com/waf/latest/developerguide/how-aws-waf-works.html) and when you are ready to implement protections from application layer HTTP POST AND GET floods, review [Getting started with AWS WAF](https://docs.aws.amazon.com/waf/latest/developerguide/getting-started.html). You can also use AWS WAF with CloudFront see the documentation on [how AWS WAF works with Amazon CloudFront features](https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html).
- Set up additional DDoS protection: By default, all AWS customers receive protection from common, most frequently occurring network and transport layer DDoS attacks that target your web site or application with AWS Shield Standard at no additional charge. For additional protection of internet-facing applications running on Amazon EC2, Elastic Load Balancing, Amazon CloudFront, AWS Global Accelerator, and Amazon Route 53 you can consider [AWS Shield Advanced](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-summary.html) and review [examples of DDoS resilient architectures](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-resiliency.html). To protect your workload and your public endpoints from DDoS attacks review [Getting started with AWS Shield Advanced](https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html).

## Resources

**Related best practices:**

- [REL10-BP01 Deploy the workload to multiple locations](./rel_fault_isolation_multiaz_region_system.html)
- [REL11-BP04 Rely on the data plane and not the control plane during recovery](./rel_withstand_component_failures_avoid_control_plane.html)
- [REL11-BP06 Send notifications when events impact availability](./rel_withstand_component_failures_notifications_sent_system.html)

**Related documents:**

- [APN
Partner: partners that can help plan your networking](https://aws.amazon.com/partners/find/results/?keyword=network)
- [AWS Marketplace for Network Infrastructure](https://aws.amazon.com/marketplace/b/2649366011)
- [What
Is AWS Global Accelerator?](https://docs.aws.amazon.com/global-accelerator/latest/dg/what-is-global-accelerator.html)
- [What
is Amazon CloudFront?](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)
- [What
is Amazon Route 53?](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)
- [What
is Elastic Load Balancing?](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html)
- [Network Connectivity capability - Establishing Your Cloud Foundations](https://docs.aws.amazon.com/whitepapers/latest/establishing-your-cloud-foundation-on-aws/network-connectivity-capability.html)
- [What is Amazon API Gateway?](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html)
- [What are AWS WAF, AWS Shield, and AWS Firewall Manager?](https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html)
- [What is Amazon Application Recovery Controller?](https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html)
- [Configure custom health checks for DNS failover](https://docs.aws.amazon.com/apigateway/latest/developerguide/dns-failover.html)

**Related videos:**

- [AWS re:Invent 2022 - Improve performance and availability with AWS Global Accelerator](https://www.youtube.com/watch?v=s5sjsdDC0Lg)
- [AWS re:Invent 2020: Global traffic management with Amazon Route 53](https://www.youtube.com/watch?v=E33dA6n9O7I)
- [AWS re:Invent 2022 - Operating highly available Multi-AZ applications](https://www.youtube.com/watch?v=mwUV5skJJ0s)
- [AWS re:Invent 2022 - Dive deep on AWS networking infrastructure](https://www.youtube.com/watch?v=HJNR_dX8g8c)
- [AWS re:Invent 2022 - Building resilient networks](https://www.youtube.com/watch?v=u-qamiNgH7Q)

**Related examples:**

- [Disaster Recovery with Amazon Application Recovery Controller (ARC)](https://catalog.us-east-1.prod.workshops.aws/workshops/4d9ab448-5083-4db7-bee8-85b58cd53158/en-US/)
- [AWS Global Accelerator Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/effb1517-b193-4c59-8da5-ce2abdb0b656/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_ha_conn_users.html*

---

# REL02-BP02 Provision redundant connectivity between private networks in the cloud and on-premises environments

Implement redundancy in your connections between private networks in
the cloud and on-premises environments to achieve connectivity
resilience. This can be accomplished by deploying two or more links
and traffic paths, preserving connectivity in the event of network
failures.

**Common anti-patterns:**

- You depend on just one network connection, which creates a single
point of failure.
- You use only one VPN tunnel or multiple tunnels that end in the same
Availability Zone.
- You rely on one ISP for VPN connectivity, which can lead to
complete failures during ISP outages.
- Not implementing dynamic routing protocols like BGP, which are
crucial for rerouting traffic during network disruptions.
- You ignore the bandwidth limitations of VPN tunnels and
overestimate their backup capabilities.

**Benefits of establishing this best
practice:** By implementing redundant connectivity between
your cloud environment and your corporate or on-premises
environment, the dependent services between the two environments can
communicate reliably.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When using AWS Direct Connect to connect your on-premises network
to AWS, you can achieve maximum network resiliency (SLA of 99.99%)
by using separate connections that end on distinct devices in more
than one on-premises location and more than one AWS Direct Connect
location. This topology offers resilience against device failures,
connectivity issues, and complete location outages. Alternatively,
you can achieve high resiliency (SLA of 99.9%) by using two
individual connections to multiple locations (each on-premises
location connected to a single Direct Connect location). This
approach protects against connectivity disruptions caused by fiber
cuts or device failures and helps mitigate complete location
failures. The Direct Connect Resiliency Toolkit can assist in
designing your AWS Direct Connect topology.

You can also consider AWS Site-to-Site VPN ending on an AWS Transit Gateway as a cost-effective backup to your primary AWS Direct Connect connection. This setup enables equal-cost multipath
(ECMP) routing across multiple VPN tunnels, allowing for
throughput of up to 50Gbps, even though each VPN tunnel is capped
at 1.25 Gbps. It's important to note, however, that AWS Direct Connect is still the most effective choice for minimizing network
disruptions and providing stable connectivity.

When using VPNs over the internet to connect your cloud
environment to your on-premises data center, configure two VPN
tunnels as part of a single site-to-site VPN connection. Each
tunnel should end in a different Availability Zone for high
availability and use redundant hardware to prevent on-premises
device failure. Additionally, consider multiple internet
connections from various internet service providers (ISPs) at your
on-premises location to avoid complete VPN connectivity disruption
due to a single ISP outage. Selecting ISPs with diverse routing
and infrastructure, especially those with separate physical paths
to AWS endpoints, provides high connectivity availability.

In addition to physical redundancy with multiple AWS Direct Connect connections and multiple VPN tunnels (or a combination of
both), implementing Border Gateway Protocol (BGP) dynamic routing
is also crucial. Dynamic BGP provides automatic rerouting of
traffic from one path to another based on real-time network
conditions and configured policies. This dynamic behavior is
especially beneficial in maintaining network availability and
service continuity in the event of link or network failures. It
quickly selects alternative paths, enhancing the network's
resilience and reliability.

### Implementation steps

- Acquisition highly-available connectivity between AWS and
your on-premises environment.

Use multiple AWS Direct Connect connections or VPN
tunnels between separately deployed private networks.
- Use multiple Direct Connect locations for high
availability.
- If using multiple AWS Regions, create redundancy in at
least two of them.

- Use AWS Transit Gateway, when possible, to end your
[VPN
connection](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-vpn-attachments.html).
- Evaluate AWS Marketplace appliances to end VPNs or
[extend
your SD-WAN to AWS](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-transit-gateway-sd-wan.html).
If you use AWS Marketplace appliances, deploy redundant
instances for high availability in different Availability
Zones.
- Provide a redundant connection to your on-premises
environment.

You may need redundant connections to multiple AWS Regions to achieve your availability needs.
- Use the
[Direct Connect Resiliency Toolkit](https://docs.aws.amazon.com/directconnect/latest/UserGuide/resilency_toolkit.html) to get started.

## Resources

**Related documents:**

- [AWS Direct Connect Resiliency Recommendations](https://aws.amazon.com/directconnect/resiliency-recommendation/)
- [Using
Redundant Site-to-Site VPN Connections to Provide
Failover](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNConnections.html)
- [Routing
policies and BGP communities](https://docs.aws.amazon.com/directconnect/latest/UserGuide/routing-and-bgp.html)
- [Active/Active
and Active/Passive Configurations in AWS Direct Connect](https://docs.aws.amazon.com/architecture-diagrams/latest/active-active-and-active-passive-configurations-in-aws-direct-connect/active-active-and-active-passive-configurations-in-aws-direct-connect.html)
- [APN
Partner: partners that can help plan your networking](https://aws.amazon.com/partners/find/results/?keyword=network)
- [AWS Marketplace for Network Infrastructure](https://aws.amazon.com/marketplace/b/2649366011)
- [Amazon Virtual Private Cloud Connectivity Options Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/introduction.html)
- [Building
a Scalable and Secure Multi-VPC AWS Network
Infrastructure](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/welcome.html)
- [Using redundant
Site-to-Site VPN connections to provide failover](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNConnections.html)
- [Using
the Direct Connect Resiliency Toolkit to get started](https://docs.aws.amazon.com/directconnect/latest/UserGuide/resilency_toolkit.html)
- [VPC
Endpoints and VPC Endpoint Services (AWS PrivateLink)](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-overview.html)
- [What
Is Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [What
is a transit gateway?](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
- [What
is AWS Site-to-Site VPN?](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html)
- [Working with Direct
Connect gateways](https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-gateways.html)

**Related videos:**

- [AWS re:Invent
2018: Advanced VPC Design and New Capabilities for Amazon VPC](https://youtu.be/fnxXNZdf6ew)
- [AWS re:Invent
2019: AWS Transit Gateway reference architectures for many
VPCs](https://youtu.be/9Nikqn_02Oc)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_ha_conn_private_networks.html*

---

# REL02-BP03 Ensure IP subnet allocation accounts for expansion and availability

Amazon VPC IP address ranges must be large enough to accommodate workload requirements,
including factoring in future expansion and allocation of IP addresses to subnets across
Availability Zones. This includes load balancers, EC2 instances, and container-based
applications.

When you plan your network topology, the first step is to define the IP address space
itself. Private IP address ranges (following RFC 1918 guidelines) should be allocated for each
VPC. Accommodate the following requirements as part of this process:

- Allow IP address space for more than one VPC per Region.
- Within a VPC, allow space for multiple subnets so that you can cover multiple
Availability Zones.
- Consider leaving unused CIDR block space within a VPC for future expansion.
- Ensure that there is IP address space to meet the needs of any transient fleets of Amazon EC2
instances that you might use, such as Spot Fleets for machine learning, Amazon EMR clusters,
or Amazon Redshift clusters. Similar consideration should be given to Kubernetes clusters, such as
Amazon Elastic Kubernetes Service (Amazon EKS), as each Kubernetes pod is assigned a routable address from the VPC CIDR
block by default.
- Note that the first four IP addresses and the last IP address in each subnet CIDR block
are reserved and not available for your use.
- Note that the initial VPC CIDR block allocated to your VPC cannot be changed or deleted,
but you can add additional non-overlapping CIDR blocks to the VPC. Subnet IPv4 CIDRs cannot
be changed, however IPv6 CIDRs can.
- The largest possible VPC CIDR block is a /16, and the smallest is a /28.
- Consider other connected networks (VPC, on-premises, or other cloud providers) and
ensure non-overlapping IP address space. For more information, see [REL02-BP05 Enforce non-overlapping private IP address ranges in all private address
spaces where they are connected.](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_non_overlap_ip.html)

**Desired outcome:** A scalable IP subnet can help you accomodate
for future growth and avoid unnecessary waste.

**Common anti-patterns:**

- Failing to consider future growth, resulting in CIDR blocks that are too small and
requiring reconfiguration, potentially causing downtime.
- Incorrectly estimating how many IP addresses an elastic load balancer can use.
- Deploying many high traffic load balancers into the same subnets
- Using automated scaling mechanisms whilst failing to monitor IP address
consumption.
- Defining excessively large CIDR ranges well beyond future growth expectations, which can
lead to difficulty peering with other networks with overlapping address ranges.

**Benefits of establishing this best practice:** This ensures that
you can accommodate the growth of your workloads and continue to provide availability as you
scale up.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Plan your network to accommodate for growth, regulatory compliance, and integration with
others. Growth can be underestimated, regulatory compliance can change, and acquisitions or
private network connections can be difficult to implement without proper planning.

- Select relevant AWS accounts and Regions based on your service requirements,
latency, regulatory, and disaster recovery (DR) requirements.
- Identify your needs for regional VPC deployments.
- Identify the size of the VPCs.

Determine if you are going to deploy multi-VPC connectivity.

[What
Is a Transit Gateway?](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
- [Single Region
Multi-VPC Connectivity](https://aws.amazon.com/answers/networking/aws-single-region-multi-vpc-connectivity/)

- Determine if you need segregated networking for regulatory requirements.
- Make VPCs with appropriately-sized CIDR blocks to accommodate your current and
future needs.

If you have unknown growth projections, you may wish to err on the side of
larger CIDR blocks to reduce the potential for future reconfiguration

- Consider using [IPv6 addressing](https://aws.amazon.com/vpc/ipv6/) for
subnets as part of a dual-stack VPC. IPv6 is well suited to being used in private
subnets containing fleets of ephemeral instances or containers that would otherwise
require large numbers of IPv4 addresses.

## Resources

**Related Well-Architected best practices:**

- [REL02-BP05 Enforce non-overlapping private IP address ranges in all private address
spaces where they are connected](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_non_overlap_ip.html)

**Related documents:**

- [APN Partner: partners
that can help plan your networking](https://aws.amazon.com/partners/find/results/?keyword=network)
- [AWS Marketplace for Network
Infrastructure](https://aws.amazon.com/marketplace/b/2649366011)
- [Amazon Virtual Private Cloud
Connectivity Options Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/introduction.html)
- [Multiple data
center HA network connectivity](https://aws.amazon.com/answers/networking/aws-multiple-data-center-ha-network-connectivity/)
- [Single Region Multi-VPC Connectivity](https://aws.amazon.com/answers/networking/aws-single-region-multi-vpc-connectivity/)
- [What Is
Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [IPv6 on AWS](https://aws.amazon.com/vpc/ipv6)
- [IPv6 on reference architectures](https://d1.awsstatic.com/architecture-diagrams/ArchitectureDiagrams/IPv6-reference-architectures-for-AWS-and-hybrid-networks-ra.pdf)
- [Amazon Elastic Kubernetes Service
launches IPv6 support](https://aws.amazon.com/blogs/containers/amazon-eks-launches-ipv6-support/)
- [Recommendations for your VPC - Classic Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-backend-instances.html#set-up-ec2)
- [Availability Zone subnets - Application Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#availability-zones)
- [Availability Zones - Network Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#availability-zones)

**Related videos:**

- [AWS re:Invent 2018: Advanced VPC Design and
New Capabilities for Amazon VPC (NET303)](https://youtu.be/fnxXNZdf6ew)
- [AWS re:Invent 2019: AWS Transit Gateway reference
architectures for many VPCs (NET406-R1)](https://youtu.be/9Nikqn_02Oc)
- [AWS re:Invent 2023: AWS Ready
for what's next? Designing networks for growth and flexibility (NET310)](https://www.youtube.com/watch?v=FkWOhTZSfdA)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_ip_subnet_allocation.html*

---

# REL02-BP04 Prefer hub-and-spoke topologies over many-to-many mesh

When connecting multiple private networks, such as Virtual Private
Clouds (VPCs) and on-premises networks, opt for a hub-and-spoke
topology over a meshed one. Unlike meshed topologies, where each
network connects directly to the others and increases the complexity
and management overhead, the hub-and-spoke architecture centralizes
connections through a single hub. This centralization simplifies the
network structure and enhances its operability, scalability, and
control.

AWS Transit Gateway is a managed, scalable, and highly-available
service designed for construction of hub-and-spoke networks on AWS.
It serves as the central hub of your network that provides network
segmentation, centralized routing, and the simplified connection to
both cloud and on-premises environments. The following figure
illustrates how you can use AWS Transit Gateway to build your
hub-and-spoke topology.

**Desired outcome:** You have
connected your Virtual Private Clouds (VPCs) and on-premises
networks through a central hub. You configure your peering
connections through the hub, which acts as a highly scalable cloud
router. Routing is simplified because you do not have to work with
complex peering relationships. Traffic between networks is
encrypted, and you have the ability to isolate networks.

**Common anti-patterns:**

- You build complex network peering rules.
- You provide routes between networks that should not communicate
with one another (for example, separate workloads that have no
interdependencies).
- There is ineffective governance of the hub instance.

**Benefits of establishing this best
practice:** As the number of connected networks increases,
management and expansion of meshed connectivity becomes increasingly
challenging. A mesh architecture introduces additional challenges,
such as additional infrastructure components, configuration
requirements, and deployment considerations. The mesh also
introduces additional overhead to manage and monitor the data plane
and control plane components. You must think about how to provide
high availability of the mesh architecture, how to monitor the mesh
health and performance, and how to handle upgrades of the mesh
components.

A hub-and-spoke model, on the other hand, establishes centralized
traffic routing across multiple networks. It provides a simpler
approach to management and monitoring of the data plane and control
plane components.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Create a Network Services account if one does not exist. Place the
hub in the organization's Network Services account. This approach
allows the hub to be centrally managed by network engineers.

The hub of the hub-and-spoke model acts as a virtual router for
traffic flowing between your Virtual Private Clouds (VPCs) and
on-premises networks. This approach reduces network complexity and
makes it easier to troubleshoot networking issues.

Consider your network design, including the VPCs, AWS Direct Connect, and Site-to-Site VPN connections you want to
interconnect.

Consider using a separate subnet for each transit gateway VPC
attachment. For each subnet, use a small CIDR (for example
/28) so that you have more address space for
compute resources. Additionally, create one network ACL, and
associate it with all of the subnets that are associated with the
hub. Keep the network ACL open in both the inbound and outbound
directions.

Design and implement your routing tables such that routes are
provided only between networks that should communicate. Omit
routes between networks that should not communicate with one
another (for example, between separate workloads that have no
inter-dependencies).

### Implementation steps

- Plan your network. Determine which networks you want to
connect, and verify that they don't share overlapping CIDR
ranges.
- Create an AWS Transit Gateway and attach your VPCs.
- If needed, create VPN connections or Direct Connect
gateways, and associate them with the Transit Gateway.
- Define how traffic is routed between the connected VPCs and
other connections through configuration of your Transit
Gateway route tables.
- Use Amazon CloudWatch to monitor and adjust configurations
as necessary for performance and cost optimization.

## Resources

**Related best practices:**

- [REL02-BP03
Ensure IP subnet allocation accounts for expansion and
availability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_ip_subnet_allocation.html)
- [REL02-BP05
Enforce non-overlapping private IP address ranges in all
private address spaces where they are connected](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_non_overlap_ip.html)

**Related documents:**

- [What
Is a Transit Gateway?](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
- [Transit
gateway design best practices](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-best-design-practices.html)
- [Building
a Scalable and Secure Multi-VPC AWS Network
Infrastructure](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/welcome.html)
- [Building
a global network using AWS Transit Gateway Inter-Region
peering](https://aws.amazon.com/blogs/networking-and-content-delivery/building-a-global-network-using-aws-transit-gateway-inter-region-peering/)
- [Amazon Virtual Private Cloud Connectivity Options](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/introduction.html)
- [APN
Partner: partners that can help plan your networking](https://aws.amazon.com/partners/find/results/?keyword=network)
- [AWS Marketplace for Network Infrastructure](https://aws.amazon.com/marketplace/b/2649366011)

**Related videos:**

- [AWS re:Invent 2023 - AWS networking foundations](https://www.youtube.com/watch?v=8nNurTFy-h4)
- [AWS re:Invent 2023 - Advanced VPC designs and new
capabilities](https://www.youtube.com/watch?v=cRdDCkbE4es)

**Related workshops:**

- [AWS Transit Gateway Workshop](https://catalog.workshops.aws/trasitgw/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_prefer_hub_and_spoke.html*

---

# REL02-BP05 Enforce non-overlapping private IP address ranges in all private address spaces where they are connected

The IP address ranges of each of your VPCs must not overlap when peered, connected via Transit Gateway, or connected over VPN. Avoid IP address conflicts between a VPC and on-premises environments or with other cloud providers that you use. You must also have a way to allocate private IP address ranges when needed. An IP address management (IPAM) system can help with automating this.

**Desired outcome:**

- No IP address range conflicts between VPCs, on-premises environments, or other cloud providers.
- Proper IP address management allows for easier scaling of network infrastructure to accommodate growth and changes in network requirements.

**Common anti-patterns:**

- Using the same IP range in your VPC as you have on premises,
in your corporate network, or other cloud providers
- Not tracking IP ranges of VPCs used to deploy your workloads.
- Relying on manual IP address management processes, such as spreadsheets.
- Over- or under-sizing CIDR blocks, which results in IP address waste or insufficient address space for your workload.

**Benefits of establishing this best
practice:** Active planning of your network will ensure that you do not have multiple occurrences of the same IP address in interconnected networks. This prevents routing problems from occurring in parts of the workload that are using the different applications.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Make use of an IPAM, such as the [Amazon VPC IP Address Manager](https://docs.aws.amazon.com/vpc/latest/ipam/what-it-is-ipam.html), to monitor and manage your CIDR use. Several IPAMs are also available from the AWS Marketplace. Evaluate your potential usage on AWS, add CIDR ranges to existing VPCs, and create VPCs to allow planned growth in usage.

### Implementation steps

- Capture current CIDR consumption (for example, VPCs and subnets).

Use service API operations to collect current CIDR consumption.
- Use the [Amazon VPC IP Address Manager to discover resources](https://docs.aws.amazon.com/vpc/latest/ipam/res-disc-work-with-view.html).

- Capture your current subnet usage.

Use service API operations to [collect subnets](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSubnets.html) per VPC in each Region.
- Use the [Amazon VPC IP Address Manager to discover resources](https://docs.aws.amazon.com/vpc/latest/ipam/res-disc-work-with-view.html).

- Record the current usage.
- Determine if you created any overlapping IP ranges.
- Calculate the spare capacity.
- Identify overlapping IP ranges. You can either migrate to a new range of
addresses or consider using techniques like [private NAT Gateway](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/private-nat-gateway.html) or [AWS PrivateLink](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/aws-privatelink.html) if you need to connect the overlapping ranges.

## Resources

**Related best practices:**

- [Protecting networks](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/protecting-networks.html)

**Related documents:**

- [APN
Partner: partners that can help plan your networking](https://aws.amazon.com/partners/find/results/?keyword=network)
- [AWS Marketplace for Network Infrastructure](https://aws.amazon.com/marketplace/b/2649366011)
- [Amazon Virtual Private Cloud Connectivity Options Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/introduction.html)
- [Multiple
data center HA network connectivity](https://aws.amazon.com/answers/networking/aws-multiple-data-center-ha-network-connectivity/)
- [Connecting Networks with Overlapping IP Ranges](https://aws.amazon.com/blogs/networking-and-content-delivery/connecting-networks-with-overlapping-ip-ranges/)
- [What
Is Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [What
is IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-it-is-ipam.html)

**Related videos:**

- [AWS re:Invent 2023 - Advanced VPC designs and new capabilities](https://www.youtube.com/watch?v=cRdDCkbE4es)
- [AWS re:Invent
2019: AWS Transit Gateway reference architectures for many
VPCs](https://youtu.be/9Nikqn_02Oc)
- [AWS re:Invent 2023 - Ready for what’s next? Designing networks for growth and flexibility](https://www.youtube.com/watch?v=FkWOhTZSfdA)
- [AWS re:Invent 2021 - {New Launch} Manage your IP addresses at scale on AWS](https://www.youtube.com/watch?v=xtLJgJfhPLg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_planning_network_topology_non_overlap_ip.html*

---
