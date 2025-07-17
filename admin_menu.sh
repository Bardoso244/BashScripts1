#!/bin/bash

# Script containing menu of commands and scripts handy for Linux admins

exit_code=1

while [ $exit_code -ne 2 ] 
do

    echo "1 - Universal EC2 Linux update"
    echo "2 - Archive and zip your folder"
    echo "3 - Backup your data to another location/server"
    echo "4 - Backup your data to your s3 bucket"
    echo "5 - Cron job for future updates/backups"
    echo "6 - Exit the script"

    read script

    case $script in
        1) echo -e "\n Running the OS update \n";/home/ec2-user/linux_update.sh ;;
        2) echo -e "\n Archiving and zipping your folder \n";/home/ec2-user/archive_and_zip.sh;;
        3) echo -e "\n Backing up your home folder. Remember to choose a safe location \n";/home/ec2-userts/data_backup.sh;;
	4) echo -e "\n Running s3 backup script, please provide paths as requested below \n";/home/ec2-user/s3_folder_backup.sh;;
        5) echo -e "\n Running crontab, here you can schedule for your scripts to run automatically \n";/home/ec2-user/scheduler.sh;;
	6) exit_code=2;;
        *) echo -e "\n You did not enter a valid choice, please try again, or press 6 to exit the script \n"
    esac

done
