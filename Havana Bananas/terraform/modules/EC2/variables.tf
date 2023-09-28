
variable "public_subnets" {
  type        = list(string)
  description = "List of public web subnets ids."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
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

variable "name_con"{
    description = "naming convention to cover all modules"
}
variable "aws_region" {
  type = string
}
variable "instance_ami_id" {
  type = string
}

variable "ec2_sg_id" {
  type = string
}
