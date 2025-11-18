# Generate sample GuardDuty findings for testing
resource "null_resource" "generate_test_findings" {
  provisioner "local-exec" {
    command = <<-EOT
      aws guardduty create-sample-findings \
        --detector-id ${module.guardduty.detector_id} \
        --finding-types Recon:EC2/PortProbeUnprotectedPort
    EOT
  }
}
```

**3. Add Output Documentation**
In your README, add a "Sample Output" section showing what hiring managers will see:
```
Outputs:
detector_id = "abc123def456..."
s3_bucket_name = "guardduty-findings-123456789012"
sns_topic_arn = "arn:aws:sns:us-east-1:..."