# Cost optimization

**Pages**: 5

---

# Practice Cloud Financial Management

HPCCOST01: How do you keep track of
expenditure used for HPC?

HPC workloads can use a large number of resources in a short space of time. Use of cloud
compute changes the way users decide what to run, where decisions on what jobs will be run are
budget based. Using the following best practices, on-going expenditure can be tracked.

## HPCCOST01-BP01 Use the right tools to collect and analyze the data you need.

There are many ways to keep track of costs using the standard
AWS tools, which will vary depending on the chosen architecture.
Please refer to the
[Cost Optimization Pillar - AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/welcome.html).

### Implementation guidance

- For HPC applications, it is very common to use tagging.
Resources used for jobs can be tagged with project names,
user ids or any other attributes you choose. Once
resources are tagged with tags activated for cost
allocation, you can generate reports based on the
attributes chosen earlier.
- If a queuing system, such as
[Slurm](https://slurm.schedmd.com/documentation.html)
or
[IBM
Spectrum LSF Suites](https://www.ibm.com/products/hpc-workload-management) is in use, they typically have
ways to log the usage of resources, such as Slurm
Accounting or LSF Analytics. Details vary depending on the
system in use.

## Key AWS services

- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)
- [Slurm
accounting with AWS ParallelCluster](https://docs.aws.amazon.com/parallelcluster/latest/ug/slurm-accounting-v3.html)
- [Metrics
in Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/practice-cloud-financial-management.html*

---

# Expenditure and usage awareness

There are no best practices unique to HPC for the Expenditure
and usage awareness best practice area. Please review the
[corresponding section in the AWS Well-Architected Cost Optimization Pillar
whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/expenditure-and-usage-awareness.html).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/expenditure-and-usage-awareness.html*

---

# Cost effective resources

HPCCOST02: How have you evaluated the trade-offs between job completion time and
cost?

With greater resource availability there is greater capability to run jobs on faster – or
more – compute resources. Even though this may result in a faster turnaround of a job (based
on wall clock time), it could also result in a much greater cost of running that job if speed
up is non-linear. For every workload there is a sweet-spot for run time and cost.

## HPCCOST02-BP01 Use the most appropriate instances and resources

Using the appropriate instances and resources for your system is key to cost
management. The technology choice may increase or decrease the overall cost of running an
HPC workload.

### Implementation guidance

- For example, a tightly coupled HPC workload might take ten hours to run on one
instance (X CPU cores), if the same job is run on 10 EC2 instances (10X CPU cores), it
may take 2 hours (performance scaling can be but is typically not linear). The cost
for EC2 will be higher, however the results of the calculation will be available much
quicker. This could reduce the research and development time, and for example reduce
time to market.
- Verify that instances have sufficient physical memory to complete jobs but not
more, as unused memory will not improve compute performance. Depending on the
methodology, increasing the number of nodes per job may distribute the computational
problem and reduce the required memory per node.
- Choose the pricing model best suited for workload duration and criticality, such
as using On Demand for high priority workloads, spot for flexible HPC workloads, and
RI for consistent HPC workloads to help optimize cost.
- Reducing the runtime can also reduce costs for surrounding services, such as
storage, since these resources will not be needed for as long.
- The choice of storage can also impact cost. Many HPC applications read and write
significant amounts of data. If the time to read and write data can be reduced, then
the compute will be needed for less time. There are many different types and
performance settings for storage. Picking the optimum version for your application can
improve efficiency and reduce cost overall.
- For some applications, the cost of licenses exceeds the cost of AWS resources.
It may be worth spending a little more on AWS resources to achieve better
performance and save money overall.

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/cost-effective-resources.html*

---

# Manage demand and supplying resources

There are no best practices unique to HPC for the Manage demand and supplying resources
best practice area. Please review the [corresponding section in the AWS Well-Architected Cost Optimization Pillar
whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/manage-demand-and-supply-resources.html).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/manage-demand-and-supplying-resources.html*

---

# Optimize over time

There are no best practices unique to HPC for the optimize over time best practice
area. For more information, see the [corresponding section in the AWS Well-Architected Cost Optimization Pillar
whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/optimize-over-time.html).

*Source: https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/optimize-over-time.html*

---
