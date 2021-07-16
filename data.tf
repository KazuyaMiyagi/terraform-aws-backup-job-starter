# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
# account data
data "aws_caller_identity" "current" {}

# https://www.terraform.io/docs/providers/aws/d/region.html
# region data
data "aws_region" "current" {}
