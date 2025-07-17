#!/bin/bash


echo "Please provide full path, including file name, for the backup tar file you want to create."
read backup_file_name
echo "Please provide the full path to the folder you want to back up."
read directory

    mkdir /home/ec2-user/logs

    tar -czvf $backup_file_name.tar.gz $directory >> /home/ec2-user/logs/archive_and_zip.log
