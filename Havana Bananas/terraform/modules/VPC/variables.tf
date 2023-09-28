//Networking vars
variable "cidr_block" {
  description = "CIDR IP Range of VPC"

}

variable "name_con" {
  description = "naming convention"
}
variable "aws_region" {
  description = "region"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}
variable "nat_count" {
  type = number
}
# variable "internet_gateway"{
#   type = string
# }
# variable "private_subnet_ids" {
#   type = list(string)
# }

# variable "public_subnet_ids" {
#   type = list(string)
# }
variable "trusted_ips"{
  type = list(string)
}