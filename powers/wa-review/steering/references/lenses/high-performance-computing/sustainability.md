# Sustainability

**Pages**: 6

---

# Region selection

HPCSUS01: Have you chosen an AWS Region that takes
into consideration your sustainability KPI?

In
[SUS01-BP01](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_region_a2.html),
you choose a Region based on both business requirements and
sustainability goals. For HPC workloads, you need to consider
additional operational requirements, such as instance availability
and performance needs.

## HPCSUS01-BP01 Select target AWS Regions that balance performance and resource availability with your sustainability goals

The AWS Cloud is a constantly expanding network of Regions and points of presence
(PoP), with a global network infrastructure linking them together. The choice of Region for
your workload significantly affects its KPIs, including end user latency, cost, and carbon
footprint. To effectively improve these KPIs, you should choose Regions for your workload
based on both your business requirements and sustainability goals.

Following performance efficiency best practices, you have identified the right Amazon EC2
instances for your HPC workloads. Amazon EC2 provides the ability to deploy instances in multiple
locations, so you need to find which Regions have your preferred instance type. Then, select
the best Region following the other practices in this pillar.

### Implementation guidance

To achieve your sustainability goals, choose Regions that are near Amazon renewable
energy projects and where the grid has a published carbon intensity that is lower than
other locations (or Regions). For more detail on choosing a Region based on your
sustainability guidelines, see [How to select a Region for your workload based on sustainability goals](https://aws.amazon.com/blogs/architecture/how-to-select-a-region-for-your-workload-based-on-sustainability-goals/).

## HPCSUS01-BP02 Select Regions based on where your users are located

Placing a workload closer to its users provides the lowest
latency while decreasing data movement across the network and
reducing environmental impact.

### Implementation guidance

It may happen that the two best practices described above
cannot be implemented simultaneously (for example, if the
preferred instances are not available in the Region closest to
the end-users). In this case, the HPC cluster administrators
must find the right tradeoff between the business objectives
and the sustainability objectives.

## Key AWS services

- [AWS Global Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)

## Resources

- [How
to select a Region for your workload based on sustainability
goals](https://aws.amazon.com/blogs/architecture/how-to-select-a-region-for-your-workload-based-on-sustainability-goals/).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/region-selection.html*

---

# Alignment to demand

There are no alignment to demand best practices specific to this
lens. For more detail, see
[Alignment
to demand](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/alignment-to-demand.html).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/alignment-to-demand.html*

---

# Software and architecture

HPCSUS02: Have you complemented your architecture with a remote desktop
solution?

By enabling remote visualization of simulation results, rather
than transferring and storing large datasets locally,
organizations can minimize network traffic, optimize resource
usage, and improve overall sustainability of their HPC operations.

## HPCSUS02-BP01 Use a VDI solution to reduce data movement

In
[SUS03-BP05
Use software patterns and architectures that best support data
access and storage patterns](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sus_sus_software_a6.html), you understand how data is
used within your workload, consumed by your users, transferred,
and stored. For HPC workloads, Virtual Desktop Infrastructure
(VDI) technologies help you reduce network traffic between the
end-users' clients rather than transferring the entire data set
and duplicating storage on-premises. In addition, optimizing
data movement across the network reduces the total networking
resources required for the workload and lowers its environmental
impact.

### Implementation guidance

Use a remote visualization technology, such as Amazon DCV or
Amazon AppStream 2.0, to visualize the results of your
simulations without the need of copying back the results.

## Key AWS services

- [Amazon
DCV](https://aws.amazon.com/hpc/dcv/)
- [Amazon
AppStream 2.0](https://aws.amazon.com/appstream2/)
- [Research
and Engineering Studio on AWS](https://aws.amazon.com/hpc/res/)

## Resources

- [Empowering
Researchers to Run HPC Workloads on AWS with Research
Gateway](https://aws.amazon.com/blogs/apn/empowering-researchers-to-run-hpc-workloads-on-aws-with-research-gateway/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/software-and-architecture.html*

---

# Data management

There are no data management best practices specific to this lens.
For more detail, see
[Data
management](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/data.html).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/data-management.html*

---

# Hardware and services

HPCSUS03: Have you selected the most efficient EC2 instance type for your HPC
workload?

Evaluate and stay current with new Amazon EC2 instance types for
HPC workloads to maximize efficiency and sustainability. As new
instances are introduced, you can adopt them for your workload and
become more efficient.

## HPCSUS03-BP01 Continually monitor the release of new EC2 instance types

As stated in the performance efficiency Pillar, we recommend
benchmarking your applications with different EC2 instances to
identify which instance type can deliver the best performance
for your HPC workloads. Using efficient Amazon EC2 instances in
HPC workloads is crucial for lower resource usage and
cost-effectiveness.

### Implementation guidance

Continually monitor the release of new instance types and take
advantage of energy efficiency improvements, including those
instance types designed to support specific workloads such as
machine learning training and inference. Independent software
vendors (ISVs) continue to update their supported
architectures. Keep an eye for ISVs that can support the ARM
architecture or accelerators, such as GPUs. Updating your
applications helps you improve the efficiency of your
workload.

## Key AWS services

- [Amazon EC2 Instance types](https://aws.amazon.com/ec2/instance-types/#HPC_Optimize)

## Resources

- [Deep
dive on AWS Graviton2 processor-powered Amazon EC2
instances](https://www.youtube.com/watch?v=NLysl0QvqXU)
- [Deep
dive into AWS Graviton3 and Amazon EC2 C7g
instances](https://www.youtube.com/watch?v=WDKwwFQKfSI&ab_channel=AWSEvents)
- [AWS Graviton4-based Amazon EC2 R8g instances: best price
performance in Amazon EC2](https://aws.amazon.com/blogs/aws/aws-graviton4-based-amazon-ec2-r8g-instances-best-price-performance-in-amazon-ec2)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/hardware-and-services.html*

---

# Process and culture

HPCSUS04: What are your methods to rapidly introduce sustainability
improvements?

With the energy-intensive nature of HPC workloads, it is important
to constantly monitor and continually adopt new technologies to
reduce your environmental impact. You can test and adopt new
technologies quicker in the cloud when compared to a traditional
on-premises environment.

## HPCSUS04-BP01 Promote a culture of constant monitoring and performance improvement

HPC workloads aggregate computing power and storage to allow for
fast processing and calculation to solve scientific,
mathematical, and engineering challenges. As a result of scale,
HPC workloads are often more energy-intensive than general
purpose computing. Therefore, better use of resources (both
hardware and software), coupled with shorter runtimes, can lead
to improved utilization and environmental sustainability.

### Implementation guidance

- Since the impact of HPC is relevant in achieving your
sustainability goals, it's important to promote a culture
of constant monitoring and improvement for this workload.
On-premises HPC clusters usually have a life cycle that
can spans years during which they are rarely updated. When
running HPC in the cloud, leaders should promote a culture
of continuous innovation. This helps improve performance,
reduce cost, and improve sustainability.
- To continually improve and streamline your HPC workloads,
you can automate your cluster deployment using CI/CD
pipelines to easily test and deploy potential performance
improvements and limit errors caused by manual processes.
For more information, see
[Tutorial:
Create a simple pipeline (S3 bucket)](https://docs.aws.amazon.com/codepipeline/latest/userguide/tutorials-simple-s3.html).

## Resources

- [Delivering
sustainable, high-performing architectures](https://www.youtube.com/watch?v=FBc9hXQfat0)
- Baker Hughes Reduces Time to Results, Carbon Footprint, and Cost Using AWS HPC:
[Customer Success Stories](https://aws.amazon.com/solutions/case-studies/baker-hughes-case-study/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/process-and-culture.html*

---
