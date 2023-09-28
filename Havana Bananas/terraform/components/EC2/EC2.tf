module "EC2" {
  source = "../../modules/EC2"

  aws_region      = var.aws_region
  vpc_id          = data.terraform_remote_state.networking_link.outputs.vpc_id
  public_subnets  = data.terraform_remote_state.networking_link.outputs.public_subnet_ids
  instance_count  = var.instance_count
  instance_type   = var.instance_type
  instance_ami_id = data.aws_ami.ubuntu.id
  name_con        = var.name_con

  ec2_sg_id = data.terraform_remote_state.security_link.outputs.ec2_sg
}