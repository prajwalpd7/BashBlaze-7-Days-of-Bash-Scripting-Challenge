#!/bin/bash
# Author: Yashraj Jaiswal
# Date: 01/08/2023
# Description: TWSBashBlazeChallenge Day-2
# Task 2: Directory Backup with Rotation

# Validate input parameter for the directory to backup
if [ "$#" -ne 1 ];
then
    echo "Usage: $0 <path_to_directory>"
    echo "Hint: enter the full path to the directory to backup"
    exit 1
fi

path_to_dir="$1"
backup_dir="/var/backups"
max_backup_files=3

# Get the number of existing backup files in the backup directory
total_backup_files=$(find "$backup_dir" -type f -name "*.tgz" | wc -l)
echo
echo "Total backup files: $total_backup_files"

# Check if more than the allowed number of backup files exist
if (( total_backup_files >= max_backup_files ));
then
    echo
    echo "More than $max_backup_files backup files detected"
    # Sort the backup files by modification time and delete the oldest one
    oldest_file=$(find "$backup_dir" -type f -name "*.tgz" | sort -r | tail -n 1)
    echo "Deleting the oldest backup file - $oldest_file"
    sudo rm -f "$oldest_file"
fi

# Create a new tar file with timestamp in the filename
backup_file="backup_$(date +%d_%m_%Y_%H_%M_%S).tgz"
sudo tar -cvzf "$backup_dir/$backup_file" "$path_to_dir" > /dev/null 2>&1

# Check if the tar command executed successfully
if [[ $? -eq 0 ]];
then
    echo
    echo "Backup created successfully"
    echo "List of backups created in the past 3 days:"
    sudo ls -lh "$backup_dir"/*.tgz |  awk '{print "-",$NF, "\t(", $5, ")"}'
else
    echo "Unable to create backup"
fi
echo