# Variables
variable "myregion" {
    type = string
    default = "us-east-1"
}

variable "api_name" {
    description = "This is the name of api gateway"
    type = string
    default = "movie_anlyzer_api"
}

variable "account_id" {
    type = string
    default = "466797617074"
}

variable "endpoint_path" {
  description = "The GET endpoint path"
  type        = string
  default     = "conversion"
}

variable "lambda_arn" {
    description = "lambda function arn"
    type = string
}
 
variable "lambda_function_name" {
    description = "lambda function name"
    type = string
}

variable "lambda_invoke_arn" {
    description =  "lambda function invoke arn"
}
