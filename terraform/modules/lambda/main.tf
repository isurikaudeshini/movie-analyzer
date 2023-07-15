resource "aws_lambda_function" "movie_function" {
  function_name = var.lambda_function_name
  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key = aws_s3_object.lambda_object.key

  handler       = "lambda.lambda_handler"
  role          = var.iam_role_arn

  source_code_hash = filebase64sha256(var.zip_file_path)

  runtime = "python3.8"

  # environment {
  #   variables = {
  #     foo = "bar"
  #   }
  # }
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
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
  key    = var.zip_file_name
  source = var.zip_file_path
}

resource "aws_iam_role_policy_attachment" "lambda_role_attach" {
  role      = var.iam_role_name
  policy_arn = var.policy_arn
}