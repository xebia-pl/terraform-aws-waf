output "waf_arn" {
  description = "The ARN of the WAF Web ACL"
  value       = module.waf.waf_web_acl_arn
}

output "waf_log_bucket_name" {
  description = "The name of the WAF log bucket"
  value       = module.waf.waf_log_bucket_name
}

output "waf_log_bucket_arn" {
  description = "The arn of the WAF log bucket"
  value       = module.waf.waf_log_bucket_arn
}
