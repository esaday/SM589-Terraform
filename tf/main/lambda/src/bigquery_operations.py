from google.cloud import bigquery

# Construct a BigQuery client object.
client = bigquery.Client()
# These values are hard-coded for the sake of simplicity.
table_id = "sm589-project.ds_sample_for_load.sample_table"

# rows_to_insert = [
#     {"id": "1", "action_name": "Phred Phlyntstone", "process_time": 32},
#     {"id": "2", "action_name": "Wylma Phlyntstone", "process_time": 29},
# ]
def put_to_bigquery(rows_to_insert):
    errors = client.insert_rows_json(table_id, rows_to_insert)  # Make an API request.
    if errors == []:
        print("New rows have been added.")
    else:
        print("Encountered errors while inserting rows: {}".format(errors))


# list_ext = [{'action_name': 'navigate to page ssy'}, {'id': '1f12dc12211'}, {'process_time': '4'}]
# print({k: v for d in list_ext for k, v in d.items()})

# sample_value = {'action_name': {'S': 'navigate to page x'}, 'id': {'S': '1'}, 'process_time': {'S': '30'}}
