resource "aws_dynamodb_table_item" "dynamodb_schema_table_item" {
  for_each   = local.loaded_data
  table_name = var.dynamo_table_name
  hash_key   = "id"
  item       = jsonencode(each.value)
}

variable "dynamo_table_name" {
  type = string
}

locals {
  json_data   = file("../data/sample-data.json")
  loaded_data = jsondecode(local.json_data)
}