
variable "tags" {
  description = "Tags to set on all objects that support them"
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "Prefix to assign to resource names"
  type        = string
  default     = "test"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = ""
}

variable "cloudwatch_metrics_enabled" {
  description = "Whether to enable CloudWatch metrics on the AWS WAF"
  type        = bool
  default     = true
}

variable "sampled_requests_enabled" {
  description = "Whether to sample requests"
  type        = bool
  default     = true
}

variable "common_ruleset_enabled" {
  description = "Whether to enable AWSManagedRulesCommonRuleSet"
  type        = bool
  default     = true
}

variable "common_ruleset_excluded_rules" {
  description = "List of rule names for the AWSManagedRulesCommonRuleSet to set to COUNT instead of BLOCK"
  type        = list(string)
  default     = []
}

variable "known_bad_inputs_ruleset_enabled" {
  description = "Whether to enable AWSManagedRulesKnownBadInputsRuleSet"
  type        = bool
  default     = true
}

variable "known_bad_inputs_excluded_rules" {
  description = "List of rule names for the AWSManagedRulesKnownBadInputsRuleSet to set to COUNT instead of BLOCK"
  type        = list(string)
  default     = []
}

variable "ip_reputation_ruleset_enabled" {
  description = "Whether to enable AWSManagedRulesAmazonIpReputationList"
  type        = bool
  default     = true
}

variable "ip_reputation_excluded_rules" {
  description = "List of rule names for the AWSManagedRulesAmazonIpReputationList to set to COUNT instead of BLOCK"
  type        = list(string)
  default     = []
}

variable "bot_control_ruleset_enabled" {
  description = "Whether to enable AWSManagedRulesBotControlRuleSet"
  type        = bool
  default     = false
}

variable "bot_control_excluded_rules" {
  description = "List of rule names for the AWSManagedRulesBotControlRuleSet to set to COUNT instead of BLOCK"
  type        = list(string)
  default     = []
}

variable "block_graphql_introspection" {
  description = "Whether to block GraphQL schema introspection"
  type        = bool
  default     = false
}

variable "waf_logging_enabled" {
  description = "Whether to enable WAF logging and create relevant resources"
  type        = bool
  default     = false
}

variable "waf_logging_bucket_name" {
  description = "How to name the WAF log bucket"
  type        = string
  default     = ""
}

variable "waf_logging_bucket_object_expiration_days" {
  description = "Expiry period for Objects in WAF log bucket, in days"
  type        = number
  default     = 1
}

variable "waf_logging_bucket_sse_algorithm" {
  description = "Server Side Encryption Algorithm to use for S3 objects."
  type        = string
  default     = "aws:kms"
}

variable "waf_logging_bucket_transition_to_glacier_days" {
  description = "Transition period for Objects in WAF log bucket from standard to Glacier, in days"
  type        = number
  default     = 90
}
