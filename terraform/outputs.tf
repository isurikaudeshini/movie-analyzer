output "teraform_aws_role_output" {
 value = aws_iam_role.iam_for_lambda.name
}

output "teraform_aws_role_arn_output" {
 value = aws_iam_role.iam_for_lambda.arn
}

output "teraform_logging_arn_output" {
 value = aws_iam_role_policy_attachment.lambda_policy.policy_arn
}