# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 1.3"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
}

module "deployment" {
  source = "./modules/deployment"
}

module "iam_for_lambda" {
  source = "./modules/iam_role"
}