# Variables
variable "myregion" {}

variable "accountId" {}

variable "api_name" {
    description = "This is the name of api gateway"
    type = string
    default = "movie_anlyzer_api"
}