# OPS 2 — How do you structure your organization to support your business outcomes?

**Pillar**: Operational Excellence  
**Best Practices**: 6

---

# OPS02-BP01 Resources have identified owners

Resources for your workload must have identified owners for change
control, troubleshooting, and other functions. Owners are assigned
for workloads, accounts, infrastructure, platforms, and
applications. Ownership is recorded using tools like a central
register or metadata attached to resources. The business value of
components informs the processes and procedures applied to them.

**Desired outcome:**

- Resources have identified owners using metadata or a central
register.
- Team members can identify who owns resources.
- Accounts have a single owner where possible.

**Common anti-patterns:**

- The alternate contacts for your AWS accounts are not populated.
- Resources lack tags that identify what teams own them.
- You have an ITSM queue without an email mapping.
- Two teams have overlapping ownership of a critical piece of
infrastructure.

**Benefits of establishing this best
practice:**

- Change control for resources is straightforward with assigned
ownership.
- You can involve the right owners when troubleshooting issues.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Define what ownership means for the resource use cases in your
environment. Ownership can mean who oversees changes to the
resource, supports the resource during troubleshooting, or who is
financially accountable. Specify and record owners for resources,
including name, contact information, organization, and team.

**Customer example**

AnyCompany Retail defines ownership as the team or individual that
owns changes and support for resources. They leverage AWS Organizations to manage their AWS accounts. Alternate account
contacts are configuring using group inboxes. Each ITSM queue maps
to an email alias. Tags identify who own AWS resources. For other
platforms and infrastructure, they have a wiki page that
identifies ownership and contact information.

### Implementation steps

- Start by defining ownership for your organization. Ownership
can imply who owns the risk for the resource, who owns
changes to the resource, or who supports the resource when
troubleshooting. Ownership could also imply financial or
administrative ownership of the resource.
- Use
[AWS Organizations](https://aws.amazon.com/organizations/) to manage accounts. You can manage the
alternate contacts for your accounts centrally.

Using company owned email addresses and phone numbers
for contact information helps you to access them even if
the individuals whom they belong to are no longer with
your organization. For example, create separate email
distribution lists for billing, operations, and security
and configure these as Billing, Security, and Operations
contacts in each active AWS account. Multiple people
will receive AWS notifications and be able to respond,
even if someone is on vacation, changes roles, or leaves
the company.
- If an account is not managed by
[AWS Organizations](https://aws.amazon.com/organizations/), alternate account contacts help
AWS get in contact with the appropriate personnel if
needed. Configure the account's alternate contacts to
point to a group rather than an individual.

- Use tags to identify owners for AWS resources. You can
specify both owners and their contact information in
separate tags.

You can use
[AWS Config](https://aws.amazon.com/config/) rules to enforce that resources have the
required ownership tags.
- For in-depth guidance on how to build a tagging strategy
for your organization, see
[AWS Tagging Best Practices whitepaper](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html).

- Use
[Amazon Q Business](https://aws.amazon.com/q/business/), a conversational assistant that uses
generative AI to enhance workforce productivity, answer
questions, and complete tasks based on information in your
enterprise systems.

Connect Amazon Q Business to your company's data source.
Amazon Q Business offers prebuilt connectors to over 40
supported data sources, including Amazon Simple Storage Service (Amazon S3), Microsoft SharePoint, Salesforce,
and Atlassian Confluence. For more information, see
[Amazon Q Business connectors](https://aws.amazon.com/q/business/connectors/).

- For other resources, platforms, and infrastructure, create
documentation that identifies ownership. This should be
accessible to all team members.

**Level of effort for the implementation
plan:** Low. Leverage account contact information and
tags to assign ownership of AWS resources. For other resources
you can use something as simple as a table in a wiki to record
ownership and contact information, or use an ITSM tool to map
ownership.

## Resources

**Related best practices:**

- [OPS02-BP02
Processes and procedures have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_proc_owners.html)
- [OPS02-BP04
Mechanisms exist to manage responsibilities and
ownership](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_responsibilities_ownership.html)

**Related documents:**

- [AWS Account Management - Updating contact information](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html)
- [AWS Organizations - Updating alternative contacts in your
organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_update_contacts.html)
- [AWS Tagging Best Practices whitepaper](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [Build
private and secure enterprise generative AI apps with Amazon Q
Business and AWS IAM Identity Center](https://aws.amazon.com/blogs/machine-learning/build-private-and-secure-enterprise-generative-ai-apps-with-amazon-q-business-and-aws-iam-identity-center/)
- [Amazon Q Business, now generally available, helps boost workforce
productivity with generative AI](https://aws.amazon.com/blogs/aws/amazon-q-business-now-generally-available-helps-boost-workforce-productivity-with-generative-ai/)
- [AWS Cloud Operations & Migrations Blog - Implementing
automated and centralized tagging controls with AWS Config and
AWS Organizations](https://aws.amazon.com/blogs/mt/implementing-automated-and-centralized-tagging-controls-with-aws-config-and-aws-organizations/)
- [AWS Security Blog - Extend your pre-commit hooks with AWS CloudFormation Guard](https://aws.amazon.com/blogs/security/extend-your-pre-commit-hooks-with-aws-cloudformation-guard/)
- [AWS DevOps Blog - Integrating AWS CloudFormation Guard into CI/CD
pipelines](https://aws.amazon.com/blogs/devops/integrating-aws-cloudformation-guard/)

**Related workshops:**

- [AWS Workshop - Tagging](https://catalog.workshops.aws/tagging/)

**Related examples:**

- [AWS Config Rules - Amazon EC2 with required tags and valid
values](https://github.com/awslabs/aws-config-rules/blob/master/python/ec2_require_tags_with_valid_values.py)

**Related services:**

- [AWS Config Rules - required-tags](https://docs.aws.amazon.com/config/latest/developerguide/required-tags.html)
- [AWS Organizations](https://aws.amazon.com/organizations/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_resource_owners.html*

---

# OPS02-BP02 Processes and procedures have identified owners

Understand who has ownership of the definition of individual
processes and procedures, why those specific process and procedures
are used, and why that ownership exists. Understanding the reasons
that specific processes and procedures are used aids in
identification of improvement opportunities.

**Desired outcome:** Your
organization has a well defined and maintained set of process and
procedures for operational tasks. The process and procedures are
stored in a central location and available to your team members.
Process and procedures are updated frequently, by clearly assigned
ownership. Where possible, scripts, templates, and automation
documents are implemented as code.

**Common anti-patterns:**

- Processes are not documented. Fragmented scripts may exist on
isolated operator workstations.
- Knowledge of how to use scripts is held by a few individuals or
informally as team knowledge.
- A legacy process is due for an update, but ownership of the
update is unclear, and the original author is no longer part of
the organization.
- Processes and scripts are not discoverable, so they are not
readily available when required (for example, in response to an
incident).

**Benefits of establishing this best
practice:**

- Processes and procedures boost your efforts to operate your
workloads.
- New team members become effective more quickly.
- Reduced time to mitigate incidents.
- Different team members (and teams) can use the same processes
and procedures in a consistent manner.
- Teams can scale their processes with repeatable processes.
- Standardized processes and procedures help mitigate the impact
of transferring workload responsibilities between teams.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

- Processes and procedures have identified owners who are
responsible for their definition.

Identify the operations activities conducted in support of
your workloads. Document these activities in a
discoverable location.
- Uniquely identify the individual or team responsible for
the specification of an activity. They are responsible to
verify that it can be successfully performed by an
adequately skilled team member with the correct
permissions, access, and tools. If there are issues with
performing that activity, the team members performing it
are responsible for providing the detailed feedback
necessary for the activity to be improved.
- Capture ownership in the metadata of the activity artifact
through services like AWS Systems Manager, through
documents, and AWS Lambda. Capture resource ownership
using tags or resource groups, specifying ownership and
contact information. Use AWS Organizations to create
tagging polices and capture ownership and contact
information.

- Over time, these procedures should be evolved to be runnable
as code, reducing the need for human intervention.

For example, consider AWS Lambda functions, CloudFormation
templates, or AWS Systems Manager automation docs.
- Perform version control in appropriate repositories.
- Include suitable resource tagging so owners and
documentation can readily be identified.

**Customer example**

AnyCompany Retail defines ownership as the team or individual that
owns processes for an application or groups of applications (that
share common architetural practices and technologies). Initially,
the process and procedures are documented as step-by-step guides
in the document management system, discoverable using tags on the
AWS account that hosts the application and on specific groups of
resources within the account. They leverage AWS Organizations to
manage their AWS accounts. Over time, these processes are
converted to code, and resources are defined using infrastructure
as code (such as CloudFormation or AWS Cloud Development Kit (AWS CDK)
templates). The operational processes become automation documents
in AWS Systems Manager or AWS Lambda functions, which can be
initiated as scheduled tasks, in response to events such as AWS
CloudWatch alarms or AWS EventBridge events, or started by
requests within an IT service management (ITSM) platform. All
process have tags to identify ownership. Documentation for the
automation and process is maintained within the wiki pages
generated by the code repository for the process.

### Implementation steps

- Document the existing processes and procedures.

Review and keep them up-to-date.
- Identify an owner for each process or procedure.
- Place them under version control.
- Where possible, share processes and procedures across
workloads and environments that share architectural
designs.

- Establish mechanisms for feedback and improvement.

Define policies for how frequently processes should be
reviewed.
- Define processes for reviewers and approvers.
- Implement issues or a ticketing queue for feedback to be
provided and tracked.
- Whereever possible, processes and procedures should have
pre-approval and risk classification from a change
approval board (CAB).

- Verify that processes and procedures are accessible and
discoverable by those who need to run them.

Use tags to indicate where the process and procedures
can be accessed for the workload.
- Use meaningful error and event messaging to indicate the
appropriate processes or procedures to address an issue.
- Use wikis and document management, and make processes
and procedures searchable consistently accross the
organization.

- Use [Amazon Q Business](https://aws.amazon.com/q/business/), a conversational assistant that uses generative AI to enhance workforce productivity, answer questions, and complete tasks based on information in your enterprise systems.

Connect Amazon Q Business to your company's data source. Amazon Q Business offers prebuilt connectors to over 40 supported data sources, including Amazon S3, Microsoft SharePoint, Salesforce, and Atlassian Confluence. For more information, see [Amazon Q connectors](https://aws.amazon.com/q/business/connectors/).

- Automate when appropriate.

Automations should be developed when services and
technologies provide an API.
- Educate adequately on processes. Develop the user
stories and requirements to automate those processes.
- Measure the use of your processes and procedures
successfully, and create issues or tickets to support iterative
improvement.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS02-BP01
Resources have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_resource_owners.html)
- [OPS02-BP04
Mechanisms exist to manage responsibilities and
ownership](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_responsibilities_ownership.html)
- [OPS11-BP04
Perform knowledge management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_knowledge_management.html)

**Related documents:**

- [AWS Whitepaper - Introduction to DevOps on AWS](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/automation.html)
- [AWS Whitepaper - Best Practices for Tagging AWS Resources](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [AWS Whitepaper - Organizing Your AWS Environment Using Multiple
Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)
- [AWS Cloud Operations and Migrations Blog - Using Amazon Q Business to streamline your operations](https://aws.amazon.com/blogs/mt/streamline-operations-using-amazon-q-for-business/)
- [AWS Cloud Operations & Migrations Blog - Build a Cloud
Automation Practice for Operational Excellence: Best Practices
from AWS Managed Services](https://aws.amazon.com/blogs/mt/build-a-cloud-automation-practice-for-operational-excellence-best-practices-from-aws-managed-services/)
- [AWS Cloud Operations & Migrations Blog - Implementing
automated and centralized tagging controls with AWS Config and
AWS Organizations](https://aws.amazon.com/blogs/mt/implementing-automated-and-centralized-tagging-controls-with-aws-config-and-aws-organizations/)
- [AWS Security Blog - Extend your pre-commit hooks with AWS CloudFormation Guard](https://aws.amazon.com/blogs/security/extend-your-pre-commit-hooks-with-aws-cloudformation-guard/)
- [AWS DevOps Blog - Integrating AWS CloudFormation Guard into CI/CD
pipelines](https://aws.amazon.com/blogs/devops/integrating-aws-cloudformation-guard/)

**Related workshops:**

- [AWS Well-Architected Operational Excellence Workshop](https://catalog.workshops.aws/well-architected-operational-excellence/en-US/)
- [AWS Workshop - Tagging](https://catalog.workshops.aws/tagging/)

**Related videos:**

- [How
to automate IT Operations on AWS](https://www.youtube.com/watch?v=GuWj_mlyTug)
- [AWS re:Invent 2020 - Automate anything with AWS Systems Manager](https://www.youtube.com/watch?v=AaI2xkW85yE)
- [AWS re:Inforce 2022 - Automating patch management and compliance
using AWS (NIS306)](https://www.youtube.com/watch?v=gL3baXQJvc0)
- [Supports You - Diving Deep into AWS Systems Manager](https://www.youtube.com/watch?v=xHNLNTa2xGU)

**Related services:**

- [AWS Systems Manager - Automation](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [AWS Service Management Connector](https://aws.amazon.com/service-management-connector/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_proc_owners.html*

---

# OPS02-BP03 Operations activities have identified owners responsible for their performance

Understand who has responsibility to perform specific activities on
defined workloads and why that responsibility exists. Understanding
who has responsibility to perform activities informs who will
conduct the activity, validate the result, and provide feedback to
the owner of the activity.

**Desired outcome:**

Your organization clearly defines responsibilities to perform
specific activities on defined workloads and respond to events
generated by the workload. The organization documents ownership of
processes and fulfillment and makes this information discoverable.
You review and update responsibilities when organizational changes
take place, and teams track and measure the performance of defect
and inefficiency identification activities. You implement feedback
mechanisms to track defects and improvements and support iterative
improvement.

**Common anti-patterns:**

- You do not document responsibilities.
- Fragmented scripts exist on isolated operator workstations.
Only a few individuals know how to use them or informally refer
to them as *team knowledge*.
- A legacy process is due for update, but no one knows who owns
the process, and the original author is no longer part of the
organization.
- Processes and scripts can't be discovered, and they are not
readily available when required (for example, in response to an
incident).

**Benefits of establishing this best
practice:**

- You understand who is responsible to perform an activity, who to
notify when action is needed, and who performs the action,
validates the result, and provides feedback to the owner of the
activity.
- Processes and procedures boost your efforts to operate your
workloads.
- New team members become effective more quickly.
- You reduce the time it takes to mitigate incidents.
- Different teams use the same processes and procedures to perform
tasks in a consistent manner.
- Teams can scale their processes with repeatable processes.
- Standardized processes and procedures help mitigate the impact
of transferring workload responsibilties between teams.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To begin to define responsibilities, start with existing
documentation, like responsibility matrices, processes and
procedures, roles and responsibilities, and tools and automation.
Review and host discussions on the responsibilities for documented
processes. Review with teams to identify misalignments between
document responsibilities and processes. Discuss services offered
with internal customers of that team to identify expectations gaps
between teams.

Analyze and address the discrepancies. Identify opportunities to
improvement, and look for frequently requested, resource-intensive
activities, which are typically strong candidates for improvement.
Explore best practices, patterns, and prescriptive guidance to
simplify and standardize improvements. Record improvement
opportunities, and track the improvements to completion.

Over time, these procedures should be evolved to be run as code,
reducing the need for human intervention. For example, procedures
can be initiated as AWS Lambda functions, CloudFormation
templates, or AWS Systems Manager Automation documents. Verify
that these procedures are version-controlled in appropriate
repositories, and include suitable resource tagging so that teams
can readily identify owners and documentation. Document the
responsibility for carrying out the activities, and then monitor
the automations for successful initiation and operation, as well
as performance of the desired outcomes.

**Customer example**

AnyCompany Retail defines ownership as the team or individual that
owns processes for an application or groups of applications that
share common architectural practices and technologies. Initially,
the company documents the processes and procedures as step-by-step
guides in the document management system. They make the procedures
discoverable using tags on the AWS account that hosts the
application and on specific groups of resources within the
account, using AWS Organizations to manage their AWS accounts.
Over time, AnyCompany Retail converts these processes to code and
defines resources using infrastructure as code (through services
like CloudFormation or AWS Cloud Development Kit (AWS CDK) templates). The
operational processes become Automation documents in AWS Systems Manager or AWS Lambda functions, which can be initiated as
scheduled tasks in response to events such as Amazon CloudWatch
alarms or Amazon EventBridge events or by requests within an IT
service management (ITSM) platform. All processes have tags to
identify who owns them. Teams manage documentation for the
automation and process within the wiki pages generated by the code
repository for the process.

### Implementation steps

- Document the existing processes and procedures.

Review and verify that they are up-to-date.
- Verify that each process or procedure has an owner.
- Place the procedures under version control.
- Where possible, share processes and procedures across
workloads and environments that share architectural
designs.

- Establish mechanisms for feedback and improvement.

Define policies for how frequently processes should be
reviewed.
- Define processes for reviewers and approvers.
- Implement issues or a ticketing queue to provide and
track feedback.
- Wherever possible, provide pre-approval and risk
classification for processes and procedures from a
change approval board (CAB).

- Make process and procedures accessible and discoverable by
users who need to run them.

Use tags to indicate where the process and procedures
can be accessed for the workload.
- Use meaningful error and event messaging to indicate the
appropriate process or proceedure to address the issue.
- Use wikis or document management to make processes and
procedures consistently searchable across the
organization.

- Automate when it is appropriate to do so.

Where services and technologies provide an API, develop
automations.
- Verify that processes are well-understood, and develop
the user stories and requirements to automate those
processes.
- Measure the successful use of processes and procedures,
with issue tracking to support iterative improvement.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS02-BP01
Resources have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_resource_owners.html)
- [OPS02-BP02
Processes and procedures have identified owners](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_resource_owners.html)
- [OPS02-BP04 Mechanisms exist to manage responsibilities and
ownership](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_responsibilities_ownership.html)
- [OPS02-BP05
Mechanisms exist to identify responsibility and
ownership](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_find_owner.html)
- [OPS11-BP04
Perform knowledge management](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_knowledge_management.html)

**Related documents:**

- [AWS Whitepaper | Introduction to DevOps on AWS](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/automation.html)
- [AWS Whitepaper | Best Practices for Tagging AWS Resources](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [AWS Whitepaper | Organizing Your AWS Environment Using Multiple
Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)
- [AWS Cloud Operations & Migrations Blog | Build a Cloud
Automation Practice for Operational Excellence: Best Practices
from AWS Managed Services](https://aws.amazon.com/blogs/mt/build-a-cloud-automation-practice-for-operational-excellence-best-practices-from-aws-managed-services/)
- [AWS Workshop - Tagging](https://catalog.workshops.aws/tagging/)
- [AWS Service Management Connector](https://aws.amazon.com/service-management-connector/)

**Related videos:**

- [AWS Knowledge Center Live | Tagging AWS Resources](https://www.youtube.com/watch?v=MX9DaAQS15I)
- [AWS re:Invent 2020 | Automate anything with AWS Systems Manager](https://www.youtube.com/watch?v=AaI2xkW85yE)
- [AWS re:Inforce 2022 | Automating patch management and compliance
using AWS (NIS306)](https://www.youtube.com/watch?v=gL3baXQJvc0)
- [Supports You | Diving Deep into AWS Systems Manager](https://www.youtube.com/watch?v=xHNLNTa2xGU)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_activity_owners.html*

---

# OPS02-BP04 Mechanisms exist to manage responsibilities and ownership

Understand the responsibilities of your role and how you contribute
to business outcomes, as this understanding informs the
prioritization of your tasks and why your role is important. This
helps team members recognize needs and respond appropriately. When
team members know their role, they can establish ownership, identify
improvement opportunities, and understand how to influence or make
appropriate changes.

Occasionally, a responsibility might not have a clear owner. In
these situations, design a mechanism to resolve this gap. Create a
well-defined escalation path to someone with the authority to assign
ownership or plan to address the need.

**Desired outcome:** Teams within
your organization have clearly-defined responsibilities that include
how they are related to resources, actions to be performed,
processes, and procedures. These responsibilities align to the
team's responsibilities and goals, as well as the responsibilities
of other teams. You document the routes of escalation in a
consistent and discoverable manner and feed these decisions into
documentation artifacts, such as responsibility matrices, team
definitions, or wiki pages.

**Common anti-patterns:**

- The responsibilities of the team are ambiguous or
poorly-defined.
- The team does not align roles with responsibilities.
- The team does not align its goals and objectives its
responsibilities, which makes it difficult to measure success.
- Team member responsibilities do not align with the team and the
wider organization.
- Your team does not keep responsibilities up-to-date, which makes
them inconsistent with the tasks performed by the team.
- Escalation paths for determining responsibilities aren't defined
or are unclear.
- Escalation paths have no single thread owner to ensure timely
reponse.
- Roles, responsibilities, and escalation paths are not
discoverable, and they are not readily available when required
(for example, in response to an incident).

**Benefits of establishing this best
practice:**

- When you understand who has responsibility or ownership, you can
contact the proper team or team member to make a request or
transition a task.
- To reduce the risk of inaction and unaddressed needs, you have
identified a person who has the authority to assign
responsibility or ownership.
- When you clearly define the scope of a responsibility, your team
members gain autonomy and ownership.
- Your responsibilities inform the decisions you make, the actions
you take, and your handoff activities to their proper owners.
- It's easy to identify abandoned responsibilities because you
have a clear understanding of what falls outside of your team's
responsibility, which helps you escalate for clarification.
- Teams avoid confusion and tension, and they can more adequately
manage their workloads and resources.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Identify team members roles and responsibilities, and verify that
they understand the expectations of their role. Make this
information discoverable so that members of your organization can
identify who they need to contact for specific needs, whether it's
a team or individual. As organizations seek to capitalize on the
opportunities to migrate and modernize on AWS, roles and
responsibilities might also change. Keep your teams and their
members aware of their responsibilities, and train them
appropriately to carry out their tasks during this change.

Determine the role or team that should receive escalations to
identify responsibility and ownership. This team can engage with
various stakeholders to come to a decision. However, they should
own the management of the decision making process.

Provide accessible mechanisms for members of your organization to
discover and identify ownership and responsibility. These
mechanisms teach them who to contact for specific needs.

**Customer example**

AnyCompany Retail recently completed a migration of workloads from
an on-premises environment to their landing zone in AWS with a
lift and shift approach. They performed an operations review to
reflect on how they accomplish common operational tasks and
verified that their existing responsibility matrix reflects
operations in the new environment. When they migrated from
on-premises to AWS, they reduced the infrastructure teams
responsibilities relating to the hardware and physical
infrastructure. This move also revealed new opportunities to
evolve the operating model for their workloads.

While they identified, addressed, and documented the majority of
responsibilities, they also defined escalation routes for any
responsibilities that were missed or that may need to change as
operations practices evolve. To explore new opportunities to
standardize and improve efficiency across your workloads, provide
access to operations tools like AWS Systems Manager and security
tools like AWS Security Hub CSPM and Amazon GuardDuty. AnyCompany
Retail puts together a review of responsibilities and strategy
based on improvements they wants to address first. As the company
adopts new ways of working and technology patterns, they update
their responsibility matrix to match.

### Implementation steps

- Start with existing documentation. Some typical source
documents might include:

Responsibility or responsible, accountable, consulted,
and informed (RACI) matrices
- Team definitions or wiki pages
- Service definitions and offerings
- Role or job descriptions

- Review and host discussions on the documented
responsibilities:

Review with teams to identify misalignments between
documented responsibilities and responsibilities the
team typically performs.
- Discuss potential services offered by internal customers
to identify gaps in expectations between teams.

- Analysis and address the discrepancies.
- Identify opportunities for improvement.

Identify frequently-requested, resource-intensive
requests, which are typically strong candidates for
improvement.
- Look for best practices, understand patterns, follow prescriptive
guidance, and simplify and standardize improvements.
- Record improvement opportunities, and track them to
completion.

- If a team doesn't already hold responsibility for managing
and tracking the assignment of responsibilities, identify
someone on the team to hold this responsibility.
- Define a process for teams to request clarification of
responsibility.

Review the process, and verify that it is clear and
simple to use.
- Make sure that someone owns and tracks escalations to
their conclusion.
- Establish operational metrics to measure effectiveness.
- Create a feedback mechanisms to verify that teams can
highlight improvement opportunities.
- Implement a mechanism for periodic review.

- Document in a discoverable and accessible location.

Wikis or documentation portal are common choices.

**Level of effort for the implementation
plan:** Medium

## Resources

**Related best practices:**

- [OPS01-BP06
Evaluate tradeoffs](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_tradeoffs.html)
- [OPS03-BP02
Team members are empowered to take action when outcomes are at
risk](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_org_culture_team_emp_take_action.html)
- [OPS03-BP03
Escalation is encouraged](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_org_culture_team_enc_escalation.html)
- [OPS03-BP07
Resource teams appropriately](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_org_culture_team_res_appro.html)
- [OPS09-BP01
Measure operations goals and KPIs with metrics](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_measure_ops_goals_kpis.html)
- [OPS09-BP03
Review operations metrics and prioritize improvement](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_operations_health_review_ops_metrics_prioritize_improvement.html)
- [OPS11-BP01
Have a process for continuous improvement](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_process_cont_imp.html)

**Related documents:**

- [AWS Whitepaper - Introduction to DevOps on AWS](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/automation.html)
- [AWS Whitepaper - AWS Cloud Adoption Framework: Operations
Perspective](https://docs.aws.amazon.com/whitepapers/latest/aws-caf-operations-perspective/aws-caf-operations-perspective.html)
- [AWS Well-Architected Framework Operational Excellence - Workload
level Operating model topologies](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/operating-model-2-by-2-representations.html)
- [AWS Prescriptive Guidance - Building your Cloud Operating
Model](https://docs.aws.amazon.com/prescriptive-guidance/latest/strategy-cloud-operating-model/welcome.html)
- [AWS Prescriptive Guidance - Create a RACI or RASCI matrix for a
cloud operating model](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/create-a-raci-or-rasci-matrix-for-a-cloud-operating-model.html)
- [AWS Cloud Operations & Migrations Blog - Delivering Business
Value with Cloud Platform Teams](https://aws.amazon.com/blogs/mt/delivering-business-value-with-cloud-platform-teams/)
- [AWS Cloud Operations & Migrations Blog - Why a Cloud Operating
Model?](https://aws.amazon.com/blogs/mt/why-a-cloud-operating-model/)
- [AWS DevOps Blog - How organizations are modernizing for cloud
operations](https://aws.amazon.com/blogs/devops/how-organizations-are-modernizing-for-cloud-operations/)

**Related videos:**

- [AWS Summit Online - Cloud Operating Models for Accelerated
Transformation](https://www.youtube.com/watch?v=ksJ5_UdYIag)
- [AWS re:Invent 2023 - Future-proofing cloud security: A new
operating model](https://www.youtube.com/watch?v=GFcKCz1VO2I)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_responsibilities_ownership.html*

---

# OPS02-BP05 Mechanisms exist to request additions, changes, and exceptions

You can make requests to owners of processes, procedures, and resources. Requests
include additions, changes, and exceptions. These requests go through a change management
process. Make informed decisions to approve requests where viable and determined to be
appropriate after an evaluation of benefits and risks.

**Desired outcome:**

- You can make requests to change processes, procedures, and resources based on assigned ownership.
- Changes are made in a deliberate manner, weighing benefits and risks.

**Common anti-patterns:**

- You must update the way you deploy your application, but there is no way to request a change to the deployment process from the operations team.
- The disaster recovery plan must be updated, but there is no identified owner to request changes to.

**Benefits of establishing this best practice:**

- Processes, procedures, and resources can evolve as requirements change.
- Owners can make informed decisions when to make changes.
- Changes are made in a deliberate manner.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To implement this best practice, you need to be able to request changes to processes,
procedures, and resources. The change management process can be lightweight. Document
the change management process.

**Customer example**

AnyCompany Retail uses a responsibility assignment (RACI) matrix to identify who owns changes for processes, procedures,
and resources. They have a documented change management process that’s lightweight and easy
to follow. Using the RACI matrix and the process, anyone can submit change requests.

**Implementation steps**

- Identify the processes, procedures, and resources for your workload and the owners for each. Document them in your knowledge management system.

If you have not implemented [OPS02-BP01 Resources have identified owners](./ops_ops_model_def_resource_owners.html),
[OPS02-BP02 Processes and procedures have identified owners](./ops_ops_model_def_proc_owners.html), or
[OPS02-BP03 Operations activities have identified owners responsible for their performance](./ops_ops_model_def_activity_owners.html), start with those first.

- Work with stakeholders in your organization to develop a change management process.
The process should cover additions, changes, and exceptions for resources, processes, and procedures.

You can use [AWS Systems Manager Change Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager.html) as a change management platform for workload resources.

- Document the change management process in your knowledge management system.

**Level of effort for the implementation plan:** Medium. Developing a change
management process requires alignment with multiple stakeholders across your organization.

## Resources

**Related best practices:**

- [OPS02-BP01 Resources have identified owners](./ops_ops_model_def_resource_owners.html) - Resources need identified owners before you build a change management process.
- [OPS02-BP02 Processes and procedures have identified owners](./ops_ops_model_def_proc_owners.html) - Processes need identified owners before you build a change management process.
- [OPS02-BP03 Operations activities have identified owners responsible for their performance](./ops_ops_model_def_activity_owners.html) - Operations activities need identified owners before you build a change management process.

**Related documents:**

- [AWS Prescriptive Guidance - Foundation palybook for AWS large migrations: Creating RACI matrices](https://docs.aws.amazon.com/prescriptive-guidance/latest/large-migration-foundation-playbook/team-org.html#raci)
- [Change Management in the Cloud Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/change-management-in-the-cloud/change-management-in-the-cloud.html)

**Related services:**

- [AWS Systems Manager Change Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_req_add_chg_exception.html*

---

# OPS02-BP06 Responsibilities between teams are predefined or negotiated

Have defined or negotiated agreements between teams describing how they work with
and support each other (for example, response times, service level objectives, or
service-level agreements). Inter-team communications channels are documented.
Understanding the impact of the teams’ work on business outcomes and the outcomes
of other teams and organizations informs the prioritization of their tasks and
helps them respond appropriately.

When responsibility and ownership are undefined or unknown, you are
at risk of both not addressing necessary activities in a timely
fashion and of redundant and potentially conflicting efforts
emerging to address those needs.

**Desired outcome:**

- Inter-team working or support agreements are agreed to and documented.
- Teams that support or work with each other have defined communication channels and response expectations.

**Common anti-patterns:**

- An issue occurs in production and two separate teams start troubleshooting independent of each other. Their siloed efforts extend the outage.
- The operations team needs assistance from the development team but there is no agreed to response time. The request is stuck in the backlog.

**Benefits of establishing this best practice:**

- Teams know how to interact and support each other.
- Expectations for responsiveness are known.
- Communications channels are clearly defined.

**Level of risk exposed if this best practice
is not established:** Low

## Implementation guidance

Implementing this best practice means that there is no ambiguity about how teams work with each other.
Formal agreements codify how teams work together or support each other. Inter-team communication channels
are documented.

**Customer example**

AnyCompany Retail’s SRE team has a service level agreement with their development team. Whenever
the development team makes a request in their ticketing system, they can expect a response within
fifteen minutes. If there is a site outage, the SRE team takes lead in the investigation with support
from the development team.

**Implementation steps**

- Working with stakeholders across your organization, develop agreements between teams based on processes and procedures.

If a process or procedure is shared between two teams, develop a runbook on how the teams will work together.
- If there are dependencies between teams, agree to a response SLA for requests.

- Document responsibilities in your knowledge management system.

**Level of effort for the implementation plan:** Medium. If there are no existing agreements
between teams, it can take effort to come to agreement with stakeholders across your organization.

## Resources

**Related best practices:**

- [OPS02-BP02 Processes and procedures have identified owners](./ops_ops_model_def_proc_owners.html) - Process ownership must be identified before setting agreements between teams.
- [OPS02-BP03 Operations activities have identified owners responsible for their performance](./ops_ops_model_def_activity_owners.html) - Operations activities ownership must be identified before setting agreements between teams.

**Related documents:**

- [AWS Executive Insights - Empowering Innovation with the Two-Pizza Team](https://aws.amazon.com/executive-insights/content/amazon-two-pizza-team/)
- [Introduction to DevOps on AWS - Two-Pizza Teams](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/two-pizza-teams.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ops_model_def_neg_team_agreements.html*

---
