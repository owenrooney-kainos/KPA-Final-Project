locals {



  public_subnet_cidrs  = data.terraform_remote_state.networking_link.outputs.public_subnet_cidr_blocks
  private_subnet_cidrs = data.terraform_remote_state.networking_link.outputs.private_subnet_cidr_blocks


  lb_sg_ingress_rules = [

    {
      type        = "http_inbound_public_subnets"
      protocol    = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "https_inbound_public_subnets"
      protocol    = "tcp"
      from_port   = "443"
      to_port     = "443"
      cidr_blocks = ["0.0.0.0/0"]
    },

  ]

  lb_sg_egress_rules = [
     {
       type        = "default"
       protocol    = "tcp"
       from_port   = "443"
       to_port     = "443"
       cidr_blocks = ["0.0.0.0/0"]
     },
     {
      type        = "default"
      protocol    = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  ]

}