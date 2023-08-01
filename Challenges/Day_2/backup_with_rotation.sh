###################################################################
# Author: Sasiram Beeke
# Date: 01/08/2023
# Description: Interactive File and Directory Explorer
# Tip: to execute shell give permision +x scriptname
###################################################################

#!/bin/bash
# accept argument and assing it to source_dir variable
source_dir=$1
# create timestamp and store it to timestamp variable
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
# Create the backup folder name using the timestamp
dir_name="backup_${timestamp}"
backup_folder="${source_dir}/${dir_name}"
mkdir "${backup_folder}"
#The script uses rsync to copy the contents of the source directory to the backup folder. 
#The rsync command ensures that the backup folder itself is excluded from the copy.
rsync -av --exclude="${dir_name}" "$source_dir/" "$backup_folder"
# Find and remove older backups, retaining only the last 3 backups
find "$source_dir" -maxdepth 1 -type d -name "backup_*" | sort | head -n -3 | xargs rm -rf
# Print a success message
echo "Backup created: $backup_folder"


