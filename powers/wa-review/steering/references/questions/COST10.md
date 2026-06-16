# COST 10 — How do you evaluate new services?

**Pillar**: Cost Optimization  
**Best Practices**: 2

---

# COST10-BP01 Develop a workload review process

Develop a process that defines the criteria and process for workload
review. The review effort should reflect potential benefit. For
example, core workloads or workloads with a value of over ten percent of the
bill are reviewed quarterly or every six months, while workloads below ten percent
are reviewed annually.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To have the most cost-efficient workload, you must regularly review the workload to know
if there are opportunities to implement new services, features, and components. To achieve
overall lower costs the process must be proportional to the potential amount of savings.
For example, workloads that are 50% of your overall spend should be reviewed more regularly,
and more thoroughly, than workloads that are five percent of your overall spend. Factor in
any external factors or volatility. If the workload services a specific geography or market
segment, and change in that area is predicted, more frequent reviews could lead to cost
savings. Another factor in review is the effort to implement changes. If there are significant
costs in testing and validating changes, reviews should be less frequent.

Factor in the long-term cost of maintaining outdated and legacy, components and resources
and the inability to implement new features into them. The current cost of testing and validation
may exceed the proposed benefit. However, over time, the cost of making the change may significantly
increase as the gap between the workload and the current technologies increases, resulting in even
larger costs. For example, the cost of moving to a new programming language may not currently be
cost effective. However, in five years time, the cost of people skilled in that language may
increase, and due to workload growth, you would be moving an even larger system to the new language,
requiring even more effort than previously.

Break down your workload into components, assign the cost of the component (an estimate is sufficient),
and then list the factors (for example, effort and external markets) next to each component.
Use these indicators to determine a review frequency for each workload. For example, you may
have webservers as a high cost, low change effort, and high external factors, resulting in
high frequency of review. A central database may be medium cost, high change effort, and
low external factors, resulting in a medium frequency of review.

Define a process to evaluate new services, design patterns, resource types, and configurations
to optimize your workload cost as they become available. Similar to [performance pillar review](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf-06.html)
and [reliability pillar review](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_monitor_aws_resources_review_monitoring.html) processes, identify, validate, and prioritize optimization and
improvement activities and issue remediation and incorporate this into your backlog.

**Implementation steps**

- **Define review frequency:**Define how frequently the workload and
its components should be reviewed. Allocate time and resources to continual improvement and review
frequency to improve the efficiency and optimization of your workload. This is a combination of
factors and may differ from workload to workload within your organization and between components
in the workload. Common factors include the importance to the organization measured in terms of
revenue or brand, the total cost of running the workload (including operation and resource costs),
the complexity of the workload, how easy is it to implement a change, any software licensing
agreements, and if a change would incur significant increases in licensing costs due to punitive
licensing. Components can be defined functionally or technically, such as web servers and databases,
or compute and storage resources. Balance the factors accordingly and develop a period for the
workload and its components. You may decide to review the full workload every 18 months, review
the web servers every six months, the database every 12 months, compute and short-term storage
every six months, and long-term storage every 12 months.
- **Define review thoroughness:**Define how much effort is spent
on the review of the workload or workload components. Similar to the review frequency, this is a
balance of multiple factors. Evaluate and prioritize opportunities for improvement to focus efforts
where they provide the greatest benefits while estimating how much effort is required for these
activities. If the expected outcomes do not satisfy the goals, and required effort costs more,
then iterate using alternative courses of action. Your review processes should include dedicated
time and resources to make continuous incremental improvements possible. As an example, you may
decide to spend one week of analysis on the database component, one week of analysis for compute
resources, and four hours for storage reviews.

## Resources

**Related documents:**

- [AWS News
Blog](https://aws.amazon.com/blogs/aws/)
- [Types of Cloud Computing](https://aws.amazon.com/types-of-cloud-computing/)
- [What's New with
AWS](https://aws.amazon.com/new/)

**Related examples:**

- [AWS Support Proactive Services](https://aws.amazon.com/premiumsupport/technology-and-programs/proactive-services/)
- [Regular workload reviews for SAP workloads](https://docs.aws.amazon.com/wellarchitected/latest/sap-lens/best-practice-4-4.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_evaluate_new_services_review_process.html*

---

# COST10-BP02 Review and analyze this workload regularly

Existing workloads are regularly reviewed based on each defined
process to find out if new services can be adopted, existing services
can be replaced, or workloads can be re-architected.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

AWS is constantly adding new features so you can experiment and innovate faster with the latest technology. [AWS What's New](https://aws.amazon.com/new/) details how AWS is doing this and provides a quick overview of AWS services, features, and Regional expansion announcements as they are released. You can dive deeper into the launches that have been announced and use them for your review and analyze of your existing workloads. To realize the benefits of new AWS services and features, you review on your workloads and implement new services and features as required. This means you may need to replace existing services you use for your workload, or modernize your workload to adopt these new AWS services. For example, you might review your workloads and replace the messaging component with Amazon Simple Email Service. This removes the cost of operating and maintaining a fleet of instances, while providing all the functionality at a reduced cost.

To analyze your workload and highlight potential opportunities, you should consider not only new services but also new ways of building solutions. Review the [This is My Architecture](https://aws.amazon.com/architecture/this-is-my-architecture) videos on AWS to learn about other customers’ architecture designs, their challenges and their solutions. Check the [All-In series](https://aws.amazon.com/architecture/all-in-series/) to find out real world applications of AWS services and customer stories. You can also watch the [Back to Basics](https://aws.amazon.com/architecture/back-to-basics/) video series that explains, examines, and breaks down basic cloud architecture pattern best practices. Another source is [How to Build This](https://aws.amazon.com/architecture/how-to-build-this/) videos, which are designed to assist people with big ideas on how to bring their minimum viable product (MVP) to life using AWS services. It is a way for builders from all over the world who have a strong idea to gain architectural guidance from experienced AWS Solutions Architects. Finally, you can review the [Getting Started](https://aws.amazon.com/getting-started/) resource materials, which has step by step tutorials.

Before starting your review process, follow your business’ requirements for the workload, security and data privacy requirements in order to use specific service or Region and performance requirements while following your agreed review process.

**Implementation steps**

- **Regularly review the workload:**Using your defined
process, perform reviews with the frequency specified. Verify that you spend the correct
amount of effort on each component. This process would be similar to the initial design
process where you selected services for cost optimization. Analyze the services and the
benefits they would bring, this time factor in the cost of making the change, not just the
long-term benefits.
- **Implement new services:** If the outcome of the
analysis is to implement changes, first perform a baseline of the workload to know the
current cost for each output. Implement the changes, then perform an analysis to confirm
the new cost for each output.

## Resources

**Related documents:**

- [AWS News
Blog](https://aws.amazon.com/blogs/aws/)
- [What's New with
AWS](https://aws.amazon.com/new/)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [AWS Getting Started](https://aws.amazon.com/getting-started/)
- [AWS General Resources](https://docs.aws.amazon.com/#general_resources)

**Related videos:**

- [AWS - This is My Architecture](https://aws.amazon.com/architecture/this-is-my-architecture)
- [AWS - Back to Basics](https://aws.amazon.com/architecture/back-to-basics/)
- [AWS - All-In series](https://aws.amazon.com/architecture/all-in-series/)
- [How to Build This](https://aws.amazon.com/architecture/how-to-build-this/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_evaluate_new_services_review_workload.html*

---
