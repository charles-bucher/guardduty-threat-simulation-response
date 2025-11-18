AWS GuardDuty Automation with Terraform
Automated Security Threat Detection | Infrastructure-as-Code | CI/CD Pipeline
Automated AWS GuardDuty deployment using Terraform for repeatable, auditable security monitoring. Built to demonstrate CloudOps security automation skills through Infrastructure-as-Code and CI/CD best practices.
Show Image
Show Image
Show Image
Show Image
📝 License: MIT
👤 Author: Charles Bucher | Portfolio

🎯 What This Project Does
Automates AWS GuardDuty deployment using Terraform, creating a fully operational security monitoring setup in AWS.
What You Get:

✅ GuardDuty fully enabled across your AWS account(s)
✅ Automated security findings notifications
✅ Repeatable, auditable Infrastructure-as-Code deployment
✅ GitHub Actions CI/CD pipeline for automated testing and deployment
✅ Visual documentation with screenshots and GIFs

This repo is portfolio-ready, showing end-to-end CloudOps and security automation skills.

🔑 Key Features
Infrastructure as Code

Terraform automates the entire GuardDuty setup
Version-controlled configuration files (main.tf, variables.tf, outputs.tf)
Repeatable deployments across multiple AWS accounts
Auditable infrastructure changes

Security Monitoring

GuardDuty enabled for threat detection (compromised credentials, crypto mining, unauthorized access)
Ready to detect real-time security threats
Extensible for SNS notifications, Lambda integrations, or custom monitoring rules

CI/CD Pipeline

GitHub Actions workflow for automated Terraform deployment
Automated terraform plan and terraform apply on code changes
Safe deployment practices with plan review

Visual Documentation

Screenshots and GIFs showing deployment workflow
Step-by-step visual walkthrough for recruiters and hiring managers
Professional presentation for portfolio use


📋 Prerequisites
Before deploying this project, you'll need:

AWS Account with GuardDuty permissions
Terraform installed locally
Git CLI for cloning the repository
AWS CLI configured with credentials (optional, for manual deployment)


🚀 Quick Start
1. Clone the Repository
bashgit clone https://github.com/charles-bucher/cloudOps-guardDuty-automation.git
cd cloudOps-guardDuty-automation
2. Initialize Terraform
bashterraform init
This downloads the AWS provider and initializes the working directory.
3. Preview the Infrastructure
bashterraform plan
Review the planned changes before applying. This shows what Terraform will create.
4. Deploy GuardDuty
bashterraform apply
```

Type `yes` when prompted to confirm deployment.

⚠️ **Always review the Terraform plan before applying in production accounts.**

### **5. Verify GuardDuty is Enabled**

- Log into the AWS Console
- Navigate to **GuardDuty**
- Verify GuardDuty is enabled and monitoring is active

---

## 🎬 **Visual Walkthrough**

| Step | Screenshot / GIF |
|------|------------------|
| **1️⃣ GitHub Push** | ![GitHub Push](screenshots/guardduty_screenshots/gd_github_push.png) |
| **2️⃣ Terraform Plan** | ![Terraform Plan](screenshots/guardduty_screenshots/gd_tfplan.png) |
| **3️⃣ Terraform Plan Confirmation** | ![Plan Confirmation](screenshots/guardduty_screenshots/gd_tfplan_confirm.png) |
| **4️⃣ Terraform Apply** | *GIF showing real-time Terraform apply progress* |
| **5️⃣ GuardDuty Dashboard** | *GIF showing GuardDuty enabling in AWS Console* |

**GIFs show real-time progress** of Terraform apply and GuardDuty enabling, adding a "wow factor" for recruiters.

---

## 🗂️ **Repository Structure**
```
cloudOps-guardDuty-automation/
├── .github/
│   └── workflows/
│       └── terraform-apply.yml      # GitHub Action for Terraform apply
├── main.tf                           # Terraform main configuration
├── variables.tf                      # Terraform input variables
├── outputs.tf                        # Terraform outputs
├── README.md                         # This file
└── screenshots/
    └── guardduty_screenshots/        # Screenshots + GIFs for portfolio

🛠️ What I Built (Technical Details)
Terraform Configuration
main.tf - Main infrastructure configuration:

AWS provider configuration
GuardDuty detector resource
Optional: SNS topic for findings notifications
Optional: CloudWatch Events rule for alerting

variables.tf - Input variables:

AWS region
GuardDuty configuration options
Notification preferences

outputs.tf - Output values:

GuardDuty detector ID
GuardDuty findings URL
SNS topic ARN (if configured)

CI/CD Pipeline
.github/workflows/terraform-apply.yml - GitHub Actions workflow:

Triggers on push to main branch
Runs terraform fmt for code formatting
Runs terraform validate for syntax checking
Runs terraform plan for change preview
Optionally runs terraform apply for automated deployment


📊 What I Learned Building This
Error-Driven Learning
This project wasn't built perfectly the first time. Here are real problems I encountered and solved:
Terraform State Management:

Problem: Error: state lock conflicts during concurrent deployments
Solution: Learned about Terraform state locking and S3 backend configuration
Lesson: Always use remote state with locking for team environments

IAM Permissions:

Problem: Error: UnauthorizedOperation when enabling GuardDuty
Solution: Debugged IAM policies, added guardduty:CreateDetector permission
Lesson: GuardDuty requires specific IAM permissions beyond basic EC2/S3 access

GitHub Actions Secrets:

Problem: CI/CD pipeline failing with authentication errors
Solution: Configured AWS credentials as GitHub repository secrets
Lesson: Never hardcode AWS credentials; always use secrets management

Terraform Version Conflicts:

Problem: Error: Unsupported Terraform version on different machines
Solution: Added required_version constraint in Terraform configuration
Lesson: Lock Terraform versions for consistency across environments


🎯 Skills Demonstrated
This project showcases:
✅ Infrastructure-as-Code – Terraform configuration, state management, modular design
✅ Security Automation – GuardDuty deployment, threat detection setup
✅ CI/CD Pipelines – GitHub Actions workflows, automated testing, deployment automation
✅ AWS Security Services – GuardDuty, CloudWatch Events, SNS notifications
✅ Documentation – Visual walkthroughs, clear setup instructions, troubleshooting guides
✅ Error Debugging – IAM permissions, Terraform state conflicts, version management

🔧 Extending This Project
Add SNS Notifications
Extend the project to send email/SMS alerts when GuardDuty detects threats:
hcl# Add to main.tf
resource "aws_sns_topic" "guardduty_alerts" {
  name = "guardduty-findings"
}

resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "guardduty-findings-rule"
  description = "Capture GuardDuty findings"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
  })
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.guardduty_alerts.arn
}
Add Lambda Response Automation
Automatically respond to GuardDuty findings with Lambda functions:
hclresource "aws_lambda_function" "guardduty_response" {
  filename      = "lambda_function.zip"
  function_name = "guardduty-auto-response"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "python3.11"
}
Multi-Account Deployment
Deploy GuardDuty across multiple AWS accounts using Terraform workspaces:
bashterraform workspace new production
terraform workspace new staging
terraform apply

⚠️ Important Notes
Cost Awareness

GuardDuty charges based on CloudTrail events and VPC Flow Logs analyzed
Estimated cost: ~$5-10/month for small accounts
Use AWS Cost Explorer to monitor GuardDuty costs

Security Best Practices

Never commit AWS credentials to Git
Always review Terraform plans before applying
Use least-privilege IAM policies
Enable GuardDuty in all AWS regions for complete coverage

Testing in Sandbox Accounts

Test this project in a sandbox/development AWS account first
Don't deploy directly to production without testing
Verify GuardDuty findings are working by generating test alerts


🤝 Contributing
Open issues or submit pull requests for:

✨ Automation improvements
🔔 Additional monitoring integrations (SNS, Lambda, PagerDuty)
📸 Enhanced visual documentation
🐛 Bug fixes or optimizations


📄 License
MIT License - See LICENSE for details

💡 Pro Tips for Portfolio Use
If you're using this as a portfolio project:
✅ Keep GIFs <5MB for fast GitHub rendering
✅ Add status badges for AWS, Terraform version, or CI/CD pipeline status
✅ Document your learning process – show errors you encountered and how you fixed them
✅ Include metrics – "Reduced security incident response time from 30+ minutes to <5 minutes"
✅ Show real-world application – explain how this would be used in production environments

📞 Contact
Charles Bucher
📧 charles.bucher.cloud@gmail.com
🔗 LinkedIn
🌐 Portfolio
💻 GitHub

🔍 Keywords for ATS/Recruiters
AWS GuardDuty Terraform Infrastructure as Code Security Automation Threat Detection CI/CD GitHub Actions CloudOps AWS Security Event-Driven Architecture SNS Notifications CloudWatch Events IAM Permissions Security Monitoring Automated Deployment DevSecOps Cloud Security Compliance Automation

