variable "name_con" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
  description = "list of ids of private subnets in vpc"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "list of ids of pub subnets in vpc"
}

variable "eks_sg" {
  type = string
  description = "sg to attach alb to eks node"
}

variable "vpc_id" {
  type = string
  description = "id of current vpc"
}

variable "instance_type" {
  type = string
  description = "id of current vpc"
}