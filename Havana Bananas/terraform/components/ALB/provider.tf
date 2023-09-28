terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "banana-sock-bucket"
    key            = "state/havana-banana-alb.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "banana-sock-lock_table"

  }
}


data "terraform_remote_state" "networking_link" {
  backend = "s3"
  config = {
    bucket         = "banana-sock-bucket"
    key            = "state/havana-banana-networking.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "banana-sock-lock_table"
  }
}


data "terraform_remote_state" "ec2_link" {
  backend = "s3"
  config = {
    bucket         = "banana-sock-bucket"
    key            = "state/havana-banana-compute.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "banana-sock-lock_table"
  }
}

data "terraform_remote_state" "eks_link" {
  backend = "s3"
  config = {
    bucket         = "banana-sock-bucket"
    key            = "state/havana-banana-eks.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "banana-sock-lock_table"
  }
}