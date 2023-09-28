variable "name_con" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "aws_region" {
  type        = string
  description = "The AWS Region into which we are bootstrapping."
  default     = "eu-west-1"
}
