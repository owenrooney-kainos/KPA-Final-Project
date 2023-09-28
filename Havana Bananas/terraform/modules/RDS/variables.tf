variable "name_con" {
  type        = string
  description = "naming convention"
}

variable "private_subnets" {
  type        = list(string)
  description = "list of cidr ranges for private subnets"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "list of ids of private subnets in vpc"
}