# SEC 11 — How do you incorporate and validate the security properties of applications?

**Pillar**: Security  
**Best Practices**: 8

---

# SEC11-BP01 Train for application security

Provide training to your team on secure development and operation
practices, which helps them build secure and high-quality software.
This practice helps your team to prevent, detect, and remediate
security issues earlier in the development lifecycle. Consider
training that covers threat modeling, secure coding practices, and
using services for secure configurations and operations. Provide
your team access to training through self-service resources, and
regularly gather their feedback for continuous improvement.

**Desired outcome:** You equip your
team with the knowledge and skills necessary to design and build
software with security in mind from the outset. Through training on
threat modeling and secure development practices, your team has a
deep understanding of potential security risks and how to mitigate
them during the software development lifecycle (SDLC). This
proactive approach to security is part of your team's culture, and
you become able to identify and remediate potential security issues
early on. As a result, your team delivers high-quality, secure
software and features more efficiently, which accelerates the
overall delivery timeline. You have a collaborative and inclusive
security culture within your organization, where the ownership of
security is shared across all builders.

**Common anti-patterns:**

- You wait until a security review, and then consider the security
properties of a system.
- You leave all security decisions to a central security team.
- You don't communicate how the decisions taken in the SDLC relate
to the overall security expectations or policies of the
organization.
- You perform the security review process too late.

**Benefits of establishing this best
practice:**

- Better knowledge of the organizational requirements for security
early in the development cycle.
- Being able to identify and remediate potential security issues
faster, resulting in a quicker delivery of features.
- Improved quality of software and systems.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

To build secure and high-quality software, provide training to
your team on common practices for secure development and operation
of applications. This practice can help your team prevent, detect,
and remediate security issues earlier in the development
lifecycle, which can accelerate your delivery timeline.

To achieve this practice, consider training your team on threat
modeling using AWS resources like the
[Threat
Modeling Workshop](https://catalog.workshops.aws/threatmodel/en-US). Threat modeling can help your team
understand potential security risks and design systems with
security in mind from the outset. Additionally, you can provide
access to
[AWS Training and Certification](https://www.aws.training/LearningLibrary?filters=Language%3A1%20Domain%3A27), industry, or AWS Partner
training on secure development practices. For more detail on a
comprehensive approach to designing, developing, securing, and
efficiently operating at scale, see
[AWS DevOps Guidance](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/devops-guidance.html).

Clearly define and communicate your organization's security review
process, and outline the responsibilities of your team, the
security team, and other stakeholders. Publish self-service
guidance, code examples, and templates that demonstrate how to
meet your security requirements. You can use AWS services like
[AWS CloudFormation](https://aws.amazon.com/cloudformation/),
[AWS Cloud Development Kit (AWS CDK) (AWS CDK) Constructs](https://docs.aws.amazon.com/cdk/v2/guide/constructs.html), and
[Service Catalog](https://aws.amazon.com/servicecatalog/) to provide pre-approved, secure
configurations and reduce the need for custom setups.

Regularly gather feedback from your team on their experience with
the security review process and training, and use this feedback to
continuously improve. Conduct game days or bug bash campaigns to
identify and address security issues while simultaneously
enhancing your team's skills.

### Implementation steps

- **Identify training needs**:
Assess the current skill level and knowledge gaps within
your team regarding secure development practices through
surveys, code reviews, or discussions with team members.
- **Plan the training**: Based
on the identified needs, create a training plan that covers
relevant topics such as threat modeling, secure coding
practices, security testing, and secure deployment
practices. Employ resources like the
[Threat
Modeling Workshop](https://catalog.workshops.aws/threatmodel/en-US),
[AWS Training and Certification](https://www.aws.training/LearningLibrary?filters=Language%3A1%20Domain%3A27), and industry or AWS
Partner training programs.
- **Schedule and deliver
training**: Schedule regular training sessions or
workshops for your team. These can be instructor-led or
self-paced, depending on your team's preferences and
availability. Encourage hands-on exercises and practical
examples to reinforce the learning.
- **Define a security review
process**: Collaborate with your security team and
other stakeholders to clearly define the security review
process for your applications. Document the responsibilities
of each team or individual involved in the process,
including your development team, security team, and other
relevant stakeholders.
- **Create self-service
resources**: Develop self-service guidance, code
examples, and templates that demonstrate how to meet your
organization's security requirements. Consider AWS services
like
[CloudFormation](https://aws.amazon.com/cloudformation/),
[AWS CDK Constructs](https://docs.aws.amazon.com/cdk/v2/guide/constructs.html), and
[Service
Catalog](https://aws.amazon.com/servicecatalog/) to provide pre-approved, secure
configurations and reduce the need for custom setups.
- **Communicate and
socialize**: Effectively communicate the security
review process and the available self-service resources to
your team. Conduct training sessions or workshops to
familiarize them with these resources, and verify that they
understand how to use them.
- **Gather feedback and
improve**: Regularly collect feedback from your
team on their experience with the security review process
and training. Use this feedback to identify areas for
improvement and continuously refine the training materials,
self-service resources, and the security review process.
- **Conduct security
exercises**: Organize game days or bug bash
campaigns to identify and address security issues within
your applications. These exercises not only help uncover
potential vulnerabilities but also serve as practical
learning opportunities for your team that enhance their
skills in secure development and operation.
- **Continue to learn and
improve:** Encourage your team to stay up to date
with the latest secure development practices, tools, and
techniques. Regularly review and update your training
materials and resources to reflect the evolving security
landscape and best practices.

## Resources

**Related best practices:**

- [SEC11-BP08 Build a program that embeds security ownership in workload teams](./sec_appsec_build_program_that_embeds_security_ownership_in_teams.html)

**Related documents:**

- [AWS Training and Certification](https://www.aws.training/LearningLibrary?query=&filters=Language%3A1%20Domain%3A27&from=0&size=15&sort=_score&trk=el_a134p000007C9OtAAK&trkCampaign=GLBL-FY21-TRAINCERT-800-Security&sc_channel=el&sc_campaign=GLBL-FY21-TRAINCERT-800-Security-Blog&sc_outcome=Training_and_Certification&sc_geo=mult)
- [How
to think about cloud security governance](https://aws.amazon.com/blogs/security/how-to-think-about-cloud-security-governance/)
- [How
to approach threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/)
- [Accelerating
training – The AWS Skills Guild](https://docs.aws.amazon.com/whitepapers/latest/public-sector-cloud-transformation/accelerating-training-the-aws-skills-guild.html)
- [AWS DevOps Sagas](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/the-devops-sagas.html)

**Related videos:**

- [Proactive
security: Considerations and approaches](https://www.youtube.com/watch?v=CBrUE6Qwfag)

**Related examples:**

- [Workshop
on threat modeling](https://catalog.workshops.aws/threatmodel)
- [Industry
awareness for developers](https://owasp.org/www-project-top-ten/)

**Related services:**

- [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
- [AWS Cloud Development Kit (AWS CDK) (AWS CDK) Constructs](https://docs.aws.amazon.com/cdk/v2/guide/constructs.html)
- [Service Catalog](https://aws.amazon.com/servicecatalog/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_train_for_application_security.html*

---

# SEC11-BP02 Automate testing throughout the development and release lifecycle

Automate the testing for security properties throughout the
development and release lifecycle. Automation makes it easier to
consistently and repeatably identify potential issues in software
prior to release, which reduces the risk of security issues in the
software being provided.

**Desired outcome:** The goal of automated testing is to
provide a programmatic way of detecting potential issues early and often throughout the
development lifecycle. When you automate regression testing, you can rerun functional and
non-functional tests to verify that previously tested software still performs as expected after
a change. When you define security unit tests to check for common misconfigurations, such as
broken or missing authentication, you can identify and fix these issues early in the development
process.

Test automation uses purpose-built test cases for application
validation, based on the application’s requirements and desired
functionality. The result of the automated testing is based on
comparing the generated test output to its respective expected
output, which expedites the overall testing lifecycle. Testing
methodologies such as regression testing and unit test suites are
best suited for automation. Automating the testing of security
properties allows builders to receive automated feedback without
having to wait for a security review. Automated tests in the form
of static or dynamic code analysis can increase code quality and
help detect potential software issues early in the development
lifecycle.

**Common anti-patterns:**

- Not communicating the test cases and test results of the
automated testing.
- Performing the automated testing only immediately prior to a
release.
- Automating test cases with frequently changing requirements.
- Failing to provide guidance on how to address the results of
security tests.

**Benefits of establishing this best practice:**

- Reduced dependency on people evaluating the security
properties of systems.
- Having consistent findings across multiple workstreams
improves consistency.
- Reduced likelihood of introducing security issues into
production software.
- Shorter window of time between detection and remediation due
to catching software issues earlier.
- Increased visibility of systemic or repeated behavior across
multiple workstreams, which can be used to drive
organization-wide improvements.

**Level of risk exposed if this best practice is not established:**Medium

## Implementation guidance

As you build your software, adopt various mechanisms for software testing to ensure that
you are testing your application for both functional requirements, based on your application’s
business logic, and non-functional requirements, which are focused on application reliability,
performance, and security.

Static application security testing (SAST) analyzes your source code for anomalous security patterns,
and provides indications for defect prone code. SAST relies on static inputs, such as
documentation (requirements specification, design documentation, and design specifications)
and application source code to test for a range of known security issues. Static code
analyzers can help expedite the analysis of large volumes of code.
The [NIST Quality Group](https://www.nist.gov/itl/ssd/software-quality-group)
provides a comparison of [Source Code Security Analyzers](https://www.nist.gov/itl/ssd/software-quality-group/source-code-security-analyzers),
which includes open source tools for [Byte Code Scanners](https://samate.nist.gov/index.php/Byte_Code_Scanners.html) and [Binary Code Scanners](https://samate.nist.gov/index.php/Binary_Code_Scanners.html).

Complement your static testing with dynamic
analysis security testing (DAST) methodologies, which performs
tests against the running application to identify potentially
unexpected behavior. Dynamic testing can be used to detect
potential issues that are not detectable via static analysis.
Testing at the code repository, build, and pipeline stages allows
you to check for different types of potential issues from entering
into your code.
[Amazon Q Developers](https://aws.amazon.com/q/developer/) provides code recommendations, including
security scanning, in the builder's IDE.
[Amazon CodeGuru Security](https://aws.amazon.com/codeguru/) can identify critical issues, security
issues, and hard-to-find bugs during application development, and
provides recommendations to improve code quality. Extracting
Software Bill of Materials (SBOM) also allows you to extract a
formal record containing the details and relationships of the
various components used in building your software. This allows you
to inform vulnerability management, and quickly identify software
or component dependencies and supply chain risks.

The
[Security
for Developers workshop](https://catalog.workshops.aws/sec4devs) uses AWS developer tools, such as
[AWS CodeBuild](https://aws.amazon.com/codebuild/),
[AWS CodeCommit](https://aws.amazon.com/codecommit/), and
[AWS CodePipeline](https://aws.amazon.com/codepipeline/), for release pipeline automation that
includes SAST and DAST testing methodologies.

As you progress through your SDLC, establish an iterative
process that includes periodic application reviews with your
security team. Feedback gathered from these security reviews
should be addressed and validated as part of your release
readiness review. These reviews establish a robust application
security posture, and provide builders with actionable feedback
to address potential issues.

### Implementation steps

- Implement consistent IDE, code review, and CI/CD tools that
include security testing.
- Consider where in the SDLC it is appropriate to block
pipelines instead of just notifying builders that issues
need to be remediated.
- [Automated
Security Helper (ASH)](https://github.com/awslabs/automated-security-helper) is an example for open-source
code security scanning tool.
- Performing testing or code analysis using automated tools,
such as
[Amazon Q Developer](https://aws.amazon.com/q/developer/) integrated with developer IDEs, and
[Amazon CodeGuru Security](https://aws.amazon.com/codeguru/) for scanning code on commit, helps
builders get feedback at the right time.
- When building using AWS Lambda, you can use
[Amazon Inspector](https://docs.aws.amazon.com/inspector/latest/user/scanning-lambda.html) to scan the application code in your
functions.
- When automated testing is included in CI/CD pipelines, you
should use a ticketing system to track the notification and
remediation of software issues.
- For security tests that might generate findings, linking to
guidance for remediation helps builders improve code
quality.
- Regularly analyze the findings from automated tools to
prioritize the next automation, builder training, or
awareness campaign.
- To extract SBOM as part of your CI/CD pipelines, use
[Amazon Inspector SBOM Generator](https://docs.aws.amazon.com/inspector/latest/user/sbom-generator.html) to produce SBOMs for
archives, container images, directories, local systems, and
compiled Go and Rust binaries in the CycloneDX SBOM format.

## Resources

**Related best practices:**

- [DevOps
Guidance: DL.CR.3 Establish clear completion criteria for code
tasks](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/dl.cr.3-establish-clear-completion-criteria-for-code-tasks.html)

**Related documents:**

- [Continuous
Delivery and Continuous Deployment](https://aws.amazon.com/devops/continuous-delivery/)

- [AWS DevOps Competency Partners](https://aws.amazon.com/devops/partner-solutions/?blog-posts-cards.sort-by=item.additionalFields.createdDate&blog-posts-cards.sort-order=desc&partner-solutions-cards.sort-by=item.additionalFields.partnerNameLower&partner-solutions-cards.sort-order=asc&awsf.partner-solutions-filter-partner-type=partner-type%23technology&awsf.Filter%20Name%3A%20partner-solutions-filter-partner-location=*all&awsf.partner-solutions-filter-partner-location=*all&partner-case-studies-cards.sort-by=item.additionalFields.sortDate&partner-case-studies-cards.sort-order=desc&awsm.page-partner-solutions-cards=1)
- [AWS Security Competency Partners for Application Security](https://aws.amazon.com/security/partner-solutions/?blog-posts-cards.sort-by=item.additionalFields.createdDate&blog-posts-cards.sort-order=desc&partner-solutions-cards.sort-by=item.additionalFields.partnerNameLower&partner-solutions-cards.sort-order=asc&awsf.partner-solutions-filter-partner-type=*all&awsf.Filter%20Name%3A%20partner-solutions-filter-partner-categories=use-case%23app-security&awsf.partner-solutions-filter-partner-location=*all&partner-case-studies-cards.sort-by=item.additionalFields.sortDate&partner-case-studies-cards.sort-order=desc&events-master-partner-webinars.sort-by=item.additionalFields.startDateTime&events-master-partner-webinars.sort-order=asc)
- [Choosing
a Well-Architected CI/CD approach](https://aws.amazon.com/blogs/devops/choosing-well-architected-ci-cd-open-source-software-aws-services/)
- [Secrets
detection in Amazon CodeGuru Security](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/recommendations.html#secrets-detection)
- [Amazon CodeGuru Security Detection Library](https://docs.aws.amazon.com/codeguru/detector-library/)
- [Accelerate
deployments on AWS with effective governance](https://aws.amazon.com/blogs/architecture/accelerate-deployments-on-aws-with-effective-governance/)
- [How
AWS approaches automating safe, hands-off
deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)
- [How
Amazon CodeGuru Security helps you effectively balance
security and velocity](https://aws.amazon.com/blogs/security/how_amazon_codeguru_security_helps_effectively_balance_security_and_velocity/)

**Related videos:**

- [Hands-off:
Automating continuous delivery pipelines at Amazon](https://www.youtube.com/watch?v=ngnMj1zbMPY)
- [Automating
cross-account CI/CD pipelines](https://www.youtube.com/watch?v=AF-pSRSGNks)
- [The
Software Development Prcess at Amazon](https://www.youtube.com/watch?t=1340&v=52SC80SFPOw&feature=youtu.be)
- [Testing
software and systems at Amazon](https://www.youtube.com/watch?v=o1sc3cK9bMU&t)

**Related examples:**

- [Industry
awareness for developers](https://owasp.org/www-project-top-ten/)
- [Automated
Security Helper (ASH)](https://github.com/awslabs/automated-security-helper)
- [AWS CodePipeline Governance - Github](https://github.com/awslabs/aws-codepipeline-governance)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_automate_testing_throughout_lifecycle.html*

---

# SEC11-BP03 Perform regular penetration testing

Perform regular penetration testing of your software. This
mechanism helps identify potential software issues that cannot be
detected by automated testing or a manual code review. It can also
help you understand the efficacy of your detective controls.
Penetration testing should try to determine if the software can be
made to perform in unexpected ways, such as exposing data that
should be protected, or granting broader permissions than
expected.

**Desired outcome:** Penetration testing is used to detect,
remediate, and validate your application’s security properties. Regular and scheduled
penetration testing should be performed as part of the software development lifecycle (SDLC).
The findings from penetration tests should be addressed prior to the software being released.
You should analyze the findings from penetration tests to identify if there are issues that
could be found using automation. Having a regular and repeatable penetration testing process
that includes an active feedback mechanism helps inform the guidance to builders and improves
software quality.

**Common anti-patterns:**

- Only penetration testing for known or prevalent security
issues.
- Penetration testing applications without dependent third-party
tools and libraries.
- Only penetration testing for package security issues, and not
evaluating implemented business logic.

**Benefits of establishing this best practice:**

- Increased confidence in the security properties of the
software prior to release.
- Opportunity to identify preferred application patterns, which
leads to greater software quality.
- A feedback loop that identifies earlier in the development
cycle where automation or additional training can improve the
security properties of software.

**Level of risk exposed if this best practice is not established:**High

## Implementation guidance

Penetration testing is a structured security testing exercise
where you run planned security breach scenarios to detect,
remediate, and validate security controls. Penetration tests start
with reconnaissance, during which data is gathered based on the
current design of the application and its dependencies. A curated
list of security-specific testing scenarios are built and run. The
key purpose of these tests is to uncover security issues in your
application, which could be exploited for gaining unintended
access to your environment, or unauthorized access to data. You
should perform penetration testing when you launch new features,
or whenever your application has undergone major changes in
function or technical implementation.

You should identify the most appropriate stage in the development
lifecycle to perform penetration testing. This testing should
happen late enough that the functionality of the system is close
to the intended release state, but with enough time remaining for
any issues to be remediated.

### Implementation steps

- Have a structured process for how penetration testing is
scoped, basing this process on the
[threat
model](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/) is a good way of maintaining context.
- Identify the appropriate place in the development cycle to
perform penetration testing. This should be when there is
minimal change expected in the application, but with enough
time to perform remediation.
- Train your builders on what to expect from penetration
testing findings, and how to get information on remediation.
- Use tools to speed up the penetration testing process by
automating common or repeatable tests.
- Analyze penetration testing findings to identify systemic
security issues, and use this data to inform additional
automated testing and ongoing builder education.

## Resources

**Related best practices:**

- [SEC11-BP01 Train for application security](./sec_appsec_train_for_application_security.html)
- [SEC11-BP02 Automate testing throughout the development and release lifecycle](./sec_appsec_automate_testing_throughout_lifecycle.html)

**Related documents:**

- [AWS Penetration Testing](https://aws.amazon.com/security/penetration-testing/) provides detailed guidance for
penetration testing on AWS
- [Accelerate
deployments on AWS with effective governance](https://aws.amazon.com/blogs/architecture/accelerate-deployments-on-aws-with-effective-governance/)
- [AWS Security Competency Partners](https://aws.amazon.com/security/partner-solutions/?blog-posts-cards.sort-by=item.additionalFields.createdDate&blog-posts-cards.sort-order=desc&partner-solutions-cards.sort-by=item.additionalFields.partnerNameLower&partner-solutions-cards.sort-order=asc&awsf.partner-solutions-filter-partner-type=*all&awsf.Filter%20Name%3A%20partner-solutions-filter-partner-categories=*all&awsf.partner-solutions-filter-partner-location=*all&partner-case-studies-cards.sort-by=item.additionalFields.sortDate&partner-case-studies-cards.sort-order=desc&events-master-partner-webinars.sort-by=item.additionalFields.startDateTime&events-master-partner-webinars.sort-order=asc)
- [Modernize
your penetration testing architecture on AWS Fargate](https://aws.amazon.com/blogs/architecture/modernize-your-penetration-testing-architecture-on-aws-fargate/)
- [AWS Fault
injection Simulator](https://aws.amazon.com/fis/)

**Related examples:**

- [Automate API testing with AWS CodePipeline](https://github.com/aws-samples/aws-codepipeline-codebuild-with-postman) (GitHub)
- [Automated security
helper](https://github.com/aws-samples/automated-security-helper) (GitHub)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_perform_regular_penetration_testing.html*

---

# SEC11-BP04 Conduct code reviews

Implement code reviews to help verify the quality and security of
software being developed. Code reviews involve having team members
other than the original code author review the code for potential
issues, vulnerabilities, and adherence to coding standards and best
practices. This process helps catch errors, inconsistencies, and
security flaws that might have been overlooked by the original
developer. Use automated tools to assist with code reviews.

**Desired outcome:** You include code
reviews during development to increase the quality of the software
being written. You upskill less experienced members of the team
through learnings identified during the code review. You identify
opportunities for automation and support the code review process
using automated tools and testing.

**Common anti-patterns:**

- You don't review code before deployment.
- The same person writes and reviews the code.
- You don't use automation and tools to assist or orchestrate code
reviews.
- You don't train builders on application security before they
review code.

**Benefits of establishing this best practice:**

- Increased code quality.
- Increased consistency of code development through reuse of
common approaches.
- Reduction in the number of issues discovered during
penetration testing and later stages.
- Improved knowledge transfer within the team.

**Level of risk exposed if this best practice is not established:**
Medium

## Implementation guidance

Code reviews help to verify the quality and security of the
software during development. Manual reviews involve having a team
member other than the original code author review the code for
potential issues, vulnerabilities, and adherence to coding
standards and best practices. This process helps catch errors,
inconsistencies, and security flaws that might have been
overlooked by the original developer.

Consider [Amazon CodeGuru Security](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html)
to help conduct automated code reviews. CodeGuru Security uses
machine learning and automated reasoning to analyze your code and
identify potential security vulnerabilities and coding issues.
Integrate automated code reviews with your existing code
repositories and continuous integration/continuous deployment
(CI/CD) pipelines.

### Implementation steps

- **Establish a code review
process:**

Define when code reviews should occur, such as before
merging code into the main branch or before deploying to
production.
- Determine who should be involved in the code review
process, such as team members, senior developers, and
security experts.
- Decide on the code review methodology, including the
process and tools to be used.

- **Set up code review tools:**

Evaluate and select code review tools that fit your
team's needs, such as GitHub Pull Requests or CodeGuru
Security
- Integrate the chosen tools with your existing code
repositories and CI/CD pipelines.
- Configure the tools to enforce code review requirements,
such as the minimum number of reviewers and approval
rules.

- **Define a code review checklist and
guidelines:**

Create a code review checklist or guidelines that
outline what should be reviewed. Consider factors such
as code quality, security vulnerabilities, adherence to
coding standards, and performance.
- Share the checklist or guidelines with the development
team, and verify everyone understands the expectations.

- **Train developers on code review best
practices:**

Provide training to your team on how to conduct
effective code reviews.
- Educate your team on application security principles and
common vulnerabilities to look for during reviews.
- Encourage knowledge sharing and pair programming
sessions to upskill less experienced team members.

- **Implement the code review
process:**

Integrate the code review step into your development
workflow, such as creating a pull request and assigning
reviewers.
- Require that code changes undergo a code review before
merge or deployment.
- Encourage open communication and constructive feedback
during the review process.

- **Monitor and improve:**

Regularly review the effectiveness of your code review
process and gather feedback from the team.
- Identify opportunities for automation or tool
improvements to streamline the code review process.
- Continuously update and refine the code review checklist
or guidelines based on learnings and industry best
practices.

- **Foster a culture of code
review:**

Emphasize the importance of code reviews to maintain
code quality and security.
- Celebrate successes and learnings from the code review
process.
- Encourage a collaborative and supportive environment
where developers feel comfortable giving and receiving
feedback.

## Resources

**Related best practices:**

- [SEC11-BP02 Automate testing throughout the development and release lifecycle](./sec_appsec_automate_testing_throughout_lifecycle.html)

**Related documents:**

- [DevOps
Guidance: DL.CR.2 Perform peer review for code changes](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/dl.cr.2-perform-peer-review-for-code-changes.html)
- [About
pull requests in GitHub](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)

**Related examples:**

- [Automate
code reviews with Amazon CodeGuru Security](https://aws.amazon.com/blogs/devops/automate-code-reviews-with-amazon-codeguru-reviewer/)
- [Automating
detection of security vulnerabilities and bugs in CI/CD pipelines
using Amazon CodeGuru Security CLI](https://aws.amazon.com/blogs/devops/automating-detection-of-security-vulnerabilities-and-bugs-in-ci-cd-pipelines-using-amazon-codeguru-reviewer-cli/)

**Related videos:**

- [Continuous
improvement of code quality with Amazon CodeGuru
Security](https://www.youtube.com/watch?v=iX1i35H1OVw)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_manual_code_reviews.html*

---

# SEC11-BP05 Centralize services for packages and dependencies

Provide centralized services for your teams to obtain software
packages and other dependencies. This allows the validation of
packages before they are included in the software that you write and
provides a source of data for the analysis of the software being
used in your organization.

**Desired outcome:** You build your
workload from external software packages in addition to the code
that you write. This makes it simpler for you to implement
functionality that is repeatedly used, such as a JSON parser or an
encryption library. You centralize the sources for these packages
and dependencies so your security team can validate them before they
are used. You use this approach in conjunction with the manual and
automated testing flows to increase the confidence in the quality of
the software that you develop.

**Common anti-patterns:**

- You pull packages from arbitrary repositories on the internet.
- You don't test new packages before you make them available to
builders.

**Benefits of establishing this best practice:**

- Better understanding of what packages are being used in the
software being built.
- Being able to notify workload teams when a package needs to be
updated based on the understanding of who is using what.
- Reducing the risk of a package with issues being included in
your software.

**Level of risk exposed if this best practice is not established:**Medium

## Implementation guidance

Provide centralized services for packages and dependencies in a
way that is simple for builders to consume. Centralized services
can be logically central rather than implemented as a monolithic
system. This approach allows you to provide services in a way that
meets the needs of your builders. You should implement an
efficient way of adding packages to the repository when updates
happen or new requirements emerge. AWS services such as
[AWS CodeArtifact](https://aws.amazon.com/codeartifact/) or similar AWS partner solutions provide a way
of delivering this capability.

### Implementation steps

- Implement a logically centralized repository service that
is available in all of the environments where software is
developed.
- Include access to the repository as part of the AWS account
vending process.
- Build automation to test packages before they are published
in a repository.
- Maintain metrics of the most commonly used packages,
languages, and teams with the highest amount of change.
- Provide an automated mechanism for builder teams to request
new packages and provide feedback.
- Regularly scan packages in your repository to identify the
potential impact of newly discovered issues.

## Resources

**Related best practices:**

- [SEC11-BP02 Automate testing throughout the development and release lifecycle](./sec_appsec_automate_testing_throughout_lifecycle.html)

**Related documents:**

- [DevOps Guidance: DL.CS.2 Sign code artifacts after each build](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/dl.cs.2-sign-code-artifacts-after-each-build.html)
- [Supply chain Levels for Software Artifacts (SLSA)](https://slsa.dev/)

**Related examples:**

- [Accelerate
deployments on AWS with effective governance](https://aws.amazon.com/blogs/architecture/accelerate-deployments-on-aws-with-effective-governance/)
- [Tighten
your package security with CodeArtifact Package Origin Control
toolkit](https://aws.amazon.com/blogs/devops/tighten-your-package-security-with-codeartifact-package-origin-control-toolkit/)
- [Multi
Region Package Publishing Pipeline](https://github.com/aws-samples/multi-region-python-package-publishing-pipeline) (GitHub)
- [Publishing
Node.js Modules on AWS CodeArtifact using AWS CodePipeline](https://github.com/aws-samples/aws-codepipeline-publish-nodejs-modules) (GitHub)
- [AWS CDK Java CodeArtifact Pipeline Sample](https://github.com/aws-samples/aws-cdk-codeartifact-pipeline-sample) (GitHub)
- [Distribute
private .NET NuGet packages with AWS CodeArtifact](https://github.com/aws-samples/aws-codeartifact-nuget-dotnet-pipelines)
(GitHub)

**Related videos:**

- [Proactive
security: Considerations and approaches](https://www.youtube.com/watch?v=CBrUE6Qwfag)
- [The
AWS Philosophy of Security (re:Invent 2017)](https://www.youtube.com/watch?v=KJiCfPXOW-U)
- [When
security, safety, and urgency all matter: Handling
Log4Shell](https://www.youtube.com/watch?v=pkPkm7W6rGg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_centralize_services_for_packages_and_dependencies.html*

---

# SEC11-BP06 Deploy software programmatically

Perform software deployments programmatically where possible.
This approach reduces the likelihood that a deployment fails or an
unexpected issue is introduced due to human error.

**Desired outcome:** The version of
your workload that you test is the version that you deploy, and the
deployment is performed consistently every time. You externalize the
configuration of your workload, which helps you deploy to different
environments without changes. You employ cryptographic signing of
your software packages to verify that nothing changes between
environments.

**Common anti-patterns:**

- Manually deploying software into production.
- Manually performing changes to software to cater to different
environments.

**Benefits of establishing this best practice:**

- Increased confidence in the software release process.
- Reduced risk of a failed change impacting business
functionality.
- Increased release cadence due to lower change risk.
- Automatic rollback capability for unexpected events during
deployment.
- Ability to cryptographically prove that the software that was
tested is the software deployed.

**Level of risk exposed if this best practice is not established:**
High

## Implementation guidance

To maintain a robust and reliable application infrastructure,
implement secure and automated deployment practices. This practice
involves removing persistent human access from production
environments, using CI/CD tools for deployments, and externalizing
environment-specific configuration data. By following this
approach, you can enhance security, reduce the risk of human
errors, and streamline the deployment process.

You can build your AWS account structure to remove persistent
human access from production environments. This practice minimizes
the risk of unauthorized changes or accidental modifications,
which improves the integrity of your production systems. Instead
of direct human access, you can use CI/CD tools like
[AWS CodeBuild](https://aws.amazon.com/codebuild/) and
[AWS CodePipeline](https://aws.amazon.com/codepipeline/) to perform deployments. You can use these
services to automate the build, test, and deployment processes,
which reduces manual intervention and increases consistency.

To further enhance security and traceability, you can sign your
application packages after they have been tested and validate
these signatures during deployment. To do so, use cryptographic
tools such as
[AWS Signer](https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html) or
[AWS Key Management Service (AWS KMS)](https://aws.amazon.com/kms/). By signing and verifying packages, you
can make sure that you deploy only authorized and validated code
to your environments.

Additionally, your team can architect your workload to obtain
environment-specific configuration data from an external source,
such as
[AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html). This practice separates
the application code from the configuration data, which helps you
manage and update configurations independently without modifying
the application code itself.

To streamline infrastructure provisioning and management, consider
using infrastructure as code (IaC) tools like
[AWS CloudFormation](https://aws.amazon.com/cloudformation/) or
[AWS CDK](https://aws.amazon.com/cdk/). You
can use these tools to define your infrastructure as code, which
improves the consistency and repeatability of deployments across
different environments.

Consider canary deployments to validate the successful deployment
of your software. Canary deployments involve rolling out changes
to a subset of instances or users before deploying to the entire
production environment. You can then monitor the impact of changes
and roll back if necessary, which minimizes the risk of widespread
issues.

Follow the recommendations outlined in the
[Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html) whitepaper.
This whitepaper provides guidance on separating environments (such
as development, staging, and production) into distinct AWS accounts, which further enhances security and isolation.

### Implementation steps

- **Set up AWS account
structure**:

Follow the guidance in the
[Organizing
Your AWS Environment Using Multiple Accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.html)
whitepaper to create separate AWS accounts for different
environments (for exampoe, development, staging, and
production).
- Configure appropriate access controls and permissions
for each account to restrict direct human access to
production environments.

- **Implement a CI/CD
pipeline**:

Set up a CI/CD pipeline using services like
[AWS CodeBuild](https://aws.amazon.com/codebuild/) and
[AWS CodePipeline](https://aws.amazon.com/codepipeline/).
- Configure the pipeline to automatically build, test, and
deploy your application code to the respective
environments.
- Integrate code repositories with the CI/CD pipeline for
version control and code management.

- **Sign and verify application
packages**:

Use
[AWS Signer](https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html) or
[AWS Key Management Service (AWS KMS)](https://aws.amazon.com/kms/) to sign your
application packages after they have been tested and
validated.
- Configure the deployment process to verify the
signatures of the application packages before you deploy
them to the target environments.

- **Externalize configuration
data**:

Store environment-specific configuration data in
[AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html).
- Modify your application code to retrieve configuration
data from the Parameter Store during deployment or
runtime.

- **Implement infrastructure as code
(IaC)**:

Use IaC tools like
[AWS CloudFormation](https://aws.amazon.com/cloudformation/) or
[AWS CDK](https://aws.amazon.com/cdk/) to define and manage your infrastructure as
code.
- Create CloudFormation templates or CDK scripts to
provision and configure the necessary AWS resources for
your application.
- Integrate IaC with your CI/CD pipeline to automatically
deploy infrastructure changes alongside application code
changes.

- **Implement canary
deployments**:

Configure your deployment process to support canary
deployments, where changes are rolled out to a subset of
instances or users before you deploy them to the entire
production environment.
- Use services like
[AWS CodeDeploy](https://aws.amazon.com/codedeploy/) or
[AWS ECS](https://aws.amazon.com/ecs/) to manage canary deployments and monitor the
impact of changes.
- Implement rollback mechanisms to revert to the previous
stable version if issues are detected during the canary
deployment.

- **Monitor and audit**:

Set up monitoring and logging mechanisms to track
deployments, application performance, and infrastructure
changes.
- Use services like
[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and
[AWS CloudTrail](https://aws.amazon.com/cloudtrail/) to collect and analyze logs and
metrics.
- Implement auditing and compliance checks to verify
adherence to security best practices and regulatory
requirements.

- **Continuously improve:**

Regularly review and update your deployment practices,
and incorporate feedback and lessons learned from
previous deployments.
- Automate as much of the deployment process as possible
to reduce manual intervention and potential human
errors.
- Collaborate with cross-functional teams (for example,
operations or security) to align and continuously
improve deployment practices.

By following these steps, you can implement secure and automated
deployment practices in your AWS environment, which enhances
security, reduces the risk of human errors, and streamlines the
deployment process.

## Resources

**Related best practices:**

- [SEC11-BP02 Automate testing throughout the development and release lifecycle](./sec_appsec_automate_testing_throughout_lifecycle.html)
- [DL.CI.2
Trigger builds automatically upon source code
modifications](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/dl.ci.2-trigger-builds-automatically-upon-source-code-modifications.html)

**Related documents:**

- [Accelerate
deployments on AWS with effective governance](https://aws.amazon.com/blogs/architecture/accelerate-deployments-on-aws-with-effective-governance/)
- [Automating
safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)
- [Code
signing using AWS Certificate Manager Private CA and AWS Key Management Service asymmetric keys](https://aws.amazon.com/blogs/security/code-signing-aws-certificate-manager-private-ca-aws-key-management-service-asymmetric-keys/)
- [Code
Signing, a Trust and Integrity Control for AWS Lambda](https://aws.amazon.com/blogs/aws/new-code-signing-a-trust-and-integrity-control-for-aws-lambda/)

**Related videos:**

- [Hands-off:
Automating continuous delivery pipelines at
Amazon](https://www.youtube.com/watch?v=ngnMj1zbMPY)

**Related examples:**

- [Blue/Green
deployments with AWS Fargate](https://catalog.us-east-1.prod.workshops.aws/workshops/954a35ee-c878-4c22-93ce-b30b25918d89/en-US)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_deploy_software_programmatically.html*

---

# SEC11-BP07 Regularly assess security properties of the pipelines

Apply the principles of the Well-Architected Security Pillar to
your pipelines, with particular attention to the separation of
permissions. Regularly assess the security properties of your
pipeline infrastructure. Effectively managing the security
*of* the pipelines allows you to deliver the
security of the software that passes *through*
the pipelines.

**Desired outcome:** The pipelines
you use to build and deploy your software follow the same
recommended practices as any other workload in your environment. The
tests that you implement in your pipelines are not editable by the
teams who use them. You give the pipelines only the permissions
needed for the deployments they are doing using temporary
credentials. You implement safeguards to prevent pipelines from
deploying to the wrong environments. You configure your pipelines to
emit state so that the integrity of your build environments can be
validated.

**Common anti-patterns:**

- Security tests that can be bypassed by builders.
- Overly broad permissions for deployment pipelines.
- Pipelines not being configured to validate inputs.
- Not regularly reviewing the permissions associated with your
CI/CD infrastructure.
- Use of long-term or hardcoded credentials.

**Benefits of establishing this best practice:**

- Greater confidence in the integrity of the software that is
built and deployed through the pipelines.
- Ability to stop a deployment when there is suspicious
activity.

**Level of risk exposed if this best practice is not
established:** High

## Implementation guidance

Your deployment pipelines are a critical component of your
software development lifecycle and should follow the same security
principles and practices as any other workload in your
environment. This includes implementing proper access controls,
validating inputs, and regularly reviewing and auditing the
permissions associated with your CI/CD infrastructure.

Verify that the teams responsible for building and deploying
applications do not have the ability to edit or bypass the
security tests and checks implemented in your pipelines. This
separation of concerns helps maintain the integrity of your build
and deployment processes.

As a starting point, consider employing the
[AWS Deployment Pipelines Reference Architecture](https://aws.amazon.com/blogs/aws/new_deployment_pipelines_reference_architecture_and_-reference_implementations/). This reference
architecture provides a secure and scalable foundation for
building your CI/CD pipelines on AWS.

Additionally, you can use services like
[AWS Identity and Access Management Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html) to generate least-privilege IAM
policies for both your pipeline permissions and as a step in your
pipeline to verify workload permissions. This helps verify that
your pipelines and workloads have only the necessary permissions
required for their specific functions, which reduces the risk of
unauthorized access or actions.

### Implementation steps

- Start with the
[AWS Deployment Pipelines Reference Architecture](https://aws.amazon.com/blogs/aws/new_deployment_pipelines_reference_architecture_and_-reference_implementations/).
- Consider using
[AWS IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html) to programmatically generate
least privilege IAM policies for the pipelines.
- Integrate your pipelines with monitoring and alerting so
that you are notified of unexpected or abnormal activity,
for AWS managed services
[Amazon EventBridge](https://aws.amazon.com/eventbridge/) allows you to route data to targets such
as [AWS Lambda](https://aws.amazon.com/lambda/) or
[Amazon Simple Notification Service](https://aws.amazon.com/sns/) (Amazon SNS).

## Resources

**Related documents:**

- [AWS Deployment Pipelines Reference Architecture](https://aws.amazon.com/blogs/aws/new_deployment_pipelines_reference_architecture_and_-reference_implementations/)
- [Monitoring
AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/monitoring.html)
- [Security
best practices for AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/security-best-practices.html)

**Related examples:**

- [DevOps
monitoring dashboard](https://github.com/aws-solutions/aws-devops-monitoring-dashboard) (GitHub)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_regularly_assess_security_properties_of_pipelines.html*

---

# SEC11-BP08 Build a program that embeds security ownership in workload teams

Build a program or mechanism that empowers builder teams to
make security decisions about the software that they create. Your
security team still needs to validate these decisions during a
review, but embedding security ownership in builder teams allows for
faster, more secure workloads to be built. This mechanism also
promotes a culture of ownership that positively impacts the
operation of the systems you build.

**Desired outcome:** You have
embedded security ownership and decision-making in your teams. You
have either trained your teams on how to think about security or
have augmented their team with embedded or associated security
people. Your teams make higher-quality security decisions earlier in
the development cycle as a result.

**Common anti-patterns:**

- Leaving all security design decisions to a security team.
- Not addressing security requirements early enough in the
development process.
- Not obtaining feedback from builders and security people on
the operation of the program.

**Benefits of establishing this best practice:**

- Reduced time to complete security reviews.
- Reduction in security issues that are only detected at the
security review stage.
- Improvement in the overall quality of the software being
written.
- Opportunity to identify and understand systemic issues or
areas of high value improvement.
- Reduction in the amount of rework required due to security
review findings.
- Improvement in the perception of the security function.

**Level of risk exposed if this best practice is not established:**
Low

## Implementation guidance

Start with the guidance in [SEC11-BP01 Train for application security](./sec_appsec_train_for_application_security.html).
Then identify the operational model for the program that
you think might work best for your organization. The two main
patterns are to train builders or to embed security people in
builder teams. After you have decided on the initial approach, you
should pilot with a single or small group of workload teams to
prove the model works for your organization. Leadership support
from the builder and security parts of the organization helps with
the delivery and success of the program. As you build this
program, it’s important to choose metrics that can be used to show
the value of the program. Learning from how AWS has approached
this problem is a good learning experience. This best practice is
very much focused on organizational change and culture. The tools
that you use should support the collaboration between the builder
and security communities.

### Implementation steps

- Start by training your builders for application security.
- Create a community and an onboarding program to educate
builders.
- Pick a name for the program. Guardians, Champions, or
Advocates are commonly used.
- Identify the model to use: train builders, embed security
engineers, or have affinity security roles.
- Identify project sponsors from security, builders, and
potentially other relevant groups.
- Track metrics for the number of people involved in the
program, the time taken for reviews, and the feedback from
builders and security people. Use these metrics to make
improvements.

## Resources

**Related best practices:**

- [SEC11-BP01 Train for application security](./sec_appsec_train_for_application_security.html)
- [SEC11-BP02 Automate testing throughout the development and release lifecycle](./sec_appsec_automate_testing_throughout_lifecycle.html)

**Related documents:**

- [How
to approach threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/)
- [How
to think about cloud security governance](https://aws.amazon.com/blogs/security/how-to-think-about-cloud-security-governance/)
- [How
AWS built the Security Guardians program, a mechanism to
distribute security ownership](https://aws.amazon.com/blogs/security/how-aws-built-the-security-guardians-program-a-mechanism-to-distribute-security-ownership/)
- [How to build a Security Guardians program to distribute security ownership](https://aws.amazon.com/blogs/security/how-to-build-your-own-security-guardians-program/)

**Related videos:**

- [Proactive
security: Considerations and approaches](https://www.youtube.com/watch?v=CBrUE6Qwfag)
- [AppSec
tooling and culture tips from AWS and Toyota Motor North
America](https://www.youtube.com/watch?v=aznmbzgj6Mg)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_appsec_build_program_that_embeds_security_ownership_in_teams.html*

---
