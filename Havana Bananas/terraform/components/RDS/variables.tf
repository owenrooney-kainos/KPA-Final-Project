variable "name_con" {
  description = "naming convention"
}

variable "private_subnets" {
  type = list(string)
}

variable "aws_region" {
  type        = string
  description = "The AWS Region into which we are bootstrapping."
  default     = "eu-west-1"
}