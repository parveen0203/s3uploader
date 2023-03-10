#!/bin/bash

export access_key_id=“AKIA2GC4PS46WKKXTNYL”
export secret_access_key=“AbG7TGGV74H5ydIlAWP0EEIp6GD6RvbqMuXBB/y+”

bucket_name=$1
file_name=$2

#Verfying if myfile.txt already exist or not
aws s3api head-object --bucket $bucket_name --key $file_name || NOT_EXIST=true
if [ $NOT_EXIST ]; then
  echo "File does not exist."
  aws s3api put-object --bucket $bucket_name --key $file_name --body $file_name
  exit 0
fi

#Downloading from S3 bucket and comparing with previously uploaded file.If content changed then upload it again with new content
aws s3api get-object --bucket $bucket_name --key $file_name current.txt
if diff $file_name current.txt; then
   echo "File content not modified"
else
   echo "File content Modified. Uploading new file to S3 Bucket" 
   aws s3api put-object --bucket $bucket_name --key $file_name --body $file_name
   rm current.txt
fi
