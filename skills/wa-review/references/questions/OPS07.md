# OPS 7 — How do you know that you are ready to support a workload?

**Pillar**: Operational Excellence  
**Best Practices**: 6

---

# OPS07-BP01 Ensure personnel capability

Have a mechanism to validate that you have the appropriate number of trained personnel to support the workload. They must be trained on the platform and services that make up your workload. Provide them with the knowledge necessary to operate the workload. You must have enough trained personnel to support the normal operation of the workload and troubleshoot any incidents that occur. Have enough personnel so that you can rotate during on-call and vacations to avoid burnout.

**Desired outcome:**

- There are enough trained personnel to support the workload at times when the workload is available.
- You provide training for your personnel on the software and services that make up your workload.

**Common anti-patterns:**

- Deploying a workload without team members trained to operate the platform and services in use.
- Not having enough personnel to support on-call rotations or personnel taking time off.

**Benefits of establishing this best
practice:**

- Having skilled team members helps effective support of your workload.
- With enough team members, you can support the workload and on-call rotations while decreasing the risk of burnout.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Validate that there are sufficient trained personnel to support the workload. Verify that you have enough team members to cover normal operational activities, including on-call rotations.

**Customer example**

AnyCompany Retail makes sure that teams supporting the workload are properly staffed and trained. They have enough engineers to support an on-call rotation. Personnel get training on the software and platform that the workload is built on and are encouraged to earn certifications. There are enough personnel so that people can take time off while still supporting the workload and the on-call rotation.

### Implementation steps

- Assign an adequate number of personnel to operate and support your workload, including on-call duties, security issues, and lifecycle events, such as end of support and certificate rotation tasks.
- Train your personnel on the software and platforms that compose your workload.

[AWS Training and Certification](https://aws.amazon.com/training/) has a library of courses about AWS. They provide free and paid courses, online and in-person.
- [AWS hosts events and webinars](https://aws.amazon.com/events/) where you learn from AWS experts.

- Perform the following on a regular basis:

Evaluate team size and skills as operating conditions and the workload change.
- Adjust team size and skills to match operational requirements.
- Verify ability and capacity to [address planned lifecycle events](https://docs.aws.amazon.com/health/latest/ug/aws-health-planned-lifecycle-events.html), unplanned security, and operational notifications through AWS Health.

**Level of effort for the implementation plan:** High. Hiring and training a team to support a workload can take significant effort but has substantial long-term benefits.

## Resources

**Related best practices:**

- [OPS11-BP04 Perform knowledge management](./ops_evolve_ops_knowledge_management.html) - Team members must have the information necessary to operate and support the workload. Knowledge management is the key to providing that.

**Related documents:**

- [AWS Events and Webinars](https://aws.amazon.com/events/)
- [AWS Training and Certification](https://aws.amazon.com/training/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_personnel_capability.html*

---

# OPS07-BP02 Ensure a consistent review of operational readiness

Use Operational Readiness Reviews (ORRs) to validate that you can
operate your workload. ORR is a mechanism developed at Amazon to
validate that teams can safely operate their workloads. An ORR is a
review and inspection process using a checklist of requirements. An
ORR is a self-service experience that teams use to certify their
workloads. ORRs include best practices from lessons learned from our
years of building software.

An ORR checklist is composed of architectural recommendations, operational process, event
management, and release quality. Our Correction of Error (CoE) process is a major driver of
these items. Your own post-incident analysis should drive the evolution of your own ORR. An ORR
is not only about following best practices but preventing the recurrence of events that you’ve
seen before. Lastly, security, governance, and compliance requirements can also be included in
an ORR.

Run ORRs before a workload launches to general availability and then throughout the
software development lifecycle. Running the ORR before launch increases your ability to operate
the workload safely. Periodically re-run your ORR on the workload to catch any drift from best
practices. You can have ORR checklists for new services launches and ORRs for periodic reviews.
This helps keep you up to date on new best practices that arise and incorporate lessons learned
from post-incident analysis. As your use of the cloud matures, you can build ORR requirements
into your architecture as defaults.

**Desired outcome:**  You have an ORR
checklist with best practices for your organization. ORRs are
conducted before workloads launch. ORRs are run periodically over
the course of the workload lifecycle.

**Common anti-patterns:**

- You launch a workload without knowing if you can operate it.
- Governance and security requirements are not included in certifying a workload for
launch.
- Workloads are not re-evaluated periodically.
- Workloads launch without required procedures in place.
- You see repetition of the same root cause failures in multiple workloads.

**Benefits of establishing this best
practice:**

- Your workloads include architecture, process, and management
best practices.
- Lessons learned are incorporated into your ORR process.
- Required procedures are in place when workloads launch.
- ORRs are run throughout the software lifecycle of your
workloads.

**Level of risk if this best practice is not
established:** High

## Implementation guidance

An ORR is two things: a process and a checklist. Your ORR process should be adopted by
your organization and supported by an executive sponsor. At a minimum, ORRs must be conducted
before a workload launches to general availability. Run the ORR throughout the software
development lifecycle to keep it up to date with best practices or new requirements. The ORR
checklist should include configuration items, security and governance requirements, and best
practices from your organization. Over time, you can use services, such as [AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html),
[AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html), and [AWS Control Tower Guardrails](https://docs.aws.amazon.com/controltower/latest/userguide/guardrails.html), to
build best practices from the ORR into guardrails for automatic detection of best practices.

**Customer example**

After several production incidents, AnyCompany Retail decided to
implement an ORR process. They built a checklist composed of best
practices, governance and compliance requirements, and lessons
learned from outages. New workloads conduct ORRs before they
launch. Every workload conducts a yearly ORR with a subset of best
practices to incorporate new best practices and requirements that
are added to the ORR checklist. Over time, AnyCompany Retail used
[AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html) to detect some best practices, speeding up the ORR
process.

**Implementation steps**

To learn more about ORRs, read the
[Operational
Readiness Reviews (ORR) whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/wa-operational-readiness-reviews.html). It provides detailed
information on the history of the ORR process, how to build your
own ORR practice, and how to develop your ORR checklist. The
following steps are an abbreviated version of that document. For
an in-depth understanding of what ORRs are and how to build your
own, we recommend reading that whitepaper.

- Gather the key stakeholders together, including representatives from security,
operations, and development.
- Have each stakeholder provide at least one requirement. For the first iteration, try
to limit the number of items to thirty or less.

[Appendix
B: Example ORR questions](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/appendix-b-example-orr-questions.html) from the Operational
Readiness Reviews (ORR) whitepaper contains sample
questions that you can use to get started.

- Collect your requirements into a spreadsheet.

You can use [custom lenses](https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-custom.html) in
the [AWS Well-Architected Tool](https://console.aws.amazon.com/wellarchiected/) to develop your ORR
and share them across your accounts and AWS Organization.

- Identify one workload to conduct the ORR on. A pre-launch workload or an internal
workload is ideal.
- Run through the ORR checklist and take note of any discoveries made. Discoveries might
be acceptable if a mitigation is in place. For any discovery that lacks a mitigation, add
those to your backlog of items and implement them before launch.
- Continue to add best practices and requirements to your ORR checklist over time.

Support customers with Enterprise Support can request the [Operational Readiness
Review Workshop](https://aws.amazon.com/premiumsupport/technology-and-programs/proactive-services/) from their Technical Account Manager. The workshop is an interactive
*working backwards* session to develop your own ORR
checklist.

**Level of effort for the implementation
plan:** High. Adopting an ORR practice in your
organization requires executive sponsorship and stakeholder
buy-in. Build and update the checklist with inputs from across
your organization.

## Resources

**Related best practices:**

- [OPS01-BP03 Evaluate governance requirements](./ops_priorities_governance_reqs.html) – Governance requirements are a natural fit
for an ORR checklist.
- [OPS01-BP04 Evaluate compliance requirements](./ops_priorities_compliance_reqs.html) – Compliance requirements are sometimes
included in an ORR checklist. Other times they are a separate process.
- [OPS03-BP07 Resource teams appropriately](./ops_org_culture_team_res_appro.html) – Team capability is a good candidate for an
ORR requirement.
- [OPS06-BP01 Plan for unsuccessful changes](./ops_mit_deploy_risks_plan_for_unsucessful_changes.html) – A rollback or
rollforward plan must be established before you launch your workload.
- [OPS07-BP01 Ensure personnel capability](./ops_ready_to_support_personnel_capability.html) – To support a workload you must
have the required personnel.
- [SEC01-BP03 Identify and validate control objectives](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_control_objectives.html) – Security control
objectives make excellent ORR requirements.
- [REL13-BP01 Define recovery objectives for downtime and data loss](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_planning_for_recovery_objective_defined_recovery.html) – Disaster
recovery plans are a good ORR requirement.
- [COST02-BP01 Develop
policies based on your organization requirements](https://docs.aws.amazon.com/wellarchitected/latest/framework/cost_govern_usage_policies.html) – Cost management policies are
good to include in your ORR checklist.

**Related documents:**

- [AWS Control Tower - Guardrails in AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/guardrails.html)
- [AWS Well-Architected Tool - Custom Lenses](https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-custom.html)
- [Operational
Readiness Review Template by Adrian Hornsby](https://medium.com/the-cloud-architect/operational-readiness-review-template-e23a4bfd8d79)
- [Operational
Readiness Reviews (ORR) Whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/operational-readiness-reviews/wa-operational-readiness-reviews.html)

**Related videos:**

- [AWS Supports You | Building an Effective Operational Readiness
Review (ORR)](https://www.youtube.com/watch?v=Keo6zWMQqS8)

**Related examples:**

- [Sample
Operational Readiness Review (ORR) Lens](https://github.com/aws-samples/custom-lens-wa-sample/tree/main/ORR-Lens)

**Related services:**

- [AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html)
- [AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html)
- [AWS Well-Architected Tool](https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_const_orr.html*

---

# OPS07-BP03 Use runbooks to perform procedures

A *runbook* is a documented process to achieve a
specific outcome. Runbooks consist of a series of steps that someone
follows to get something done. Runbooks have been used in operations
going back to the early days of aviation. In cloud operations, we
use runbooks to reduce risk and achieve desired outcomes. At its
simplest, a runbook is a checklist to complete a task.

Runbooks are an essential part of operating your workload. From
onboarding a new team member to deploying a major release, runbooks
are the codified processes that provide consistent outcomes no
matter who uses them. Runbooks should be published in a central
location and updated as the process evolves, as updating runbooks is
a key component of a change management process. They should also
include guidance on error handling, tools, permissions, exceptions,
and escalations in case a problem occurs.

As your organization matures, begin automating runbooks. Start with
runbooks that are short and frequently used. Use scripting languages
to automate steps or make steps easier to perform. As you automate
the first few runbooks, you'll dedicate time to automating more
complex runbooks. Over time, most of your runbooks should be
automated in some way.

**Desired outcome:** Your team has a
collection of step-by-step guides for performing workload tasks. The
runbooks contain the desired outcome, necessary tools and
permissions, and instructions for error handling. They are stored in
a central location (version control system) and updated frequently.
For example, your runbooks provide capabilities for your teams to
monitor, communicate, and respond to AWS Health events for critical
accounts during application alarms, operational issues, and planned
lifecycle events.

**Common anti-patterns:**

- Relying on memory to complete each step of a process.
- Manually deploying changes without a checklist.
- Different team members performing the same process but with
different steps or outcomes.
- Letting runbooks drift out of sync with system changes and
automation.

**Benefits of establishing this best
practice:**

- Reducing error rates for manual tasks.
- Operations are performed in a consistent manner.
- New team members can start performing tasks sooner.
- Runbooks can be automated to reduce toil.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Runbooks can take several forms depending on the maturity level of
your organization. At a minimum, they should consist of a
step-by-step text document. The desired outcome should be clearly
indicated. Clearly document necessary special permissions or
tools. Provide detailed guidance on error handling and escalations
in case something goes wrong. List the runbook owner and publish
it in a central location. Once your runbook is documented,
validate it by having someone else on your team run it. As
procedures evolve, update your runbooks in accordance with your
change management process.

Your text runbooks should be automated as your organization
matures. Using services like
[AWS Systems Manager automations](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html), you can transform flat text
into automations that can be run against your workload. These
automations can be run in response to events, reducing the
operational burden to maintain your workload. AWS Systems Manager
Automation also provides a low-code
[visual
design experience](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-visual-designer.html) to create automation runbooks more
easily.

**Customer example**

AnyCompany Retail must perform database schema updates during
software deployments. The Cloud Operations Team worked with the
Database Administration Team to build a runbook for manually
deploying these changes. The runbook listed each step in the
process in checklist form. It included a section on error handling
in case something went wrong. They published the runbook on their
internal wiki along with their other runbooks. The Cloud
Operations Team plans to automate the runbook in a future sprint.

### Implementation steps

If you don't have an existing document
repository, a version control repository is a great place to start
building your runbook library. You can build your runbooks using
Markdown. We have provided an example runbook template that you
can use to start building runbooks.

```
`# Runbook Title
## Runbook Info
| Runbook ID | Description | Tools Used | Special Permissions | Runbook Author | Last Updated | Escalation POC |
|-------|-------|-------|-------|-------|-------|-------|
| RUN001 | What is this runbook for? What is the desired outcome? | Tools | Permissions | Your Name | 2022-09-21 | Escalation Name |
## Steps
1. Step one
2. Step two`
```

- If you don't have an existing documentation repository or
wiki, create a new version control repository in your version
control system.
- Identify a process that does not have a runbook. An ideal
process is one that is conducted semiregularly, short in
number of steps, and has low impact failures.
- In your document repository, create a new draft Markdown
document using the template. Fill in Runbook Title and the
required fields under Runbook Info.
- Starting with the first step, fill in the Steps portion of the
runbook.
- Give the runbook to a team member. Have them use the runbook
to validate the steps. If something is missing or needs
clarity, update the runbook.
- Publish the runbook to your internal documentation store. Once
published, tell your team and other stakeholders.
- Over time, you'll build a library of runbooks. As that library
grows, start working to automate runbooks.

**Level of effort for the implementation
plan:** Low. The minimum standard for a runbook is a
step-by-step text guide. Automating runbooks can increase the
implementation effort.

## Resources

**Related best practices:**

- [OPS02-BP02
Processes and procedures have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_proc_owners.html)
- [OPS07-BP04
Use playbooks to investigate issues](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_playbooks.html)
- [OPS10-BP01
Use a process for event, incident, and problem
management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_event_incident_problem_process.html)
- [OPS10-BP02
Have a process per alert](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_process_per_alert.html)
- [OPS11-BP04
Perform knowledge management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_knowledge_management.html)

**Related documents:**

- [Achieving
Operational Excellence using automated playbook and
runbook](https://aws.amazon.com/blogs/mt/achieving-operational-excellence-using-automated-playbook-and-runbook/)
- [AWS Systems Manager: Working with runbooks](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html)
- [Migration
playbook for AWS large migrations - Task 4: Improving your
migration runbooks](https://docs.aws.amazon.com/prescriptive-guidance/latest/large-migration-migration-playbook/task-four-migration-runbooks.html)
- [Use
AWS Systems Manager Automation runbooks to resolve operational
tasks](https://aws.amazon.com/blogs/mt/use-aws-systems-manager-automation-runbooks-to-resolve-operational-tasks/)

**Related videos:**

- [AWS re:Invent 2019: DIY guide to runbooks, incident reports, and
incident response](https://www.youtube.com/watch?v=E1NaYN_fJUo)
- [How
to automate IT Operations on AWS | Amazon Web Services](https://www.youtube.com/watch?v=GuWj_mlyTug)
- [Integrate
Scripts into AWS Systems Manager](https://www.youtube.com/watch?v=Seh1RbnF-uE)

**Related examples:**

- [Well-Architected
Labs: Automating operations with Playbooks and Runbooks](https://wellarchitectedlabs.com/operational-excellence/200_labs/200_automating_operations_with_playbooks_and_runbooks/)
- [AWS Blog Post: Build a Cloud Automation Practice for Operational
Excellence: Best Practices from AWS Managed Services](https://aws.amazon.com/blogs/mt/build-a-cloud-automation-practice-for-operational-excellence-best-practices-from-aws-managed-services/)
- [AWS Systems Manager: Automation walkthroughs](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-walk.html)
- [AWS Systems Manager: Restore a root volume from the latest
snapshot runbook](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-document-sample-restore.html)
- [Building
an AWS incident response runbook using Jupyter notebooks and
CloudTrail Lake](https://catalog.us-east-1.prod.workshops.aws/workshops/a5801f0c-7bd6-4282-91ae-4dfeb926a035/en-US)
- [Gitlab
- Runbooks](https://gitlab.com/gitlab-com/runbooks)
- [Rubix - A
Python library for building runbooks in Jupyter
Notebooks](https://github.com/Nurtch/rubix)
- [Using
Document Builder to create a custom runbook](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-walk-document-builder.html)

**Related services:**

- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_runbooks.html*

---

# OPS07-BP04 Use playbooks to investigate issues

*Playbooks* are step-by-step guides used to investigate an incident.
When incidents happen, playbooks are used to investigate, scope
impact, and identify a root cause. Playbooks are used for a variety
of scenarios, from failed deployments to security incidents. In many
cases, playbooks identify the root cause that a runbook is used to
mitigate. Playbooks are an essential component of your
organization's incident response plans.

A good playbook has several key features. It guides the user, step
by step, through the process of discovery. Thinking outside-in, what
steps should someone follow to diagnose an incident? Clearly define
in the playbook if special tools or elevated permissions are needed
in the playbook. Having a communication plan to update stakeholders
on the status of the investigation is a key component. In situations
where a root cause can't be identified, the playbook should have an
escalation plan. If the root cause is identified, the playbook
should point to a runbook that describes how to resolve it.
Playbooks should be stored centrally and regularly maintained. If
playbooks are used for specific alerts, provide your team with
pointers to the playbook within the alert.

As your organization matures, automate your playbooks. Start with
playbooks that cover low-risk incidents. Use scripting to automate
the discovery steps. Make sure that you have companion runbooks to
mitigate common root causes.

**Desired outcome:** Your
organization has playbooks for common incidents. The playbooks are
stored in a central location and available to your team members.
Playbooks are updated frequently. For any known root causes,
companion runbooks are built.

**Common anti-patterns:**

- There is no standard way to investigate an incident.
- Team members rely on muscle memory or institutional knowledge to
troubleshoot a failed deployment.
- New team members learn how to investigate issues through trial
and error.
- Best practices for investigating issues are not shared across
teams.

**Benefits of establishing this best
practice:**

- Playbooks boost your efforts to mitigate incidents.
- Different team members can use the same playbook to identify a
root cause in a consistent manner.
- Known root causes can have runbooks developed for them, speeding
up recovery time.
- Playbooks help team members to start contributing sooner.
- Teams can scale their processes with repeatable playbooks.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

How you build and use playbooks depends on the maturity of your
organization. If you are new to the cloud, build playbooks in text
form in a central document repository. As your organization
matures, playbooks can become semi-automated with scripting
languages like Python. These scripts can be run inside a Jupyter
notebook to speed up discovery. Advanced organizations have fully
automated playbooks for common issues that are auto-remediated
with runbooks.

Start building your playbooks by listing common incidents that
happen to your workload. Choose playbooks for incidents that are
low risk and where the root cause has been narrowed down to a few
issues to start. After you have playbooks for simpler scenarios,
move on to the higher risk scenarios or scenarios where the root
cause is not well known.

Your text playbooks should be automated as your organization
matures. Using services like
[AWS Systems Manager Automations](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html), flat text can be transformed
into automations. These automations can be run against your
workload to speed up investigations. These automations can be
activated in response to events, reducing the mean time to
discover and resolve incidents.

Customers can use
[AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/what-is-incident-manager.html) to respond to incidents.
This service provides a single interface to triage incidents,
inform stakeholders during discovery and mitigation, and
collaborate throughout the incident. It uses AWS Systems Manager
Automations to speed up detection and recovery.

**Customer example**

A production incident impacted AnyCompany Retail. The on-call
engineer used a playbook to investigate the issue. As they
progressed through the steps, they kept the key stakeholders,
identified in the playbook, up to date. The engineer identified
the root cause as a race condition in a backend service. Using a
runbook, the engineer relaunched the service, bringing AnyCompany
Retail back online.

### Implementation steps

If you don't have an existing document repository, we suggest
creating a version control repository for your playbook library.
You can build your playbooks using Markdown, which is compatible
with most playbook automation systems. If you are starting from
scratch, use the following example playbook template.

```
`# Playbook Title
## Playbook Info
| Playbook ID | Description | Tools Used | Special Permissions | Playbook Author | Last Updated | Escalation POC | Stakeholders | Communication Plan |
|-------|-------|-------|-------|-------|-------|-------|-------|-------|
| RUN001 | What is this playbook for? What incident is it used for? | Tools | Permissions | Your Name | 2022-09-21 | Escalation Name | Stakeholder Name | How will updates be communicated during the investigation? |
## Steps
1. Step one
2. Step two`
```

- If you don't have an existing document repository or wiki,
create a new version control repository for your playbooks
in your version control system.
- Identify a common issue that requires investigation. This
should be a scenario where the root cause is limited to a
few issues and resolution is low risk.
- Using the Markdown template, fill in the Playbook Name
section and the fields under Playbook Info.
- Fill in the troubleshooting steps. Be as clear as possible
on what actions to perform or what areas you should
investigate.
- Give a team member the playbook and have them go through it
to validate it. If there's anything missing or something
isn't clear, update the playbook.
- Publish your playbook in your document repository and inform
your team and any stakeholders.
- This playbook library will grow as you add more playbooks.
Once you have several playbooks, start automating them using
tools like AWS Systems Manager Automations to keep
automation and playbooks in sync.

**Level of effort for the implementation
plan:** Low. Your playbooks should be text documents
stored in a central location. More mature organizations will
move towards automating playbooks.

## Resources

**Related best practices:**

- [OPS02-BP02
Processes and procedures have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_proc_owners.html)
- [OPS07-BP03
Use runbooks to perform procedures](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_runbooks.html)
- [OPS10-BP01
Use a process for event, incident, and problem
management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_event_incident_problem_process.html)
- [OPS10-BP02
Have a process per alert](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_event_response_process_per_alert.html)
- [OPS11-BP04
Perform knowledge management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_knowledge_management.html)

**Related documents:**

- [Achieving
Operational Excellence using automated playbook and
runbook](https://aws.amazon.com/blogs/mt/achieving-operational-excellence-using-automated-playbook-and-runbook/)
- [AWS Systems Manager: Working with runbooks](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html)
- [Use
AWS Systems Manager Automation runbooks to resolve operational
tasks](https://aws.amazon.com/blogs/mt/use-aws-systems-manager-automation-runbooks-to-resolve-operational-tasks/)

**Related videos:**

- [AWS re:Invent 2019: DIY guide to runbooks, incident reports, and
incident response (SEC318-R1)](https://www.youtube.com/watch?v=E1NaYN_fJUo)
- [AWS Systems Manager Incident Manager - AWS Virtual
Workshops](https://www.youtube.com/watch?v=KNOc0DxuBSY)
- [Integrate
Scripts into AWS Systems Manager](https://www.youtube.com/watch?v=Seh1RbnF-uE)

**Related examples:**

- [AWS Customer Playbook Framework](https://github.com/aws-samples/aws-customer-playbook-framework)
- [AWS Systems Manager: Automation walkthroughs](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-walk.html)
- [Building
an AWS incident response runbook using Jupyter notebooks and
CloudTrail Lake](https://catalog.workshops.aws/workshops/a5801f0c-7bd6-4282-91ae-4dfeb926a035/en-US)
- [Rubix – A
Python library for building runbooks in Jupyter
Notebooks](https://github.com/Nurtch/rubix)
- [Using
Document Builder to create a custom runbook](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-walk-document-builder.html)

**Related services:**

- [AWS Systems Manager Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [AWS Systems Manager Incident Manager](https://docs.aws.amazon.com/incident-manager/latest/userguide/what-is-incident-manager.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_playbooks.html*

---

# OPS07-BP05 Make informed decisions to deploy systems and changes

Have processes in place for successful and unsuccessful changes to your workload. A pre-mortem is an exercise where a team simulates a failure to develop mitigation strategies. Use pre-mortems to anticipate failure and create procedures where appropriate. Evaluate the benefits and risks of deploying changes to your workload. Verify that all changes comply with governance.

**Desired outcome:**

- You make informed decisions when deploying changes to your workload.
- Changes comply with governance.

**Common anti-patterns:**

- Deploying a change to our workload without a process to handle a failed deployment.
- Making changes to your production environment that are out of compliance with governance requirements.
- Deploying a new version of your workload without establishing a baseline for resource utilization.

**Benefits of establishing this best
practice:**

- You are prepared for unsuccessful changes to your workload.
- Changes to your workload are compliant with governance policies.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Use pre-mortems to develop processes for unsuccessful changes. Document your processes for unsuccessful changes. Ensure that all changes comply with governance. Evaluate the benefits and risks to deploying changes to your workload.

**Customer example**

AnyCompany Retail regularly conducts pre-mortems to validate their processes for unsuccessful changes. They document their processes in a shared Wiki and update it frequently. All changes comply with governance requirements.

**Implementation steps**

- Make informed decisions when deploying changes to your workload. Establish and review criteria for a successful deployment. Develop scenarios or criteria that would initiate a rollback of a change. Weigh the benefits of deploying changes against the risks of an unsuccessful change.
- Verify that all changes comply with governance policies.
- Use pre-mortems to plan for unsuccessful changes and document mitigation strategies. Run a table-top exercise to model an unsuccessful change and validate roll-back procedures.

**Level of effort for the implementation plan:** Moderate. Implementing a practice of pre-mortems requires coordination and effort from stakeholders across your organization

## Resources

**Related best practices:**

- [OPS01-BP03 Evaluate governance requirements](./ops_priorities_governance_reqs.html) - Governance requirements are a key factor in determining whether to deploy a change.
- [OPS06-BP01 Plan for unsuccessful changes](./ops_mit_deploy_risks_plan_for_unsucessful_changes.html) - Establish plans to mitigate a failed deployment and use pre-mortems to validate them.
- [OPS06-BP02 Test deployments](./ops_mit_deploy_risks_test_val_chg.html) - Every software change should be properly tested before deployment in order to reduce defects in production.
- [OPS07-BP01 Ensure personnel capability](./ops_ready_to_support_personnel_capability.html) - Having enough trained personnel to support the workload is essential to making an informed decision to deploy a system change.

**Related documents:**

- [Amazon Web Services: Risk and Compliance](https://docs.aws.amazon.com/whitepapers/latest/aws-risk-and-compliance/welcome.html)
- [AWS Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/)
- [Governance in the AWS Cloud: The Right Balance Between Agility and Safety](https://aws.amazon.com/blogs/apn/governance-in-the-aws-cloud-the-right-balance-between-agility-and-safety/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_informed_deploy_decisions.html*

---

# OPS07-BP06 Create support plans for production workloads

Enable support for any software and services that your production workload relies on.
Select an appropriate support level to meet your production service-level needs.
Support plans for these dependencies are necessary in case there is a service
disruption or software issue. Document support plans and how to request support
for all service and software vendors. Implement mechanisms that verify that
support points of contacts are kept up to date.

**Desired outcome:**

- Implement support plans for software and services that production workloads rely on.
- Choose an appropriate support plan based on service-level needs.
- Document the support plans, support levels, and how to request support.

**Common anti-patterns:**

- You have no support plan for a critical software vendor. Your workload
is impacted by them and you can do nothing to expedite a fix or get
timely updates from the vendor.
- A developer that was the primary point of contact for a software vendor left
the company. You are not able to reach the vendor support directly. You must
spend time researching and navigating generic contact systems, increasing the
time required to respond when needed.
- A production outage occurs with a software vendor. There is no documentation on
how to file a support case.

**Benefits of establishing this best practice:**

- With the appropriate support level, you are able to get a response in the time frame necessary to meet service-level needs.
- As a supported customer you can escalate if there are production issues.
- Software and services vendors can assist in troubleshooting during an incident.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Enable support plans for any software and services vendors that your production workload
relies on. Set up appropriate support plans to meet service-level needs. For AWS customers,
this means activating AWS Business Support or greater on any accounts where you have production
workloads. Meet with support vendors on a regular cadence to get updates about support
offerings, processes, and contacts. Document how to request support from software and
services vendors, including how to escalate if there is an outage. Implement mechanisms
to keep support contacts up to date.

**Customer example**

At AnyCompany Retail, all commercial software and services dependencies have support plans.
For example, they have AWS Enterprise Support activated on all accounts with production workloads.
Any developer can raise a support case when there is an issue. There is a wiki page with
information on how to request support, whom to notify, and best practices for expediting a case.

**Implementation steps**

- Work with stakeholders in your organization to identify software and services vendors that your workload relies on. Document these dependencies.
- Determine service-level needs for your workload. Select a support plan that aligns with them.
- For commercial software and services, establish a support plan with the vendors.

Subscribing to AWS Business Support or greater for all production accounts provides faster
response time from AWS Support and strongly recommended. If you don’t have premium support,
you must have an action plan to handle issues, which require help from AWS Support. AWS Support
provides a mix of tools and technology, people, and programs designed to proactively help
you optimize performance, lower costs, and innovate faster. In addition, AWS Business Support provides
additional benefits, including API access to AWS Trusted Advisor and AWS Health for programmatic integration with your systems, alongside other access methods like the AWS Management Console and Amazon EventBridge channels.

- Document the support plan in your knowledge management tool. Include how to request support,
who to notify if a support case is filed, and how to escalate during an incident. A wiki is
a good mechanism to allow anyone to make necessary updates to documentation when they become
aware of changes to support processes or contacts.

**Level of effort for the implementation plan:** Low. Most software and services vendors
offer opt-in support plans. Documenting and sharing support best practices on your knowledge management system
verifies that your team knows what to do when there is a production issue.

## Resources

**Related best practices:**

- [OPS02-BP02 Processes and procedures have identified owners](./ops_ops_model_def_proc_owners.html)

**Related documents:**

- [AWS Support Plans](https://docs.aws.amazon.com/awssupport/latest/user/aws-support-plans.html)

**Related services:**

- [AWS Business Support](https://aws.amazon.com/premiumsupport/plans/business/)
- [AWS Enterprise Support](https://aws.amazon.com/premiumsupport/plans/enterprise/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_enable_support_plans.html*

---
