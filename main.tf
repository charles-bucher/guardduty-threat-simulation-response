terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "guardduty_alerts" {
  name = "guardduty-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "email"
  endpoint  = "quietopscb@gmail.com"
}

resource "aws_sns_topic_policy" "guardduty_alerts" {
  arn = aws_sns_topic.guardduty_alerts.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "events.amazonaws.com" }
      Action    = "SNS:Publish"
      Resource  = aws_sns_topic.guardduty_alerts.arn
    }]
  })
}

module "guardduty_alerting" {
  source          = "./modules/guardduty-alerting"
  name_prefix     = "security"
  sns_topic_arn   = aws_sns_topic.guardduty_alerts.arn
  severity_filter = [7, 8]
  tags            = { Environment = "production" }
}
