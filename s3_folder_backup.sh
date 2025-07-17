#!/bin/bash

echo "Please provide the full path to the folder you want to back up."
read backup_path
echo "Please provide the full name of your s3 bucket."
read s3_bucket

aws s3 cp "$backup_path" s3://$s3_bucket/ --recursive
