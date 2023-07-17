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

  iam_policy_arn = module.iam.iam_policy_arn
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

# resource "null_resource" "generate_lambda_zip" {
#   provisioner "local-exec" {
#     command = "bash ./modules/scripts/package_lambda.sh"

#     environment = {
#       source_code_path = "../infrastructure/code"
#       module_dir_path  = "../modules"
#       build_dir_path   = "../build"
#       path_pwd         = path.module

#     }
#   }
# }