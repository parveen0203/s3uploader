#!/bin/bash

export access_key_id=“AKIA2GC4PS46WKKXTNYL”
export secret_access_key=“AbG7TGGV74H5ydIlAWP0EEIp6GD6RvbqMuXBB/y+”

bucket_name=$1
file_name=$2

aws s3api head-object --bucket $bucket_name --key $file_name || NOT_EXIST=true
if [ $NOT_EXIST ]; then
  echo "File does not exist."
  aws s3api put-object --bucket $bucket_name --key $file_name --body $file_name
  exit 0
fi

aws s3api get-object --bucket $bucket_name --key $file_name current.txt
if diff $file_name current.txt; then
   echo "no file change"
else
   echo "file changed"
   rm current.txt 
   aws s3api put-object --bucket $bucket_name --key $file_name --body $file_name
fi
