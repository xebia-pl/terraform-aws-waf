provider "aws" {
  region = "eu-west-1"
}

provider "random" {}

resource "random_pet" "bucket_prefix" {
  length = 4
}

resource "random_integer" "integer" {
  min = 100
  max = 100000
}
module "waf" {
  source = "../"

  cloudwatch_metrics_enabled       = true
  sampled_requests_enabled         = true
  common_ruleset_enabled           = true
  known_bad_inputs_ruleset_enabled = true
  ip_reputation_ruleset_enabled    = true
  bot_control_ruleset_enabled      = true

  waf_logging_enabled                           = true
  waf_logging_bucket_name                       = "${random_pet.bucket_prefix.id}-${random_integer.integer.id}"
  waf_logging_bucket_transition_to_glacier_days = 1
  waf_logging_bucket_object_expiration_days     = 2
  waf_logging_bucket_sse_algorithm              = "aws:kms"

  tags = {
    "test" = "true"
  }
}
