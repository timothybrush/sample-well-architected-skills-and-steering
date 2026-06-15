# Indicators for security testing

**Pages**: 3

---

# [QA.ST.1] Evolve vulnerability management processes to be conducive of DevOps practices

**Category:** FOUNDATIONAL

Vulnerability management requires an ongoing, iterative process consistent with agile
development practices. The goal is to discover potential vulnerabilities across networks,
infrastructures, and applications, and to prioritize and take action on them.

Automated vulnerability scanning must be integrated into deployment pipelines to
provide feedback to developers regarding security vulnerabilities and improvements early on.
This minimizes extensive security evaluations during deployment and is consistent with the
DevOps *shift left* approach—addressing security problems early on in the
development process. Choose vulnerability scanning tools that are compatible with your
existing technology and platforms. For instance, if [Amazon CodeCatalyst](https://aws.amazon.com/codecatalyst/) is your pipeline tool of choice, verify that the
chosen vulnerability scanning tool has a CodeCatalyst plugin or API integration capability. If
vulnerabilities are detected during a build, the pipeline should automatically generate
alerts, allowing developers to address issues quickly.

If you use issue-tracking systems like Jira or [CodeCatalyst Issues](https://docs.aws.amazon.com/codecatalyst/latest/userguide/issues.html), it can be
beneficial to automatically generate tickets to assist developers with tracking issues. When
a vulnerability is detected, an automated ticket should be generated, tagged with severity,
and assigned to the appropriate developer or team. Use vulnerability management dashboards
to consistently monitor and analyze threats. Regular reports should detail vulnerability
trends, ensuring vulnerabilities are not reintroduced and pinpointing recurrent security
challenges.

To effectively practice vulnerability management in a DevOps environment, it's
important to adopt a culture where security is everyone's responsibility. Development and
security teams need collaboration, with clear delineations for security issue handoff and
ownership. In a DevOps model, distributed development teams take on security
responsibilities for their products. Centralized security teams often become enabling teams,
offering training, insights, and support. They can also take on the responsibilities of a
security platform team, producing reusable components, improving efficiency, reducing
duplication of work, and overall providing autonomy to distributed teams so that they can
efficiently secure their products.

**Related information:**

- [Enterprise
DevOps: Why You Should Run What You Build](https://aws.amazon.com/blogs/enterprise-strategy/enterprise-devops-why-you-should-run-what-you-build/)
- [Automated
Software Vulnerability Management - Amazon Inspector](https://aws.amazon.com/inspector/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/qa.st.1-evolve-vulnerability-management-processes-to-be-conducive-of-devops-practices.html*

---

# [QA.ST.3] Use application risk assessments for secure software design

**Category:** FOUNDATIONAL

Application risk assessments integrate security considerations
directly into the software development lifecycle. At the
earliest stages of the development lifecycle, design reviews
focus on the planned architecture, features, and flow of the
application. During these reviews, security experts should
assist with making design choices to prevent introducing weak
points that could introduce vulnerabilities. The primary goal
is to make security-centric design decisions, eliminating
vulnerabilities before they're developed.

After the design phase, threat modeling dives deeper into
potential security threats that the finalized design might
face. This results in a list of possible attack vectors,
identifying how an attacker might exploit vulnerabilities. An
inverse approach to threat modeling is attack modeling, which
identifies specific attacks or vulnerabilities and examines
how they can be exploited. Both methods offer insights into
possible vulnerabilities and guide developing protective
measures.

Once vulnerabilities are identified through design reviews and
potential threats through modeling, these insights should
directly inform the software's security requirements. As
applications evolve or as new threats emerge, periodically
revisit and update both functional and non-functional
requirements. Functional requirements involves measures like
input validation, session management, or error handling.
Non-functional requirements includes making changes that
impact to performance, scalability, and reliability under
security threats.

Translate identified risks into actionable user stories that detail potential abuse
or misuse scenarios. Add these stories into the backlog for the team to address during
development. Attach a test case to each story to validate its effective resolution,
establishing a clear *definition of done* for developers to adhere to.

**Related information:**

- [Threat
Composer](https://awslabs.github.io/threat-composer)
- [Threat
modeling for builders](https://catalog.workshops.aws/threatmodel/)
- [AWS Security Maturity Model - Threat Modeling](https://maturitymodel.security.aws.dev/en/3.-efficient/threat-modeling/)
- [How
to approach threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/qa.st.3-use-application-risk-assessments-for-secure-software-design.html*

---

# [QA.ST.6] Validate third-party components using software composition analysis

**Category:** FOUNDATIONAL

The use of open-source software and third-party components accelerates the software
development process, but it also introduces new security and compliance risks. Software
Composition Analysis (SCA) is used to assess these risks and verify that
external dependencies being used do not have known vulnerabilities. SCA works by scanning
software component inventories, such as software bill of materials [software bill of materials](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/software-bill-of-materials-sbom.html) (SBOM) and dependency manifest files.

When selecting a SCA tool, focus on tools that provide the most comprehensive
vulnerability database, pulling from sources such as the [National Vulnerability Database](https://nvd.nist.gov/) (NVD) and [Common Vulnerabilities and Exposures](https://www.cve.org/) (CVE). The tool will need to integrate with
your existing toolsets, frameworks, and pipelines, as well as provide both detection and
remediation guidance for vulnerabilities. These feedback mechanisms enable teams to detect
and mitigate vulnerabilities, maintaining the software's integrity without impacting
development velocity.

Integrate SCA into the continuous integration pipeline to automatically scan changes
for vulnerabilities. Use SCA to scan existing repositories periodically to verify that
existing codebases maintain the same security standards as newer developments. Centrally
storing SBOMs also offers unique advantages for assessing vulnerabilities at scale. While
scanning repositories and pipelines can capture vulnerabilities in active projects,
centralized SBOMs act as a consistent, versioned record of all software components used
across various projects and versions. It provides a holistic view of all dependencies across
different projects, making it easier to manage and mitigate risks at an organizational
level. Instead of scanning every repository individually, centralized scanning of SBOMs
offers a consolidated method to assessing and remediating vulnerabilities.

**Related information:**

- [Security
in every stage of the CI/CD pipeline: SCA](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/security-in-every-stage-of-cicd-pipeline.html#software-composition-analysis-sca)
- [Building
end-to-end AWS DevSecOps CI/CD pipeline with open source
SCA, SAST and DAST tools](https://aws.amazon.com/blogs/devops/building-end-to-end-aws-devsecops-ci-cd-pipeline-with-open-source-sca-sast-and-dast-tools/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/qa.st.6-validate-third-party-components-using-software-composition-analysis.html*

---
