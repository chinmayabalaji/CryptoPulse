import json
import boto3
import logger
import urllib3
from datetime import datetime

def get_data():
    logger.info("Collecting Crypto Data")
    http = urllib3.PoolManager()
    params = {'search': 'python'}
    url = "https://api.coingecko.com/api/v3/exchanges"
    response = http.request("GET", url, fields = params)
    data = json.loads(response.data.decode('utf-8'))
    return data

def load_to_s3(data):
    logger.info("Loading Data to S3")
    s3_client = boto3.client('s3')
    s3_client.put_object(Bucket = 'dev-cryptolake', Key = f"Exchanges_Data_{datetime.now()}.json", Body = json.dumps(data), ContentType = "application/json" )

def lambda_handler(event, context):
    try:
        logger.info("Starting Lambda Function")
        crypto_data = get_data()
        load_to_s3(crypto_data)
    except Exception as e:
        print(f"Error Encounter: str{e}")
        raise