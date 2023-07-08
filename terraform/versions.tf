# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
}