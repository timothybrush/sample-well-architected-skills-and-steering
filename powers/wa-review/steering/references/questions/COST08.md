# COST 8 — How do you plan for data transfer charges?

**Pillar**: Cost Optimization  
**Best Practices**: 3

---

# COST08-BP01 Perform data transfer modeling

Gather organization requirements and perform data transfer modeling
of the workload and each of its components. This identifies the
lowest cost point for its current data transfer requirements.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When designing a solution in the cloud, data transfer fees are usually neglected due to habits of designing architecture using on-premises data centers or lack of knowledge. Data transfer charges in AWS are determined by the source, destination, and volume of traffic. Factoring in these fees during the design phase can lead to cost savings. Understanding where the data transfer occurs in your workload, the cost of the transfer, and its associated benefit is very important to accurately estimate total cost of ownership (TCO). This allows you to make an informed decision to modify or accept the architectural decision. For example, you may have a Multi-Availability Zone configuration where you replicate data between the Availability Zones.

You model the components of services which transfer the data in your workload, and decide that this is an acceptable cost (similar to paying for compute and storage in both Availability Zones) to achieve the required reliability and resilience. Model the costs over different usage levels. Workload usage can change over time, and different services may be more cost effective at different levels.

While modeling your data transfer, think about how much data is ingested and where that data comes from. Additionally, consider how much data is processed and how much storage or compute capacity is needed. During modeling, follow networking best practices for your workload architecture to optimize your potential data transfer costs.

The AWS Pricing Calculator can help you see estimated costs for specific AWS services and expected data transfer. If you have a workload already running (for test purposes or in a pre-production environment), use [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) or [AWS Cost and Usage Report](https://aws.amazon.com/aws-cost-management/aws-cost-and-usage-reporting/) (CUR) to understand and model your data transfer costs. Configure a proof
of concept (PoC) or test your workload, and run a test with a realistic simulated load. You
can model your costs at different workload demands.

### Implementation steps

- **Identify requirements:** What is the primary goal and business requirements for the planned data transfer between source and destination? What is the expected business outcome at the end? Gather business requirements and define expected outcome.
- **Identify source and destination:** What is the data source and destination for the data transfer, such as within AWS Regions, to AWS services, or out to the internet?

[Data transfer within an AWS Region](https://docs.aws.amazon.com/cur/latest/userguide/cur-data-transfers-charges.html#data-transfer-within-region)
- [Data transfer between AWS Regions](https://docs.aws.amazon.com/cur/latest/userguide/cur-data-transfers-charges.html#data-transfer-between-regions)
- [Data transfer out to the internet](https://docs.aws.amazon.com/cur/latest/userguide/cur-data-transfers-charges.html#data-transfer-out-internet)

- **Identify data classifications:** What is the data classification for this data transfer? What kind of data is it? How big is the data? How frequently must data be transferred? Is data sensitive?
- **Identify AWS services or tools to use:** Which AWS services are used for this data transfer? Is it possible to use an already-provisioned service for another workload?
- **Calculate data transfer costs:**Use [AWS Pricing](https://aws.amazon.com/pricing/) the data transfer modeling you created previously to calculate the data
transfer costs for the workload. Calculate the data transfer costs at different usage
levels, for both increases and reductions in workload usage. Where there are multiple
options for the workload architecture, calculate the cost for each option for comparison.
- **Link costs to outcomes:** For each data transfer cost
incurred, specify the outcome that it achieves for the workload. If it is transfer between
components, it may be for decoupling, if it is between Availability Zones it may be for
redundancy.
- **Create data transfer modeling:** After gathering all information, create a conceptual base data transfer modeling for multiple use cases and different workloads.

## Resources

**Related documents:**

- [AWS caching solutions](https://aws.amazon.com/caching/aws-caching/)
- [AWS Pricing](https://aws.amazon.com/pricing/)
- [Amazon EC2 Pricing](https://aws.amazon.com/ec2/pricing/on-demand/)
- [Amazon VPC pricing](https://aws.amazon.com/vpc/pricing/)
- [Understanding data transfer charges](https://docs.aws.amazon.com/cur/latest/userguide/cur-data-transfers-charges.html)

**Related videos:**

- [Monitoring and Optimizing Your Data Transfer Costs](https://www.youtube.com/watch?v=UjliYz25_qo)
- [S3 Transfer Acceleration](https://youtu.be/J2CVnmUWSi4)

**Related examples:**

- [Overview of Data Transfer Costs for Common Architectures](https://aws.amazon.com/blogs/architecture/overview-of-data-transfer-costs-for-common-architectures/)
- [AWS Prescriptive Guidance for Networking](https://aws.amazon.com/prescriptive-guidance/?apg-all-cards.sort-by=item.additionalFields.sortDate&apg-all-cards.sort-order=desc&awsf.apg-new-filter=*all&awsf.apg-content-type-filter=*all&awsf.apg-code-filter=*all&awsf.apg-category-filter=categories%23network&awsf.apg-rtype-filter=*all&awsf.apg-isv-filter=*all&awsf.apg-product-filter=*all&awsf.apg-env-filter=*all)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_modeling.html*

---

# COST08-BP02 Select components to optimize data transfer cost

All components are selected, and architecture is designed to reduce data transfer costs.
This includes using components such as wide-area-network (WAN) optimization and
Multi-Availability Zone (AZ) configurations

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Architecting for data transfer minimizes data transfer costs. This may involve using content delivery networks to locate data closer to users, or using dedicated network links from your premises to AWS. You can also use WAN optimization and application optimization to reduce the amount of data that is transferred between components.

When transferring data to or within the AWS Cloud, it is essential to know the destination based on varied use cases, the nature of the data, and the available network resources in order to select the right AWS services to optimize data transfer. AWS offers a range of data transfer services tailored for diverse data migration requirements. Select the right [data storage](https://aws.amazon.com/products/storage/) and [data transfer](https://aws.amazon.com/cloud-data-migration/) options based on the business needs within your organization.

When planning or reviewing your workload architecture, consider the following:

- **Use VPC endpoints within AWS:** VPC endpoints allow for private connections between your VPC and supported AWS services. This allows you to avoid using the public internet, which can lead to data transfer costs.
- **Use a NAT gateway:** Use a [NAT gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) so that instances in a private subnet can connect to the internet or to the services outside your VPC. Check whether the resources behind the NAT gateway that send the most traffic are in the same Availability Zone as the NAT gateway. If they are not, create new NAT gateways in the same Availability Zone as the resource to reduce cross-AZ data transfer charges.
- **Use AWS Direct Connect** Direct Connect bypasses the public internet and establishes a direct, private connection between your on-premises network and AWS. This can be more cost-effective and consistent than transferring large volumes of data over the internet.
- **Avoid transferring data across Regional boundaries:** Data transfers between AWS Regions (from one Region to another) typically incur charges. It should be a very thoughtful decision to pursue a multi-Region path. For more detail, see [Multi-Region scenarios](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/multi-region-scenarios.html).
- **Monitor data transfer:** Use Amazon CloudWatch and [VPC flow logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) to capture details about your data transfer and network usage. Analyze captured network traffic information in your VPCs, such as IP address or range going to and from network interfaces.
- **Analyze your network usage:** Use metering and reporting tools such as AWS Cost Explorer, CUDOS Dashboards, or CloudWatch to understand data transfer cost of your workload.

### Implementation steps

- **Select components for data transfer:** Using the data transfer modeling explained in [COST08-BP01 Perform data transfer modeling](./cost_data_transfer_modeling.html), focus on where the largest data transfer costs are or where they would be if the workload usage changes. Look for alternative architectures or additional components that remove or reduce the need for data transfer (or lower its cost).

## Resources

**Related best practices:**

- [COST08-BP01 Perform data transfer modeling](./cost_data_transfer_modeling.html)
- [COST08-BP03 Implement services to reduce data transfer costs](./cost_data_transfer_implement_services.html)

**Related documents:**

- [Cloud Data Migration](https://aws.amazon.com/cloud-data-migration/)
- [AWS caching solutions](https://aws.amazon.com/caching/aws-caching/)
- [Deliver
content faster with Amazon CloudFront](https://aws.amazon.com/getting-started/tutorials/deliver-content-faster/)

**Related examples:**

- [Overview of Data Transfer Costs for Common Architectures](https://aws.amazon.com/blogs/architecture/overview-of-data-transfer-costs-for-common-architectures/)
- [AWS Network Optimization Tips](https://aws.amazon.com/blogs/networking-and-content-delivery/aws-network-optimization-tips/)
- [Optimize performance and reduce costs for network analytics with VPC Flow Logs in Apache Parquet format](https://aws.amazon.com/blogs/big-data/optimize-performance-and-reduce-costs-for-network-analytics-with-vpc-flow-logs-in-apache-parquet-format/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_optimized_components.html*

---

# COST08-BP03 Implement services to reduce data transfer costs

Implement services to reduce data transfer. For example, use edge
locations or content delivery networks (CDN) to deliver content to
end users, build caching layers in front of your application servers
or databases, and use dedicated network connections instead of VPN
for connectivity to the cloud.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

There are various AWS services that can help you to optimize your
network data transfer usage. Depending on your workload components,
type, and cloud architecture, these services can assist you in
compression, caching, and sharing and distribution of your traffic
on the cloud.

- [Amazon CloudFront](https://aws.amazon.com/cloudfront/) is a global content delivery
network that delivers data with low latency and high transfer
speeds. It caches data at edge locations across the world,
which reduces the load on your resources. By using CloudFront,
you can reduce the administrative effort in delivering content
to large numbers of users globally with minimum latency. The
[security
savings bundle](https://aws.amazon.com/about-aws/whats-new/2021/02/introducing-amazon-cloudfront-security-savings-bundle/?sc_channel=em&sc_campaign=Launch_mult_OT_awsroadmapemail_20200910&sc_medium=em_whats_new&sc_content=launch_ot_ot&sc_country=mult&sc_geo=mult&sc_category=mult&sc_outcome=launch) can help you to save up to 30% on your
CloudFront usage if you plan to grow your usage over time.
- [AWS Direct Connect](https://aws.amazon.com/directconnect/) allows you to establish a
dedicated network connection to AWS. This can reduce network
costs, increase bandwidth, and provide a more consistent
network experience than internet-based connections.
- [Site-to-Site VPN](https://aws.amazon.com/vpn/) allows you to establish a secure and
private connection between your private network and the AWS
global network. It is ideal for small offices or business
partners because it provides simplified connectivity, and it
is a fully managed and elastic service.
- [VPC
Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html) allow connectivity between AWS
services over private networking and can be used to reduce
public data transfer and
[NAT
gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) costs.
[Gateway
VPC endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html) have no hourly charges, and
support Amazon S3 and Amazon DynamoDB.
[Interface
VPC endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html) are provided by
[AWS PrivateLink](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html) and have an hourly fee and per-GB usage cost.
- [NAT
gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) provide built-in scaling and management
for reducing costs as opposed to a standalone NAT instance. Place
NAT gateways in the same Availability Zones as high traffic
instances and consider using VPC endpoints for the instances
that need to access Amazon DynamoDB or Amazon S3 to reduce the data
transfer and processing costs.
- Use [AWS Snow Family](https://aws.amazon.com/snow/) devices which have computing resources to
collect and process data at the edge. AWS Snow Family devices
([Snowball Edge](https://aws.amazon.com/snowcone/),
[Snowball Edge](https://aws.amazon.com/snowball/)
and
[Snowmobile](https://aws.amazon.com/snowmobile/))
allow you to move petabytes of data to the AWS Cloud cost
effectively and offline.

### Implementation steps

- **Implement services:**
Select applicable AWS network services based on your
service workload type using the data transfer modeling and
reviewing VPC Flow Logs. Look at where the largest costs and
highest volume flows are. Review the AWS services and assess
whether there is a service that reduces or removes the
transfer, specifically networking and content delivery. Also
look for caching services where there is repeated access to
data or large amounts of data.

## Resources

**Related documents:**

- [AWS Direct Connect](https://aws.amazon.com/directconnect/)
- [AWS Explore Our
Products](https://aws.amazon.com/)
- [AWS caching solutions](https://aws.amazon.com/caching/aws-caching/)
- [Amazon CloudFront](https://aws.amazon.com/cloudfront/)
- [AWS Snow Family](https://aws.amazon.com/snow/)
- [Amazon CloudFront Security Savings Bundle](https://aws.amazon.com/about-aws/whats-new/2021/02/introducing-amazon-cloudfront-security-savings-bundle/)

**Related videos:**

- [Monitoring
and Optimizing Your Data Transfer Costs](https://www.youtube.com/watch?v=UjliYz25_qo)
- [AWS Cost Optimization Series: CloudFront](https://www.youtube.com/watch?v=k8De2AfAN3k)
- [How
can I reduce data transfer charges for my NAT gateway?](https://www.youtube.com/watch?v=hq4KtPRezus)

**Related examples:**

- [How-to
chargeback shared services: An AWS Transit Gateway
example](https://aws.amazon.com/blogs/aws-cloud-financial-management/gs-chargeback-shared-services-an-aws-transit-gateway-example/)
- [Understand
AWS data transfer details in depth from cost and usage report
using Athena query and QuickSight](https://aws.amazon.com/blogs/networking-and-content-delivery/understand-aws-data-transfer-details-in-depth-from-cost-and-usage-report-using-athena-query-and-quicksight/)
- [Overview
of Data Transfer Costs for Common Architectures](https://aws.amazon.com/blogs/architecture/overview-of-data-transfer-costs-for-common-architectures/)
- [Using
AWS Cost Explorer to analyze data transfer costs](https://aws.amazon.com/blogs/mt/using-aws-cost-explorer-to-analyze-data-transfer-costs/)
- [Cost-Optimizing
your AWS architectures by utilizing Amazon CloudFront
features](https://aws.amazon.com/blogs/networking-and-content-delivery/cost-optimizing-your-aws-architectures-by-utilizing-amazon-cloudfront-features/)
- [How
can I reduce data transfer charges for my NAT gateway?](https://aws.amazon.com/premiumsupport/knowledge-center/vpc-reduce-nat-gateway-transfer-costs/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_implement_services.html*

---
