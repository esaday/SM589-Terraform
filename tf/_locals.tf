variable "gcp_creds_path" {
  type      = string
  sensitive = true
}

locals {
  json_data   = file("../data/sample-data.json")
  loaded_data = jsondecode(local.json_data)
}
