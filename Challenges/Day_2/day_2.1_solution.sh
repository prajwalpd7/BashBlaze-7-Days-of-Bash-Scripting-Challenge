#!/bin/bash

echo "Welcome to Backupinator!!"

backup_dir=$1
if [[ $backup_dir == "" ]];then
    echo "Please enter the name of directory to back up"
    echo "Usage: 'script.sh <directory name>'"
    exit
fi

echo "Initiating the backup of $backup_dir"
echo "Checking for previous backups"
#Checking for previous backups
cd $backup_dir
num_of_prev_backups=$(find -name "*backup*" | wc -l)
echo "$num_of_prev_backups"
#Condition to check if backups are more than 3
if [[ $num_of_prev_backups -ge 3 ]]; then
    echo "Found 3 or more backups. Deleting the oldest one"
    echo "Deleting the backup $oldest_backup"
    #Deletes oldest backup
    ls -d backup* --time=creation -r| head -1 |xargs rm -r
    echo "Deleted the backup $oldest_backup"
fi
cd ..
#Making a new backup
rsync $backup_dir/* $backup_dir/"backup_$backup_dir_$(date +'%d-%m-%Y_%H-%m-%S')"/
echo "Backup Created backup_$backup_dir_$(date +'%d-%m-%Y_%H-%m-%S')!!"
