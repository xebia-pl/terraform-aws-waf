<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| aws | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| waf_logging_bucket | github.com/rackspace-infrastructure-automation/aws-terraform-s3.git?ref=v0.12.7 |  |

## Resources

| Name |
|------|
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) |
| [aws_kinesis_firehose_delivery_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) |
| [aws_wafv2_web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) |
| [aws_wafv2_web_acl_logging_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| block\_graphql\_introspection | Whether to block GraphQL schema introspection | `bool` | `false` | no |
| bot\_control\_excluded\_rules | List of rule names for the AWSManagedRulesBotControlRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| bot\_control\_ruleset\_enabled | Whether to enable AWSManagedRulesBotControlRuleSet | `bool` | `false` | no |
| cloudwatch\_metrics\_enabled | Whether to enable CloudWatch metrics on the AWS WAF | `bool` | `true` | no |
| common\_ruleset\_enabled | Whether to enable AWSManagedRulesCommonRuleSet | `bool` | `true` | no |
| common\_ruleset\_excluded\_rules | List of rule names for the AWSManagedRulesCommonRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| environment | Environment name | `string` | `""` | no |
| ip\_reputation\_excluded\_rules | List of rule names for the AWSManagedRulesAmazonIpReputationList to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| ip\_reputation\_ruleset\_enabled | Whether to enable AWSManagedRulesAmazonIpReputationList | `bool` | `true` | no |
| known\_bad\_inputs\_excluded\_rules | List of rule names for the AWSManagedRulesKnownBadInputsRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| known\_bad\_inputs\_ruleset\_enabled | Whether to enable AWSManagedRulesKnownBadInputsRuleSet | `bool` | `true` | no |
| name\_prefix | Prefix to assign to resource names | `string` | `"test"` | no |
| sampled\_requests\_enabled | Whether to sample requests | `bool` | `true` | no |
| tags | Tags to set on all objects that support them | `map(string)` | `{}` | no |
| waf\_logging\_bucket\_name | How to name the WAF log bucket | `string` | `""` | no |
| waf\_logging\_bucket\_object\_expiration\_days | Expiry period for Objects in WAF log bucket, in days | `number` | `1` | no |
| waf\_logging\_bucket\_sse\_algorithm | Server Side Encryption Algorithm to use for S3 objects. | `string` | `"aws:kms"` | no |
| waf\_logging\_bucket\_transition\_to\_glacier\_days | Transition period for Objects in WAF log bucket from standard to Glacier, in days | `number` | `90` | no |
| waf\_logging\_enabled | Whether to enable WAF logging and create relevant resources | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| waf\_log\_bucket\_arn | The arn of the WAF log bucket |
| waf\_log\_bucket\_name | The name of the WAF log bucket |
| waf\_web\_acl\_arn | The ARN of the WAF Web ACL |
| waf\_web\_acl\_capacity | The capacity of the WAF Web ACL |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
