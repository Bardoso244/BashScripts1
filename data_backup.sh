#!/bin/bash

echo "Enter source path for the backup"
read source
echo "Enter destination path for the backup"
read destination

if ! command -v rsync > /dev/null 2>&1
then
    echo "Rsync needs installing for this script to run"
    echo "Please install rsync, using your local package manager"  
fi

current_date=$(date +%Y-%m-%d-%H:%M)

rsync_options="-avb --backup-dir $destination/current_date --delete"

$(which rsync) $rsync_options $source $destination >> backup_$current_date.log
