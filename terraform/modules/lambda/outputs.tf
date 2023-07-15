output "lambda_function_arn" {
  value = aws_lambda_function.movie_function.arn
}

output "lambda_function_name" {
  value =  aws_lambda_function.movie_function.function_name
}

output "lambda_invoke_arn" {
  value =  aws_lambda_function.movie_function.invoke_arn
}