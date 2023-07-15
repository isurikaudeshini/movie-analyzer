# Terraform Block
terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.7.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
}

module "lambda" {
  source = "./modules/lambda"

  policy_arn = module.iam.iam_role_arn
  iam_role_name =  module.iam.iam_role_name
  iam_role_arn = module.iam.iam_role_arn

}

module "iam" {
  source = "./modules/iam"
}

module "api_gateway" {
  source   = "./modules/api_gateway"
  myregion = var.myregion

  lambda_arn = module.lambda.lambda_function_arn
  lambda_function_name =  module.lambda.lambda_function_name
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  
}
