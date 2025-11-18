variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of SNS topic to send alerts to"
  type        = string
}

variable "severity_filter" {
  description = "List of severity levels to capture (4=MEDIUM, 7-8=HIGH/CRITICAL)"
  type        = list(number)
  default     = [4, 7, 8]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}