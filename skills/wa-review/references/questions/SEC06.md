# SEC 6 — How do you protect your compute resources?

**Pillar**: Security  
**Best Practices**: 5

---

# SEC06-BP01 Perform vulnerability management

Frequently scan and patch for vulnerabilities in your code, dependencies, and in your infrastructure to help protect against new threats.

**Desired outcome:** You have a
solution that continually scans your workload for software
vulnerabilities, potential defects, and unintended network exposure.
You have established processes and procedures to identify,
prioritize, and remediate these vulnerabilities based on risk
assessment criteria. Additionally, you have implemented automated
patch management for your compute instances. Your vulnerability
management program is integrated into your software development
lifecycle, with solutions to scan your source code during the CI/CD
pipeline.

**Common anti-patterns:**

- Not having a vulnerability management program.
- Performing system patching without considering severity or risk avoidance.
- Using software that has passed its vendor-provided end of life (EOL) date.
- Deploying code into production before analyzing it for security issues.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

Vulnerability management is a key aspect of maintaining a secure
and robust cloud environment. It involves a comprehensive process
that includes security scans, identification and prioritization of
issues, and patch operations to resolve the identified
vulnerabilities. Automation plays a pivotal role in this process
because it facilitates continuous scanning of workloads for
potential issues and unintended network exposure, as well as
remediation efforts.

The
[AWS Shared Responsibility Model](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/shared-responsibility.html) is a fundamental concept that
underpins vulnerability management. According to this model, AWS
is responsible for securing the underlying infrastructure,
including hardware, software, networking, and facilities that run
AWS services. Conversely, you are responsible for securing your
data, security configurations, and management tasks associated
with services like Amazon EC2 instances and Amazon S3 objects.

AWS offers a range of services to support vulnerability management
programs.
[Amazon Inspector](https://aws.amazon.com/inspector/) continuously scans AWS workloads for software
vulnerabilities and unintended network access, while
[AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager.html) helps manage patching across
Amazon EC2 instances. These services can be integrated with
[AWS Security Hub CSPM](https://aws.amazon.com/security-hub/), a cloud security posture management service
that automates AWS security checks, centralizes security alerts,
and provides a comprehensive view of an organization's security
posture. Furthermore,
[Amazon CodeGuru Security](https://aws.amazon.com/codeguru/) uses static code analysis to identify
potential issues in Java and Python applications during the
development phase.

By incorporating vulnerability management practices into the
software development lifecycle, you can proactively address
vulnerabilities before they are introduced into production
environments, which reduces the risk of security events and
minimizes the potential impact of vulnerabilities.

### Implementation steps

- **Understand the shared responsibility
model:** Review the AWS shared responsibility model
to understand your responsibilities for securing your
workloads and data in the cloud. AWS is responsible for
securing the underlying cloud infrastructure, while you are
responsible for securing your applications, data, and the
services you use.
- **Implement vulnerability
scanning**: Configure a vulnerability scanning
service, such as Amazon Inspector, to automatically scan
your compute instances (for example, virtual machines,
containers, or serverless functions) for software
vulnerabilities, potential defects, and unintended network
exposure.
- **Establish vulnerability management
processes:** Define processes and procedures to
identify, prioritize, and remediate vulnerabilities. This
may include the setup of regular vulnerability scanning
schedules, establishment of risk assessment criteria, and
definition of remediation timelines based on vulnerability
severity.
- **Set up patch management:**
Use a patch management service to automate the process of
patching your compute instances, both for operating systems
and applications. You can configure the service to scan
instances for missing patches and automatically install them
on a schedule. Consider AWS Systems Manager Patch Manager to
provide this functionality.
- **Configure malware
protection:** Implement mechanisms to detect
malicious software in your environment. For example, you can
use tools like
[Amazon GuardDuty](https://aws.amazon.com/guardduty/) to analyze, detect, and alert of malware in
EC2 and EBS volumes. GuardDuty can also scan newly uploaded
objects to Amazon S3 for potential malware or viruses and
take action to isolate them before they are ingested into
downstream processes.
- **Integrate vulnerability scanning in
CI/CD pipelines:** If you're using a CI/CD pipeline
for your application deployment, integrate vulnerability
scanning tools into your pipeline. Tools like Amazon CodeGuru Security and open-source options can scan your
source code, dependencies, and artifacts for potential
security issues.
- **Configure a security monitoring
service:** Set up a security monitoring service,
such as AWS Security Hub CSPM, to get a comprehensive view of
your security posture across multiple cloud services. The
service should collect security findings from various
sources and present them in a standardized format for easier
prioritization and remediation.
- **Implement web application
penetration testing**: If your application is a web
application, and your organization has the necessary skills
or can hire outside assistance, consider implementing web
application penetration testing to identify potential
vulnerabilities in your application.
- **Automate with infrastructure as
code**: Use infrastructure as code (IaC) tools,
such as
[AWS CloudFormation](https://aws.amazon.com/cloudformation/), to automate the deployment and
configuration of your resources, including the security
services mentioned previously. This practice helps you
create a more consistent and standardized resource
architecture across multiple accounts and environments.
- **Monitor and continually
improve**: Continually monitor your vulnerability
management program's effectiveness, and make improvements as
needed. Review security findings, assess the effectiveness
of your remediation efforts, and adjust your processes and
tools accordingly.

## Resources

**Related documents:**

- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)
- [Security
Overview of AWS Lambda](https://pages.awscloud.com/rs/112-TZM-766/images/Overview-AWS-Lambda-Security.pdf)
- [Amazon CodeGuru](https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html)
- [Improved, Automated Vulnerability Management for Cloud Workloads with a New Amazon Inspector](https://aws.amazon.com/blogs/aws/improved-automated-vulnerability-management-for-cloud-workloads-with-a-new-amazon-inspector/)
- [Automate vulnerability management and remediation in AWS using Amazon Inspector and AWS Systems Manager – Part 1](https://aws.amazon.com/blogs/mt/automate-vulnerability-management-and-remediation-in-aws-using-amazon-inspector-and-aws-systems-manager-part-1/)

**Related videos:**

- [Securing
Serverless and Container Services](https://youtu.be/kmSdyN9qiXY)
- [Security best
practices for the Amazon EC2 instance metadata service](https://youtu.be/2B5bhZzayjI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_compute_vulnerability_management.html*

---

# SEC06-BP02 Provision compute from hardened images

Provide fewer opportunities for unintended access to your runtime
environments by deploying them from hardened images. Only acquire
runtime dependencies, such as container images and application
libraries, from trusted registries and verify their signatures.
Create your own private registries to store trusted images and
libraries for use in your build and deploy processes.

**Desired outcome:** Your compute
resources are provisioned from hardened baseline images. You
retrieve external dependencies, such as container images and
application libraries, only from trusted registries and verify their
signatures. These are stored in private registries for your build
and deployment processes to reference. You scan and update images
and dependencies regularly to help protect against any newly
discovered vulnerabilities.

**Common anti-patterns:**

- Acquiring images and libraries from trusted registries, but not
verifying their signature or performing vulnerability scans
before putting into use.
- Hardening images, but not regularly testing them for new
vulnerabilities or updating to the latest version.
- Installing or not removing software packages that are not
required during the expected lifecycle of the image.
- Relying solely on patching to keep production compute resources
up to date. Patching alone can still cause compute resources to
drift from the hardened standard over time. Patching can also
fail to remove malware that may have been installed by a threat
actor during a security event.

**Benefits of establishing this best
practice:** Hardening images helps reduce the number of
paths available in your runtime environment that can allow
unintended access to unauthorized users or services. It also can
reduce the scope of impact should any unintended access occur.

**Level of risk exposed if this best practice
is not established:** High

## Implementation guidance

To harden your systems, start from the latest versions of
operating systems, container images, and application libraries.
Apply patches to known issues. Minimize the system by removing any
unneeded applications, services, device drivers, default users,
and other credentials. Take any other needed actions, such as
disabling ports to create an environment that has only the
resources and capabilities needed by your workloads. From this
baseline, you can then install software, agents, or other
processes you need for purposes such as workload monitoring or
vulnerability management.

You can reduce the burden of hardening systems by using guidance
that trusted sources provide, such as the
[Center for Internet
Security](https://www.cisecurity.org/) (CIS) and the Defense Information Systems Agency
(DISA) [Security
Technical Implementation Guides (STIGs)](https://public.cyber.mil/stigs/). We recommend you
start with an
[Amazon
Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) (AMI) published by AWS or an APN partner, and
use the AWS [EC2 Image Builder](https://aws.amazon.com/image-builder/) to automate configuration according to an
appropriate combination of CIS and STIG controls.

While there are available hardened images and EC2 Image Builder
recipes that apply the CIS or DISA STIG recommendations, you may
find their configuration prevents your software from running
successfully. In this situation, you can start from a non-hardened
base image, install your software, and then incrementally apply
CIS controls to test their impact. For any CIS control that
prevents your software from running, test if you can implement the
finer-grained hardening recommendations in a DISA instead. Keep
track of the different CIS controls and DISA STIG configurations
you are able to apply successfully. Use these to define your image
hardening recipes in EC2 Image Builder accordingly.

For containerized workloads, hardened images from Docker are
available on the
[Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/)
[public
repository](https://gallery.ecr.aws/docker). You can use EC2 Image Builder to harden
container images alongside AMIs.

Similar to operating systems and container images, you can obtain
code packages (or *libraries*) from public
repositories, through tooling such as pip, npm, Maven, and NuGet.
We recommend you manage code packages by integrating private
repositories, such as within
[AWS CodeArtifact](https://aws.amazon.com/codeartifact/), with trusted public repositories. This
integration can handle retrieving, storing, and keeping packages
up-to-date for you. Your application build processes can then
obtain and test the latest version of these packages alongside
your application, using techniques like Software Composition
Analysis (SCA), Static Application Security Testing (SAST), and
Dynamic Application Security Testing (DAST).

For serverless workloads that use AWS Lambda, simplify managing
package dependencies using
[Lambda
layers.](https://docs.aws.amazon.com/lambda/latest/dg/chapter-layers.html) Use Lambda layers to configure a set of standard
dependencies that are shared across different functions into a
standalone archive. You can create and maintain layers through
their own build process, providing a central way for your
functions to stay up-to-date.

## Implementation steps

- Harden operating systems. Use base images from trusted sources
as a foundation for building your hardened AMIs. Use
[EC2 Image Builder](https://aws.amazon.com/image-builder/) to help customize the software installed
on your images.
- Harden containerized resources. Configure containerized
resources to meet security best practices. When using
containers, implement
[ECR
Image Scanning](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html) in your build pipeline and on a regular
basis against your image repository to look for CVEs in your
containers.
- When using serverless implementation with AWS Lambda, use
[Lambda
layers](https://docs.aws.amazon.com/lambda/latest/dg/chapter-layers.html) to segregate application function code and
shared dependent libraries. Configure
[code
signing](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html) for Lambda to make sure that only trusted code
runs in your Lambda functions.

## Resources

**Related best practices:**

- [OPS05-BP05
Perform patch management](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops_dev_integ_patch_mgmt.html)

**Related videos:**

- [Deep
dive into AWS Lambda security](https://www.youtube.com/watch?v=FTwsMYXWGB0)

**Related examples:**

- [Quickly
build STIG-compliant AMI using EC2 Image Builder](https://aws.amazon.com/blogs/security/quickly-build-stig-compliant-amazon-machine-images-using-amazon-ec2-image-builder/)
- [Building
better container images](https://aws.amazon.com/blogs/containers/building-better-container-images/)
- [Using
Lambda layers to simplify your development process](https://aws.amazon.com/blogs/compute/using-lambda-layers-to-simplify-your-development-process/)
- [Develop
& Deploy AWS Lambda Layers using Serverless
Framework](https://github.com/aws-samples/aws-serverless-lambda-layers)
- [Building
end-to-end AWS DevSecOps CI/CD pipeline with open source SCA,
SAST and DAST tools](https://aws.amazon.com/blogs/devops/building-end-to-end-aws-devsecops-ci-cd-pipeline-with-open-source-sca-sast-and-dast-tools/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_compute_hardened_images.html*

---

# SEC06-BP03 Reduce manual management and interactive access

Use automation to perform deployment, configuration, maintenance,
and investigative tasks wherever possible. Consider manual access to
compute resources in cases of emergency procedures or in safe
(sandbox) environments, when automation is not available.

**Desired outcome:** Programmatic
scripts and automation documents (runbooks) capture authorized
actions on your compute resources. These runbooks are initiated
either automatically, through change detection systems, or
manually, when human judgment is required. Direct access to compute
resources is only made available in emergency situations when
automation is not available. All manual activities are logged and
incorporated into a review process to continually improve your
automation capabilities.

**Common anti-patterns:**

- Interactive access to Amazon EC2 instances with protocols such
as SSH or RDP.
- Maintaining individual user logins such as `/etc/passwd` or
Windows local users.
- Sharing a password or private key to access an instance among
multiple users.
- Manually installing software and creating or updating
configuration files.
- Manually updating or patching software.
- Logging into an instance to troubleshoot problems.

**Benefits of establishing this best
practice:** Performing actions with automation helps you to
reduce the operational risk of unintended changes and
misconfigurations. Removing the use of Secure Shell (SSH) and Remote
Desktop Protocol (RDP) for interactive access reduces the scope of
access to your compute resources. This takes away a common path for
unauthorized actions. Capturing your compute resource management
tasks in automation documents and programmatic scripts provides a
mechanism to define and audit the full scope of authorized
activities at a fine-grained level of detail.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Logging into an instance is a classic approach to system
administration. After installing the server operating system,
users would typically log in manually to configure the system and
install the desired software. During the server's lifetime, users
might log in to perform software updates, apply patches, change
configurations, and troubleshoot problems.

Manual access poses a number of risks, however. It requires a
server that listens for requests, such as an SSH or RDP service,
that can provide a potential path to unauthorized access. It also
increases the risk of human error associated with performing
manual steps. These can result in workload incidents, data
corruption or destruction, or other security issues. Human access
also requires protections against the sharing of credentials,
creating additional management overhead.

To mitigate these risks, you can implement an agent-based remote
access solution, such as
[AWS Systems Manager](https://aws.amazon.com/systems-manager/). AWS Systems Manager Agent (SSM Agent) initiates an encrypted
channel and thus does not rely on listening for
externally-initiated requests. Consider configuring SSM Agent to
[establish
this channel over a VPC endpoint](https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-create-vpc.html).

Systems Manager gives you fine-grained control over how you can interact with
your managed instances. You define the automations to run, who can
run them, and when they can run. Systems Manager can apply patches, install
software, and make configuration changes without interactive
access to the instance. Systems Manager can also provide access to a remote
shell and log every command invoked, and its output, during the
session to logs and
[Amazon S3](https://aws.amazon.com/s3/).
[AWS CloudTrail](https://aws.amazon.com/cloudtrail/) records invocations of Systems Manager APIs for inspection.

### Implementation steps

- [Install
AWS Systems Manager Agent](https://docs.aws.amazon.com/systems-manager/latest/userguide/manually-install-ssm-agent-linux.html) (SSM Agent) on your Amazon EC2 instances. Check to see if SSM Agent is included and
started automatically as part of your base AMI
configuration.
- Verify that the IAM Roles associated with your EC2 instance
profiles include the `AmazonSSMManagedInstanceCore`
[managed
IAM policy](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonSSMManagedInstanceCore.html).
- Disable SSH, RDP, and other remote access services running
on your instances. You can do this by running scripts
configured in the user data section of your launch
templates or by building customized AMIs with tools such as
EC2 Image Builder.
- Verify that the security group ingress rules applicable to
your EC2 instances do not permit access on port 22/tcp (SSH)
or port 3389/tcp (RDP). Implement detection and alerting on
misconfigured security groups using services such as AWS Config.
- Define appropriate automations, runbooks, and run commands
in Systems Manager. Use IAM policies to define who can perform these
actions and the conditions under which they are permitted.
Test these automations thoroughly in a non-production
environment. Invoke these automations when necessary,
instead of interactively accessing the instance.
- Use
[AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html) to provide
interactive access to instances when necessary. Turn on
session activity logging to maintain an audit trail in
[Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html) or [Amazon S3](https://aws.amazon.com/s3/).

## Resources

**Related best practices:**

- [REL08-BP04
Deploy using immutable infrastructure](https://docs.aws.amazon.com/wellarchitected/latest/framework/rel_tracking_change_management_immutable_infrastructure.html)

**Related examples:**

- [Replacing
SSH access to reduce management and security overhead with AWS Systems Manager](https://aws.amazon.com/blogs/mt/vr-beneficios-session-manager/)

**Related tools:**

- [AWS Systems Manager](https://aws.amazon.com/systems-manager/)

**Related videos:**

- [Controlling
User Session Access to Instances in AWS Systems Manager Session
Manager](https://www.youtube.com/watch?v=nzjTIjFLiow)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_compute_reduce_manual_management.html*

---

# SEC06-BP04 Validate software integrity

Use cryptographic verification to validate the integrity of software
artifacts (including images) your workload uses.  Cryptographically
sign your software as a safeguard against unauthorized changes run
within your compute environments.

**Desired outcome:** All artifacts
are obtained from trusted sources. Vendor website certificates are
validated.  Downloaded artifacts are cryptographically verified by
their signatures. Your own software is cryptographically signed and
verified by your computing environments.

**Common anti-patterns:**

- Trusting reputable vendor websites to obtain software artifacts,
but ignoring certificate expiration notices.  Proceeding with
downloads without confirming certificates are valid.
- Validating vendor website certificates, but not
cryptographically verifying downloaded artifacts from these
websites.
- Relying solely on digests or hashes to validate software
integrity.  Hashes establish that artifacts have not been
modified from the original version, but do not validate their
source.
- Not signing your own software, code, or libraries, even when
only used in your own deployments.

**Benefits of establishing this best
practice:** Validating the integrity of artifacts that your
workload depends on helps prevent malware from entering your compute
environments.  Signing your software helps safeguard against
unauthorized running in your compute environments.   Secure your
software supply chain by signing and verifying code.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

Operating system images, container images, and code artifacts are
often distributed with integrity checks available, such as through
a digest or hash.  These allow clients to verify integrity by
computing their own hash of the payload and validating it is the
same as the one published.  While these checks help verify that
the payload has not been tampered with, they do not validate the
payload came from the original source (its
*provenance*).  Verifying provenance requires a
certificate that a trusted authority issues to digitally sign the
artifact.

If you are using a downloaded software or artifacts in your
workload, check if the provider provides a public key for digital
signature verification.  Here are some examples of how AWS
provides a public key and verification instructions for software
we publish:

- [EC2 Image Builder: Verify the signature of the AWSTOE installation
download](https://docs.aws.amazon.com/imagebuilder/latest/userguide/awstoe-verify-sig.html)
- [AWS Systems Manager: Verifying the signature of SSM Agent](https://docs.aws.amazon.com/systems-manager/latest/userguide/verify-agent-signature.html)
- [Amazon CloudWatch: Verifying the signature of the CloudWatch agent
package](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/verify-CloudWatch-Agent-Package-Signature.html)

Incorporate digital signature verification into the processes you
use for obtaining and hardening images, as discussed in
[SEC06-BP02 Provision compute from
hardened images](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_hardened_images.html).

You can use
[AWS Signer](https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html) to help manage the verification of signatures, as
well as your own code-signing lifecycle for your own software and
artifacts.  Both
[AWS Lambda](https://aws.amazon.com/lambda/) and
[Amazon Elastic Container Registry](https://aws.amazon.com/ecr/) provide integrations with Signer
to verify the signatures of your code and images.  Using the
examples in the Resources section, you can incorporate Signer into
your continuous integration and delivery (CI/CD) pipelines to
automate verification of signatures and the signing of your own
code and images.

## Resources

**Related documents:**

- [Cryptographic
Signing for Containers](https://aws.amazon.com/blogs/containers/cryptographic-signing-for-containers/)
- [Best
Practices to help secure your container image build pipeline
by using AWS Signer](https://aws.amazon.com/blogs/security/best-practices-to-help-secure-your-container-image-build-pipeline-by-using-aws-signer/)
- [Announcing
Container Image Signing with AWS Signer and Amazon EKS](https://aws.amazon.com/blogs/containers/announcing-container-image-signing-with-aws-signer-and-amazon-eks/)
- [Configuring
code signing for AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html)
- [Best
practices and advanced patterns for Lambda code signing](https://aws.amazon.com/blogs/security/best-practices-and-advanced-patterns-for-lambda-code-signing/)
- [Code
signing using AWS Certificate Manager Private CA and AWS Key Management Service asymmetric keys](https://aws.amazon.com/blogs/security/code-signing-aws-certificate-manager-private-ca-aws-key-management-service-asymmetric-keys/)

**Related examples:**

- [Automate
Lambda code signing with Amazon CodeCatalyst and AWS Signer](https://aws.amazon.com/blogs/devops/automate-lambda-code-signing-with-amazon-codecatalyst-and-aws-signer/)
- [Signing
and Validating OCI Artifacts with AWS Signer](https://aws.amazon.com/blogs/containers/signing-and-validating-oci-artifacts-with-aws-signer/)

**Related tools:**

- [AWS Lambda](https://aws.amazon.com/lambda/)
- [AWS Signer](https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html)
- [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/)
- [AWS Key Management Service](https://aws.amazon.com/kms/)
- [AWS CodeArtifact](https://aws.amazon.com/codeartifact/)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_compute_validate_software_integrity.html*

---

# SEC06-BP05 Automate compute protection

Automate compute protection operations to reduce the need for human
intervention. Use automated scanning to detect potential issues
within your compute resources, and remediate with automated
programmatic responses or fleet management operations.  Incorporate
automation in your CI/CD processes to deploy trustworthy workloads
with up-to-date dependencies.

**Desired outcome:** Automated
systems perform all scanning and patching of compute resources. You
use automated verification to check that software images and
dependencies come from trusted sources, and have not been tampered
with. Workloads are automatically checked for up-to-date
dependencies, and are signed to establish trustworthiness in AWS
compute environments.  Automated remediations are initiated when
non-compliant resources are detected.

**Common anti-patterns:**

- Following the practice of immutable infrastructure, but not
having a solution in place for emergency patching or replacement
of production systems.
- Using automation to fix misconfigured resources, but not having
a manual override mechanism in place.  Situations may arise
where you need to adjust the requirements, and you may need to
suspend automations until you make these changes.

**Benefits of establishing this best
practice:** Automation can reduce the risk of unauthorized
access and use of your compute resources.  It helps to prevent
misconfigurations from making their way into production
environments, and detecting and fixing misconfigurations should they
occur.  Automation also helps to detect unauthorized access and use
of compute resources to reduce your time to respond.  This in turn
can reduce the overall scope of impact from the issue.

**Level of risk exposed if this best practice
is not established:** Medium

## Implementation guidance

You can apply the automations described in the Security Pillar
practices for protecting your compute resources.
[SEC06-BP01 Perform vulnerability
management](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_vulnerability_management.html) describes how you can use
[Amazon Inspector](https://aws.amazon.com/inspector/) in both your CI/CD pipelines and for continually
scanning your runtime environments for known Common
Vulnerabilities and Exposures (CVEs).  You can use
[AWS Systems Manager](https://aws.amazon.com/systems-manager/) to apply patches or redeploy from fresh
images through automated runbooks to keep your compute fleet
updated with the latest software and libraries.  Use these
techniques to reduce the need for manual processes and interactive
access to your compute resources.  See
[SEC06-BP03 Reduce manual
management and interactive access](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_reduce_manual_management.html) to learn more.

Automation also plays a role in deploying workloads that are
trustworthy, described in
[SEC06-BP02 Provision compute from
hardened images](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_hardened_images.html) and
[SEC06-BP04 Validate software
integrity](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_protect_compute_validate_software_integrity.html).  You can use services such as
[EC2 Image Builder](https://aws.amazon.com/image-builder/),
[AWS Signer](https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html),
[AWS CodeArtifact](https://aws.amazon.com/codeartifact/), and
[Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/) to download, verify, construct,
and store hardened and approved images and code dependencies.
Alongside Inspector, each of these can play a role in your CI/CD
process so your workload makes its way to production only when it
is confirmed that its dependencies are up-to-date and from trusted
sources.  Your workload is also signed so AWS compute
environments, such as
[AWS Lambda](https://aws.amazon.com/lambda/) and
[Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/) can verify it hasn't been tampered
with before allowing it to run.

Beyond these preventative controls, you can use automation in your
detective controls for your compute resources as well.  As one
example,
[AWS Security Hub CSPM](https://aws.amazon.com/security-hub/) offers the
[NIST
800-53 Rev. 5](https://docs.aws.amazon.com/securityhub/latest/userguide/nist-standard.html) standard that includes checks such
as [[EC2.8]
EC2 instances should use Instance Metadata Service Version 2
(IMDSv2)](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-8).  IMDSv2 uses the techniques of session
authentication, blocking requests that contain an
X-Forwarded-For HTTP header, and a network TTL
of 1 to stop traffic originating from external sources to retrieve
information about the EC2 instance. This check in Security Hub CSPM can
detect when EC2 instances use IMDSv1 and initiate automated
remediation. Learn more about automated detection and remediations
in [SEC04-BP04
Initiate remediation for non-compliant resources](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_detect_investigate_events_noncompliant_resources.html).

### Implementation steps

- Automate creating secure, compliant and hardened AMIs with
[EC2 Image Builder](https://docs.aws.amazon.com/imagebuilder/latest/userguide/integ-compliance-products.html).  You can produce images that incorporate
controls from the Center for Internet Security (CIS)
Benchmarks or Security Technical Implementation Guide (STIG)
standards from base AWS and APN partner images.
- Automate configuration management. Enforce and validate secure
configurations in your compute resources automatically by
using a configuration management service or tool.

Automated configuration management
using [AWS Config](https://aws.amazon.com/config/)
- Automated security and compliance posture management
using [AWS Security Hub CSPM](https://aws.amazon.com/security-hub/)

- Automate patching or replacing Amazon Elastic Compute Cloud
(Amazon EC2) instances. AWS Systems Manager Patch Manager
automates the process of patching managed instances with both
security-related and other types of updates. You can use Patch
Manager to apply patches for both operating systems and
applications.

[AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html)

- Automate scanning of compute resources for common
vulnerabilities and exposures (CVEs), and embed security
scanning solutions within your build pipeline.

[Amazon Inspector](https://aws.amazon.com/inspector/)
- [ECR
Image Scanning](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html)

- Consider Amazon GuardDuty for automatic malware and threat
detection to protect compute resources. GuardDuty can also
identify potential issues when an
[AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html) function gets invoked in your AWS environment.

[Amazon GuardDuty](https://aws.amazon.com/guardduty/)

- Consider AWS Partner solutions. AWS Partners offer
industry-leading products that are equivalent, identical to,
or integrate with existing controls in your on-premises
environments. These products complement the existing AWS
services to allow you to deploy a comprehensive security
architecture and a more seamless experience across your cloud
and on-premises environments.

[Infrastructure
security](https://aws.amazon.com/security/partner-solutions/#infrastructure_security)

## Resources

**Related best practices:**

- [SEC01-BP06
Automate deployment of standard security controls](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_securely_operate_automate_security_controls.html)

**Related documents:**

- [Get
the full benefits of IMDSv2 and disable IMDSv1 across your AWS
infrastructure](https://aws.amazon.com/blogs/security/get-the-full-benefits-of-imdsv2-and-disable-imdsv1-across-your-aws-infrastructure/)

**Related videos:**

- [Security best
practices for the Amazon EC2 instance metadata service](https://youtu.be/2B5bhZzayjI)

*Source: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/sec_protect_compute_auto_protection.html*

---
