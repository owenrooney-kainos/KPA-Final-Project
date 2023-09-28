variable "name_con" {
type = string
default = "banana-sock-"

}
variable "aws_region" {
  type        = string
  description = "The AWS Region into which we are bootstrapping."
  default = "eu-west-1"
}

variable "account_id"{
    type = number
    default = "138588690193"
}