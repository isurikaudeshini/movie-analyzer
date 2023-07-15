output "endpoint_url" {
  value = "${aws_api_gateway_stage.apistage.invoke_url}/${var.endpoint_path}"
}