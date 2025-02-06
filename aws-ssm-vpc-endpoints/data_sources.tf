data "aws_region" "current" {}

data "aws_vpc" "main" {
  id = var.vpc_id
}
