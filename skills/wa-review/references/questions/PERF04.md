# PERF 4 — How do you select and configure networking resources?

**Pillar**: Performance Efficiency  
**Best Practices**: 7

---

# PERF04-BP01 Understand how networking impacts performance

Analyze and understand how network-related decisions impact your
workload to provide efficient performance and improved user
experience.

**Common anti-patterns:**

- All traffic flows through your existing data centers.
- You route all traffic through central firewalls instead of using
cloud-native network security tools.
- You provision AWS Direct Connect connections without understanding
actual usage requirements.
- You don’t consider workload characteristics and encryption
overhead when defining your networking solutions.
- You use on-premises concepts and strategies for networking
solutions in the cloud.

**Benefits of establishing this best
practice:** Understanding how networking impacts workload
performance helps you identify potential bottlenecks, improve user
experience, increase reliability, and lower operational maintenance
as the workload changes.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

The network is responsible for the connectivity between
application components, cloud services, edge networks, and
on-premises data, and therefore it can heavily impact workload
performance. In addition to workload performance, user experience
can be also impacted by network latency, bandwidth, protocols,
location, network congestion, jitter, throughput, and routing
rules.

Have a documented list of networking requirements from the
workload including latency, packet size, routing rules, protocols,
and supporting traffic patterns. Review the available networking
solutions and identify which service meets your workload
networking characteristics. Cloud-based networks can be quickly
rebuilt, so evolving your network architecture over time is
necessary to improve performance efficiency.

### Implementation steps:

- Define and document networking performance requirements,
including metrics such as network latency, bandwidth,
protocols, locations, traffic patterns (spikes and
frequency), throughput, encryption, inspection, and routing
rules.
- Learn about key AWS networking services like [VPCs](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html), [AWS Direct Connect](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect.html), [Elastic Load Balancing (ELB)](https://aws.amazon.com/elasticloadbalancing/), and [Amazon Route 53](https://aws.amazon.com/route53/).
- Capture the following key networking characteristics:

Characteristics

Tools and metrics

Foundational networking characteristics

[VPC
Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [AWS Transit Gateway Flow Logs](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-flow-logs.html)
- [AWS Transit Gateway metrics](https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-cloudwatch-metrics.html)
- [AWS PrivateLink metrics](https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-cloudwatch-metrics.html)

Application networking characteristics

- [Elastic
Fabric Adapter](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-network-performance-ena.html)
- [AWS App Mesh metrics](https://docs.aws.amazon.com/app-mesh/latest/userguide/envoy-metrics.html)
- [Amazon API Gateway metrics](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-metrics-and-dimensions.html)

Edge networking characteristics

- [Amazon CloudFront metrics](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/viewing-cloudfront-metrics.html)
- [Amazon Route 53 metrics](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/monitoring-cloudwatch.html)
- [AWS Global Accelerator metrics](https://docs.aws.amazon.com/global-accelerator/latest/dg/cloudwatch-monitoring.html)

Hybrid networking characteristics

- [Direct Connect metrics](https://docs.aws.amazon.com/directconnect/latest/UserGuide/monitoring-cloudwatch.html)
- [AWS Site-to-Site VPN metrics](https://docs.aws.amazon.com/vpn/latest/s2svpn/monitoring-cloudwatch-vpn.html)
- [AWS Client VPN metrics](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/monitoring-cloudwatch.html)
- [AWS Cloud WAN metrics](https://docs.aws.amazon.com/vpc/latest/cloudwan/cloudwan-cloudwatch-metrics.html)

Security networking characteristics

- [AWS Shield, AWS WAF, and AWS Network Firewall metrics](https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html)

Tracing characteristics

- [AWS X-Ray](https://aws.amazon.com/xray/)
- [VPC
Reachability Analyzer](https://docs.aws.amazon.com/vpc/latest/reachability/what-is-reachability-analyzer.html)
- [Network Access Analyzer](https://docs.aws.amazon.com/vpc/latest/network-access-analyzer/what-is-network-access-analyzer.html)
- [Amazon Inspector](https://docs.aws.amazon.com/inspector/latest/user/what-is-inspector.html)
- [Amazon CloudWatch RUM](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM.html)

- Benchmark and test network performance:

[Benchmark](https://aws.amazon.com/premiumsupport/knowledge-center/network-throughput-benchmark-linux-ec2/) network
throughput, as some factors can affect Amazon EC2 network
performance when instances are in the same VPC. Measure
the network bandwidth between Amazon EC2 Linux instances in the
same VPC.
- Perform [load
tests](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/) to experiment with networking solutions and
options.

## Resources

**Related documents:**

- [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [EC2
Enhanced Networking on Linux](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html)
- [EC2
Enhanced Networking on Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html)
- [EC2
Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [Enabling
Enhanced Networking with the Elastic Network Adapter (ENA) on
Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking-ena.html)
- [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [Networking
Products with AWS](https://aws.amazon.com/products/networking/)
- [Transit Gateway](https://docs.aws.amazon.com/vpc/latest/tgw)
- [Transitioning
to latency-based routing in Amazon Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/TutorialTransitionToLBR.html)
- [VPC
Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)

**Related videos:**

- [AWS re:Invent 2023 - AWS networking foundations](https://www.youtube.com/watch?v=8nNurTFy-h4)
- [AWS re:Invent 2023 - What can networking do for your application?](https://www.youtube.com/watch?v=tUh26i8uY9Q)
- [AWS re:Invent 2023 - Advanced VPC designs and new capabilities](https://www.youtube.com/watch?v=cRdDCkbE4es)
- [AWS re:Invent 2023 - A developer’s guide to cloud networking](https://www.youtube.com/watch?v=i77D556lrgY)
- [AWS re:Invent 2019 - Connectivity
to AWS and hybrid AWS network architectures](https://www.youtube.com/watch?v=eqW6CPb58gs)
- [AWS re:Invent 2019 - Optimizing
Network Performance for Amazon EC2 Instances](https://www.youtube.com/watch?v=DWiwuYtIgu0)
- [AWS Summit Online - Improve Global
Network Performance for Applications](https://youtu.be/vNIALfLTW9M)
- [AWS re:Invent 2020 - Networking
best practices and tips with the Well-Architected
Framework](https://youtu.be/wOMNpG49BeM)
- [AWS re:Invent 2020 - AWS networking
best practices in large-scale migrations](https://youtu.be/qCQvwLBjcbs)

**Related examples:**

- [AWS Transit Gateway and Scalable Security Solutions](https://github.com/aws-samples/aws-transit-gateway-and-scalable-security-solutions)
- [AWS Networking Workshops](https://networking.workshop.aws/)
- [Hands-on Network Firewall Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/d071f444-e854-4f3f-98c8-025fa0d1de2f/en-US)
- [Observing and Diagnosing your Network on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/cf2ecaa4-e4be-4f40-b93f-e9fe3b1c1f64/en-US)
- [Finding and addressing Network Misconfigurations on AWS](https://validating-network-reachability.awssecworkshops.com/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_understand_how_networking_impacts_performance.html*

---

# PERF04-BP02 Evaluate available networking features

Evaluate networking features in the cloud that may increase performance. Measure the impact of these features through testing, metrics, and analysis. For example, take advantage of network-level features that are available to reduce latency, network distance, or jitter.

**Common anti-patterns:**

- You stay within one Region because that is where your headquarters is physically located.
- You use firewalls instead of security groups for filtering traffic.
- You break TLS for traffic inspection rather than relying on security groups, endpoint policies, and other cloud-native functionality.
- You only use subnet-based segmentation instead of security groups.

**Benefits of establishing this best
practice:** Evaluating all service features and options can increase your workload performance, reduce the cost of infrastructure, decrease the effort required to maintain your workload, and increase your overall security posture. You can use the global AWS backbone to provide the optimal networking experience for your customers.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS offers services like [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/) and [Amazon CloudFront](https://aws.amazon.com/cloudfront/) that can help improve network performance, while most AWS services have product features (such as the [Amazon S3 Transfer Acceleration](https://aws.amazon.com/s3/transfer-acceleration/) feature) to optimize network traffic.

Review which network-related configuration options are available to you and how they could impact your workload. Performance optimization depends on understanding how these options interact with your architecture and the impact that they will have on both measured performance and user experience.

### Implementation steps

- Create a list of workload components.

Consider using [AWS Cloud WAN](https://aws.amazon.com/cloud-wan/) to build, manage and monitor your organization's network when building a unified global network.
- Monitor your global and core networks with [Amazon CloudWatch Logs metrics](https://docs.aws.amazon.com/network-manager/latest/tgwnm/monitoring-cloudwatch-metrics.html). Leverage [Amazon CloudWatch RUM](https://aws.amazon.com/about-aws/whats-new/2021/11/amazon-cloudwatch-rum-applications-client-side-performance/), which provides insights to help to identify, understand, and enhance users’ digital experience.
- View aggregate network latency between AWS Regions and Availability Zones, as well as within each Availability Zone, using [AWS Network Manager](https://aws.amazon.com/transit-gateway/network-manager/) to gain insight into how your application performance relates to the performance of the underlying AWS network.
- Use an existing configuration management database (CMDB) tool or a service such as [AWS Config](https://aws.amazon.com/config/) to create an inventory of your workload and how it’s configured.

- If this is an existing workload, identify and document the benchmark for your performance metrics, focusing on the bottlenecks and areas to improve. Performance-related networking metrics will differ per workload based on business requirements and workload characteristics. As a start, these metrics might be important to review for your workload: bandwidth, latency, packet loss, jitter, and retransmits.
- If this is a new workload, perform [load tests](https://aws.amazon.com/solutions/implementations/distributed-load-testing-on-aws/) to identify performance bottlenecks.
- For the performance bottlenecks you identify, review the configuration options for your solutions to identify performance improvement opportunities. Check out the following key networking options and features:

Improvement opportunity
Solution

Network path or routes

Use [Network Access Analyzer](https://docs.aws.amazon.com/vpc/latest/network-access-analyzer/what-is-network-access-analyzer.html) to identify paths or routes.

Network protocols

See [PERF04-BP05 Choose network protocols to improve performance](./perf_networking_choose_network_protocols_improve_performance.html)

Network topology

Evaluate your operational and performance tradeoffs between [VPC Peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) and [AWS Transit Gateway](https://aws.amazon.com/transit-gateway/) when connecting multiple accounts. AWS Transit Gateway simplifies how you interconnect all of your VPCs, which can span across thousands of AWS accounts and into on-premises networks. Share your AWS Transit Gateway between multiple accounts using [AWS Resource Access Manager](https://aws.amazon.com/ram/).

See [PERF04-BP03 Choose appropriate dedicated connectivity or VPN for your workload](./perf_networking_choose_appropriate_dedicated_connectivity_or_vpn.html)

Network services

[AWS Global Accelerator](https://aws.amazon.com/global-accelerator/) is a networking service that improves the performance of your users’ traffic by up to 60% using the AWS global network infrastructure.

[Amazon CloudFront](https://aws.amazon.com/cloudfront/) can improve the performance of your workload content delivery and latency globally.

Use [Lambda@edge](https://aws.amazon.com/lambda/edge/) to run functions that customize the content that CloudFront delivers closer to the users, reduce latency, and improve performance.

Amazon Route 53 offers [latency-based routing](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-latency.html), [geolocation routing](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-geo.html), [geoproximity routing](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-geoproximity.html), and [IP-based routing](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-ipbased.html) options to help you improve your workload’s performance for a global audience. Identify which routing option would optimize your workload performance by reviewing your workload traffic and user location when your workload is distributed globally.

Storage resource features

[Amazon S3 Transfer Acceleration](https://aws.amazon.com/s3/transfer-acceleration/) is a feature that lets external users benefit from the networking optimizations of CloudFront to upload data to Amazon S3. This improves the ability to transfer large amounts of data from remote locations that don’t have dedicated connectivity to the AWS Cloud.

[Amazon S3 Multi-Region Access Points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPoints.html) replicates content to multiple Regions and simplifies the workload by providing one access point. When a Multi-Region Access Point is used, you can request or write data to Amazon S3 with the service identifying the lowest latency bucket.

Compute resource features

[Elastic Network Interfaces (ENI)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html) used by Amazon EC2 instances, containers, and Lambda functions are limited on a per-flow basis. Review your placement groups to optimize your [EC2 networking throughput](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-network-bandwidth.html). To avoid a bottleneck on a per flow-basis, design your application to use multiple flows. To monitor and get visibility into your compute related networking metrics, use CloudWatch Metrics and [ethtool](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-network-performance-ena.html). The `ethtool` command is included in the ENA driver and exposes additional network-related metrics that can be published as a [custom metric](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html) to CloudWatch.

[Amazon Elastic Network Adapters (ENA)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking-ena.html) provide further optimization by delivering better throughput for your instances within a [cluster placement group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html#placement-groups-cluster%23placement-groups-limitations-cluster).

[Elastic Fabric Adapter (EFA)](https://aws.amazon.com/hpc/efa/) is a network interface for Amazon EC2 instances that allows you to run workloads requiring high levels of internode communications at scale on AWS.

[Amazon EBS-optimized instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html) use an optimized configuration stack and provide additional, dedicated capacity to increase the Amazon EBS I/O.

## Resources

**Related documents:**

- [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [EC2 Enhanced Networking on Linux](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html)
- [EC2 Enhanced Networking on Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html)
- [EC2 Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [Enabling Enhanced Networking with the Elastic Network Adapter (ENA) on Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking-ena.html)
- [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [Networking Products with AWS](https://aws.amazon.com/products/networking/)
- [Transitioning to Latency-Based Routing in Amazon Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/TutorialTransitionToLBR.html)
- [VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html)
- [VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)

**Related videos:**

- [AWS re:Invent 2023 – Ready for what's next? Designing networks for growth and flexibility](https://www.youtube.com/watch?v=FkWOhTZSfdA)
- [AWS re:Invent 2023 – Advanced VPC designs and new capabilities](https://www.youtube.com/watch?v=cRdDCkbE4es)
- [AWS re:Invent 2023 – A developer's guide to cloud networking](https://www.youtube.com/watch?v=i77D556lrgY)
- [AWS re:Invent 2022 – Dive deep on AWS networking infrastructure](https://www.youtube.com/watch?v=HJNR_dX8g8c)
- [AWS re:Invent 2019 – Connectivity to AWS and hybrid AWS network architectures](https://www.youtube.com/watch?v=eqW6CPb58gs)
- [AWS re:Invent 2018 – Optimizing Network Performance for Amazon EC2 Instances](https://www.youtube.com/watch?v=DWiwuYtIgu0)
- [AWS Global Accelerator](https://www.youtube.com/watch?v=Docl4julOQw)

**Related examples:**

- [AWS Transit Gateway and Scalable Security Solutions](https://github.com/aws-samples/aws-transit-gateway-and-scalable-security-solutions)
- [AWS Networking Workshops](https://catalog.workshops.aws/networking/en-US)
- [Observing and diagnosing your network](https://catalog.us-east-1.prod.workshops.aws/workshops/cf2ecaa4-e4be-4f40-b93f-e9fe3b1c1f64/en-US)
- [Finding and addressing network misconfigurations on AWS](https://validating-network-reachability.awssecworkshops.com/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_evaluate_networking_features.html*

---

# PERF04-BP03 Choose appropriate dedicated connectivity or VPN for your workload

When hybrid connectivity is required to connect on-premises and
cloud resources, provision adequate bandwidth to meet your
performance requirements. Estimate the bandwidth and latency
requirements for your hybrid workload. These numbers will drive your
sizing requirements.

**Common anti-patterns:**

- You only evaluate VPN solutions for your network encryption
requirements.
- You do not evaluate backup or redundant connectivity options.
- You do not identify all workload requirements (encryption,
protocol, bandwidth, and traffic needs).

**Benefits of establishing this best
practice:** Selecting and configuring appropriate
connectivity solutions will increase the reliability of your
workload and maximize performance. By identifying workload
requirements, planning ahead, and evaluating hybrid solutions, you
can minimize expensive physical network changes and operational
overhead while increasing your time-to-value.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Develop a hybrid networking architecture based on your bandwidth
requirements. [Direct Connect](https://aws.amazon.com/directconnect/) allows you to connect your
on-premises network privately with AWS. It is suitable when you
need high-bandwidth and low-latency while achieving consistent
performance. A VPN connection establishes secure connection over
the internet. It is used when only a temporary connection is
required, when cost is a factor, or as a contingency while waiting
for resilient physical network connectivity to be established when using Direct Connect.

If your bandwidth requirements are high, you might consider
multiple Direct Connect or VPN services. Traffic can be load
balanced across services, although we don't recommend load
balancing between Direct Connect and VPN because of the latency
and bandwidth differences.

### Implementation steps

- Estimate the bandwidth and latency requirements of your
existing applications.

For existing workloads that are moving to AWS, leverage the
data from your internal network monitoring systems.
- For new or existing workloads for which you don’t have
monitoring data, consult with the product owners to
determine adequate performance metrics and provide a good
user experience.

- Select dedicated connection or VPN as your connectivity
option. Based on all workload requirements (encryption,
bandwidth, and traffic needs), you can either choose AWS Direct Connect or [Site-to-Site VPN](https://aws.amazon.com/vpn/) (or both). The
following diagram can help you choose the appropriate
connection type.

[AWS Direct Connect](https://aws.amazon.com/directconnect/) provides dedicated connectivity to the
AWS environment, from 50 Mbps up to 100 Gbps, using either
dedicated connections or hosted connections. This gives you
managed and controlled latency and provisioned bandwidth so
your workload can connect efficiently to other environments.
Using AWS Direct Connect partners, you can have end-to-end
connectivity from multiple environments, providing an
extended network with consistent performance. AWS offers
scaling direct connect connection bandwidth using either
native 100 Gbps, link aggregation group (LAG), or BGP
equal-cost multipath (ECMP).
- The AWS [Site-to-Site VPN](https://aws.amazon.com/vpn/) provides a managed VPN service supporting internet protocol security (IPsec). When a VPN connection is created, each VPN connection includes two tunnels for high availability.

- Follow AWS documentation to choose an appropriate
connectivity option:

If you decide to use Direct Connect, select the
appropriate bandwidth for your connectivity.
- If you are using an AWS Site-to-Site VPN across multiple
locations to connect to an AWS Region, use
an [accelerated
Site-to-Site VPN connection](https://docs.aws.amazon.com/vpn/latest/s2svpn/accelerated-vpn.html) for the opportunity
to improve network performance.
- If your network design consists of IPSec VPN connection
over [AWS Direct Connect](https://aws.amazon.com/directconnect/), consider using Private IP VPN to
improve security and achieve
segmentation. [AWS Site-to-Site Private IP VPN](https://aws.amazon.com/blogs/networking-and-content-delivery/introducing-aws-site-to-site-vpn-private-ip-vpns/) is deployed on top of
transit virtual interface (VIF).
- [AWS Direct Connect SiteLink](https://aws.amazon.com/blogs/aws/new-site-to-site-connectivity-with-aws-direct-connect-sitelink/) allows creating
low-latency and redundant connections between your data
centers worldwide by sending data over the fastest path
between [AWS Direct Connect locations](https://aws.amazon.com/directconnect/locations/), bypassing AWS Regions.

- Validate your connectivity setup before deploying to
production. Perform security and performance testing to
assure it meets your bandwidth, reliability, latency, and
compliance requirements.
- Regularly monitor your connectivity performance and usage
and optimize if required.

*Deterministic performance flowchart*

## Resources

**Related documents:**

- [Networking Products with AWS](https://aws.amazon.com/products/networking/)
- [AWS Transit Gateway](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
- [VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html)
- [Building
a Scalable and Secure Multi-VPC AWS Network
Infrastructure](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/welcome.html)
- [Client
VPN](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/what-is.html)

**Related videos:**

- [AWS re:Invent 2023 – Building hybrid network connectivity with AWS](https://www.youtube.com/watch?v=Fi4me2vPwrQ)
- [AWS re:Invent 2023 – Secure remote connectivity to AWS](https://www.youtube.com/watch?v=yHEhrkGdnj0)
- [AWS re:Invent 2022 – Optimizing performance with Amazon CloudFront](https://www.youtube.com/watch?v=LkyifXYEtrg)
- [AWS re:Invent 2019 – Connectivity to AWS and hybrid AWS network architectures](https://www.youtube.com/watch?v=eqW6CPb58gs)
- [AWS re:Invent 2020 – AWS Transit Gateway Connect](https://www.youtube.com/watch?v=_MPY_LHSKtM&t=491s)

**Related examples:**

- [AWS Transit Gateway and Scalable Security Solutions](https://github.com/aws-samples/aws-transit-gateway-and-scalable-security-solutions)
- [AWS Networking Workshops](https://networking.workshop.aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_choose_appropriate_dedicated_connectivity_or_vpn.html*

---

# PERF04-BP04 Use load balancing to distribute traffic across multiple resources

Distribute traffic across multiple resources or services to allow your workload to take
advantage of the elasticity that the cloud provides. You can also use load balancing for
offloading encryption termination to improve performance, reliability and manage and route
traffic effectively.

**Common anti-patterns:**

- You don’t consider your workload requirements when choosing the load balancer type.
- You don’t leverage the load balancer features for performance optimization.
- The workload is exposed directly to the internet without a load balancer.
- You route all internet traffic through existing load balancers.
- You use generic TCP load balancing and making each compute node handle SSL encryption.

**Benefits of establishing this best practice:** A load balancer
handles the varying load of your application traffic in a single Availability Zone or across
multiple Availability Zones and enables high availability, automatic scaling, and better
utilization for your workload.

**Level of risk exposed if this best practice is not established:**
High

## Implementation guidance

Load balancers act as the entry point for your workload, from which point they distribute
the traffic to your backend targets, such as compute instances or containers, to improve
utilization.

Choosing the right load balancer type is the first step to optimize your architecture.
Start by listing your workload characteristics, such as protocol (like TCP, HTTP, TLS, or
WebSockets), target type (like instances, containers, or serverless), application requirements
(like long running connections, user authentication, or stickiness), and placement (like
Region, Local Zone, Outpost, or zonal isolation).

AWS provides multiple models for your applications to use load balancing. [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) is best suited for load balancing of HTTP and HTTPS traffic and provides
advanced request routing targeted at the delivery of modern application architectures,
including microservices and containers.

[Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html) is best suited for load balancing of TCP traffic where extreme performance is
required. It is capable of handling millions of requests per second while maintaining
ultra-low latencies, and it is optimized to handle sudden and volatile traffic patterns.

[Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) provides integrated
certificate management and SSL/TLS decryption, allowing you the flexibility to centrally
manage the SSL settings of the load balancer and offload CPU intensive work from your
workload.

After choosing the right load balancer, you can start leveraging its features to reduce
the amount of effort your backend has to do to serve the traffic.

For example, using both Application Load Balancer (ALB) and Network Load Balancer (NLB), you can perform SSL/TLS encryption
offloading, which is an opportunity to avoid the CPU-intensive TLS handshake from being
completed by your targets and also to improve certificate management.

When you configure SSL/TLS offloading in your load balancer, it becomes responsible for
the encryption of the traffic from and to clients while delivering the traffic unencrypted to
your backends, freeing up your backend resources and improving the response time for the
clients.

Application Load Balancer can also serve HTTP/2 traffic without needing to support it on your targets. This
simple decision can improve your application response time, as HTTP/2 uses TCP connections
more efficiently.

Your workload latency requirements should be considered when defining the architecture.
As an example, if you have a latency-sensitive application, you may decide to use Network Load Balancer, which
offers extremely low latencies. Alternatively, you may decide to bring your workload closer to
your customers by leveraging Application Load Balancer in [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/) or even [AWS Outposts](https://aws.amazon.com/outposts/rack/).

Another consideration for latency-sensitive workloads is cross-zone load balancing. With
cross-zone load balancing, each load balancer node distributes traffic across the registered
targets in all allowed Availability Zones.

Use Auto Scaling integrated with your load balancer. One of the key aspects of a performance
efficient system has to do with right-sizing your backend resources. To do this, you can
leverage load balancer integrations for backend target resources. Using the load balancer
integration with Auto Scaling groups, targets will be added or removed from the load balancer as
required in response to incoming traffic. Load balancers can also integrate with [Amazon ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html) and [Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html) for containerized workloads.

- [Amazon ECS - Service load
balancing](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html)
- [Application load
balancing on Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html)
- [Network
load balancing on Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html)

### Implementation steps

- Define your load balancing requirements including traffic volume, availability and
application scalability.
- Choose the right load balancer type for your application.

Use Application Load Balancer for HTTP/HTTPS workloads.
- Use Network Load Balancer for non-HTTP workloads that run on TCP or UDP.
- Use a combination of both ([ALB as a target of NLB](https://aws.amazon.com/blogs/networking-and-content-delivery/application-load-balancer-type-target-group-for-network-load-balancer/)) if you want to leverage features of both
products. For example, you can do this if you want to use the static IPs of NLB
together with HTTP header based routing from ALB, or if you want to expose your HTTP
workload to an [AWS PrivateLink](https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-share-your-services.html).
- For a full comparison of load balancers, see [ELB product comparison](https://aws.amazon.com/elasticloadbalancing/features/).

- Use SSL/TLS offloading if possible.

Configure HTTPS/TLS listeners with both [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html) and [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html) integrated with [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/).
- Note that some workloads may require end-to-end encryption for compliance
reasons. In this case, it is a requirement to allow encryption at the targets.
- For security best practices, see [SEC09-BP02 Enforce encryption in transit](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_data_transit_encrypt.html).

- Select the right routing algorithm (only ALB).

The routing algorithm can make a difference in how well-used your backend
targets are and therefore how they impact performance. For example, ALB
provides [two options for routing algorithms](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#modify-routing-algorithm):
- **Least outstanding requests:** Use to achieve a better
load distribution to your backend targets for cases when the requests for your
application vary in complexity or your targets vary in processing capability.
- **Round robin:** Use when the requests and targets are
similar, or if you need to distribute requests equally among targets.

- Consider cross-zone or zonal isolation.

Use cross-zone turned off (zonal isolation) for latency improvements and zonal
failure domains. It is turned off by default in NLB and in [ALB you can
turn it off per target group](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/disable-cross-zone.html).
- Use cross-zone turned on for increased availability and flexibility. By
default, cross-zone is turned on for ALB and in [NLB you can
turn it on per target group](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/target-group-cross-zone.html).

- Turn on HTTP keep-alives for your HTTP workloads (only ALB). With this feature, the
load balancer can reuse backend connections until the keep-alive timeout expires,
improving your HTTP request and response time and also reducing resource utilization on
your backend targets. For detail on how to do this for Apache and Nginx, see [What are
the optimal settings for using Apache or NGINX as a backend server for ELB?](https://aws.amazon.com/premiumsupport/knowledge-center/apache-backend-elb/)
- Turn on monitoring for your load balancer.

Turn on access logs for your [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/enable-access-logging.html) and [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-access-logs.html).
- The main fields to consider for ALB
are `request_processing_time`, `request_processing_time`,
and `response_processing_time`.
- The main fields to consider for NLB
are `connection_time` and `tls_handshake_time`.
- Be ready to query the logs when you need them. You can use Amazon Athena to query
both [ALB
logs](https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html) and [NLB logs](https://docs.aws.amazon.com/athena/latest/ug/networkloadbalancer-classic-logs.html).
- Create alarms for performance related metrics such as [TargetResponseTime for ALB](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html).

## Resources

**Related documents:**

- [ELB product
comparison](https://aws.amazon.com/elasticloadbalancing/features/)
- [AWS Global
Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
- [Improving Performance and Reducing Cost Using Availability Zone Affinity](https://aws.amazon.com/blogs/architecture/improving-performance-and-reducing-cost-using-availability-zone-affinity/)
- [Step by step for Log Analysis with Amazon Athena](https://github.com/aws/elastic-load-balancing-tools/tree/master/amazon-athena-for-elb)
- [Querying Application Load Balancer logs](https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html)
- [Monitor your
Application Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-monitoring.html)
- [Monitor your
Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-monitoring.html)
- [Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html)

**Related videos:**

- [AWS re:Invent 2023: What can
networking do for your application?](https://www.youtube.com/watch?v=tUh26i8uY9Q)
- [AWS re:Inforce 20: How to use
Elastic Load Balancing to enhance your security posture at scale](https://www.youtube.com/watch?v=YhNc5VSzOGQ)
- [AWS re:Invent 2018: Elastic Load Balancing: Deep
Dive and Best Practices](https://www.youtube.com/watch?v=VIgAT7vjol8)
- [AWS re:Invent 2021 - How to
choose the right load balancer for your AWS workloads](https://www.youtube.com/watch?v=p0YZBF03r5A)
- [AWS re:Invent 2019: Get the
most from Elastic Load Balancing for different workloads](https://www.youtube.com/watch?v=HKh54BkaOK0)

**Related examples:**

- [Gateway Load Balancer](https://catalog.workshops.aws/gwlb-networking/en-US)
- [CDK and CloudFormation samples for Log Analysis with Amazon Athena](https://github.com/aws/elastic-load-balancing-tools/tree/master/log-analysis-elb-cdk-cf-template)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_load_balancing_distribute_traffic.html*

---

# PERF04-BP05 Choose network protocols to improve performance

Make decisions about protocols for communication between systems and
networks based on the impact to the workload’s performance.

There is a relationship between latency and bandwidth to achieve
throughput. If your file transfer is using Transmission Control
Protocol (TCP), higher latencies will most likely reduce overall
throughput. There are approaches to fix this with TCP tuning and
optimized transfer protocols, but one solution is to use User
Datagram Protocol (UDP).

**Common anti-patterns:**

- You use TCP for all workloads regardless of performance
requirements.

**Benefits of establishing this best
practice:** Verifying that an appropriate protocol is used for communication
between users and workload components helps improve overall user
experience for your applications. For instance, connection-less UDP
allows for high speed, but it doesn't offer retransmission or high
reliability. TCP is a full featured protocol, but it requires
greater overhead for processing the packets.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

If you have the ability to choose different protocols for your
application and you have expertise in this area, optimize your
application and end-user experience by using a different protocol.
Note that this approach comes with significant difficulty and
should only be attempted if you have optimized your application in
other ways first.

A primary consideration for improving your workload’s performance
is to understand the latency and throughput requirements, and then
choose network protocols that optimize performance.

**When to consider using TCP**

TCP provides reliable data delivery, and can be used for
communication between workload components where reliability and
guaranteed delivery of data is important. Many web-based
applications rely on TCP-based protocols, such as HTTP and HTTPS,
to open TCP sockets for communication between application
components. Email and file data transfer are common applications
that also make use of TCP, as it is a simple and reliable transfer
mechanism between application components. Using TLS with TCP can
add some overhead to the communication, which can result in
increased latency and reduced throughput, but it comes with the
advantage of security. The overhead comes mainly from the added
overhead of the handshake process, which can take several
round-trips to complete. Once the handshake is complete, the
overhead of encrypting and decrypting data is relatively small.

**When to consider using UDP**

UDP is a connection-less-oriented protocol and is therefore
suitable for applications that need fast, efficient transmission,
such as log, monitoring, and VoIP data. Also, consider using UDP
if you have workload components that respond to small queries from
large numbers of clients to ensure optimal performance of the
workload. Datagram Transport Layer Security (DTLS) is the UDP
equivalent of Transport Layer Security (TLS). When using DTLS with
UDP, the overhead comes from encrypting and decrypting the data,
as the handshake process is simplified. DTLS also adds a small
amount of overhead to the UDP packets, as it includes additional
fields to indicate the security parameters and to detect
tampering.

**When to consider using SRD**

Scalable reliable datagram (SRD) is a network transport protocol
optimized for high-throughput workloads due to its ability to
load-balancer traffic across multiple paths and quickly recover
from packet drops or link failures. SRD is therefore best used for
high performance computing (HPC) workloads that require high
throughput and low latency communication between compute nodes.
This might include parallel processing tasks such as simulation,
modeling, and data analysis that involve a large amount of data
transfer between nodes.

### Implementation steps

- Use
the [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/) and [AWS Transfer Family](https://aws.amazon.com/aws-transfer-family/) services to improve the throughput of
your online file transfer applications. The AWS Global Accelerator service helps you achieve lower latency between
your client devices and your workload on AWS. With AWS Transfer Family, you can use TCP-based protocols such as
Secure Shell File Transfer Protocol (SFTP) and File Transfer
Protocol over SSL (FTPS) to securely scale and manage your
file transfers to AWS storage services.
- Use network latency to determine if TCP is appropriate for
communication between workload components. If the network
latency between your client application and server is high,
then the TCP three-way handshake can take some time, thereby
impacting on the responsiveness of your application. Metrics
such as time to first byte (TTFB) and round-trip time (RTT)
can be used to measure network latency. If your workload
serves dynamic content to users, consider
using [Amazon CloudFront](https://aws.amazon.com/cloudfront/), which establishes a persistent connection
to each origin for dynamic content to remove the connection
setup time that would otherwise slow down each client
request.
- Using TLS with TCP or UDP can result in increased latency
and reduced throughput for your workload due to the impact
of encryption and decryption. For such workloads, consider
SSL/TLS offloading
on [Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) to improve workload performance by
allowing the load balancer to handle SSL/TLS encryption and
decryption process instead of having backend instances do
it. This can help reduce the CPU utilization on the backend
instances, which can improve performance and increase
capacity.
- Use
the [Network Load Balancer (NLB)](https://aws.amazon.com/elasticloadbalancing/network-load-balancer/) to deploy services that rely on
the UDP protocol, such as authentication and authorization,
logging, DNS, IoT, and streaming media, to improve the
performance and reliability of your workload. The NLB
distributes incoming UDP traffic across multiple targets,
allowing you to scale your workload horizontally, increase
capacity, and reduce the overhead of a single target.
- For your High Performance Computing (HPC) workloads,
consider using
the [Elastic
Network Adapter (ENA) Express](https://aws.amazon.com/about-aws/whats-new/2022/11/elastic-network-adapter-ena-express-amazon-ec2-instances/) functionality that uses
the SRD protocol to improve network performance by providing
a higher single flow bandwidth (25 Gbps) and lower tail
latency (99.9 percentile) for network traffic between EC2
instances.
- Use
the [Application Load Balancer (ALB)](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) to route and load balance your
gRPC (Remote Procedure Calls) traffic between workload
components or between gRPC clients and services. gRPC uses
the TCP-based HTTP/2 protocol for transport and it provides
performance benefits such as lighter network footprint,
compression, efficient binary serialization, support for
numerous languages, and bi-directional streaming.

## Resources

**Related documents:**

- [How to route UDP traffic into Kubernetes](https://aws.amazon.com/blogs/containers/how-to-route-udp-traffic-into-kubernetes/)
- [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [EC2
Enhanced Networking on Linux](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html)
- [EC2
Enhanced Networking on Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html)
- [EC2
Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [Enabling
Enhanced Networking with the Elastic Network Adapter (ENA) on
Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking-ena.html)
- [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [Networking
Products with AWS](https://aws.amazon.com/products/networking/)
- [Transitioning
to Latency-Based Routing in Amazon Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/TutorialTransitionToLBR.html)
- [VPC
Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)

**Related videos:**

- [AWS re:Invent 2022 – Scaling network performance on next-gen Amazon Elastic Compute Cloud instances](https://www.youtube.com/watch?v=jNYpWa7gf1A)
- [AWS re:Invent 2022 – Application networking foundations](https://www.youtube.com/watch?v=WcZwWuq6FTk)

**Related examples:**

- [AWS Transit Gateway and Scalable Security Solutions](https://github.com/aws-samples/aws-transit-gateway-and-scalable-security-solutions)
- [AWS Networking Workshops](https://networking.workshop.aws/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_choose_network_protocols_improve_performance.html*

---

# PERF04-BP06 Choose your workload's location based on network requirements

Evaluate options for resource placement to reduce network latency and improve throughput, providing an optimal user experience by reducing page load and data transfer times.

**Common anti-patterns:**

- You consolidate all workload resources into one geographic location.
- You chose the closest Region to your location but not to the workload end user.

**Benefits of establishing this best
practice:** User experience is greatly affected by the latency between the user and your application. By using appropriate AWS Regions and the AWS private global network, you can reduce latency and deliver a better experience to remote users.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Resources, such as Amazon EC2 instances, are placed into Availability Zones within [AWS Regions](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/), [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/), [AWS Outposts](https://aws.amazon.com/outposts/), or [AWS Wavelength](https://aws.amazon.com/wavelength/) zones. Selection of this location influences network latency and throughput from a given user location. Edge services like [Amazon CloudFront](https://aws.amazon.com/cloudfront/) and [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/) can also be used to improve network performance by either caching content at edge locations or providing users with an optimal path to the workload through the AWS global network.

Amazon EC2 provides placement groups for networking. A placement group is a logical grouping of instances to decrease latency. Using placement groups with supported instance types and an Elastic Network Adapter (ENA) enables workloads to participate in a low-latency, reduced jitter 25 Gbps network. Placement groups are recommended for workloads that benefit from low network latency, high network throughput, or both.

Latency-sensitive services are delivered at edge locations using AWS global network, such as [Amazon CloudFront](https://aws.amazon.com/cloudfront/). These edge locations commonly provide services like content delivery network (CDN) and domain name system (DNS). By having these services at the edge, workloads can respond with low latency to requests for content or DNS resolution. These services also provide geographic services, such as geotargeting of content (providing different content based on the end users’ location) or latency-based routing to direct end users to the nearest Region (minimum latency).

Use edge services to reduce latency and to enable content caching. Configure cache control correctly for both DNS and HTTP/HTTPS to gain the most benefit from these approaches.

### Implementation steps

- Capture information about the IP traffic going to and from network interfaces.

[Logging IP traffic using VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [How the client IP address is preserved in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/preserve-client-ip-address.headers.html)

- Analyze network access patterns in your workload to identify how users use your application.

Use monitoring tools, such as [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and [AWS CloudTrail](https://aws.amazon.com/cloudtrail/), to gather data on network activities.
- Analyze the data to identify the network access pattern.

- Select Regions for your workload deployment based on the following key elements:

**Where your data is located:** For data-heavy
applications (such as big data and machine learning), application code should run as
close to the data as possible.
- **Where your users are located**: For user-facing
applications, choose a Region (or Regions) close to your workload’s users.
- **Other constraints**: Consider constraints such as
cost and compliance as explained in [What to Consider when Selecting a Region for
your Workloads.](https://aws.amazon.com/blogs/architecture/what-to-consider-when-selecting-a-region-for-your-workloads/)

- Use [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/) to run workloads like video rendering. Local Zones allow you to benefit from having compute and storage resources closer to end users.
- Use [AWS Outposts](https://aws.amazon.com/outposts/) for workloads that need to remain on-premises and where you want that workload to run seamlessly with the rest of your other workloads in AWS.
- Applications like high-resolution live video streaming, high-fidelity audio, and augmented reality or virtual reality (AR/VR) require ultra-low-latency for 5G devices. For such applications, consider [AWS Wavelength](https://aws.amazon.com/wavelength/). AWS Wavelength embeds AWS compute and storage services within 5G networks, providing mobile edge computing infrastructure for developing, deploying, and scaling ultra-low-latency applications.
- Use local caching or [AWS Caching Solutions](https://aws.amazon.com/caching/aws-caching/) for frequently used assets to improve performance, reduce data movement, and lower environmental impact.

Service
When to use

[Amazon CloudFront](https://aws.amazon.com/cloudfront/)

Use to cache static content such as images, scripts, and videos, as well as dynamic content such as API responses or web applications.

[Amazon ElastiCache](https://aws.amazon.com/elasticache/)

Use to cache content for web applications.

[DynamoDB Accelerator](https://aws.amazon.com/dynamodb/dax/)

Use to add in-memory acceleration to your DynamoDB tables.
- Use services that can help you run code closer to users of your workload like the following:

Service
When to use

[Lambda@edge](https://aws.amazon.com/lambda/edge/)

Use for compute-heavy operations that are initiated when objects are not in the cache.

[Amazon CloudFront Functions](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-functions.html)

Use for simple use cases like HTTP(s) requests or response manipulations that can be initiated by short-lived functions.

[AWS IoT Greengrass](https://aws.amazon.com/greengrass/)

Use to run local compute, messaging, and data caching for connected devices.
- Some applications require fixed entry points or higher performance by reducing first byte latency and jitter, and increasing throughput. These applications can benefit from networking services that provide static anycast IP addresses and TCP termination at edge locations. [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/) can improve performance for your applications by up to 60% and provide quick failover for multi-region architectures. AWS Global Accelerator provides you with static anycast IP addresses that serve as a fixed entry point for your applications hosted in one or more AWS Regions. These IP addresses permit traffic to ingress onto the AWS global network as close to your users as possible. AWS Global Accelerator reduces the initial connection setup time by establishing a TCP connection between the client and the AWS edge location closest to the client. Review the use of AWS Global Accelerator to improve the performance of your TCP/UDP workloads and provide quick failover for multi-Region architectures.

## Resources

**Related best practices:**

- [COST07-BP02 Implement Regions based on cost](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_pricing_model_region_cost.html)
- [COST08-BP03 Implement services to reduce data transfer costs](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_data_transfer_implement_services.html)
- [REL10-BP01 Deploy the workload to multiple locations](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_fault_isolation_multiaz_region_system.html)
- [REL10-BP02 Select the appropriate locations for your multi-location deployment](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_fault_isolation_select_location.html)
- [SUS01-BP01 Choose Region based on both business requirements and sustainability goals](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_region_a2.html)
- [SUS02-BP04 Optimize geographic placement of workloads based on their networking requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_user_a5.html)
- [SUS04-BP07 Minimize data movement across networks](https://docs.aws.amazon.com/wellarchitected/latest/framework/sus_sus_data_a8.html)

**Related documents:**

- [AWS Global Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
- [AWS Local Zones and AWS Outposts, choosing the right technology for your edge workload](https://aws.amazon.com/blogs/compute/aws-local-zones-and-aws-outposts-choosing-the-right-technology-for-your-edge-workload/)
- [Placement groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/)
- [AWS Outposts](https://aws.amazon.com/outposts/)
- [AWS Wavelength](https://aws.amazon.com/wavelength/)
- [Amazon CloudFront](https://aws.amazon.com/cloudfront/)
- [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/)
- [AWS Direct Connect](https://aws.amazon.com/directconnect/)
- [AWS Site-to-Site VPN](https://aws.amazon.com/vpn/site-to-site-vpn/)
- [Amazon Route 53](https://aws.amazon.com/route53/)

**Related videos:**

- [AWS Local Zones Explainer Video](https://www.youtube.com/watch?v=JHt-D4_zh7w)
- [AWS Outposts: Overview and How it Works](https://www.youtube.com/watch?v=ppG2FFB0mMQ)
- [AWS re:Invent 2023 - A migration strategy for edge and on-premises workloads](https://www.youtube.com/watch?v=4wUXzYNLvTw)
- [AWS re:Invent 2021 - AWS Outposts: Bringing the AWS experience on premises](https://www.youtube.com/watch?v=FxVF6A22498)
- [AWS re:Invent 2020: AWS Wavelength: Run apps with ultra-low latency at 5G edge](https://www.youtube.com/watch?v=AQ-GbAFDvpM)
- [AWS re:Invent 2022 - AWS Local Zones: Building applications for a distributed edge](https://www.youtube.com/watch?v=bDnh_d-slhw)
- [AWS re:Invent 2021 - Building low-latency websites with Amazon CloudFront](https://www.youtube.com/watch?v=9npcOZ1PP_c)
- [AWS re:Invent 2022 - Improve performance and availability with AWS Global Accelerator](https://www.youtube.com/watch?v=s5sjsdDC0Lg)
- [AWS re:Invent 2022 - Build your global wide area network using AWS](https://www.youtube.com/watch?v=flBieylTwvI)
- [AWS re:Invent 2020: Global traffic management with Amazon Route 53](https://www.youtube.com/watch?v=E33dA6n9O7I)

**Related examples:**

- [AWS Global Accelerator Custom Routing Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/ac213084-3f4a-4b01-9835-5052d6096b5b/en-US)
- [Handling Rewrites and Redirects using Edge Functions](https://catalog.us-east-1.prod.workshops.aws/workshops/814dcdac-c2ad-4386-98d5-27d37bb77766/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_choose_workload_location_network_requirements.html*

---

# PERF04-BP07 Optimize network configuration based on metrics

Use collected and analyzed data to make informed decisions about
optimizing your network configuration.

**Common anti-patterns:**

- You assume that all performance-related issues are
application-related.
- You only test your network performance from a location close to
where you have deployed the workload.
- You use default configurations for all network services.
- You overprovision the network resource to provide sufficient
capacity.

**Benefits of establishing this best
practice:** Collecting necessary metrics of your AWS
network and implementing network monitoring tools allows you to
understand network performance and optimize network configurations.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Monitoring traffic to and from VPCs, subnets, or network
interfaces is crucial to understand how to utilize AWS network
resources and optimize network configurations. By using the
following AWS networking tools, you can further inspect
information about the traffic usage, network access and logs.

### Implementation steps

- Identify the key performance metrics such as latency or packet
loss to collect. AWS provides several tools that can
help you to collect these metrics. By using the following
tools, you can further inspect information about the traffic
usage, network access, and logs:

AWS tool

Where to use

[Amazon VPC IP Address Manager](https://docs.aws.amazon.com/vpc/latest/ipam/what-it-is-ipam.html).

Use IPAM to plan, track, and monitor IP addresses for
your AWS and on-premises workloads. This is a best
practice to optimize IP address usage and allocation.

[VPC
Flow logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)

Use VPC Flow Logs to capture detailed information about
traffic to and from network interfaces in your VPCs.
With VPC Flow Logs, you can diagnose overly restrictive
or permissive security group rules and determine the
direction of the traffic to and from the network
interfaces.

[AWS Transit Gateway Flow Logs](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-flow-logs.html)

Use AWS Transit Gateway Flow Logs to capture information
about the IP traffic going to and from your transit
gateways.

[DNS
query logging](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html)

Log information about public or private DNS queries
Route 53 receives. With DNS logs, you can optimize DNS
configurations by understanding the domain or subdomain
that was requested or Route 53 EDGE locations that
responded to DNS queries.

[Reachability Analyzer](https://docs.aws.amazon.com/vpc/latest/reachability/what-is-reachability-analyzer.html)

Reachability Analyzer helps you analyze and debug
network reachability. Reachability Analyzer is a
configuration analysis tool that allows you to perform
connectivity testing between a source resource and a
destination resource in your VPCs. This tool helps you
verify that your network configuration matches your
intended connectivity.

[Network Access Analyzer](https://docs.aws.amazon.com/vpc/latest/network-access-analyzer/what-is-network-access-analyzer.html)

Network Access Analyzer helps you understand network
access to your resources. You can use Network Access Analyzer to specify your network access requirements and
identify potential network paths that do not meet your
specified requirements. By optimizing your corresponding
network configuration, you can understand and verify the
state of your network and demonstrate if your network on
AWS meets your compliance requirements.

[Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)

Use [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) and turn on the appropriate metrics
for network options. Make sure to choose the right
network metric for your workload. For example, you can
turn on metrics for VPC Network Address Usage, VPC NAT
Gateway, AWS Transit Gateway, VPN tunnel, AWS Network Firewall, Elastic Load Balancing, and AWS Direct Connect. Continually monitoring metrics is a good
practice to observe and understand your network status
and usage, which helps you optimize network
configuration based on your observations.

[AWS Network Manager](https://aws.amazon.com/about-aws/whats-new/2022/11/network-manager-real-time-performance-monitoring-aws-global-network/)

Using AWS Network Manager, you can monitor the real-time
and historical performance of
the [AWS Global Network](https://aws.amazon.com/about-aws/global-infrastructure/global_network/) for operational and planning
purposes. Network Manager provides aggregate network
latency between AWS Regions and Availability Zones and
within each Availability Zone, allowing you to better
understand how your application performance relates to
the performance of the underlying AWS network.

[Amazon CloudWatch RUM](https://aws.amazon.com/blogs/aws/cloudwatch-rum/)

Use Amazon CloudWatch RUM to collect the metrics that
give you the insights that help you identify,
understand, and improve user experience.
- Identify top talkers and application traffic patterns using
VPC and AWS Transit Gateway Flow Logs.
- Assess and optimize your current network architecture
including VPCs, subnets, and routing. As an example, you can
evaluate how different VPC peering or AWS Transit Gateway
can help you improve the networking in your architecture.
- Assess the routing paths in your network to verify that the
shortest path between destinations is always used. Network Access Analyzer can help you do this.

## Resources

**Related documents:**

- [Public
DNS query logging](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html)
- [What
is IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-it-is-ipam.html)
- [What
is Reachability Analyzer?](https://docs.aws.amazon.com/vpc/latest/reachability/what-is-reachability-analyzer.html)
- [What
is Network Access Analyzer?](https://docs.aws.amazon.com/vpc/latest/network-access-analyzer/what-is-network-access-analyzer.html)
- [CloudWatch
metrics for your VPCs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cloudwatch.html)
- [Optimize
performance and reduce costs for network analytics with VPC
Flow Logs in Apache Parquet format](https://aws.amazon.com/blogs/big-data/optimize-performance-and-reduce-costs-for-network-analytics-with-vpc-flow-logs-in-apache-parquet-format/)
- [Monitoring
your global and core networks with Amazon CloudWatch
metrics](https://docs.aws.amazon.com/vpc/latest/tgwnm/monitoring-cloudwatch-metrics.html)
- [Continuously
monitor network traffic and resources](https://docs.aws.amazon.com/whitepapers/latest/security-best-practices-for-manufacturing-ot/continuously-monitor-network-traffic-and-resources.html)

**Related videos:**

- [AWS re:Invent 2023 – A developer's guide to cloud networking](https://www.youtube.com/watch?v=i77D556lrgY)
- [AWS re:Invent 2023 – Ready for what’s next? Designing networks for growth and flexibility](https://www.youtube.com/watch?v=FkWOhTZSfdA)
- [AWS re:Invent 2023 – Advanced VPC designs and new capabilities](https://www.youtube.com/watch?v=cRdDCkbE4es)
- [AWS re:Invent 2022 – Dive deep on AWS networking infrastructure](https://www.youtube.com/watch?v=HJNR_dX8g8c)
- [AWS re:Invent 2020 – Networking
best practices and tips with the AWS Well-Architected
Framework](https://www.youtube.com/watch?v=wOMNpG49BeM)
- [AWS re:Invent 2020 – Monitoring
and troubleshooting network traffic](https://www.youtube.com/watch?v=Ed09ReWRQXc)

**Related examples:**

- [AWS Networking Workshops](https://networking.workshop.aws/)
- [AWS Network Monitoring](https://github.com/aws-samples/monitor-vpc-network-patterns)
- [Observing and diagnosing your network on AWS](https://catalog.us-east-1.prod.workshops.aws/workshops/cf2ecaa4-e4be-4f40-b93f-e9fe3b1c1f64/en-US)
- [Finding and addressing network misconfigurations on AWS](https://validating-network-reachability.awssecworkshops.com/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/perf_networking_optimize_network_configuration_based_on_metrics.html*

---
