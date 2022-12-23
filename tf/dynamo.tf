resource "aws_dynamodb_table" "dynamodb_table" {
  name             = "lambda-dynamodb-stream"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "Id"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "Id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "dynamodb_schema_table_item" {
  for_each = local.loaded_data
  table_name = aws_dynamodb_table.dynamodb_table.name
  hash_key   = "Id"
  item = jsonencode(each.value)
}