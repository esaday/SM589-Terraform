resource "aws_dynamodb_table" "dynamodb_table" {
  name             = "lambda-dynamodb-stream"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "id"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "extra_table" {
  name             = "extra-dynamo-db-table"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "epoch"
  stream_enabled   = false

  attribute {
    name = "epoch"
    type = "S"
  }
}


output "dynamo_table_name" {
  value = aws_dynamodb_table.dynamodb_table.name
}
