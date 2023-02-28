# s3uploader
Created s3uploader.sh using Bash scripting on Mac OS
<img width="525" alt="Screen Shot 2023-02-28 at 4 16 51 PM" src="https://user-images.githubusercontent.com/48429431/221982175-8618bb51-61a5-4b38-8abd-7421e5a276d7.png">


Handled 2 cases:

1. Myfile.txt not present: It will verify if myfile.txt doesn't exist then it will upload the myfile.txt to required s3 bucket and exit.
2. Myfile.txt present: It will check if the content of myfile.txt is different the previously uploaded file.If yes,it will upload new file.

Using **Watch Utility** to watch the myfile.txt for any modification
Currently it's checking every 30sec for any new changes and accordingly upload it to S3 bucket.

  **$watch -n 30 ./s3uploader.sh $bucket_name myfile.txt**

Every 30.0s: ./s3uploader.sh ido20230224182720500300000001 myfile.txt                                                         Parveens-MacBook-Air.local: Tue Feb 28 16:11:27 2023

{
    "AcceptRanges": "bytes",
    "LastModified": "2023-02-28T20:52:55+00:00",
    "ContentLength": 11,
    "ETag": "\"f417a7e2e52a72b136c652bc7662f14b\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
}
{
    "AcceptRanges": "bytes",
    "LastModified": "2023-02-28T20:52:55+00:00",
    "ContentLength": 11,
    "ETag": "\"f417a7e2e52a72b136c652bc7662f14b\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
}
no file change

Every 30.0s: ./s3uploader.sh ido20230224182720500300000001 myfile.txt                                                         Parveens-MacBook-Air.local: Tue Feb 28 16:15:59 2023

{
    "AcceptRanges": "bytes",
    "LastModified": "2023-02-28T20:52:55+00:00",
    "ContentLength": 11,
    "ETag": "\"f417a7e2e52a72b136c652bc7662f14b\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
}
{
    "AcceptRanges": "bytes",
    "LastModified": "2023-02-28T20:52:55+00:00",
    "ContentLength": 11,
    "ETag": "\"f417a7e2e52a72b136c652bc7662f14b\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
}
1c1
< yeah
---
> yessssssss
file changed
{
    "ETag": "\"83a99ec2133d9ab6ff006391ef3fa011\"",
    "ServerSideEncryption": "AES256"
}
