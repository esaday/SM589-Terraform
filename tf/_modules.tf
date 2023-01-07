module "main" {
  source         = "./main"
  gcp_creds_path = var.gcp_creds_path
}

module "data" {
  source            = "./data"
  dynamo_table_name = module.main.dynamo_table_name
}
