# OPS 1 — How do you determine what your priorities are?

**Pillar**: Operational Excellence  
**Best Practices**: 6

---

# OPS01-BP01 Evaluate external customer needs

Involve key stakeholders, including business, development, and
operations teams, to determine where to focus efforts on external
customer needs. This verifies that you have a thorough understanding
of the operations support that is required to achieve your desired
business outcomes.

**Desired outcome:**

- You work
backwards from customer outcomes.
- You understand how your operational practices support business
outcomes and objectives.
- You engage all relevant parties.
- You have mechanisms to capture external customer needs.

**Common anti-patterns:**

- You have decided not to have customer support outside of core
business hours, but you haven't reviewed historical support
request data. You do not know whether this will have an impact
on your customers.
- You are developing a new feature but have not engaged your
customers to find out if it is desired, if desired in what form,
and without experimentation to validate the need and method of
delivery.

**Benefits of establishing this best
practice:** Customers whose needs are satisfied are much
more likely to remain customers. Evaluating and understanding
external customer needs will inform how you prioritize your efforts
to deliver business value.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

**Understand business needs:** Business success is created by shared
goals and understanding across stakeholders, including business,
development, and operations teams.

**Review business goals, needs, and
priorities of external customers:** Engage key
stakeholders, including business, development, and operations
teams, to discuss goals, needs, and priorities of external
customers. This ensures that you have a thorough understanding of
the operational support that is required to achieve business and
customer outcomes.

**Establish a shared
understanding:** Establish a shared understanding of the
business functions of the workload, the roles of each of the teams
in operating the workload, and how these factors support your
shared business goals across internal and external customers.

## Resources

**Related best practices:**

- [OPS11-BP03
Implement feedback loops](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_ext_cust_needs.html*

---

# OPS01-BP02 Evaluate internal customer needs

Involve key stakeholders, including business, development, and
operations teams, when determining where to focus efforts on
internal customer needs. This will ensure that you have a thorough
understanding of the operations support that is required to achieve
business outcomes.

**Desired outcome:**

- You use your
established priorities to focus your improvement efforts where they
will have the greatest impact (for example, developing team skills,
improving workload performance, reducing costs, automating runbooks,
or enhancing monitoring).
- You update your priorities as needs change.

**Common anti-patterns:**

- You have
decided to change IP address allocations for your product teams,
without consulting them, to make managing your network easier. You
do not know the impact this will have on your product teams.
- You are implementing a new development tool but have not engaged
your internal customers to find out if it is needed or if it is
compatible with their existing practices.
- You are implementing a new monitoring system but have not
contacted your internal customers to find out if they have
monitoring or reporting needs that should be considered.

**Benefits of establishing this best
practice:** Evaluating and understanding internal customer
needs informs how you prioritize your efforts to deliver business
value.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

- Understand business needs: Business success is created by
shared goals and understanding across stakeholders including
business, development, and operations teams.
- Review business goals, needs, and priorities of internal
customers: Engage key stakeholders, including business,
development, and operations teams, to discuss goals, needs,
and priorities of internal customers. This ensures that you
have a thorough understanding of the operational support that
is required to achieve business and customer outcomes.
- Establish shared understanding: Establish shared understanding
of the business functions of the workload, the roles of each
of the teams in operating the workload, and how these factors
support shared business goals across internal and external
customers.

## Resources

**Related best practices:**

- [OPS11-BP03
Implement feedback loops](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_evolve_ops_feedback_loops.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_int_cust_needs.html*

---

# OPS01-BP03 Evaluate governance requirements

Governance is the set of policies, rules, or frameworks that a company uses to
achieve its business goals. Governance requirements are generated from within your
organization. They can affect the types of technologies you choose or influence the
way you operate your workload. Incorporate organizational governance requirements
into your workload. Conformance is the ability to demonstrate that you have implemented
governance requirements.

**Desired outcome:**

- Governance requirements are incorporated into the architectural design and operation of your workload.
- You can provide proof that you have followed governance requirements.
- Governance requirements are regularly reviewed and updated.

**Common anti-patterns:**

- Your organization mandates that the root account has multi-factor authentication. You failed to implement this requirement and the root account is compromised.
- During the design of your workload, you choose an instance type that is not approved by the IT department. You are unable to launch your workload and must conduct a redesign.
- You are required to have a disaster recovery plan. You did not create one and your workload suffers an extended outage.
- Your team wants to use new instances but your governance requirements have not been updated to allow them.

**Benefits of establishing this best
practice:**

- Following governance requirements aligns your workload with larger organization policies.
- Governance requirements reflect industry standards and best practices for your organization.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Identify governance requirement by working with stakeholders and
governance organizations. Include governance requirements into your
workload. Be able to demonstrate proof that you’ve followed governance
requirements.

**Customer example**

At AnyCompany Retail, the cloud operations team works with stakeholders
across the organization to develop governance requirements. For example,
they prohibit SSH access into Amazon EC2 instances. If teams need system access,
they are required to use AWS Systems Manager Session Manager. The cloud
operations team regularly updates governance requirements as new services
become available.

**Implementation steps**

- Identify the stakeholders for your workload, including any centralized teams.
- Work with stakeholders to identify governance requirements.
- Once you’ve generated a list, prioritize the improvement items, and begin implementing them into your workload.

Use services like [AWS Config](https://aws.amazon.com/blogs/industries/best-practices-for-aws-organizations-service-control-policies-in-a-multi-account-environment/) to create governance-as-code and validate that governance requirements are followed.
- If you use [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html), you can leverage Service Control Policies to implement governance requirements.

- Provide documentation that validates the implementation.

**Level of effort for the implementation plan:** Medium. Implementing missing governance requirements
may result in rework of your workload.

## Resources

**Related best practices:**

- [OPS01-BP04 Evaluate compliance requirements](./ops_priorities_compliance_reqs.html) - Compliance is like governance but comes from outside an organization.

**Related documents:**

- [AWS Management and Governance Cloud Environment Guide](https://docs.aws.amazon.com/wellarchitected/latest/management-and-governance-guide/management-and-governance-cloud-environment-guide.html)
- [Best Practices for AWS Organizations Service Control Policies in a Multi-Account Environment](https://aws.amazon.com/blogs/industries/best-practices-for-aws-organizations-service-control-policies-in-a-multi-account-environment/)
- [Governance in the AWS Cloud: The Right Balance Between Agility and Safety](https://aws.amazon.com/blogs/apn/governance-in-the-aws-cloud-the-right-balance-between-agility-and-safety/)
- [What is Governance, Risk, And Compliance (GRC)?](https://aws.amazon.com/what-is/grc/)

**Related videos:**

- [AWS Management and Governance: Configuration, Compliance, and Audit - AWS Online Tech Talks](https://www.youtube.com/watch?v=79ud1ZAaoj0)
- [AWS re:Inforce 2019: Governance for the Cloud Age (DEM12-R1)](https://www.youtube.com/watch?v=y3WmHnavuN8)
- [AWS re:Invent 2020: Achieve compliance as code using AWS Config](https://www.youtube.com/watch?v=m8vTwvbzOfw)
- [AWS re:Invent 2020: Agile governance on AWS GovCloud (US)](https://www.youtube.com/watch?v=hv6B17eriHQ)

**Related examples:**

- [AWS Config Conformance Pack Samples](https://docs.aws.amazon.com/config/latest/developerguide/conformancepack-sample-templates.html)

**Related services:**

- [AWS Config](https://aws.amazon.com/config/)
- [AWS Organizations - Service Control Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_governance_reqs.html*

---

# OPS01-BP04 Evaluate compliance requirements

Regulatory, industry, and internal compliance requirements are an important driver for defining
your organization’s priorities. Your compliance framework may preclude you from using specific
technologies or geographic locations. Apply due diligence if no external compliance frameworks are
identified. Generate audits or reports that validate compliance.

If you advertise that your product meets specific compliance standards, you must have an internal process for ensuring continuous compliance. Examples of compliance standards include PCI DSS, FedRAMP, and HIPAA. Applicable compliance standards are determined by various factors, such as what types of data the solution stores or transmits and which geographic regions the solution supports.

**Desired outcome:**

- Regulatory, industry, and internal compliance requirements are incorporated into architectural selection.
- You can validate compliance and generate audit reports.

**Common anti-patterns:**

- Parts of your workload fall under the Payment Card Industry Data Security Standard (PCI-DSS) framework but your workload stores credit cards data unencrypted.
- Your software developers and architects are unaware of the compliance framework that your organization must adhere to.
- The yearly Systems and Organizations Control (SOC2) Type II audit is happening soon and you are unable to verify that controls are in place.

**Benefits of establishing this best
practice:**

- Evaluating and understanding the compliance requirements that apply to your workload will inform how you prioritize your efforts to deliver business value.
- You choose the right locations and technologies that are congruent with your compliance framework.
- Designing your workload for auditability helps you to prove you are adhering to your compliance framework.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Implementing this best practice means that you incorporate compliance requirements into your architecture design process. Your team members are aware of the required compliance framework. You validate compliance in line with the framework.

**Customer example**

AnyCompany Retail stores credit card information for customers. Developers on the card storage team understand that they need to comply with the PCI-DSS framework. They’ve taken steps to verify that credit card information is stored and accessed securely in line with the PCI-DSS framework. Every year they work with their security team to validate compliance.

**Implementation steps**

- Work with your security and governance teams to determine what industry, regulatory, or internal compliance frameworks that your workload must adhere to. Incorporate the compliance frameworks into your workload.

Validate continual compliance of AWS resources with services like
[AWS Compute Optimizer](https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is-compute-optimizer.html)
and [AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html).

- Educate your team members on the compliance requirements so they can operate and evolve the workload in line with them. Compliance requirements should be included in architectural and technological choices.
- Depending on the compliance framework, you may be required to generate an audit or compliance report. Work with your organization to automate this process as much as possible.

Use services like [AWS Audit Manager](https://docs.aws.amazon.com/audit-manager/latest/userguide/what-is.html) to validate compliance and generate audit reports.
- You can download AWS security and compliance documents with [AWS Artifact](https://docs.aws.amazon.com/artifact/latest/ug/what-is-aws-artifact.html).

**Level of effort for the implementation plan:** Medium. Implementing compliance frameworks can be challenging. Generating audit reports or compliance documents adds additional complexity.

## Resources

**Related best practices:**

- [SEC01-BP03 Identify and validate control objectives](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_control_objectives.html) - Security control objectives are an important part of overall compliance.
- [SEC01-BP06 Automate testing and validation of security controls in pipelines](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_test_validate_pipeline.html) - As part of your pipelines, validate security controls. You can also generate compliance documentation for new changes.
- [SEC07-BP02 Define data protection controls](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_data_classification_define_protection.html) - Many compliance frameworks have data handling and storage policies based.
- [SEC10-BP03 Prepare forensic capabilities](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_incident_response_prepare_forensic.html) - Forensic capabilities can sometimes be used in auditing compliance.

**Related documents:**

- [AWS Compliance Center](https://aws.amazon.com/financial-services/security-compliance/compliance-center/)
- [AWS Compliance Resources](https://aws.amazon.com/compliance/resources/)
- [AWS Risk and Compliance Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/aws-risk-and-compliance/welcome.html)
- [AWS Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/)
- [AWS services in scope by compliance programs](https://aws.amazon.com/compliance/services-in-scope/)

**Related videos:**

- [AWS re:Invent 2020: Achieve compliance as code using AWS Compute Optimizer](https://www.youtube.com/watch?v=m8vTwvbzOfw)
- [AWS re:Invent 2021 - Cloud compliance, assurance, and auditing](https://www.youtube.com/watch?v=pdrYGVgb08Y)
- [AWS Summit ATL 2022 - Implementing compliance, assurance, and auditing on AWS (COP202)](https://www.youtube.com/watch?v=i7XrWimhqew)

**Related examples:**

- [PCI DSS and AWS Foundational Security Best Practices on AWS](https://aws.amazon.com/solutions/partners/compliance-pci-fsbp-remediation/)

**Related services:**

- [AWS Artifact](https://docs.aws.amazon.com/artifact/latest/ug/what-is-aws-artifact.html)
- [AWS Audit Manager](https://docs.aws.amazon.com/audit-manager/latest/userguide/what-is.html)
- [AWS Compute Optimizer](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html)
- [AWS Security Hub CSPM](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_compliance_reqs.html*

---

# OPS01-BP05 Evaluate threat landscape

Evaluate threats to the business (for example, competition, business
risk and liabilities, operational risks, and information security
threats) and maintain current information in a risk registry.
Include the impact of risks when determining where to focus efforts.

The
[Well-Architected
Framework](https://aws.amazon.com/architecture/well-architected/) emphasizes learning, measuring, and improving. It
provides a consistent approach for you to evaluate architectures,
and implement designs that will scale over time. AWS provides the
[AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/) to help you review your approach prior
to development, the state of your workloads prior to production, and
the state of your workloads in production. You can compare them to
the latest AWS architectural best practices, monitor the overall
status of your workloads, and gain insight to potential risks.

AWS customers are eligible for a guided Well-Architected Review of
their mission-critical workloads to
[measure
their architectures](https://aws.amazon.com/premiumsupport/programs/) against AWS best practices. Enterprise
Support customers are eligible for an
[Operations
Review](https://aws.amazon.com/premiumsupport/programs/), designed to help them to identify gaps in their
approach to operating in the cloud.

The cross-team engagement of these reviews helps to establish common
understanding of your workloads and how team roles contribute to
success. The needs identified through the review can help shape your
priorities.

[AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/) is a tool that provides access to a core set
of checks that recommend optimizations that may help shape your
priorities.
[Business
and Enterprise Support customers](https://aws.amazon.com/premiumsupport/plans/) receive access to additional
checks focusing on security, reliability, performance, and
cost-optimization that can further help shape their priorities.

**Desired outcome:**

- You regularly
review and act on Well-Architected and Trusted Advisor outputs
- You are aware of the latest patch status of your services
- You understand the risk and impact of known threats and act
accordingly
- You implement mitigations as necessary
- You communicate actions and context

**Common anti-patterns:**

- You are
using an old version of a software library in your product. You are
unaware of security updates to the library for issues that may have
unintended impact on your workload.
- Your competitor just released a version of their product that
addresses many of your customers' complaints about your product.
You have not prioritized addressing any of these known issues.
- Regulators have been pursuing companies like yours that are not
compliant with legal regulatory compliance requirements. You
have not prioritized addressing any of your outstanding
compliance requirements.

**Benefits of establishing this best practice:** You identify and understand the threats to your
organization and workload, which helps your determination of which
threats to address, their priority, and the resources necessary to
do so.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

- **Evaluate threat landscape:**
Evaluate threats to the business (for example, competition,
business risk and liabilities, operational risks, and
information security threats), so that you can include their
impact when determining where to focus efforts.

[AWS Latest Security Bulletins](https://aws.amazon.com/security/security-bulletins/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)

- **Maintain a threat model:**
Establish and maintain a threat model identifying potential
threats, planned and in place mitigations, and their priority.
Review the probability of threats manifesting as incidents,
the cost to recover from those incidents and the expected harm
caused, and the cost to prevent those incidents. Revise
priorities as the contents of the threat model change.

## Resources

**Related best practice:**

- [SEC01-BP07
Identify threats and prioritize mitigations using a threat
model](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_securely_operate_threat_model.html)

**Related documents:**

- [AWS Cloud
Compliance](https://aws.amazon.com/compliance/)
- [AWS Latest Security Bulletins](https://aws.amazon.com/security/security-bulletins/)
- [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/)

**Related videos:**

- [AWS re:Inforce 2023 - A tool to help improve your threat
modeling](https://youtu.be/CaYCsmjuiHg?si=e_CXPGqRF4WeBr1u)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_threat_landscape.html*

---

# OPS01-BP06 Evaluate tradeoffs while managing benefits and risks

Competing interests from multiple parties can make it challenging to
prioritize efforts, build capabilities, and deliver outcomes aligned
with business strategies. For example, you may be asked to
accelerate speed-to-market for new features over optimizing IT
infrastructure costs. This can put two interested parties in
conflict with one another. In these situations, decisions need to be
brought to a higher authority to resolve conflict. Data is required
to remove emotional attachment from the decision-making process.

The same challenge may occur at a tactical level. For example, the
choice between using relational or non-relational database
technologies can have a significant impact on the operation of an
application. It's critical to understand the predictable results of
various choices.

AWS can help you educate your teams about AWS and its services to
increase their understanding of how their choices can have an impact
on your workload. Use the resources provided by
[Support](https://aws.amazon.com/premiumsupport/programs/)
([AWS Knowledge Center](https://aws.amazon.com/premiumsupport/knowledge-center/),
[AWS Discussion Forums](https://forums.aws.amazon.com/index.jspa), and
[Support Center](https://console.aws.amazon.com/support/home/)) and
[AWS Documentation](https://docs.aws.amazon.com/) to educate your teams. For further questions,
reach out to Support.

AWS also shares operational best practices and patterns in
[The
Amazon Builders' Library](https://aws.amazon.com/builders-library/). A wide variety of other useful
information is available through the
[AWS Blog](https://aws.amazon.com/blogs/) and
[The
Official AWS Podcast](https://aws.amazon.com/podcasts/aws-podcast/).

**Desired outcome:** You have a
clearly defined decision-making governance framework to facilitate
important decisions at every level within your cloud delivery
organization. This framework includes features like a risk register,
defined roles that are authorized to make decisions, and a defined
models for each level of decision that can be made. This framework
defines in advance how conflicts are resolved, what data needs to be
presented, and how options are prioritized, so that once decisions
are made you can commit without delay. The decision-making framework
includes a standardized approach to reviewing and weighing the
benefits and risks of every decision to understand the tradeoffs.
This may include external factors, such as adherence to regulatory
compliance requirements.

**Common anti-patterns:**

- Your
investors request that you demonstrate compliance with Payment Card
Industry Data Security Standards (PCI DSS). You do not consider the
tradeoffs between satisfying their request and continuing with your
current development efforts. Instead, you proceed with your
development efforts without demonstrating compliance. Your investors
stop their support of your company over concerns about the security
of your platform and their investments.
- You have decided to include a library that one of your
developers found on the internet. You have not evaluated the
risks of adopting this library from an unknown source and do not
know if it contains vulnerabilities or malicious code.
- The original business justification for your migration was based
upon the modernization of 60% of your application workloads.
However, due to technical difficulties, a decision was made to
modernize only 20%, leading to a reduction in planned benefits
long-term, increased operator toil for infrastructure teams to
manually support legacy systems, and greater reliance on
developing new skillsets in your infrastructure teams that were
not planning for this change.

**Benefits of establishing this best
practice:** Fully aligning and supporting board-level
business priorities, understanding the risks to achieving success,
making informed decisions, and acting appropriately when risks
impede chances for success. Understanding the implications and
consequences of your decisions helps you to prioritize your options
and bring leaders into agreement faster, leading to improved
business outcomes. Identifying the available benefits of your
choices and being aware of the risks to your organization helps you
make data-driven decisions, rather than relying on anecdotes.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Managing benefits and risks should be defined by a governing body
that drives the requirements for key decision-making. You want
decisions to be made and prioritized based on how they benefit the
organization, with an understanding of the risks involved.
Accurate information is critical for making the organizational
decisions. This should be based on solid measurements and defined
by common industry practices of cost benefit analysis. To make
these types of decisions, strike a balance between centralized and
decentralized authority. There is always a tradeoff, and it's
important to understand how each choice impacts defined strategies
and desired business outcomes.

### Implementation steps

- Formalize benefits measurement practices within a holistic
cloud governance framework.

Balance central control of decision-making with
decentralized authority for some decisions.
- Understand that burdensome decision-making processes
imposed on every decision can slow you down.
- Incorporate external factors into your decision making
process (like compliance requirements).

- Establish an agreed-upon decision-making framework for
various levels of decisions, which includes who is required
to unblock decisions that are subject to conflicted
interests.

Centralize one-way door decisions that could be
irreversible.
- Allow two-way door decisions to be made by lower level
organizational leaders.

- Understand and manage benefits and risks. Balance the
benefits of decisions against the risks involved.

**Identify benefits**:
Identify benefits based on business goals, needs, and
priorities. Examples include business case impact,
time-to-market, security, reliability, performance, and
cost.
- **Identify risks**:
Identify risks based on business goals, needs, and
priorities. Examples include time-to-market, security,
reliability, performance, and cost.
- **Assess benefits against risks
and make informed decisions**: Determine the
impact of benefits and risks based on goals, needs, and
priorities of your key stakeholders, including business,
development, and operations. Evaluate the value of the
benefit against the probability of the risk being
realized and the cost of its impact. For example,
emphasizing speed-to-market over reliability might
provide competitive advantage. However, it may result in
reduced uptime if there are reliability issues.

- Programatically enforce key decisions that automate your
adherence to compliance requirements.
- Leverage known industry frameworks and capabilities, such as
Value Stream Analysis and LEAN, to baseline current state
performance, business metrics, and define iterations of
progress towards improvements to these metrics.

**Level of effort for the implementation
plan:** Medium-High

## Resources

**Related best practices:**

- [OPS01-BP05
Evaluate threat landscape](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_threat_landscape.html)

**Related documents:**

- [Elements
of Amazon's Day 1 Culture | Make high quality, high velocity
decisions](https://aws.amazon.com/executive-insights/content/how-amazon-defines-and-operationalizes-a-day-1-culture/)
- [Cloud
Governance](https://aws.amazon.com/cloudops/cloud-governance/)
- [Management
& Governance Cloud Environment](https://docs.aws.amazon.com/wellarchitected/latest/management-and-governance-guide/management-and-governance-cloud-environment-guide.html?did=wp_card&trk=wp_card)
- [Governance
in the Cloud and in the Digital Age: Parts One &
Two](https://aws.amazon.com/blogs/enterprise-strategy/governance-in-the-cloud-and-in-the-digital-age-part-one/)

**Related videos:**

- [Podcast
| Jeff Bezos | On how to make decisions](https://www.youtube.com/watch?v=VFwCGECvq4I)

**Related examples:**

- [Make
informed decisions using data (The DevOps Sagas)](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/oa.bcl.10-make-informed-decisions-using-data.html)
- [Using
development value stream mapping to identify constraints to
DevOps outcomes](https://docs.aws.amazon.com/prescriptive-guidance/latest/strategy-devops-value-stream-mapping/introduction.html)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_priorities_eval_tradeoffs.html*

---
