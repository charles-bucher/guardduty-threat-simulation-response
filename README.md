# 🛡️ AWS GuardDuty Automation with Terraform

[![GitHub Workflow](https://img.shields.io/github/actions/workflow/status/charles-bucher/cloudOps-guardDuty-automation/terraform-apply.yml?branch=main)](https://github.com/charles-bucher/cloudOps-guardDuty-automation/actions) 
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![AWS](https://img.shields.io/badge/AWS-CloudOps-orange)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-blue)](https://www.terraform.io/)
[![GitHub](https://img.shields.io/badge/GitHub-VersionControl-black)](https://github.com/charles-bucher/cloudOps-guardDuty-automation)

---

## 📋 Table of Contents
- [What This Does](#-what-this-does)
- [Why This Matters](#-why-this-matters)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Architecture](#-architecture)
- [Visual Walkthrough](#-visual-walkthrough)
- [Project Structure](#-project-structure)
- [What I Learned](#-what-i-learned)
- [Future Enhancements](#-future-enhancements)
- [Contributing](#-contributing)
- [License](#-license)
- [Connect With Me](#-connect-with-me)

---

## 🎯 What This Does
Automates deployment of AWS GuardDuty using Terraform, eliminating manual configuration and creating a reproducible, secure monitoring environment.

**Key Deliverables:**
- ✅ GuardDuty Enabled
- ✅ Infrastructure as Code (Terraform)
- ✅ Repeatable Deployments across accounts
- ✅ Security Baseline for incident response
- ✅ Portfolio-ready CloudOps/DevSecOps demonstration

---

## 💡 Why This Matters
**Business Value:**
- Reduces manual security setup time
- Eliminates human error
- Scales across multiple AWS accounts
- Provides an audit trail via Git

**Technical Skills Demonstrated:**
- Infrastructure as Code (Terraform)
- AWS Security (GuardDuty, CloudWatch)
- CI/CD Automation (GitHub Actions)
- Cloud Operations & Incident Response

---

## 🛠️ Tech Stack

| Technology         | Purpose                  | Why It's Used                        |
|-------------------|-------------------------|-------------------------------------|
| Terraform          | Infrastructure as Code   | Industry-standard cloud automation  |
| AWS GuardDuty      | Threat Detection         | Monitors AWS accounts for threats   |
| AWS CloudWatch     | Logging & Monitoring     | Captures security events            |
| GitHub Actions     | CI/CD Pipeline           | Automates deployment workflow       |
| Git                | Version Control          | Tracks infrastructure changes       |

---

## 📦 Prerequisites
- AWS account with admin access
- AWS CLI configured
- Terraform v1.0+
- Git installed
- IAM Permissions: GuardDuty, CloudWatch, IAM role creation  

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "guardduty:*",
        "iam:CreateServiceLinkedRole",
        "cloudwatch:*"
      ],
      "Resource": "*"
    }
  ]
}
🚀 Quick Start
bash
Copy code
# Clone repository
git clone https://github.com/charles-bucher/cloudOps-guardDuty-automation.git
cd cloudOps-guardDuty-automation

# Configure AWS credentials
aws configure

# Initialize Terraform
terraform init

# Preview deployment
terraform plan

# Apply Terraform configuration
terraform apply
# Type 'yes' when prompted

# Verify GuardDuty is enabled
aws guardduty list-detectors

# Optional cleanup
terraform destroy
🏗️ Architecture
pgsql
Copy code
┌─────────────────────────────────────┐
│             AWS Account             │
│                                     │
│  ┌──────────────┐   ┌─────────────┐ │
│  │ Terraform    │──▶│ GuardDuty   │ │
│  │ Automation   │   │ Detector    │ │
│  └──────────────┘   └─────┬───────┘ │
│                           │           │
│                           ▼           │
│                    CloudWatch Logs    │
│                    Security Events    │
└─────────────────────────────────────┘
Terraform manages the entire infrastructure end-to-end.

🎬 Visual Walkthrough
Step	Screenshot
GitHub Push	
Terraform Plan	
Terraform Apply	
GuardDuty Enabled	

🗂️ Project Structure
bash
Copy code
cloudOps-guardDuty-automation/
│
├── .github/workflows/terraform-apply.yml
├── screenshots/
│   ├── GD_01.png
│   ├── GD_02.png
│   ├── GD_03.png
│   └── GD_04.png
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── .gitignore
├── LICENSE
└── README.md
📚 What I Learned
Terraform state management & provider configuration

AWS IAM least-privilege setup

Infrastructure version control

Security-first cloud automation

Troubleshooting IAM & Terraform conflicts

🔮 Future Enhancements
SNS notifications & Lambda integration for findings

Multi-region GuardDuty deployment

Export findings to S3 & EventBridge integration

Terraform Cloud state management

Dashboards for metrics & monitoring

🤝 Contributing
Fork the repo

Create a feature branch

Commit changes

Push & open a PR

Suggestions welcome: Terraform optimization, AWS security integrations, documentation improvements

📄 License
MIT License - see LICENSE for details.

📞 Connect With Me
GitHub: charles-bucher

LinkedIn: Charles Bucher

vbnet
Copy code

