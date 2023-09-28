module "EKS" {
  source = "../../modules/EKS"

  name_con           = var.name_con
  
  //private_subnet_ids = data.terraform_remote_state.networking_link.outputs.private_subnet_ids
  
  public_subnet_ids = data.terraform_remote_state.networking_link.outputs.public_subnet_ids

  eks_sg = data.terraform_remote_state.security_link.outputs.eks_sg

  vpc_id = data.terraform_remote_state.networking_link.outputs.vpc_id

  instance_type = var.eks_instance_type

}