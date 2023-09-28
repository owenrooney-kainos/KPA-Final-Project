variable "aws_region" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "name_con" {
  description = "naming convention"
}
# variable "target_group_instance_ids"{
#   type = list(string)
# }
# variable "target_group_port" {
#   type        = number
#   description = "target group port number"

# }
# variable "public_subnet_ids"{
#   type = string
# }
