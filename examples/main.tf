provider "aws" {
  region = "eu-west-1"
}

module "waf" {
  source = "../"

  cloudwatch_metrics_enabled       = true
  sampled_requests_enabled         = true
  common_ruleset_enabled           = true
  known_bad_inputs_ruleset_enabled = true
  ip_reputation_ruleset_enabled    = true
  bot_control_ruleset_enabled      = true

  tags = {
    "test" = "true"
  }
}
