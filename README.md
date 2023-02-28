# s3uploader
Created s3uploader.sh using Bash scripting on Mac OS

Handled 2 cases:

1. Myfile.txt not present: It will verify if myfile.txt doesn't exist then it will upload the myfile.txt to required s3 bucket and exit.
2. Myfile.txt present: It will check if the content of myfile.txt is different the previously uploaded file.If yes,it will upload new file.

Using **Watch Utility** to watch the myfile.txt for any modification at run time.

Currently it's running the script every 30sec to detect any new changes and accordingly upload it to S3 bucket.

export bucket_name=ido20230224182720500300000001
  
Adding some screenshots from watch utility on how to watch the changes
 **$watch -n 30 ./s3uploader.sh $bucket_name myfile.txt**

<img width="510" alt="Screen Shot 2023-02-28 at 4 23 28 PM" src="https://user-images.githubusercontent.com/48429431/221983759-1ed9a440-0192-4cbd-8909-047c2bee923f.png">
<img width="562" alt="Screen Shot 2023-02-28 at 4 24 23 PM" src="https://user-images.githubusercontent.com/48429431/221983775-6741b44a-468e-4a23-955c-ea15beef55fb.png">
