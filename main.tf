terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.name_prefix}-managed-ruleset"
  description = "Combination of AWS Managed rulesets"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = var.common_ruleset_enabled ? ["common-rules"] : []
    content {
      name     = rule.value
      priority = 100
      override_action {
        none {}
      }
      statement {
        managed_rule_group_statement {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
          dynamic "excluded_rule" {
            for_each = var.common_ruleset_excluded_rules
            content {
              name = excluded_rule.value
            }
          }
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "${var.name_prefix}-waf-common-ruleset-metrics"
        sampled_requests_enabled   = var.sampled_requests_enabled
      }
    }
  }
  dynamic "rule" {
    for_each = var.known_bad_inputs_ruleset_enabled ? ["known-bad-inputs"] : []
    content {
      name     = rule.value
      priority = 200
      override_action {
        none {}
      }
      statement {
        managed_rule_group_statement {
          name        = "AWSManagedRulesKnownBadInputsRuleSet"
          vendor_name = "AWS"
          dynamic "excluded_rule" {
            for_each = var.known_bad_inputs_excluded_rules
            content {
              name = excluded_rule.value
            }
          }
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "${var.name_prefix}-waf-known-bad-inputs-metrics"
        sampled_requests_enabled   = var.sampled_requests_enabled
      }
    }
  }
  dynamic "rule" {
    for_each = var.ip_reputation_ruleset_enabled ? ["ip-reputation"] : []
    content {
      name     = rule.value
      priority = 300
      override_action {
        none {}
      }
      statement {
        managed_rule_group_statement {
          name        = "AWSManagedRulesAmazonIpReputationList"
          vendor_name = "AWS"
          dynamic "excluded_rule" {
            for_each = var.ip_reputation_excluded_rules
            content {
              name = excluded_rule.value
            }
          }
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "${var.name_prefix}-waf-ip-reputation-metrics"
        sampled_requests_enabled   = var.sampled_requests_enabled
      }
    }
  }
  dynamic "rule" {
    for_each = var.bot_control_ruleset_enabled ? ["bot-control"] : []
    content {
      name     = rule.value
      priority = 400
      override_action {
        none {}
      }
      statement {
        managed_rule_group_statement {
          name        = "AWSManagedRulesBotControlRuleSet"
          vendor_name = "AWS"
          dynamic "excluded_rule" {
            for_each = var.bot_control_excluded_rules
            content {
              name = excluded_rule.value
            }
          }
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "${var.name_prefix}-waf-bot-control-metrics"
        sampled_requests_enabled   = var.sampled_requests_enabled
      }
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
    metric_name                = "${var.name_prefix}-waf-metrics"
    sampled_requests_enabled   = var.sampled_requests_enabled
  }

  tags = var.tags
}
