import logging
from bigquery_operations import put_to_bigquery

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)


def handler(event, context):
    rows_to_insert = []
    for record in event['Records']:
        new_dynamo_record = record['dynamodb']['NewImage']
        LOGGER.info(f"New record: {new_dynamo_record}")
        #sample_value = {'action_name': {'S': 'navigate to page x'}, 'id': {'S': '1'}, 'process_time': {'S': '30'}}
        #extract the values from the incoming dynamo record
        rows_to_insert.append({k: v['S'] for k, v in new_dynamo_record.items()})
    try:
        LOGGER.info(f"Inserting rows: {rows_to_insert}")
        put_to_bigquery(rows_to_insert)
        rows_to_insert = []
    except Exception as e:
        LOGGER.error(f"Error: {e}")
        raise e
    return event
