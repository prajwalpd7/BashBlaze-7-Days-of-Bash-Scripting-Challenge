#!/bin/bash

# Asking user to provide the directory path to take backup of
read -p "Please provide path to take back up of: " src_dir
echo $src_dir

# Creating back up folder
echo "Creating back up..."

# Setting Current Time using date command
current_time=$(date "+%Y-%m-%d_%H-%M-%S")
# echo "Current Time : $current_time"

# Creating back up folder by appending current time with backup_
backup_folder=$src_dir/backup_$current_time

# Getting count of back up folders
file_count=$(ls -l $src_dir | awk '/backup_/' | wc -l)
# echo $file_count

# Getting the name of oldest file
oldest_file=$(ls -l $src_dir | awk '/backup_/ {print $9}' | head -1)
# echo $oldest_file

# Using condition to check if there are 3 back up folders already present then remove the oldest one and add the new.
if [ $file_count -eq 3 ]
then
    echo "Removing Oldest File: $oldest_file"
    rm -r "$src_dir/$oldest_file"
fi

# using rysnc to copy src folder and copying it into backup folder. rsync helped in excluding older back up folders.
rsync -ar $src_dir/. $backup_folder --exclude /backup*

echo "Backup created: $backup_folder"


