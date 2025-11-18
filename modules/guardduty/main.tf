# EventBridge Rule - Capture GuardDuty findings
resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "${var.name_prefix}-guardduty-findings"
  description = "Capture GuardDuty findings with severity ${join(", ", var.severity_filter)}"
  
  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = var.severity_filter
    }
  })
  
  tags = var.tags
}

# EventBridge Target - Send to SNS
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  target_id = "GuardDutyToSNS"
  arn       = var.sns_topic_arn
  
  input_transformer {
    input_paths = {
      severity     = "$.detail.severity"
      type         = "$.detail.type"
      title        = "$.detail.title"
      description  = "$.detail.description"
      resource     = "$.detail.resource.resourceType"
      account      = "$.detail.accountId"
      region       = "$.detail.region"
      time         = "$.detail.updatedAt"
      finding_id   = "$.detail.id"
    }
    
    input_template = <<EOF
🚨 GuardDuty Security Alert
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Severity: <severity>
Finding ID: <finding_id>

📋 FINDING DETAILS
Type: <type>
Title: <title>
Description: <description>

🎯 AFFECTED RESOURCE
Type: <resource>

📍 LOCATION
Account: <account>
Region: <region>
Time: <time>

🔗 CONSOLE LINK
https://console.aws.amazon.com/guardduty/home?region=<region>#/findings?search=id%3D<finding_id>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  }
}