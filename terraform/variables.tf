variable "lambda_function_name" {
    description = "This is the name of lambda function"
    type =  string
    default = "movie-analyzer"
}

variable "s3_bucket_name" {
    description = "This is the name of the s3 bucket"
    type = string
    default = "movie-analyzer-s3-bucket-01"
}

variable "zip_file_path" {
    description = "Path of the python zip file"
    type = string
    default = "../infrastructure/zip/python_file.zip"
}

variable "zip_file_name" {
    description = "Name of the zip file"
    type = string
    default = "python_file.zip"
}