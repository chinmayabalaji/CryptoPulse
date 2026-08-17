import json
#import boto3
from datetime import datetime
import urllib3

def get_data():
    print("In get_data function")
    http = urllib3.PoolManager()
    params = {'search': 'python'}
    url = "https://api.coingecko.com/api/v3/exchanges"

    response = http.request("GET", url, fields=params)

    data = json.loads(response.data.decode('utf-8'))

    print(data)

def load_to_s3(data):

    s3_client = boto3.client('s3')
    s3_client.put_object(Bucket = 'dev-cryptolake', key = f"Exchanges_Data_{datetime.now()}.json", Body = data )

def lambda_handler():
    try:
        print("In main function")
        crypto_data = get_data()
        print(type(crypto_data))
    except Exception as e:
        print(f"Error Encounter: str{e}")
        raise

lambda_handler()