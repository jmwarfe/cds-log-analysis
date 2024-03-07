from prefect import flow, task, get_run_logger
import boto3
import sys
import json

@task
def list(bucket):
    s3_client = boto3.client('s3')
    paginator = s3_client.get_paginator('list_objects_v2')
    for page in paginator.paginate(Bucket=bucket):
        obj = page['Contents']
        return(json.dumps(obj, indent=2 , default=str))
        sys.exit()
        

@flow(name="CDS Log Analysis")
def runner(bucket):
    logger = get_run_logger()
    logger.info(list(bucket))

if __name__ == "__main__":
    bucket = "cds-server-access-logs"
    runner(bucket)
