# notebook table
resource "google_bigquery_table" "tbl_notebook" {
  dataset_id = "ds_stationary"
  table_id   = "tbl_notebooks"

  time_partitioning {
    type = "DAY"
  }
  schema = file("../data/tbl_notebooks_schema.json")
}

#Deploy stationary shop dataset
resource "google_bigquery_dataset" "stationary" {
  dataset_id    = "ds_stationary"
  friendly_name = "stationary"
  description   = "Stationary Shop dataset"
  location      = "EU" #check the location
  #default_table_expiration_ms = 3600000
}