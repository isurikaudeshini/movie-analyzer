variable "lambda_function_name" {
  description = "This is the name of lambda function"
  type        = string
  default     = "movie-analyzer"
}

variable "lambda_layer_name" {
  description = "This is the name of lambda function"
  type        = string
  default     = "movie-analyzer-lambda-layer"
}

variable "runtime_version" {
  description = "Compatible run time version"
  type        = string
  default     = "python3.8"
}

variable "s3_bucket_name" {
  description = "This is the name of the s3 bucket"
  type        = string
  default     = "movie-analyzer-s3-bucket-01"
}

variable "python_code_zip_path" {
  description = "Path of the python zip file containing lambda function"
  type        = string
  default     = "../build/code.zip"
}

variable "package_zip_file_name" {
  description = "Name of the zip file"
  type        = string
  default     = "python_files.zip"
}

variable "package_zip_file_path" {
  description = "Path of the python zip file containing lambda function"
  type        = string
  default     = "../build/python_files.zip"
}

variable "iam_policy_arn" {
  description = "This is imported from iam module"
  type        = string
}

variable "iam_role_name" {
  description = "This is imported from iam module"
  type        = string
}

variable "iam_role_arn" {
  description = "This is iam role arn"
  type        = string
}
