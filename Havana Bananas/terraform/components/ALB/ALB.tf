module "AppLB" {
  source = "../../modules/ALB"


  target_group_port         = 80
  name_con                  = var.name_con
  public_subnet_ids         = data.terraform_remote_state.networking_link.outputs.public_subnet_ids
  target_group_instance_ids = data.terraform_remote_state.ec2_link.outputs.target_group_instance_ids
  vpc_id                    = data.terraform_remote_state.networking_link.outputs.vpc_id
  lb_sg_ingress_rules      = local.lb_sg_ingress_rules
  lb_sg_egress_rules       = local.lb_sg_egress_rules
  security_group_id         = module.AppLB.security_group_id

  nlb_target_group = data.terraform_remote_state.eks_link.outputs.scaling_group_id
}