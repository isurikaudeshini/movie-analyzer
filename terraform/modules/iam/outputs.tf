output "iam_role_name" {
  value = aws_iam_role.iam_for_lambda.name
}

output "iam_role_arn" {
  value = aws_iam_role.iam_for_lambda.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.lambda_logging.arn
}
