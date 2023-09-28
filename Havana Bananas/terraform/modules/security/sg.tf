resource "aws_security_group" "banana-sock-sg" {
  name        = "${local.name_con}sg"
  description = "Security group for public instances"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.public_subnet_sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.public_subnet_sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${local.name_con}ec2_sg"
  }

}

resource "aws_security_group" "banana-sock-eks_sg" {
  name        = "${local.name_con}eks_sg"
  description = "Security group for eks instances"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.eks_sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.eks_sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${local.name_con}eks_sg"
  }

}