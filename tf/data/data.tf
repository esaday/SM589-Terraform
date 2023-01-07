resource "aws_dynamodb_table_item" "dynamodb_schema_table_item" {
  for_each   = local.loaded_data
  table_name = aws_dynamodb_table.dynamodb_table.name
  hash_key   = "id"
  item       = jsonencode(each.value)
  depends_on = [
    google_bigquery_dataset.main_dataset,
    google_bigquery_table.sample_table,
    aws_lambda_function.lambda_function,
    aws_lambda_event_source_mapping.log_events
  ]
}