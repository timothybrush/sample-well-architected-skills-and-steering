# OPS 11 — How do you evolve operations?

**Pillar**: Operational Excellence  
**Best Practices**: 9

---

# OPS11-BP01 Have a process for continuous improvement

Evaluate your workload against internal and external architecture
best practices. Conduct frequent, intentional workload reviews.
Prioritize improvement opportunities into your software development
cadence.

**Desired outcome:**

- You analyze your workload against architecture best practices
frequently.
- You give improvement opportunities equal priority to features in
your software development process.

**Common anti-patterns:**

- You have not conducted an architecture review on your workload
since it was deployed several years ago.
- You give a lower priority to improvement opportunities. Compared
to new features, these opportunities stay in the backlog.
- There is no standard for implementing modifications to best
practices for the organization.

**Benefits of establishing this best
practice:**

- Your workload is kept up-to-date on architecture best practices.
- You evolve your workload in an intentional manner.
- You can leverage organization best practices to improve all
workloads.
- You make marginal gains that have a cumulative impact, which
drives deeper efficiencies.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Frequently conduct an architectural review of your workload. Use
internal and external best practices, evaluate your workload, and
identify improvement opportunities. Prioritize improvement
opportunities into your software development cadence.

### Implementation steps

- Conduct periodic architecture reviews of your production
workload with an agreed-upon frequency. Use a documented
architectural standard that includes AWS-specific best
practices.

Use your internally-defined standards for these reviews.
If you do not have an internal standard, use the AWS
Well-Architected Framework.
- Use the AWS Well-Architected Tool to create a custom
lens of your internal best practices and conduct your
architecture review.
- Contact your AWS Solution Architect or Technical Account
Manager to conduct a guided Well-Architected Framework
Review of your workload.

- Prioritize improvement opportunities identified during the
review into your software development process.

**Level of effort for the implementation
plan:** Low. You can use the AWS Well-Architected
Framework to conduct your yearly architecture review.

## Resources

**Related best practices:**

- [OPS11-BP02
Perform post-incident analysis](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_perform_rca_process.html)
- [OPS11-BP08
Document and share lessons learned](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_share_lessons_learned.html)
- [OPS04
Implement Observability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_process_cont_imp.html)

**Related documents:**

- [AWS Well-Architected Tool - Custom lenses](https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-custom.html)
- [AWS Well-Architected Whitepaper - The review process](https://docs.aws.amazon.com/wellarchitected/latest/framework/the-review-process.html)
- [Customize
Well-Architected Reviews using Custom Lenses and the AWS Well-Architected Tool](https://aws.amazon.com/blogs/mt/customize-well-architected-reviews-using-custom-lenses-and-the-aws-well-architected-tool/)
- [Implementing
the AWS Well-Architected Custom Lens lifecycle in your
organization](https://aws.amazon.com/blogs/architecture/implementing-the-aws-well-architected-custom-lens-lifecycle-in-your-organization/)

**Related videos:**

- [AWS re:Invent 2023 - Scaling AWS Well-Architected best practices
across your organization](https://youtu.be/UXtZCoE9qfQ?si=OPATCOY2YAwiF2TS)

**Related examples:**

- [AWS Well-Architected Tool](https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_process_cont_imp.html*

---

# OPS11-BP02 Perform post-incident analysis

Review customer-impacting events and identify the contributing
factors and preventative actions. Use this information to develop
mitigations to limit or prevent recurrence. Develop procedures for
prompt and effective responses. Communicate contributing factors and
corrective actions as appropriate, tailored to target audiences.

**Desired outcome:**

- You have established incident management processes that include
post-incident analysis.
- You have observability plans in place to collect data on events.
- With this data, you understand and collect metrics that support
your post-incident analysis process.
- You learn from incidents to improve future outcomes.

**Common anti-patterns:**

- You administer an application server. Approximately every 23
hours and 55 minutes all your active sessions are terminated.
You have tried to identify what is going wrong on your
application server. You suspect it could instead be a network
issue but are unable to get cooperation from the network team as
they are too busy to support you. You lack a predefined process
to follow to get support and collect the information necessary
to determine what is going on.
- You have had data loss within your workload. This is the first
time it has happened and the cause is not obvious. You decide it
is not important because you can recreate the data. Data loss
starts occurring with greater frequency impacting your
customers. This also places addition operational burden on you
as you restore the missing data.

**Benefits of establishing this best
practice:**

- You have a predefined process to determine the components,
conditions, actions, and events that contributed to an incident,
which helps you identify opportunities for improvement.
- You use data from post-incident analysis to make improvements.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Use a process to determine contributing factors. Review all
customer impacting incidents. Have a process to identify and
document the contributing factors of an incident so that you can
develop mitigations to limit or prevent recurrence and you can
develop procedures for prompt and effective responses. Communicate
incident root causes as appropriate, and tailor the communication
to your target audience. Share learnings openly within your
organization.

### Implementation steps

- Collect metrics such as deployment change, configuration
change, incident start time, alarm time, time of engagement,
mitigation start time, and incident resolved time.
- Describe key time points on the timeline to understand the
events of the incident.
- Ask the following questions:

Could you improve time to detection?
- Are there updates to metrics and alarms that would
detect the incident sooner?
- Can you improve the time to diagnosis?
- Are there updates to your response plans or escalation
plans that would engage the correct responders sooner?
- Can you improve the time to mitigation?
- Are there runbook or playbook steps that you could add
or improve?
- Can you prevent future incidents from occurring?

- Create checklists and actions. Track and deliver all
actions.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS11-BP01 Have a process for continuous improvement](./ops_evolve_ops_process_cont_imp.html)
- [OPS 4 - Implement observability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/implement-observability.html)

**Related documents:**

- [Performing
a post-incident analysis in Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/analysis.html)
- [Operational
Readiness Review](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/iteration.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_perform_rca_process.html*

---

# OPS11-BP03 Implement feedback loops

Feedback loops provide actionable insights that drive decision making.
Build feedback loops into your procedures and workloads. This helps you
identify issues and areas that need improvement. They also validate investments
made in improvements. These feedback loops are the foundation for continuously
improving your workload.

Feedback loops fall into two categories: *immediate feedback* and *retrospective analysis*.
Immediate feedback is gathered through review of the performance and outcomes from operations
activities. This feedback comes from team members, customers, or the automated output of
the activity. Immediate feedback is received from things like A/B testing and shipping new
features, and it is essential to failing fast.

Retrospective analysis is performed regularly to capture feedback from the review of
operational outcomes and metrics over time. These retrospectives happen at the end of
a sprint, on a cadence, or after major releases or events. This type of feedback loop
validates investments in operations or your workload. It helps you measure success and
validates your strategy.

**Desired outcome:** You use immediate feedback and retrospective
analysis to drive improvements. There is a mechanism to capture user and team member feedback.
Retrospective analysis is used to identify trends that drive improvements.

**Common anti-patterns:**

- You launch a new feature but have no way of receiving customer feedback on it.
- After investing in operations improvements, you don’t conduct a retrospective to validate them.
- You collect customer feedback but don’t regularly review it.
- Feedback loops lead to proposed action items but they aren’t included in the software development process.
- Customers don’t receive feedback on improvements they’ve proposed.

**Benefits of establishing this best
practice:**

- You can work backwards from the customer to drive new features.
- Your organization culture can react to changes faster.
- Trends are used to identify improvement opportunities.
- Retrospectives validate investments made to your workload and operations.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implementing this best practice means that you use both immediate feedback and retrospective analysis.
These feedback loops drive improvements. There are many mechanisms for immediate feedback, including
surveys, customer polls, or feedback forms. Your organization also uses retrospectives to identify
improvement opportunities and validate initiatives.

**Customer example**

AnyCompany Retail created a web form where customers can give feedback or report issues. During the weekly
scrum, user feedback is evaluated by the software development team. Feedback is regularly used to steer the
evolution of their platform. They conduct a retrospective at the end of each sprint to identify items they
want to improve.

## Implementation steps

- Immediate feedback

You need a mechanism to receive feedback from customers and team members.
Your operations activities can also be configured to deliver automated feedback.
- Your organization needs a process to review this feedback, determine what to
improve, and schedule the improvement.
- Feedback must be added into your software development process.
- As you make improvements, follow up with the feedback submitter.

You can use [AWS Systems Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html) to create and track these improvements as [OpsItems](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems.html).

- Retrospective analysis

Conduct retrospectives at the end of a development cycle, on a set cadence, or after a major release.
- Gather stakeholders involved in the workload for a retrospective meeting.
- Create three columns on a whiteboard or spreadsheet: Stop, Start, and Keep.

*Stop* is for anything that you want your team to
stop doing.
- *Start* is for ideas that you want to start
doing.
- *Keep* is for items that you want to keep doing.

- Go around the room and gather feedback from the stakeholders.
- Prioritize the feedback. Assign actions and stakeholders to any Start or Keep items.
- Add the actions to your software development process and communicate status updates to
stakeholders as you make the improvements.

**Level of effort for the implementation plan:** Medium. To implement this
best practice, you need a way to take in immediate feedback and analyze it. Also, you need to
establish a retrospective analysis process.

## Resources

**Related best practices:**

- [OPS01-BP01 Evaluate external customer needs](./ops_priorities_ext_cust_needs.html): Feedback loops are a mechanism to gather external customer needs.
- [OPS01-BP02 Evaluate internal customer needs](./ops_priorities_int_cust_needs.html): Internal stakeholders can use feedback loops to communicate needs and requirements.
- [OPS11-BP02 Perform post-incident analysis](./ops_evolve_ops_perform_rca_process.html): Post-incident analyses are an important form of retrospective analysis conducted after incidents.
- [OPS11-BP07 Perform operations metrics reviews](./ops_evolve_ops_metrics_review.html): Operations metrics reviews identify trends and areas for improvement.

**Related documents:**

- [7
Pitfalls to Avoid When Building a CCOE](https://aws.amazon.com/blogs/enterprise-strategy/7-pitfalls-to-avoid-when-building-a-ccoe/)
- [Atlassian Team
Playbook - Retrospectives](https://www.atlassian.com/team-playbook/plays/retrospective)
- [Email
Definitions: Feedback Loops](https://aws.amazon.com/blogs/messaging-and-targeting/email-definitions-feedback-loops/)
- [Establishing Feedback Loops Based on the AWS Well-Architected Framework Review](https://aws.amazon.com/blogs/architecture/establishing-feedback-loops-based-on-the-aws-well-architected-framework-review/)
- [IBM Garage Methodology - Hold a retrospective](https://www.ibm.com/garage/method/practices/learn/practice_retrospective_analysis/)
- [Investopedia – The PDCS
Cycle](https://www.investopedia.com/terms/p/pdca-cycle.asp)
- [Maximizing
Developer Effectiveness by Tim Cochran](https://martinfowler.com/articles/developer-effectiveness.html)
- [Operations Readiness Reviews (ORR) Whitepaper - Iteration](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/iteration.html)
- [ITIL CSI - Continual Service Improvement](https://wiki.en.it-processmaps.com/index.php/ITIL_CSI_-_Continual_Service_Improvement)
- [When Toyota met e-commerce: Lean at Amazon](https://www.mckinsey.com/capabilities/operations/our-insights/when-toyota-met-e-commerce-lean-at-amazon)

**Related videos:**

- [Building Effective Customer
Feedback Loops](https://www.youtube.com/watch?v=zz_VImJRZ3U)

**Related examples:**

- [Astuto - Open source customer feedback
tool](https://github.com/riggraz/astuto)
- [AWS Solutions - QnABot on
AWS](https://aws.amazon.com/solutions/implementations/qnabot-on-aws/)
- [Fider - A platform to organize customer
feedback](https://github.com/getfider/fider)

**Related services:**

- [AWS Systems Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html*

---

# OPS11-BP04 Perform knowledge management

Knowledge management helps team members find the information to perform their job. In learning organizations, information is freely shared which empowers individuals. The information can be discovered or searched. Information is accurate and up to date. Mechanisms exist to create new information, update existing information, and archive outdated information. The most common example of a knowledge management platform is a content management system like a wiki.

**Desired outcome:**

- Team members have access to timely, accurate information.
- Information is searchable.
- Mechanisms exist to add, update, and archive information.

**Common anti-patterns:**

- There is no centralized knowledge storage. Team members manage their own notes on their local machines.
- You have a self-hosted wiki but no mechanisms to manage information, resulting in outdated information.
- Someone identifies missing information but there’s no process to request adding it the team wiki. They add it themselves but they miss a key step, leading to an outage.

**Benefits of establishing this best practice:**

- Team members are empowered because information is shared freely.
- New team members are onboarded faster because documentation is up to date and searchable.
- Information is timely, accurate, and actionable.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Knowledge management is an important facet of learning organizations. To begin, you need a central repository to store your knowledge (as a common example, a self-hosted wiki). You must develop processes for adding, updating, and archiving knowledge. Develop standards for what should be documented and let everyone contribute.

**Customer example**

AnyCompany Retail hosts an internal Wiki where all knowledge is stored. Team members are encouraged to add to the knowledge base as they go about their daily duties. On a quarterly basis, a cross-functional team evaluates which pages are least updated and determines if they should be archived or updated.

**Implementation steps**

- Start with identifying the content management system where knowledge will be stored. Get agreement from stakeholders across your organization.

If you don’t have an existing content management system, consider running a self-hosted wiki or using a version control repository as a starting point.

- Develop runbooks for adding, updating, and archiving information. Educate your team on these processes.
- Identify what knowledge should be stored in the content management system. Start with daily activities (runbooks and playbooks) that team members perform. Work with stakeholders to prioritize what knowledge is added.
- On a periodic basis, work with stakeholders to identify out-of-date information and archive it or bring it up to date.

**Level of effort for the implementation plan:** Medium. If you don’t have an existing content management system, you can set up a self-hosted wiki or a version-controlled document repository.

## Resources

**Related best practices:**

- [OPS11-BP08 Document and share lessons learned](./ops_evolve_ops_share_lessons_learned.html) - Knowledge management facilitates information sharing about lessons learned.

**Related documents:**

- [Atlassian - Knowledge Management](https://www.atlassian.com/itsm/knowledge-management)

**Related examples:**

- [DokuWiki](https://www.dokuwiki.org/dokuwiki)
- [Gollum](https://github.com/gollum/gollum)
- [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki)
- [Wiki.js](https://github.com/Requarks/wiki)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_knowledge_management.html*

---

# OPS11-BP05 Define drivers for improvement

Identify drivers for improvement to help you evaluate and prioritize
opportunities based on data and feedback loops. Explore improvement
opportunities in your systems and processes, and automate where
appropriate.

**Desired outcome:**

- You track data from across your environment.
- You correlate events and activities to business outcomes.
- You can compare and contrast between environments and systems.
- You maintain a detailed activity history of your deployments and
outcomes.
- You collect data to support your security posture.

**Common anti-patterns:**

- You collect data from across your environment but do not
correlate events and activities.
- You collect detailed data from across your estate, and it drives
high Amazon CloudWatch and AWS CloudTrail activity and cost.
However, you do not use this data meaningfully.
- You do not account for business outcomes when defining drivers
for improvement.
- You do not measure the effects of new features.

**Benefits of establishing this best
practice:**

- You minimize the impact of event-based motivations or emotional
investment by determining criteria for improvement.
- You respond to business events, not just technical ones.
- You measure your environment to identify areas of improvement.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- Understand drivers for improvement: You should only make
changes to a system when a desired outcome is supported.

Desired capabilities: Evaluate desired features and
capabilities when evaluating opportunities for
improvement.

[What's
New with AWS](https://aws.amazon.com/new/)

- Unacceptable issues: Evaluate unacceptable issues, bugs,
and vulnerabilities when evaluating opportunities for
improvement. Track rightsizing options, and seek
optimization opportunities.

[AWS Latest Security Bulletins](https://aws.amazon.com/security/security-bulletins/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [Cloud
Intelligence Dashboards](https://www.wellarchitectedlabs.com/cloud-intelligence-dashboards/)

- Compliance requirements: Evaluate updates and changes
required to maintain compliance with regulation, policy,
or to remain under support from a third party, when
reviewing opportunities for improvement.

[AWS Compliance](https://aws.amazon.com/compliance/)
- [AWS Compliance Programs](https://aws.amazon.com/compliance/programs/)
- [AWS Compliance Latest News](https://aws.amazon.com/compliance/compliance-latest-news/)

## Resources

**Related best practices:**

- [OPS01
Organization priorities](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/organization-priorities.html)
- [OPS02
Relationships and Ownerships](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/relationships-and-ownership.html)
- [OPS04-BP01
Identify key performance indicators](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_observability_identify_kpis.html)
- [OPS08
Utilizing Workload Observability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/utilizing-workload-observability.html)
- [OPS09
Understanding Operational Health](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/understanding-operational-health.html)
- [OPS11-BP03
Implement feedback loops](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html)

**Related documents:**

- [Amazon Athena](https://aws.amazon.com/athena/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)
- [Quick](https://aws.amazon.com/quicksight/)
- [AWS Compliance](https://aws.amazon.com/compliance/)
- [AWS Compliance Latest News](https://aws.amazon.com/compliance/compliance-latest-news/)
- [AWS Compliance Programs](https://aws.amazon.com/compliance/programs/)
- [AWS Glue](https://aws.amazon.com/glue/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)
- [AWS Latest Security Bulletins](https://aws.amazon.com/security/security-bulletins/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)
- [Export
your log data to Amazon S3](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/S3Export.html)
- [What's New with
AWS](https://aws.amazon.com/new/)
- [The
Imperatives of Customer-Centric Innovation](https://aws.amazon.com/executive-insights/content/the-imperatives-of-customer-centric-innovation/)
- [Digital
Transformation: Hype or a Strategic Necessity?](https://aws.amazon.com/blogs/enterprise-strategy/digital-transformation-hype-or-a-strategic-necessity/)

**Related Videos**

- [AWS re:Invent 2023 - Improve operational efficiency and resilience
with Support (SUP310)](https://youtu.be/jaehZYBNG0Y?si=UNEaLZsXDrxcBgYo)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_drivers_for_imp.html*

---

# OPS11-BP06 Validate insights

Review your analysis results and responses with cross-functional
teams and business owners. Use these reviews to establish common
understanding, identify additional impacts, and determine courses of
action. Adjust responses as appropriate.

**Desired outcomes:**

- You review insights with business owners on a regular basis.
Business owners provide additional context to newly-gained
insights.
- You review insights and request feedback from technical peers,
and you share your learnings across teams.
- You publish data and insights for other technical and business
teams to review. You factor in your learnings to new practices
by other departments.
- Summarize and review new insights with senior leaders. Senior
leaders use new insights to define strategy.

**Common anti-patterns:**

- You release a new feature. This feature changes some of your
customer behaviors. Your observability does not take these
changes into account. You do not quantify the benefits of these
changes.
- You push a new update and neglect refreshing your CDN. The CDN
cache is no longer compatible with the latest release. You
measure the percentage of requests with errors. All of your
users report HTTP 400 errors when communicating with backend
servers. You investigate the client errors and find that because
you measured the wrong dimension, your time was wasted.
- Your service-level agreement stipulates 99.9% uptime, and your
recovery point objective is four hours. The service owner maintains
that the system is zero downtime. You implement an expensive and
complex replication solution, which wastes time and money.

**Benefits of establishing this best practice:**

- When you validate insights with business owners and
subject matter experts, you establish common understanding and more
effectively guide improvement.
- You discover hidden issues and factor them into future
decisions.
- Your focus moves from technical outcomes to business outcomes.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- **Validate insights:** Engage with business owners and subject
matter experts to ensure there is common understanding and
agreement of the meaning of the data you have collected.
Identify additional concerns, potential impacts, and determine
a courses of action.

## Resources

**Related best practices:**

- [OPS01-BP06
Evaluate tradeoffs while managing benefits and risks](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_tradeoffs.html)
- [OPS02-BP06
Responsibilities between teams are predefined or
negotiated](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_neg_team_agreements.html)
- [OPS11-BP03
Implement feedback loops](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html)

**Related documents:**

- [Designing
a Cloud Center of Excellence (CCOE)](https://aws.amazon.com/blogs/enterprise-strategy/designing-a-cloud-center-of-excellence-ccoe/)

**Related videos:**

- [Building
observability to increase resiliency](https://youtu.be/6bJkYtrMMPI?si=yu8tVMz4a6ax9f34&t=2695)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_validate_insights.html*

---

# OPS11-BP07 Perform operations metrics reviews

Regularly perform retrospective analysis of operations metrics with
cross-team participants from different areas of the business. Use
these reviews to identify opportunities for improvement, potential
courses of action, and to share lessons learned. Look for
opportunities to improve in all of your environments (for example,
development, test, and production).

**Desired outcome:**

- You frequently review business-affecting metrics
- You detect and review anomalies through your observability
capabilities
- You use data to support business outcomes and goals

**Common anti-patterns:**

- Your maintenance window interrupts a significant retail
promotion. The business remains unaware that there is a standard
maintenance window that could be delayed if there are other
business impacting events.
- You suffered an extended outage because you commonly use an
outdated library in your organization. You have since migrated
to a supported library. The other teams in your organization do
not know that they are at risk.
- You do not regularly review attainment of customer SLAs. You are
trending to not meet your customer SLAs. There are financial
penalties related to not meeting your customer SLAs.

**Benefits of establishing this best
practice:**

- When you meet regularly to review operations metrics, events,
and incidents, you maintain common understanding across teams.
- Your team meets routinely to review metrics and incidents, which
positions you to take action on risks and recognize customer
SLAs.
- You share lessons learned, which provides data for
prioritization and targeted improvements for business outcomes.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- Regularly perform retrospective analysis of operations metrics
with cross-team participants from different areas of the
business.
- Engage stakeholders, including the business, development, and
operations teams, to validate your findings from immediate
feedback and retrospective analysis and share lessons learned.
- Use their insights to identify opportunities for improvement
and potential courses of action.

## Resources

**Related best practices:**

- [OPS08-BP05
Create dashboards](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_workload_observability_create_dashboards.html)
- [OPS09-BP03
Review operations metrics and prioritize improvement](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_review_ops_metrics_prioritize_improvement.html)
- [OPS10-BP01
Use a process for event, incident, and problem
management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_event_incident_problem_process.html)

**Related documents:**

- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
- [Amazon CloudWatch metrics and dimensions reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
- [Publish
custom metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
- [Using
Amazon CloudWatch metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)
- [Dashboards
and visualizations with CloudWatch](https://docs.aws.amazon.com/prescriptive-guidance/latest/implementing-logging-monitoring-cloudwatch/cloudwatch-dashboards-visualizations.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_metrics_review.html*

---

# OPS11-BP08 Document and share lessons learned

Document and share lessons learned from the operations activities so
that you can use them internally and across teams. You should share
what your teams learn to increase the benefit across your
organization. Share information and resources to prevent avoidable
errors and ease development efforts, and focus on delivery of
desired features.

Use AWS Identity and Access Management (IAM) to define permissions
that permit controlled access to the resources you wish to share
within and across accounts.

**Desired outcome:**

- You use version-controlled repositories to share application
libraries, scripted procedures, procedure documentation, and
other system documentation.
- You share your infrastructure standards as version-controlled
AWS CloudFormation templates.
- You review lessons learned across teams.

**Common anti-patterns:**

- You suffered an extended outage because your organization
commonly uses buggy library. You have since migrated to a
reliable library. The other teams in your organization do not
know they are at risk. No one documents and shares the
experience with this library, and they are not aware of the
risk.
- You have identified an edge case in an internally-shared
microservice that causes sessions to drop. You have updated your
calls to the service to avoid this edge case. The other teams in
your organization do not know that they are at risk.
- You have found a way to significantly reduce the CPU utilization
requirements for one of your microservices. You do not know if
any other teams could take advantage of this technique.

**Benefits of establishing this best
practice:** Share lessons learned to support improvement
and to maximize the benefits of experience.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

- **Document and share lessons learned:** Have procedures to
document the lessons learned from the running of operations
activities and retrospective analysis so that they can be used
by other teams.
- **Share learnings:** Have procedures to share lessons learned and
associated artifacts across teams. For example, share updated
procedures, guidance, governance, and best practices through
an accessible wiki. Share scripts, code, and libraries through
a common repository.

Leverage [AWS re:Post Private](https://aws.amazon.com/repost-private/) as a knowledge service to streamline collaboration and knowledge sharing within your organization.

## Resources

**Related best practices:**

- [OPS02-BP06
Responsibilities between teams are predefined or
negotiated](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_neg_team_agreements.html)
- [OPS05-BP01
Use version control](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_version_control.html)
- [OPS05-BP06
Share design standards](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_share_design_stds.html)
- [OPS11-BP03
Implement feedback loops](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html)
- [OPS11-BP07
Perform operations metrics reviews](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_metrics_review.html)

**Related documents:**

- [Increase collaboration and securely share cloud knowledge with AWS re:Post Private](https://aws.amazon.com/blogs/aws/increase-collaboration-and-securely-share-cloud-knowledge-with-aws-repost-private/)
- [Reduce project delays with a docs-as-code solution](https://aws.amazon.com/blogs/infrastructure-and-automation/reduce-project-delays-with-docs-as-code-solution/)

**Related videos:**

- [AWS re:Invent 2023 - Collaborate within your company and with AWS using AWS re:Post Private](https://www.youtube.com/watch?v=HNq_kU2QJLU)
- [Supports You | Exploring the Incident Management Tabletop
Exercise](https://www.youtube.com/watch?v=0m8sGDx-pRM)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_share_lessons_learned.html*

---

# OPS11-BP09 Allocate time to make improvements

Dedicate time and resources within your processes to make continuous
incremental improvements possible.

**Desired outcome:**

- You create temporary duplicates of environments, which lowers
the risk, effort, and cost of experimentation and testing.
- These duplicated environments can be used to test the
conclusions from your analysis, experiment, and develop and test
planned improvements.
- You run gamedays, and you use Fault Injection Service (FIS) to
provide the controls and guardrails that teams need to run
experiments in a production-like environment.

**Common anti-patterns:**

- There is a known performance issue in your application server.
It is added to the backlog behind every planned feature
implementation. If the rate of planned features being added
remains constant, the performance issue would never be
addressed.
- To support continual improvement, you approve administrators and
developers using all their extra time to select and implement
improvements. No improvements are ever completed.
- Operational acceptance is complete, and you do not test
operational practices again.

**Benefits of establishing this best
practice:** By dedicating time and resources within your
processes, you can make continuous, incremental improvements
possible.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

- Allocate time to make improvements: Dedicate time and
resources within your processes to make continuous,
incremental improvements.
- Implement changes to improve and evaluate the results to
determine success.
- If the results do not satisfy the goals and the improvement is
still a priority, pursue alternative courses of action.
- Simulate production workloads through game days, and use
learnings from these simulations to improve.

## Resources

**Related best practices:**

- [OPS05-BP08
Use multiple environments](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_dev_integ_multi_env.html)

**Related videos:**

- [AWS re:Invent 2023 - Improve application resilience with AWS Fault
Injection Service](https://youtu.be/N0aZZVVZiUw?si=ivYa9ScBfHcj-IAq)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_allocate_time_for_imp.html*

---
