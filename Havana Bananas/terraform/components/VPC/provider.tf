terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "banana-sock-bucket"
    key            = "state/havana-banana-networking.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "banana-sock-lock_table"
  }
}