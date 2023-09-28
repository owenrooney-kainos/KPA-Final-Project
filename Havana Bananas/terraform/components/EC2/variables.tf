variable "aws_region" {
  type = string
}
variable "name_con" {
  type = string
}
variable "instance_count" {
  type        = number
  description = "Number of EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "type of EC2 instances"
  default     = "t3.micro"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public web subnets ids."
}