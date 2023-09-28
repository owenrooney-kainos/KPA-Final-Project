
variable "public_subnet_sg_ingress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "public_subnet_sg_egress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "eks_sg_ingress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "eks_sg_egress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "name_con" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}