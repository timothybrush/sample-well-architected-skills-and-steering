# COST 7 — How do you use pricing models to reduce cost?

**Pillar**: Cost Optimization  
**Best Practices**: 5

---

# COST07-BP01 Perform pricing model analysis

Analyze each component of the workload. Determine if the
component and resources will be running for extended periods
(for commitment discounts) or dynamic and short-running (for
spot or on-demand). Perform an analysis on the workload using
the recommendations in cost management tools and apply business
rules to those recommendations to achieve high returns.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

AWS has multiple [pricing models](https://aws.amazon.com/pricing/)
that allow you to pay for your resources in the most cost-effective way that suits your
organization’s needs and depending on product. Work with your teams to
determine the most appropriate pricing model. Often your pricing model
consists of a combination of multiple options, as determined by your
availability

**On-Demand Instances** allow you to pay for
compute or database capacity by the hour or by the second (60 seconds
minimum) depending on which instances you run, without long-term
commitments or upfront payments.

**Savings Plans** are a flexible pricing
model that offers low prices on Amazon EC2, Lambda, and AWS Fargate
usage, in exchange for a commitment to a consistent amount of usage
(measured in dollars per hour) over one year or three years terms.

**Spot Instances** are an Amazon EC2
pricing mechanism that allows you request spare compute capacity
at discounted hourly rate (up to 90% off the on-demand price)
without upfront commitment.

**Reserved Instances** allow you up
to 75 percent discount by prepaying for capacity. For more details,
see [Optimizing costs with reservations](https://docs.aws.amazon.com/whitepapers/latest/how-aws-pricing-works/aws-cost-optimization.html).

You might choose to include a Savings Plans for the resources
associated with the production, quality, and development
environments. Alternatively, because sandbox resources are
only powered on when needed, you might choose an on-demand
model for the resources in that environment. Use Amazon
[Spot Instances](https://docs.aws.amazon.com/whitepapers/latest/how-aws-pricing-works/amazon-elastic-compute-cloud-amazon-ec2.html#spot-instances)
to reduce Amazon EC2 costs or use
[Compute Savings Plans](https://docs.aws.amazon.com/whitepapers/latest/how-aws-pricing-works/amazon-elastic-compute-cloud-amazon-ec2.html#savings-plans)
to reduce Amazon EC2, Fargate, and Lambda cost. The
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
recommendations tool provides opportunities for commitment
discounts with Saving plans.

If you have been purchasing
[Reserved Instances](https://aws.amazon.com/aws-cost-management/aws-cost-optimization/reserved-instances/?track=costop) for Amazon EC2 in
the past or have established cost allocation practices inside
your organization, you can continue using Amazon EC2 Reserved Instances
for the time being. However, we recommend working on a strategy
to use Savings Plans in the future as a more flexible cost
savings mechanism. You can refresh Savings Plans (SP)
Recommendations in AWS Cost Management to generate new Savings
Plans Recommendations at any time. Use Reserved Instances
(RI) to reduce Amazon RDS, Amazon Redshift, Amazon ElastiCache,
and Amazon OpenSearch Service costs. Saving Plans and Reserved
Instances are available in three options: all upfront, partial
upfront and no upfront payments. Use the recommendations provided
in AWS Cost Explorer RI and SP purchase recommendations.

To find opportunities for Spot workloads, use an hourly view
of your overall usage, and look for regular periods of changing
usage or elasticity. You can use Spot Instances for various
fault-tolerant and flexible applications. Examples include
stateless web servers, API endpoints, big data and analytics
applications, containerized workloads, CI/CD, and other
flexible workloads.

Analyze your Amazon EC2 and Amazon RDS instances whether they can be turned
off when you don’t use (after hours and weekends). This approach
will allow you to reduce costs by 70% or more compared to using
them 24/7. If you have Amazon Redshift clusters that only need to be
available at specific times, you can pause the cluster and later
resume it. When the Amazon Redshift cluster or Amazon EC2 and Amazon RDS Instance is
stopped, the compute billing halts and only the storage charge
applies.

Note that [On-Demand Capacity reservations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/capacity-reservations-pricing-billing.html) (ODCR) are not a pricing
discount. Capacity Reservations are charged at the equivalent
On-Demand rate, whether you run instances in reserved capacity or
not. They should be considered when you need to provide enough
capacity for the resources you plan to run. ODCRs don't have to
be tied to long-term commitments, as they can be cancelled when
you no longer need them, but they can also benefit from the
discounts that Savings Plans or Reserved Instances provide.

**Implementation steps**

- **Analyze workload elasticity:**Using the hourly granularity
in Cost Explorer or a custom dashboard, analyze your workload's elasticity. Look for regular changes
in the number of instances that are running. Short duration instances are candidates for
Spot Instances or Spot Fleet.

[Well-Architected Lab: Cost Explorer](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/100_5_Cost_Visualization/Lab_Guide.html#Elasticity)
- [Well-Architected Lab: Cost Visualization](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/200_5_Cost_Visualization/README.html)

- **Review existing pricing contracts:** Review
current contracts or commitments for long term needs. Analyze what you currently
have and how much those commitments are in use. Leverage pre-existing
contractual discounts or enterprise agreements. [Enterprise Agreements](https://aws.amazon.com/pricing/enterprise/)
give customers the option to tailor agreements that best suit their
needs. For long term commitments, consider reserved pricing discounts,
Reserved Instances or Savings Plans for the specific instance type,
instance family, AWS Region, and Availability Zones.
- **Perform a commitment discount analysis:** Using Cost Explorer
in your account, review the Savings Plans and Reserved Instance recommendations. To verify that
you implement the correct recommendations with the required discounts and risk, follow the
[Well-Architected labs](https://wellarchitectedlabs.com/cost/costeffectiveresources/).

## Resources

**Related documents:**

- [Accessing
Reserved Instance recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-recommendations.html)
- [Instance
purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)
- [AWS Enterprise](https://aws.amazon.com/pricing/enterprise/)

**Related videos:**

- [Save
up to 90% and run production workloads on Spot](https://www.youtube.com/watch?v=BlNPZQh2wXs)

**Related examples:**

- [Well-Architected
Lab: Cost Explorer](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/100_5_Cost_Visualization/Lab_Guide.html#Elasticity)
- [Well-Architected
Lab: Cost Visualization](https://wellarchitectedlabs.com/Cost/Cost_Fundamentals/200_5_Cost_Visualization/README.html)
- [Well-Architected
Lab: Pricing Models](https://wellarchitectedlabs.com/Cost/CostEffectiveResources.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_analysis.html*

---

# COST07-BP02 Choose Regions based on cost

Resource pricing may be different in each Region. Identify Regional cost differences and only deploy in Regions with higher costs to meet latency, data residency and data sovereignty requirements. Factoring in Region cost helps you pay the lowest overall price for this workload.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

The [AWS Cloud Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/) is global, hosted in
[multiple locations world-wide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html), and built
around AWS Regions, Availability Zones, Local Zones, AWS Outposts, and Wavelength Zones. A Region
is a physical location in the world and each Region is a separate geographic area where AWS has
multiple Availability Zones. Availability Zones which are multiple isolated locations within each
Region consist of one or more discrete data centers, each with redundant power, networking, and
connectivity.

Each AWS Region operates within local market conditions, and resource pricing is different in
each Region due to differences in the cost of land, fiber, electricity, and taxes, for example.
Choose a specific Region to operate a component of or your entire solution so that you can run
at the lowest possible price globally. Use [AWS Calculator](https://calculator.aws/#/) to estimate the costs of your workload
in various Regions by searching services by location type (Region, wave length zone and local zone)
and Region.

When you architect your solutions, a best practice is to seek to place computing resources
closer to users to provide lower latency and strong data sovereignty. Select the geographic
location based on your business, data privacy, performance, and security requirements. For
applications with global end users, use multiple locations.

Use Regions that provide lower prices for AWS services to deploy your workloads if you
have no obligations in data privacy, security and business requirements. For example, if your
default Region is Asia Pacific (Sydney) (`ap-southwest-2`), and if there are no
restrictions (data privacy, security, for example) to use other Regions, deploying
non-critical (development and test) Amazon EC2 instances in US East (N. Virginia)
(`us-east-1`) will cost you less.

*Region feature matrix table*

The preceding matrix table shows us that Region 6 is the best option for this given scenario because latency
is low compared to other Regions, service is available, and it is the least expensive Region.

## Implementation steps

- **Review AWS Region pricing:**Analyze the workload costs in
the current Region. Starting with the highest costs by service and usage type, calculate
the costs in other Regions that are available. If the forecasted saving outweighs the cost
of moving the component or workload, migrate to the new Region.
- **Review requirements for multi-Region deployments:** Analyze your
business requirements and obligations (data privacy, security, or performance) to find out if
there are any restrictions for you to not to use multiple Regions. If there are no obligations
to restrict you to use single Region, then use multiple Regions.
- **Analyze required data transfer:** Consider data transfer costs
when selecting Regions. Keep your data close to your customer and close to the resources. Select
less costly AWS Regions where data flows and where there is minimal data transfer. Depending on
your business requirements for data transfer, you can use [Amazon CloudFront](https://aws.amazon.com/cloudfront/), [AWS PrivateLink](https://aws.amazon.com/privatelink/),
[AWS Direct Connect](https://aws.amazon.com/directconnect/), and [AWS Virtual Private Network](https://aws.amazon.com/vpn/) to reduce your networking costs, improve performance, and enhance
security.

## Resources

**Related documents:**

- [Accessing
Reserved Instance recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-recommendations.html)
- [Amazon EC2 pricing](https://aws.amazon.com/ec2/pricing/)
- [Instance
purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)
- [Region
Table](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/)

**Related videos:**

- [Save
up to 90% and run production workloads on Spot](https://www.youtube.com/watch?v=BlNPZQh2wXs)

**Related examples:**

- [Overview of Data Transfer Costs for Common Architectures](https://aws.amazon.com/blogs/architecture/overview-of-data-transfer-costs-for-common-architectures/)
- [Cost Considerations for Global Deployments](https://aws.amazon.com/blogs/aws-cloud-financial-management/cost-considerations-for-global-deployments/)
- [What to Consider when Selecting a Region for your Workloads](https://aws.amazon.com/blogs/architecture/what-to-consider-when-selecting-a-region-for-your-workloads/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_region_cost.html*

---

# COST07-BP03 Select third-party agreements with cost-efficient terms

Cost efficient agreements and terms ensure the cost of these
services scales with the benefits they provide. Select agreements
and pricing that scale when they provide additional benefits to your
organization.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

There are multiple products on the market that can help you manage costs in your cloud environments. They may have some differences in terms of features that depend on customer requirements, such as some focusing on cost governance or cost visibility and others on cost optimization. One key factor for effective cost optimization and governance is using the right tool with necessary features and the right pricing model. These products have different pricing models. Some charge you a certain percentage of your monthly bill, while others charge a percentage of your realized savings. Ideally, you should pay only for what you need.

When you use third-party solutions or services in the cloud, it's important that the
pricing structures are aligned to your desired outcomes. Pricing should scale with the
outcomes and value it provides. For example, in software that takes a percentage of
savings it provides, the more you save (outcome), the more it charges. License agreements where you pay more as your expenses increase might not always be in your best interest for optimizing costs. However, if the vendor offers clear benefits for all parts of your bill, this scaling fee might be justified.

For example, a solution that provides recommendations for Amazon EC2 and charges a percentage of your entire bill can become more expensive if you use other services that provide no benefit. Another example is a managed service that is charged at a percentage of the cost of managed resources. A larger instance size may not necessarily require more management effort, but can be charged more. Verify that these service pricing arrangements include a cost optimization program or features in their service to drive efficiency.

Customers may find these products on the market more advanced or easier to use. You need to consider the cost of these products and think about potential cost optimization outcomes in the long term.

### Implementation steps

- **Analyze third-party agreements and terms:** Review the pricing in third party agreements. Perform modeling for different levels of your usage, and factor in new costs such as new service usage, or increases in current services due to workload growth. Decide if the additional costs provide the required benefits to your business.

## Resources

**Related documents:**

- [Accessing
Reserved Instance recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-recommendations.html)
- [Instance
purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)

**Related videos:**

- [Save
up to 90% and run production workloads on Spot](https://www.youtube.com/watch?v=BlNPZQh2wXs)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_third_party.html*

---

# COST07-BP04 Implement pricing models for all components of this workload

Permanently running resources should utilize reserved capacity such
as Savings Plans or Reserved Instances. Short-term capacity is
configured to use Spot Instances, or Spot Fleet. On-Demand Instances are only
used for short-term workloads that cannot be interrupted and do not
run long enough for reserved capacity, between 25% to 75% of the
period, depending on the resource type.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

To improve cost efficiency, AWS provides multiple commitment recommendations based on your past usage. You can use these recommendations to understand what you can save, and how the commitment will be used. You can use these services as On-Demand, Spot, or make a commitment for a certain period of time and reduce your on-demand costs with Reserved Instances (RIs) and Savings Plans (SPs). You need to understand not only each workload components and multiple AWS services, but also commitment discounts, purchase options, and Spot Instances for these services to optimize your workload.

Consider the requirements of your workload’s components, and understand the different pricing models for these services. Define the availability requirement of these components. Determine if there are multiple independent resources that perform the function in the workload, and what the workload requirements are over time. Compare the cost of the resources using the default On-Demand pricing model and other applicable models. Factor in any potential changes in resources or workload components.

For example, let’s look at this Web Application Architecture on AWS. This sample workload consists of multiple AWS services, such as Amazon Route 53, AWS WAF, Amazon CloudFront, Amazon EC2 instances, Amazon RDS instances, Load Balancers, Amazon S3 storage, and Amazon Elastic File System (Amazon EFS). You need to review each of these services, and identify potential cost saving opportunities with different pricing models. Some of them may be eligible for RIs or SPs, while some of them may be available only on-demand. As the following image shows, some of the AWS services can be committed using RIs or SPs.

*AWS services committed using Reserved Instances and Savings Plans*

### Implementation steps

- **Implement pricing models:** Using your analysis results, purchase Savings Plans, Reserved Instances, or implement Spot Instances. If it is your first commitment purchase, choose the top five or ten recommendations in the list, then monitor and analyze the results over the next month or two. AWS Cost Management Console guides you through the process. Review the RI or SP recommendations from the console, customize the recommendations (type, payment, and term), and review hourly commitment (for example $20 per hour), and then add to cart. Discounts apply automatically to eligible usage. Purchase a small amount of commitment discounts in regular cycles (for example every 2 weeks or monthly). Implement Spot Instances for workloads that can be interrupted or are stateless. Finally, select on-demand Amazon EC2 instances and allocate resources for the remaining requirements.
- **Workload review cycle:** Implement a review cycle for the workload that specifically analyzes pricing model coverage. Once the workload has the required coverage, purchase additional commitment discounts partially (every few months), or as your organization usage changes.

## Resources

**Related documents:**

- [Understanding your Savings Plans recommendations](https://docs.aws.amazon.com/savingsplans/latest/userguide/sp-recommendations.html)
- [Accessing
Reserved Instance recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-recommendations.html)
- [How
to Purchase Reserved Instances](https://aws.amazon.com/ec2/pricing/reserved-instances/buyer/)
- [Instance
purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)
- [Spot
Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
- [Reservation models for other AWS services](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-reservation-models/reservation-models-for-other-aws-services.html)
- [Savings Plans Supported Services](https://docs.aws.amazon.com/savingsplans/latest/userguide/sp-services.html)

**Related videos:**

- [Save
up to 90% and run production workloads on Spot](https://www.youtube.com/watch?v=BlNPZQh2wXs)

**Related examples:**

- [What should you consider before purchasing Savings Plans?](https://repost.aws/knowledge-center/savings-plans-considerations)
- [How can I use Cost Explorer to analyze my spending and usage?](https://repost.aws/knowledge-center/cost-explorer-analyze-spending-and-usage)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_implement_models.html*

---

# COST07-BP05 Perform pricing model analysis at the management account level

Check billing and cost management tools and see recommended
discounts with commitments and reservations to perform regular
analysis at the management account level.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Performing regular cost modeling helps you implement opportunities
to optimize across multiple workloads. For example, if multiple
workloads use On-Demand Instances at an aggregate level, the risk
of change is lower, and implementing a commitment-based discount
can achieve a lower overall cost. It is recommended to perform
analysis in regular cycles of two weeks to one month. This allows
you to make small adjustment purchases, so the coverage of your
pricing models continues to evolve with your changing workloads
and their components.

Use the
[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) recommendations tool to find opportunities
for commitment discounts in your management account.
Recommendations at the management account level are calculated
considering usage across all of the accounts in your AWS
organization that have Reserve Instances (RI) or Savings Plans (SP). They're also calculated when
discount sharing is activated to recommend a commitment that
maximizes savings across accounts.

While purchasing at the management account level optimizes for max
savings in many cases, there may be situations where you might
consider purchasing SPs at the linked account level, like when you
want the discounts to apply first to usage in that particular
linked account. Member account recommendations are calculated at
the individual account level, to maximize savings for each
isolated account. If your account owns both RI and SP commitments,
they will be applied in this order:

- Zonal RI
- Standard RI
- Convertible RI
- Instance Savings Plan
- Compute Savings
Plan

If you purchase an SP at the management account level, the savings
will be applied based on highest to lowest discount percentage.
SPs at the management account level look across all linked
accounts and apply the savings wherever the discount will be the
highest. If you wish to restrict where the savings are applied,
you can purchase a Savings Plan at the linked account level and
any time that account is running eligible compute services, the
discount will be applied there first. When the account is not
running eligible compute services, the discount will be shared
across the other linked accounts under the same management
account. Discount sharing is turned on by default, but can be
turned off if needed.

In a Consolidated Billing Family, Savings Plans are applied first
to the owner account's usage, and then to other accounts' usage.
This occurs only if you have sharing enabled. Your Savings Plans
are applied to your highest savings percentage first. If there are
multiple usages with equal savings percentages, Savings Plans are
applied to the first usage with the lowest Savings Plans rate.
Savings Plans continue to apply until there are no more remaining
uses or your commitment is exhausted. Any remaining usage is
charged at the On-Demand rates. You can refresh Savings Plans
Recommendations in AWS Cost Management to generate new Savings Plans Recommendations at any time.

After analyzing flexibility of instances, you can commit by
following recommendations. Create cost modeling by analyzing the
workload’s short-term costs with potential different resource
options, analyzing AWS pricing models, and aligning them with your
business requirements to find out total cost of ownership and
[cost
optimization](https://docs.aws.amazon.com/whitepapers/latest/how-aws-pricing-works/aws-cost-optimization.html) opportunities.

### Implementation steps

**Perform a commitment discount
analysis**: Use Cost Explorer in your account review
the Savings Plans and Reserved Instance recommendations. Make
sure you understand Saving Plan recommendations, and estimate
your monthly spend and monthly savings. Review recommendations
at the management account level, which are calculated
considering usage across all of the member accounts in your AWS
organization that have RI or Savings Plans discount sharing
enabled for maximum savings across accounts. You can verify that
you implemented the correct recommendations with the required
discounts and risk by following the Well-Architected labs.

## Resources

**Related documents:**

- [How
does AWS pricing work?](https://aws.amazon.com/pricing/?nc2=h_ql_pr_ln)
- [Instance
purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)
- [Saving
Plan Overview](file:///Users/mergenf/Documents/WELL%20ARCHITECTED/COST%20OPT%20PILLAR/phase3a/COST06/%E2%80%A2%09https:/docs.aws.amazon.com/savingsplans/latest/userguide/sp-overview.html)
- [Saving
Plan recommendations](https://docs.aws.amazon.com/savingsplans/latest/userguide/sp-recommendations.html)
- [Accessing
Reserved Instance recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-recommendations.html)
- [Understanding
your Saving Plans recommendation](https://docs.aws.amazon.com/savingsplans/latest/userguide/sp-recommendations.html)
- [How
Savings Plans apply to your AWS usage](https://docs.aws.amazon.com/savingsplans/latest/userguide/sp-applying.html)
- [Saving
Plans with Consolidated Billing](https://aws.amazon.com/premiumsupport/knowledge-center/savings-plans-consolidated-billing/)
- [Turning
on shared reserved instances and Savings Plans
discounts](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-turn-on-process.html)

**Related videos:**

- [Save
up to 90% and run production workloads on Spot](https://www.youtube.com/watch?v=BlNPZQh2wXs)

**Related examples:**

- [What
should I consider before purchasing a Savings Plan?](https://aws.amazon.com/premiumsupport/knowledge-center/savings-plans-considerations/)
- [How
can I use rolling Savings Plans to reduce commitment
risk?](https://aws.amazon.com/blogs/aws-cloud-financial-management/how-can-i-use-rolling-savings-plans-to-reduce-commitment-risk/)
- [When
to Use Spot Instances](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-leveraging-ec2-spot-instances/when-to-use-spot-instances.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_master_analysis.html*

---
