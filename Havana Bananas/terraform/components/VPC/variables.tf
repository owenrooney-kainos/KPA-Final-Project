variable "cidr_block" {
  description = "CIDR IP Range of VPC"
  default     = "10.0.0.0/16"
}

variable "name_con" {
  description = "naming convention"
}
variable "aws_region" {
  type        = string
  description = "The AWS Region into which we are bootstrapping."
}

variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "nat_count"{
  type = number
}
variable "trusted_ips"{
  type = list(string)
}
