resource "aws_lambda_function" "lambda_function" {
  function_name    = "process-dynamodb-records"
  filename         = data.archive_file.lambda_zip_file.output_path
  source_code_hash = data.archive_file.lambda_zip_file.output_base64sha256
  handler          = "handler.handler"
  role             = aws_iam_role.lambda_assume_role.arn
  runtime          = "python3.8"

  lifecycle {
    create_before_destroy = true
  }
  environment {
    variables = {
      GOOGLE_APPLICATION_CREDENTIALS = "gcp_creds.json"
    }
  }
}

resource "null_resource" "install_dependencies" {
  provisioner "local-exec" {
    command = "pip install -r ${path.module}/../lambda/requirements.txt -t ${path.module}/../lambda/package/"
  }

  provisioner "local-exec" {
  command = "cp -r ${path.module}/../lambda/src/ ${path.module}/../lambda/package/ && cp ${var.gcp_creds_path} ${path.module}/../lambda/package/gcp_creds.json"
  }

  triggers = {
    run_on_requirements_change = filemd5("${path.module}/../lambda/requirements.txt")
    run_on_code_change = filemd5("${path.module}/../lambda/src/handler.py")
  }
}


data "archive_file" "lambda_zip_file" {
  depends_on = [null_resource.install_dependencies]
  output_path = "${path.module}/../lambda.zip"
  source_dir  = "${path.module}/../lambda/package/"
  type        = "zip"
}

resource "aws_lambda_event_source_mapping" "log_events" {
  event_source_arn  = aws_dynamodb_table.dynamodb_table.stream_arn
  function_name     = aws_lambda_function.lambda_function.arn
  starting_position = "LATEST"
}