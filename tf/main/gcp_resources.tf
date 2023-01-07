# notebook table
resource "google_bigquery_table" "sample_table" {
  dataset_id = local.dataset_id
  table_id   = "sample_table"
  deletion_protection=false
  depends_on = [
    google_bigquery_dataset.main_dataset
  ]
  time_partitioning {
    type = "DAY"
  }
  schema = file("../data/tbl_sample_schema.json")

}

#Deploy dataset
resource "google_bigquery_dataset" "main_dataset" {
  dataset_id    = local.dataset_id
  friendly_name = "friendly name for dataset"
  description   = "Main dataset"
  delete_contents_on_destroy = true
  #default_table_expiration_ms = 3600000
}

locals {
  dataset_id = "ds_sample_for_load"
}

variable "gcp_creds_path" {
  type = string
  sensitive = true
}