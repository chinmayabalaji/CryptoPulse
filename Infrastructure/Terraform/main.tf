terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.92"
      }
    }

    required_version = ">= 1.2"
    
    backend "s3" {
    bucket = "aws-terraform-infra-backend"
    key = "terraform.tfstate"
    region = "eu-north-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
    region = "us-east-1"
}

