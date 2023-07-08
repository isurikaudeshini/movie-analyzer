resource "aws_lambda_function" "movie_function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.lambda_handler"
  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key = aws_s3_object.lambda_object.key

  source_code_hash = filebase64sha256(var.zip_file_path)

  runtime = "python3.9"

  # environment {
  #   variables = {
  #     foo = "bar"
  #   }
  # }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam-lambda"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# resource "aws_cloudwatch_log_group" "hello" {
#   name = "/aws/lambda/${}"

#   retention_in_days = 1
# }

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