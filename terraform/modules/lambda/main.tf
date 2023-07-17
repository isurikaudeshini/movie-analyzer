resource "aws_lambda_function" "movie_function" {
  function_name = var.lambda_function_name
  filename      = "../build/code.zip"

  handler = "lambda.lambda_handler"
  role    = var.iam_role_arn

  source_code_hash = filebase64sha256(var.python_code_zip_path)

  runtime = var.runtime_version

  layers = [aws_lambda_layer_version.lambda_layer.arn]

  depends_on = [
    aws_iam_role_policy_attachment.lambda_role_attach,
    aws_cloudwatch_log_group.lambda_cloudwatch
  ]

}

resource "aws_cloudwatch_log_group" "lambda_cloudwatch" {
  name              = var.lambda_function_name
  retention_in_days = 1
}

resource "aws_iam_role_policy_attachment" "lambda_role_attach" {
  role       = var.iam_role_name
  policy_arn = var.iam_policy_arn
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "lambda_object" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = var.package_zip_file_name
  source = var.package_zip_file_path
}

resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name               = var.lambda_layer_name
  compatible_runtimes      = [var.runtime_version]
  compatible_architectures = ["x86_64"]

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_object.key
}

