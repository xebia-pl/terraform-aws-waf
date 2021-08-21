output "waf_log_bucket_name" {
  description = "The name of the WAF log bucket"
  value       = join("", module.waf_logging_bucket.*.bucket_id)
}

output "waf_log_bucket_arn" {
  description = "The arn of the WAF log bucket"
  value       = join("", module.waf_logging_bucket.*.bucket_arn)
}

output "waf_web_acl_arn" {
  description = "The ARN of the WAF Web ACL"
  value       = aws_wafv2_web_acl.web_acl.arn
}

output "waf_web_acl_capacity" {
  description = "The capacity of the WAF Web ACL"
  value       = aws_wafv2_web_acl.web_acl.capacity
}
