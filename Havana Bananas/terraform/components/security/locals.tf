locals {
  public_subnet_sg_ingress_rules = [
    {
      type        = "ssh_inbound_public_subnets"
      protocol    = "tcp"
      from_port   = "22"
      to_port     = "22"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "http_inbound_public_subnets"
      protocol    = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  public_subnet_sg_egress_rules = [
    {
      type        = "default"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  eks_sg_ingress_rules = [
    {
      type        = "ssh"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = concat(["0.0.0.0/0"])
    },
    {
      type        = "http"
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_blocks = concat(["0.0.0.0/0"])
    },
    {
      type        = "https"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "https"
      protocol    = "tcp"
      from_port   = 30001
      to_port     = 30001
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "default"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = concat(["0.0.0.0/0"])
    },
  ]

  eks_sg_egress_rules = [
    {
      type        = "default out to all"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = concat(["0.0.0.0/0"], var.public_subnets)
    },
  ]
}