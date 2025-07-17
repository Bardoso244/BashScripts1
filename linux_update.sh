#!/bin/bash

set -o pipefail

os=/etc/os-release
updatelog=/home/ec2-user/logs/linux_update.log
errorlog=/home/ec2-user/logs/linux_update_error.log
current_date=$(date +%Y-%m-%d-%H:%M)

mkdir -p /home/ec2-user/logs
touch /home/ec2-user/logs/linux_update.log
touch /home/ec2-user/logs/linux_update_error.log

update_status_check() {

   if [ $? -ne 0 ]
   then 
        echo "Update failed on $(date), check $errorlog for details"
   fi 
}

# OS update Red Hat and Linux 2023
if grep -q "Red Hat" $os || grep -q "Linux 2023" $os
then 
    sudo dnf update -y >> $updatelog  2>> $errorlog 
    update_status_check $?
fi

#Ubuntu and Debian
if grep -q "Ubuntu" $os || grep -q "Debian" $os 
then 
    sudo apt update -y >> $updatelog 2>> $errorlog
    update_status_check $?
fi

#Amazon Linux 2
if grep -q "Linux 2" $os
then
    sudo yum update -y >> $updatelog 2>> $errorlog
    update_status_check $?
fi

#Suse Linux
if grep -q "SUSE" $os
then
    sudo zypper update -y >> $updatelog 2>> $errorlog
    update_status_check $?
    shutdown -r 0
fi

