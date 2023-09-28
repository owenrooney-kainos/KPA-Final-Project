module "VPC" {
  source = "../../modules/VPC"

  name_con        = var.name_con
  aws_region      = var.aws_region
  cidr_block      = var.cidr_block
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  nat_count = var.nat_count
  trusted_ips = var.trusted_ips
}