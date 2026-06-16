# OPS 10 — How do you manage workload and operations events?

**Pillar**: Operational Excellence  
**Best Practices**: 7

---

# OPS10-BP01 Use a process for event, incident, and problem management

The ability to efficiently manage events, incidents, and problems is key to maintaining workload health and performance. It's crucial to recognize and understand the differences between these elements to develop an effective response and resolution strategy. Establishing and following a well-defined process for each aspect helps your team swiftly and effectively handle any operational challenges that arise.

**Desired outcome:** Your organization effectively manages operational events, incidents, and problems through well-documented and centrally stored processes. These processes are consistently updated to reflect changes, streamlining handling and maintaining high service reliability and workload performance.

**Common anti-patterns:**

- You reactively, rather than proactively, respond to events.
- Inconsistent approaches are taken to different types of events or incidents.
- Your organization does not analyze and learn from incidents to prevent future occurrences.

**Benefits of establishing this best
practice:**

- Streamlined and standardized response processes.
- Reduced impact of incidents on services and customers.
- Expedited issue resolution.
- Continuous improvement in operational processes.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implementing this best practice means you are tracking workload events. You have processes
to handle incidents and problems. The processes are documented, shared, and updated
frequently. Problems are identified, prioritized, and fixed.

**Understanding events, incidents, and problems**

- **Events:** An *event* is an observation of an action, occurrence, or change of state. Events can be planned or unplanned and they can originate internally or externally to the workload.
- **Incidents:** *Incidents* are events that require a response, like unplanned interruptions or degradations of service quality. They represent disruptions that need immediate attention to restore normal workload operation.
- **Problems:** *Problems* are the underlying causes of one or more incidents. Identifying and resolving problems involves digging deeper into the incidents to prevent future occurrences.

### Implementation steps

**Events**

- **Monitor events:**

[Implement observability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/implement-observability.html) and [utilize workload observability](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/utilizing-workload-observability.html).
- Monitor actions taken by a user, role, or an AWS service are recorded as events in [AWS CloudTrail](https://aws.amazon.com/cloudtrail/).
- Respond to operational changes in your applications in real time with [Amazon EventBridge](https://aws.amazon.com/eventbridge/).
- Continually assess, monitor, and record resource configuration changes with [AWS Config](https://aws.amazon.com/config/).

- **Create processes:**

Develop a process to assess which events are significant and require monitoring. This involves setting thresholds and parameters for normal and abnormal activities.
- Determine criteria escalating an event to an incident. This could be based on the severity, impact on users, or deviation from expected behavior.
- Regularly review the event monitoring and response processes. This includes analyzing past incidents, adjusting thresholds, and refining alerting mechanisms.

**Incidents**

- **Respond to incidents:**

Use insights from observability tools to quickly identify and respond to incidents.
- Implement [AWS Systems Manager Ops Center](https://aws.amazon.com/systems-manager/features/#OpsCenter) to aggregate, organize, and prioritize operational items and incidents.
- Use services like [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and [AWS X-Ray](https://aws.amazon.com/xray/) for deeper analysis and troubleshooting.
- Consider [AWS Managed Services (AMS)](https://aws.amazon.com/managed-services/) for enhanced incident management, leveraging its proactive, preventative, and detective capabilities. AMS extends operational support with services like monitoring, incident detection and response, and security management.
- Enterprise Support customers can use [AWS Incident Detection and Response](https://aws.amazon.com/premiumsupport/aws-incident-detection-response/), which provides continual proactive monitoring and incident management for production workloads.

- **Create an incident management process:**

Establish a structured incident management process, including clear roles, communication protocols, and steps for resolution.
- Integrate incident management with tools like [Amazon Q Developer in chat applications](https://aws.amazon.com/chatbot/) for efficient response and coordination.
- Categorize incidents by severity, with predefined [incident response plans](https://docs.aws.amazon.com/incident-manager/latest/userguide/response-plans.html) for each category.

- **Learn and improve:**

Conduct [post-incident analysis](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_perform_rca_process.html) to understand root causes and resolution effectiveness.
- Continually update and improve response plans based on reviews and evolving practices.
- Document and share lessons learned across teams to enhance operational resilience.
- Enterprise Support customers can request the [Incident Management Workshop](https://aws.amazon.com/premiumsupport/technology-and-programs/proactive-services/#Operational_Workshops_and_Deep_Dives) from their Technical Account Manager. This guided workshop tests your existing incident response plan and helps you identify areas for improvement.

**Problems**

- **Identify problems:**

Use data from previous incidents to identify recurring patterns that may indicate deeper systemic issues.
- Leverage tools like [AWS CloudTrail](https://aws.amazon.com/cloudtrail/) and [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to analyze trends and uncover underlying problems.
- Engage cross-functional teams, including operations, development, and business units, to gain diverse perspectives on the root causes.

- **Create a problem management process:**

Develop a structured process for problem management, focusing on long-term solutions rather than quick fixes.
- Incorporate root cause analysis (RCA) techniques to investigate and understand the underlying causes of incidents.
- Update operational policies, procedures, and infrastructure based on findings to prevent recurrence.

- **Continue to improve:**

Foster a culture of constant learning and improvement, encouraging teams to proactively identify and address potential problems.
- Regularly review and revise problem management processes and tools to align with evolving business and technology landscapes.
- Share insights and best practices across the organization to build a more resilient and efficient operational environment.

- **Engage AWS Support:**

Use AWS support resources, such as [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/), for proactive guidance and optimization recommendations.
- Enterprise Support customers can access specialized programs like [AWS Countdown](https://aws.amazon.com/premiumsupport/aws-countdown/) for support during critical events.

**Level of effort for the implementation plan:** Medium

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS04-BP02 Implement application telemetry](./ops_observability_application_telemetry.html)
- [OPS07-BP03 Use runbooks to perform procedures](./ops_ready_to_support_use_runbooks.html)
- [OPS07-BP04 Use playbooks to investigate issues](./ops_ready_to_support_use_playbooks.html)
- [OPS08-BP01 Analyze workload metrics](./ops_workload_observability_analyze_workload_metrics.html)
- [OPS11-BP02 Perform post-incident analysis](./ops_evolve_ops_perform_rca_process.html)

**Related documents:**

- [AWS
Security Incident Response Guide](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/welcome.html)
- [AWS Incident Detection and Response](https://aws.amazon.com/premiumsupport/aws-incident-detection-response/)
- [AWS Cloud Adoption Framework: Operations Perspective - Incident and problem management](https://docs.aws.amazon.com/whitepapers/latest/aws-caf-operations-perspective/incident-and-problem-management.html)
- [Incident
Management in the Age of DevOps and SRE](https://www.infoq.com/presentations/incident-management-devops-sre/)
- [PagerDuty - What is Incident Management?](https://www.pagerduty.com/resources/learn/what-is-incident-management/)

**Related videos:**

- [Top incident response tips from AWS](https://www.youtube.com/watch?v=Cu20aOvnHwA)
- [AWS re:Invent 2022 - The Amazon Builders' Library: 25 yrs of Amazon operational excellence](https://www.youtube.com/watch?v=DSRhgBd_gtw)
- [AWS re:Invent 2022 - AWS Incident Detection and Response (SUP201)](https://www.youtube.com/watch?v=IbSgM4IP9IE)
- [Introducing Incident Manager from AWS Systems Manager](https://www.youtube.com/watch?v=I6lScgh4qds)

**Related examples:**

- [AWS Proactive Services – Incident Management Workshop](https://aws.amazon.com/premiumsupport/technology-and-programs/proactive-services/#Operational_Workshops_and_Deep_Dives)
- [How to Automate Incident Response with PagerDuty and AWS Systems Manager Incident Manager](https://aws.amazon.com/blogs/mt/how-to-automate-incident-response-with-pagerduty-and-aws-systems-manager-incident-manager/)
- [Engage Incident Responders with the On-Call Schedules in AWS Systems Manager Incident Manager](https://aws.amazon.com/blogs/mt/engage-incident-responders-with-the-on-call-schedules-in-aws-systems-manager-incident-manager/)
- [Improve the Visibility and Collaboration during Incident Handling in AWS Systems Manager Incident Manager](https://aws.amazon.com/blogs/mt/improve-the-visibility-and-collaboration-during-incident-handling-in-aws-systems-manager-incident-manager/)
- [Incident reports and service requests in AMS](https://docs.aws.amazon.com/managedservices/latest/userguide/support-experience.html)

**Related services:**

- [Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_event_incident_problem_process.html*

---

# OPS10-BP02 Have a process per alert

Establishing a clear and defined process for each alert in your system is essential for effective and efficient incident management. This practice ensures that every alert leads to a specific, actionable response, improving the reliability and responsiveness of your operations.

**Desired outcome:** Every alert initiates a specific, well-defined response plan. Where possible, responses are automated, with clear ownership and a defined escalation path. Alerts are linked to an up-to-date knowledge base so that any operator can respond consistently and effectively. Responses are quick and uniform across the board, enhancing operational efficiency and reliability.

**Common anti-patterns:**

- Alerts have no predefined response process, leading to makeshift and delayed resolutions.
- Alert overload causes important alerts to be overlooked.
- Alerts are inconsistently handled due to lack of clear ownership and responsibility.

**Benefits of establishing this best
practice:**

- Reduced alert fatigue by only raising actionable alerts.
- Decreased mean time to resolution (MTTR) for operational issues.
- Decreased mean time to investigate (MTTI), which helps reduce MTTR.
- Enhanced ability to scale operational responses.
- Improved consistency and reliability in handling operational events.

For example, you have a defined process for AWS Health events for critical accounts, including application alarms, operational issues, and planned lifecycle events (like updating Amazon EKS versions before clusters are auto-updated), and you provide the capability for your teams to actively monitor, communicate, and respond to these events. These actions help you prevent service disruptions caused by AWS-side changes or mitigate them faster when unexpected issues occur.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Having a process per alert involves establishing a clear response plan for each alert, automating responses where possible, and continually refining these processes based on operational feedback and evolving requirements.

### Implementation steps

The following diagram illustrates the incident management workflow within [AWS Systems Manager Incident Manager](https://aws.amazon.com/systems-manager/features/incident-manager/). It is designed to respond swiftly to operational issues by automatically creating incidents in response to specific events from [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) or [Amazon EventBridge](https://aws.amazon.com/eventbridge/). When an incident is created, either automatically or manually, Incident Manager centralizes the management of the incident, organizes relevant AWS resource information, and initiates predefined response plans. This includes running Systems Manager Automation runbooks for immediate action, as well as creating a parent operational work item in OpsCenter to track related tasks and analyses. This streamlined process speeds up and coordinates incident response across your AWS environment.

- **Use composite alarms:** Create [composite alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html) in CloudWatch to group related alarms, reducing noise and allowing for more meaningful responses.
- **Stay informed with [AWS Health](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html):** AWS Health is the authoritative source of information about the health of your AWS Cloud resources. Use AWS Health to visualize and get notified of any current service events and upcoming changes, such as planned lifecycle events, so you can take steps to mitigate impacts.

[Create purpose-fit AWS Health event notifications](https://docs.aws.amazon.com/health/latest/ug/user-notifications.html) to e-mail and chat channels through [AWS User Notifications](https://docs.aws.amazon.com/notifications/latest/userguide/what-is-service.html), and integrate programatically with [your monitoring and alerting tools through Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html) or the [AWS Health API](https://docs.aws.amazon.com/health/latest/APIReference/Welcome.html).
- Plan and track progress on health events that require action by integrating with change management or ITSM tools (like [Jira](https://docs.aws.amazon.com/smc/latest/ag/cloud-sys-health.html) or [ServiceNow](https://docs.aws.amazon.com/smc/latest/ag/sn-aws-health.html)) that you may already use through Amazon EventBridge or the AWS Health API.
- If you use AWS Organizations, enable
[organization view for
AWS Health](https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html) to aggregate AWS Health events across accounts.

- **Integrate Amazon CloudWatch alarms with Incident Manager:** Configure CloudWatch alarms to automatically create incidents in [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/response-plans.html).
- **Integrate Amazon EventBridge with Incident Manager:** Create [EventBridge rules](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule.html) to react to events and create incidents using defined response plans.
- **Prepare for incidents in Incident Manager:**

Establish detailed [response plans](https://docs.aws.amazon.com/incident-manager/latest/userguide/response-plans.html) in Incident Manager for each type of alert.
- Establish chat channels through [Amazon Q Developer in chat applications](https://docs.aws.amazon.com/incident-manager/latest/userguide/chat.html) connected to response plans in Incident Manager, facilitating real-time communication during incidents across platforms like Slack, Microsoft Teams, and Amazon Chime.
- Incorporate [Systems Manager Automation runbooks](https://docs.aws.amazon.com/incident-manager/latest/userguide/runbooks.html) within Incident Manager to drive automated responses to incidents.

## Resources

**Related best practices:**

- [OPS04-BP01 Identify key performance indicators](./ops_observability_identify_kpis.html)
- [OPS08-BP04 Create actionable alerts](./ops_workload_observability_create_alerts.html)

**Related documents:**

- [AWS Cloud Adoption Framework: Operations Perspective - Incident and problem management](https://docs.aws.amazon.com/whitepapers/latest/aws-caf-operations-perspective/incident-and-problem-management.html)
- [Using Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Setting up AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/setting-up.html)
- [Preparing for incidents in Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-response.html)

**Related videos:**

- [Top incident response tips from AWS](https://www.youtube.com/watch?v=Cu20aOvnHwA)
- [re:Invent 2023 | Manage resource lifecycle events at scale with AWS Health](https://www.youtube.com/watch?v=VoLLNL5j9NA)

**Related examples:**

- [AWS Workshops - AWS Systems Manager Incident Manager - Automate incident response to security events](https://catalog.workshops.aws/automate-incident-response/en-US/settingupim/onboarding)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_process_per_alert.html*

---

# OPS10-BP03 Prioritize operational events based on business impact

Responding promptly to operational events is critical, but not all events are equal. When you prioritize based on business impact, you also prioritize addressing events with the potential for significant consequences, such as safety, financial loss, regulatory violations, or damage to reputation.

**Desired outcome:** Responses to operational events are prioritized based on potential impact to business operations and objectives. This makes the responses efficient and effective.

**Common anti-patterns:**

- Every event is treated with the same level of urgency, leading to confusion and delays in addressing critical issues.
- You fail to distinguish between high and low impact events, leading to misallocation of resources.
- Your organization lacks a clear prioritization framework, resulting in inconsistent responses to operational events.
- Events are prioritized based on the order they are reported, rather than their impact on business outcomes.

**Benefits of establishing this best
practice:**

- Ensures critical business functions receive attention first, minimizing potential damage.
- Improves resource allocation during multiple concurrent events.
- Enhances the organization's ability to maintain trust and meet regulatory requirements.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

When faced with multiple operational events, a structured approach to prioritization based on impact and urgency is essential. This approach helps you make informed decisions, direct efforts where they're needed most, and mitigate the risk to business continuity.

### Implementation steps

- **Assess impact:** Develop a classification system to evaluate the severity of events in terms of their potential impact on business operations and objectives. The following example shows impact categories:

Impact level
Description

High

Affects many staff or customers, high financial impact, high reputational damage, or injury.

Medium

Affects a groups of staff or customers, moderate financial impact, or moderate reputational damage.

Low

Affects individual staff or customers, low financial impact, or low reputational damage.
- **Assess urgency:** Define urgency levels for how quickly an event needs a response, considering factors such as safety, financial implications, and service-level agreements (SLAs). The following example demonstrates urgency categories:

Urgency level
Description

High

Exponentially increasing damage, time-sensitive work impacted, imminent escalation, or VIP users or groups affected.

Medium

Damage increases over time, or single VIP user or group affected.

Low

Marginal damage increase over time, or non-time-sensitive work impacted.
- **Create a prioritization matrix:**

Use a matrix to cross-reference impact and urgency, assigning priority levels to different combinations.
- Make the matrix accessible and understood by all team members responsible for operational event responses.
- The following example matrix displays incident severity according to urgency and impact:

Urgency and impact
High
Medium
Low

High

Critical

Urgent

High

Medium

Urgent

High

Normal

Low

High

Normal

Low

- **Train and communicate:** Train response teams on the prioritization matrix and the importance of following it during an event. Communicate the prioritization process to all stakeholders to set clear expectations.
- **Integrate with incident response:**

Incorporate the prioritization matrix into your incident response plans and tools.
- Automate the classification and prioritization of events where possible to speed up response times.
- Enterprise Support customers can leverage [AWS Incident Detection and Response](https://aws.amazon.com/premiumsupport/aws-incident-detection-response/), which provides 24x7 proactive monitoring and incident management for production workloads.

- **Review and adapt:** Regularly review the effectiveness of the prioritization process and make adjustments based on feedback and changes in the business environment.

## Resources

**Related best practices:**

- [OPS03-BP03 Escalation is encouraged](./ops_org_culture_team_enc_escalation.html)
- [OPS08-BP04 Create actionable alerts](./ops_workload_observability_create_alerts.html)
- [OPS09-BP01 Measure operations goals and KPIs with metrics](./ops_operations_health_measure_ops_goals_kpis.html)

**Related documents:**

- [Atlassian - Understanding incident severity levels](https://www.atlassian.com/incident-management/kpis/severity-levels)
- [IT Process Map - Checklist Incident Priority](https://wiki.en.it-processmaps.com/index.php/Checklist_Incident_Priority)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_prioritize_events.html*

---

# OPS10-BP04 Define escalation paths

Establish clear escalation paths within your incident response protocols to facilitate timely and effective action. This includes specifying prompts for escalation, detailing the escalation process, and pre-approving actions to expedite decision-making and reduce mean time to resolution (MTTR).

**Desired outcome:** A structured and efficient process that escalates incidents to the appropriate personnel, minimizing response times and impact.

**Common anti-patterns:**

- Lack of clarity on recovery procedures leads to makeshift responses during critical incidents.
- Absence of defined permissions and ownership results in delays when urgent action is needed.
- Stakeholders and customers are not informed in line with expectations.
- Important decisions are delayed.

**Benefits of establishing this best
practice:**

- Streamlined incident response through predefined escalation procedures.
- Reduced downtime with pre-approved actions and clear ownership.
- Improved resource allocation and support-level adjustments according to incident severity.
- Improved communication to stakeholders and customers.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Properly defined escalation paths are crucial for rapid incident response. AWS Systems Manager Incident Manager supports the setup of structured escalation plans and on-call schedules, which alert the right personnel so that they are ready to act when incidents occur.

### Implementation steps

- **Set up escalation prompts:** Set up [CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-actions) to create an incident in [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com//incident-manager/latest/userguide/incident-creation.html).
- **Set up on-call schedules:** Create [on-call schedules](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-manager-on-call-schedule-create.html) in Incident Manager that align with your escalation paths. Equip on-call personnel with the necessary permissions and tools to act swiftly.
- **Detail escalation procedures:**

Determine specific conditions under which an incident should be escalated.
- Create [escalation plans](https://docs.aws.amazon.com/incident-manager/latest/userguide/escalation.html) in Incident Manager.
- Escalation channels should consist of a contact or an on-call schedule.
- Define the roles and responsibilities of the team at each escalation level.

- **Pre-approve mitigation actions:** Collaborate with decision-makers to pre-approve actions for anticipated scenarios. Use [Systems Manager Automation runbooks](https://docs.aws.amazon.com//incident-manager/latest/userguide/tutorials-runbooks.html) integrated with Incident Manager to speed up incident resolution.
- **Specify ownership:** Clearly identify internal owners for each step of the escalation path.
- **Detail third-party escalations:**

Document third-party service-level agreements (SLAs), and align them with internal goals.
- Set clear protocols for vendor communication during incidents.
- Integrate vendor contacts into incident management tools for direct access.
- Conduct regular drills that include third-party response scenarios.
- Keep vendor escalation information well-documented and easily accessible.

- **Train and rehearse escalation plans:** Train your team on the escalation process and conduct regular incident response drills or game days. Enterprise Support customers can request an [Incident Management Workshop](https://aws.amazon.com/premiumsupport/technology-and-programs/proactive-services/).
- **Continue to improve:** Review the effectiveness of your escalation paths regularly. Update your processes based on lessons learned from incident post-mortems and continuous feedback.

**Level of effort for the implementation plan:** Moderate

## Resources

**Related best practices:**

- [OPS08-BP04 Create actionable alerts](./ops_workload_observability_create_alerts.html)
- [OPS10-BP02 Have a process per alert](./ops_event_response_process_per_alert.html)
- [OPS11-BP02 Perform post-incident analysis](./ops_evolve_ops_perform_rca_process.html)

**Related documents:**

- [AWS Systems Manager Incident Manager Escalation Plans](https://docs.aws.amazon.com/incident-manager/latest/userguide/escalation.html)
- [Working with on-call schedules in Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-manager-on-call-schedule.html)
- [Creating and Managing Runbooks](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html)
- [Temporary elevated access management with AWS IAM Identity Center](https://aws.amazon.com/blogs/security/temporary-elevated-access-management-with-iam-identity-center/)
- [Atlassian - Escalation policies for effective incident management](https://www.atlassian.com/incident-management/on-call/escalation-policies)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_define_escalation_paths.html*

---

# OPS10-BP05 Define a customer communication plan for service-impacting events

Effective communication during service impacting events is critical to maintain trust and transparency with customers. A well-defined communication plan helps your organization quickly and clearly share information, both internally and externally, during incidents.

**Desired outcome:**

- A robust communication plan that effectively informs customers and stakeholders during service impacting events.
- Transparency in communication to build trust and reduce customer anxiety.
- Minimizing the impact of service impacting events on customer experience and business operations.

**Common anti-patterns:**

- Inadequate or delayed communication leads to customer confusion and dissatisfaction.
- Overly technical or vague messaging fails to convey the actual impact on users.
- There is no predefined communication strategy, resulting in inconsistent and reactive messaging.

**Benefits of establishing this best
practice:**

- Enhanced customer trust and satisfaction through proactive and clear communication.
- Reduced burden on support teams by preemptively addressing customer concerns.
- Improved ability to manage and recover from incidents effectively.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Creating a comprehensive communication plan for service impacting events involves multiple facets, from choosing the right channels to crafting the message and tone. The plan should be adaptable, scalable, and cater to different outage scenarios.

### Implementation steps

- **Define roles and responsibilities:**

Assign a major incident manager to oversee incident response activities.
- Designate a communications manager responsible for coordinating all external and internal communications.
- Include the support manager to provide consistent communication through support tickets.

- **Identify communication channels:** Select channels like workplace chat, email, SMS, social media, in-app notifications, and status pages. These channels should be resilient and able to operate independently during service impacting events.
- **Communicate quickly, clearly, and regularly to customers:**

Develop templates for various service impairment scenarios, emphasizing simplicity and essential details. Include information about the service impairment, expected resolution time, and impact.
- Use Amazon Pinpoint to alert customers using push notifications, in-app notifications, emails, text messages, voice messages, and messages over custom channels.
- Use Amazon Simple Notification Service (Amazon SNS) to alert subscribers programatically or through email, mobile push notifications, and text messages.
- Communicate status through dashboards by sharing an Amazon CloudWatch dashboard publicly.
- Encourage social media engagement:

Actively monitor social media to understand customer sentiment.
- Post on social media platforms for public updates and community engagement.
- Prepare templates for consistent and clear social media communication.

- **Coordinate internal communication:** Implement internal protocols using tools like Amazon Q Developer in chat applications for team coordination and communication. Use CloudWatch dashboards to communicate status.
- **Orchestrate communication with dedicated tools and services:**

Use AWS Systems Manager Incident Manager with Amazon Q Developer in chat applications to set up dedicated chat channels for real-time internal communication and coordination during incidents.
- Use AWS Systems Manager Incident Manager runbooks to automate customer notifications through Amazon Pinpoint, Amazon SNS, or third-party tools like social media platforms during incidents.
- Incorporate approval workflows within runbooks to optionally review and authorize all external communications before sending.

- **Practice and improve:**

Conduct training on the use of communication tools and strategies. Empower teams to make timely decisions during incidents.
- Test the communication plan through regular drills or gamedays. Use these tests to refine messaging and evaluate the effectiveness of channels.
- Implement feedback mechanisms to assess communication effectiveness during incidents. Continually evolve the communication plan based on feedback and changing needs.

**Level of effort for the implementation plan:** High

## Resources

**Related best practices:**

- [OPS07-BP03 Use runbooks to perform procedures](./ops_ready_to_support_use_runbooks.html)
- [OPS10-BP06 Communicate status through dashboards](./ops_event_response_dashboards.html)
- [OPS11-BP02 Perform post-incident analysis](./ops_evolve_ops_perform_rca_process.html)

**Related documents:**

- [Atlassian - Incident communication best practices](https://www.atlassian.com/incident-management/incident-communication)
- [Atlassian - How to write a good status update](https://www.atlassian.com/blog/statuspage/how-to-write-a-good-status-update)
- [PagerDuty - A Guide to Incident Communications](https://www.pagerduty.com/resources/learn/a-guide-to-incident-communications/)

**Related videos:**

- [Atlassian - Create your own incident communication plan: Incident templates](https://www.youtube.com/watch?v=ZROVn6-K2qU)

**Related examples:**

- [AWS Health Dashboard](https://aws.amazon.com/premiumsupport/technology/aws-health-dashboard/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_push_notify.html*

---

# OPS10-BP06 Communicate status through dashboards

Use dashboards as a strategic tool to convey real-time operational status and key metrics to different audiences, including internal technical teams, leadership, and customers. These dashboards offer a centralized, visual representation of system health and business performance, enhancing transparency and decision-making efficiency.

**Desired outcome:**

- Your dashboards provide a comprehensive view of the system and business metrics relevant to different stakeholders.
- Stakeholders can proactively access operational information, reducing the need for frequent status requests.
- Real-time decision-making is enhanced during normal operations and incidents.

**Common anti-patterns:**

- Engineers joining an incident management call require status updates to get up to speed.
- Relying on manual reporting for management, which leads to delays and potential inaccuracies.
- Operations teams are frequently interrupted for status updates during incidents.

**Benefits of establishing this best
practice:**

- Empowers stakeholders with immediate access to critical information, promoting informed decision-making.
- Reduces operational inefficiencies by minimizing manual reporting and frequent status inquiries.
- Increases transparency and trust through real-time visibility into system performance and business metrics.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Dashboards effectively communicate the status of your system and business metrics and can be tailored to the needs of different audience groups. Tools like Amazon CloudWatch dashboards and Amazon Quick help you create interactive, real-time dashboards for system monitoring and business intelligence.

### Implementation steps

- **Identify stakeholder needs:** Determine the specific information needs of different audience groups, such as technical teams, leadership, and customers.
- **Choose the right tools:** Select appropriate tools like [Amazon CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html) for system monitoring and [Amazon Quick](https://aws.amazon.com/quicksight/) for interactive business intelligence. [AWS Health](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html) provides a ready-to-use experience in the [AWS Health Dashboard](https://health.aws.amazon.com/health/home), or you can use Health events in Amazon EventBridge or through the AWS Health API to augment your own dashboards.
- **Design effective dashboards:**

Design dashboards to clearly present relevant metrics and KPIs, ensuring they are understandable and actionable.
- Incorporate system-level and business-level views as needed.
- Include both high-level (for broad overviews) and low-level (for detailed analysis) dashboards.
- Integrate automated alarms within dashboards to highlight critical issues.
- Annotate dashboards with important metrics thresholds and goals for immediate visibility.

- **Integrate data sources:**

Use [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) to aggregate and display metrics from various AWS services and [query metrics from other data sources](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/MultiDataSourceQuerying.html), creating a unified view of your system's health and business metrics.
- Use features like [CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html) to query and visualize log data from different applications and services.
- Use AWS Health events to stay informed about the operational status and confirmed operational issues from AWS services through the [AWS Health API](https://docs.aws.amazon.com/health/latest/APIReference/Welcome.html) or [AWS Health events on Amazon EventBridge](https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html).

- **Provide self-service access:**

Share CloudWatch dashboards with relevant stakeholders for self-service information access using [dashboard sharing features](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-dashboard-sharing.html).
- Ensure that dashboards are easily accessible and provide real-time, up-to-date information.

- **Regularly update and refine:**

Continually update and refine dashboards to align with evolving business needs and stakeholder feedback.
- Regularly review the dashboards to keep them relevant and effective for conveying the necessary information.

## Resources

**Related best practices:**

- [OPS08-BP05 Create dashboards](./ops_workload_observability_create_dashboards.html)

**Related documents:**

- [Building dashboards for operational visibility](https://aws.amazon.com/builders-library/building-dashboards-for-operational-visibility/)
- [Using Amazon CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html)
- [Create flexible dashboards with dashboard variables](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_dashboard_variables.html)
- [Sharing CloudWatch dashboards](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-dashboard-sharing.html)
- [Query metrics from other data sources](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/MultiDataSourceQuerying.html)
- [Add a custom widget to a CloudWatch dashboard](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/add_custom_widget_dashboard.html)

**Related examples:**

- [One Observability Workshop - Dashboards](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/en-US/aws-native/dashboards)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_dashboards.html*

---

# OPS10-BP07 Automate responses to events

Automating event responses is key for fast, consistent, and error-free operational handling. Create streamlined processes and use tools to automatically manage and respond to events, minimizing manual interventions and enhancing operational effectiveness.

**Desired outcome:**

- Reduced human errors and faster resolution times through automation.
- Consistent and reliable operational event handling.
- Enhanced operational efficiency and system reliability.

**Common anti-patterns:**

- Manual event handling leads to delays and errors.
- Automation is overlooked in repetitive, critical tasks.
- Repetitive, manual tasks lead to alert fatigue and missing critical issues.

**Benefits of establishing this best
practice:**

- Accelerated event responses, reducing system downtime.
- Reliable operations with automated and consistent event handling.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Incorporate automation to create efficient operational workflows and minimize manual interventions.

### Implementation steps

- **Identify automation opportunites:** Determine repetitive tasks for automation, such as issue remediation, ticket enrichment, capacity management, scaling, deployments, and testing.
- **Identify automation prompts:**

Assess and define specific conditions or metrics that initiate automated responses using [Amazon CloudWatch alarm actions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-actions).
- Use [Amazon EventBridge](https://aws.amazon.com/eventbridge/) to respond to events in AWS services, custom workloads, and SaaS applications.
- Consider initiation events such as [specific log entries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html), [performance metrics thresholds](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html), or [state changes](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html) in AWS resources.

- **Implement event-driven automation:**

Use AWS Systems Manager Automation runbooks to simplify maintenance, deployment, and remediation tasks.
- [Creating incidents in Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html) automatically gathers and adds details about the involved AWS resources to the incident.
- Proactively monitor quotas using [Quota Monitor for AWS](https://aws.amazon.com/solutions/implementations/quota-monitor/).
- Automatically adjust capacity with [AWS Auto Scaling](https://aws.amazon.com/autoscaling/) to maintain availability and performance.
- Automate development pipelines with [Amazon CodeCatalyst](https://codecatalyst.aws/explore).
- Smoke test or continually monitor endpoints and APIs [using synthetic monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html).

- **Perform risk mitigation through automation:**

Implement [automated security responses](https://aws.amazon.com/solutions/implementations/automated-security-response-on-aws/) to swiftly address risks.
- Use [AWS Systems Manager State Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state.html) to reduce configuration drift.
- [Remediate noncompliant resources with AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html).

**Level of effort for the implementation plan:** High

## Resources

**Related best practices:**

- [OPS08-BP04 Create actionable alerts](./ops_workload_observability_create_alerts.html)
- [OPS10-BP02 Have a process per alert](./ops_event_response_process_per_alert.html)

**Related documents:**

- [Using Systems Manager Automation runbooks with Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/tutorials-runbooks.html)
- [Creating incidents in Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html)
- [AWS service quotas](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
- [Monitor resource usage and send notifications when approaching quotas](https://docs.aws.amazon.com/solutions/latest/quota-monitor-for-aws/solution-overview.html)
- [AWS Auto Scaling](https://aws.amazon.com/autoscaling/)
- [What is Amazon CodeCatalyst?](https://docs.aws.amazon.com/codecatalyst/latest/userguide/welcome.html)
- [Using Amazon CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Using Amazon CloudWatch alarm actions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-actions)
- [Remediating Noncompliant Resources with AWS Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/remediation.html)
- [Creating metrics from log events using filters](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringLogData.html)
- [AWS Systems Manager State Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state.html)

**Related videos:**

- [Create Automation Runbooks with AWS Systems Manager](https://www.youtube.com/watch?v=fQ_KahCPBeU)
- [How to automate IT Operations on AWS](https://www.youtube.com/watch?v=GuWj_mlyTug)
- [AWS Security Hub CSPM automation rules](https://www.youtube.com/watch?v=XaMfO_MERH8)
- [Start your software project fast with Amazon CodeCatalyst blueprints](https://www.youtube.com/watch?v=rp7roaoPzFE)

**Related examples:**

- [Amazon CodeCatalyst Tutorial: Creating a project with the Modern three-tier web application blueprint](https://docs.aws.amazon.com/codecatalyst/latest/userguide/getting-started-template-project.html)
- [One Observability Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/en-US)
- [Respond to incidents using Incident Manager](https://catalog.workshops.aws/getting-started-with-com/en-US/operations-management/incident-manager)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_auto_event_response.html*

---
