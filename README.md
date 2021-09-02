<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_waf_logging_bucket"></a> [waf\_logging\_bucket](#module\_waf\_logging\_bucket) | github.com/rackspace-infrastructure-automation/aws-terraform-s3.git | v0.12.7 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.firehose_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.firehose_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.waf_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_wafv2_web_acl.web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_logging_configuration.logging_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_graphql_introspection"></a> [block\_graphql\_introspection](#input\_block\_graphql\_introspection) | Whether to block GraphQL schema introspection | `bool` | `false` | no |
| <a name="input_bot_control_excluded_rules"></a> [bot\_control\_excluded\_rules](#input\_bot\_control\_excluded\_rules) | List of rule names for the AWSManagedRulesBotControlRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| <a name="input_bot_control_ruleset_enabled"></a> [bot\_control\_ruleset\_enabled](#input\_bot\_control\_ruleset\_enabled) | Whether to enable AWSManagedRulesBotControlRuleSet | `bool` | `false` | no |
| <a name="input_cloudwatch_metrics_enabled"></a> [cloudwatch\_metrics\_enabled](#input\_cloudwatch\_metrics\_enabled) | Whether to enable CloudWatch metrics on the AWS WAF | `bool` | `true` | no |
| <a name="input_common_ruleset_enabled"></a> [common\_ruleset\_enabled](#input\_common\_ruleset\_enabled) | Whether to enable AWSManagedRulesCommonRuleSet | `bool` | `true` | no |
| <a name="input_common_ruleset_excluded_rules"></a> [common\_ruleset\_excluded\_rules](#input\_common\_ruleset\_excluded\_rules) | List of rule names for the AWSManagedRulesCommonRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `""` | no |
| <a name="input_ip_reputation_excluded_rules"></a> [ip\_reputation\_excluded\_rules](#input\_ip\_reputation\_excluded\_rules) | List of rule names for the AWSManagedRulesAmazonIpReputationList to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| <a name="input_ip_reputation_ruleset_enabled"></a> [ip\_reputation\_ruleset\_enabled](#input\_ip\_reputation\_ruleset\_enabled) | Whether to enable AWSManagedRulesAmazonIpReputationList | `bool` | `true` | no |
| <a name="input_known_bad_inputs_excluded_rules"></a> [known\_bad\_inputs\_excluded\_rules](#input\_known\_bad\_inputs\_excluded\_rules) | List of rule names for the AWSManagedRulesKnownBadInputsRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| <a name="input_known_bad_inputs_ruleset_enabled"></a> [known\_bad\_inputs\_ruleset\_enabled](#input\_known\_bad\_inputs\_ruleset\_enabled) | Whether to enable AWSManagedRulesKnownBadInputsRuleSet | `bool` | `true` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix to assign to resource names | `string` | `"test"` | no |
| <a name="input_sampled_requests_enabled"></a> [sampled\_requests\_enabled](#input\_sampled\_requests\_enabled) | Whether to sample requests | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to set on all objects that support them | `map(string)` | `{}` | no |
| <a name="input_waf_logging_bucket_name"></a> [waf\_logging\_bucket\_name](#input\_waf\_logging\_bucket\_name) | How to name the WAF log bucket | `string` | `""` | no |
| <a name="input_waf_logging_bucket_object_expiration_days"></a> [waf\_logging\_bucket\_object\_expiration\_days](#input\_waf\_logging\_bucket\_object\_expiration\_days) | Expiry period for Objects in WAF log bucket, in days | `number` | `1` | no |
| <a name="input_waf_logging_bucket_sse_algorithm"></a> [waf\_logging\_bucket\_sse\_algorithm](#input\_waf\_logging\_bucket\_sse\_algorithm) | Server Side Encryption Algorithm to use for S3 objects. | `string` | `"aws:kms"` | no |
| <a name="input_waf_logging_bucket_transition_to_glacier_days"></a> [waf\_logging\_bucket\_transition\_to\_glacier\_days](#input\_waf\_logging\_bucket\_transition\_to\_glacier\_days) | Transition period for Objects in WAF log bucket from standard to Glacier, in days | `number` | `90` | no |
| <a name="input_waf_logging_enabled"></a> [waf\_logging\_enabled](#input\_waf\_logging\_enabled) | Whether to enable WAF logging and create relevant resources | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_waf_log_bucket_arn"></a> [waf\_log\_bucket\_arn](#output\_waf\_log\_bucket\_arn) | The arn of the WAF log bucket |
| <a name="output_waf_log_bucket_name"></a> [waf\_log\_bucket\_name](#output\_waf\_log\_bucket\_name) | The name of the WAF log bucket |
| <a name="output_waf_web_acl_arn"></a> [waf\_web\_acl\_arn](#output\_waf\_web\_acl\_arn) | The ARN of the WAF Web ACL |
| <a name="output_waf_web_acl_capacity"></a> [waf\_web\_acl\_capacity](#output\_waf\_web\_acl\_capacity) | The capacity of the WAF Web ACL |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
