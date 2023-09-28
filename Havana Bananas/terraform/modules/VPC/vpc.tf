//Main VPC
resource "aws_vpc" "banana-sock-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}vpc",
             })
  )
}
