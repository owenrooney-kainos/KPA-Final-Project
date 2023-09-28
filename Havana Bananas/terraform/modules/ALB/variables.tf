# variable "public_subnets" {
#   type        = list(string)
#   description = "List of public subnets ids."
# }

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "target_group_port" {
  type        = number
  description = "target group port number"

}
variable "name_con" {
  type        = string
  description = "naming convention to cover all modules"
}
variable "target_group_instance_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnets ids."
}
variable "alb_sg_egress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "alb_sg_ingress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}
variable "security_group_id" {
  type = string
}

variable "nlb_target_group" {
  type = string
}


