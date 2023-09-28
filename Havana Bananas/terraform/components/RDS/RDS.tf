module "RDS" {
  source = "../../modules/RDS"

  name_con        = var.name_con
  private_subnets = var.private_subnets
  #private subnet ids output from VPC module
  private_subnet_ids = data.terraform_remote_state.VPC.outputs.private_subnet_ids

}