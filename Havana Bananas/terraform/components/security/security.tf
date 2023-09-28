module "security" {
  source = "../../modules/security"

  public_subnet_sg_ingress_rules = local.public_subnet_sg_ingress_rules
  public_subnet_sg_egress_rules  = local.public_subnet_sg_egress_rules
  
  eks_sg_ingress_rules = local.eks_sg_ingress_rules
  eks_sg_egress_rules = local.eks_sg_egress_rules
  
  name_con                       = var.name_con

  public_subnets = var.public_subnets
  //private_subnets = var.private_subnets

  vpc_id = data.terraform_remote_state.VPC.outputs.vpc_id
}

