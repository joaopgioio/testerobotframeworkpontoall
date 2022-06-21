#!/usr/bin/env python

# Uploads file given as parameter to S3. 
# Requires S3_URL env var to contain bucket, end-point and credentials.

import sys, os, tinys3, urlparse, string

file_name = sys.argv[1] 

# expected format http://access_key:secret_key@awsendpoint/bucketname
s3url = urlparse.urlparse(os.environ.get('S3_URL'))

access_key = s3url.username
secret_key = s3url.password
endpoint = s3url.hostname
bucket = string.lstrip(s3url.path, '/')

conn = tinys3.Connection(access_key, secret_key, tls=True, endpoint=endpoint)

input_file = open(file_name, 'rb')
conn.upload(file_name, input_file, bucket) 

print 'http://' + bucket + '.' + endpoint + '/' + file_name