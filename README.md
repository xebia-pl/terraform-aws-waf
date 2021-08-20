## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_kinesis_firehose_delivery_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) |
| [aws_wafv2_web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) |
| [aws_wafv2_web_acl_logging_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bot\_control\_excluded\_rules | List of rule names for the AWSManagedRulesBotControlRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| bot\_control\_ruleset\_enabled | Whether to enable AWSManagedRulesBotControlRuleSet | `bool` | `false` | no |
| cloudwatch\_metrics\_enabled | Whether to enable CloudWatch metrics on the AWS WAF | `bool` | `true` | no |
| common\_ruleset\_enabled | Whether to enable AWSManagedRulesCommonRuleSet | `bool` | `true` | no |
| common\_ruleset\_excluded\_rules | List of rule names for the AWSManagedRulesCommonRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| ip\_reputation\_excluded\_rules | List of rule names for the AWSManagedRulesAmazonIpReputationList to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| ip\_reputation\_ruleset\_enabled | Whether to enable AWSManagedRulesAmazonIpReputationList | `bool` | `true` | no |
| known\_bad\_inputs\_excluded\_rules | List of rule names for the AWSManagedRulesKnownBadInputsRuleSet to set to COUNT instead of BLOCK | `list(string)` | `[]` | no |
| known\_bad\_inputs\_ruleset\_enabled | Whether to enable AWSManagedRulesKnownBadInputsRuleSet | `bool` | `true` | no |
| name\_prefix | Prefix to assign to resource names | `string` | `""` | no |
| sampled\_requests\_enabled | Whether to sample requests | `bool` | `true` | no |
| tags | Tags to set on all objects that support them | `map(string)` | `{}` | no |

## Outputs

No output.
