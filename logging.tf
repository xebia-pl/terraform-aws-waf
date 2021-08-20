#tfsec:ignore:AWS002
module "waf_logging_bucket" {
  count = var.waf_logging_enabled ? 1 : 0

  source      = "git@github.com:rackspace-infrastructure-automation/aws-terraform-s3//?ref=v0.12.7"
  name        = var.waf_logging_bucket_name
  environment = var.environment

  bucket_acl                 = "private"
  block_public_access        = true
  lifecycle_enabled          = true
  transition_to_glacier_days = var.waf_logging_bucket_transition_to_glacier_days
  object_expiration_days     = var.waf_logging_bucket_object_expiration_days

  versioning          = true
  object_lock_enabled = false

  sse_algorithm = var.waf_logging_bucket_sse_algorithm

  tags = var.tags
}

# resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
#   bucket = module.s3_cloudtrail_bucket.bucket_id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Id      = "CloudTrailBucketPolicy"
#     Statement = [
#       {
#         Sid    = "AWSCloudTrailAclCheck",
#         Effect = "Allow",
#         Principal = {
#           Service = "cloudtrail.amazonaws.com"
#         },
#         Action   = "s3:GetBucketAcl",
#         Resource = module.s3_cloudtrail_bucket.bucket_arn
#       },
#       {
#         Sid    = "AWSCloudTrailWrite",
#         Effect = "Allow",
#         Principal = {
#           Service = "cloudtrail.amazonaws.com"
#         },
#         Action   = "s3:PutObject",
#         Resource = "${module.s3_cloudtrail_bucket.bucket_arn}/*",
#         Condition = {
#           StringEquals = {
#             "s3:x-amz-acl" = "bucket-owner-full-control"
#           }
#         }
#       }
#     ]
#   })
# }


resource "aws_kinesis_firehose_delivery_stream" "waf_stream" {
  count       = var.waf_logging_enabled ? 1 : 0
  name        = "aws-waf-logs-${var.name_prefix}" # aws-waf-logs- prefix is required
  destination = "s3"

  s3_configuration {
    role_arn   = join("", aws_iam_role.firehose_role.*.arn)
    bucket_arn = join("", module.waf_logging_bucket.*.bucket_arn)
  }

  tags = var.tags
}


resource "aws_iam_role" "firehose_role" {
  count = var.waf_logging_enabled ? 1 : 0
  name  = "${var.name_prefix}-firehose-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = var.tags
}

resource "aws_iam_role_policy" "firehose_policy" {
  count = var.waf_logging_enabled ? 1 : 0

  role = join("", aws_iam_role.firehose_role.*.arn)

  policy = jsonencode({
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject*",
          "s3:ListObject*",
          "s3:PutObject*",
          "s3:ListBucket*",
          "s3:AbortMultipartUpload",
          "s3:ListBucketMultipartUploads",
          "s3:GetBucketLocation",
        ],
        "Resource" : [
          join("", module.waf_logging_bucket.*.bucket_arn),
          "${join("", module.waf_logging_bucket.*.bucket_arn)}/*"
        ]
      }
    ]
  })
}

resource "aws_wafv2_web_acl_logging_configuration" "logging_configuration" {
  count                   = var.waf_logging_enabled ? 1 : 0
  log_destination_configs = [join("", aws_kinesis_firehose_delivery_stream.waf_stream.*.arn)]
  resource_arn            = aws_wafv2_web_acl.web_acl.arn
  redacted_fields {
    single_header {
      name = "authorization"
    }
  }
}
