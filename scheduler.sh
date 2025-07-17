#!/bin/bash

command1="/home/ec2-user/linux_update.sh"
command2="/home/ec2-user/data_backup.sh"
command3="/home/ec2-user/archive_and_zip.sh"
command4="/home/ec2-user/s3_folder_backup.sh"

# crontab syntax is as follows: minutes, hours, day of month, month, day of week (0 - 6, Sunday = 0)
schedule="0 5 * * 2"

cron_job1="$schedule $command1"

echo "$cron_job1" | crontab -
