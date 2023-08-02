#!/bin/bash

# In this function, we are checking if the number of backup folders is greater than 3, if so,
# then we only keep the latest 3 backups and delete others
rotate_backups() {
 backup=$1
 NUMBER_OF_BACKUPS_ALLOWED=3
 NUMBER_OF_FOLDERS_PRESENT=$( ls $backup | sort -V | wc -l  )
 NUMBER_OF_FOLDERS_TO_BE_REMOVED=$(( $NUMBER_OF_FOLDERS_PRESENT - $NUMBER_OF_BACKUPS_ALLOWED ))

 if [[ $NUMBER_OF_FOLDERS_TO_BE_REMOVED -gt 0 ]]; then
	 FOLDERS_TO_BE_DELETED=$( ls $backup | sort -V | head -n $NUMBER_OF_FOLDERS_TO_BE_REMOVED )
	 for folder in $FOLDERS_TO_BE_DELETED;
	 do
		 rm -r $backup/$folder
	 done
 fi
}

# Starting of script
if [[ $# -ne 2 ]]; then
	echo "Correct Usage: ./backup_with_rotation.sh <src_directory> <target_directory>"
	exit 1
fi


# Assigning command line arguments to variables
source_directory="$1"
target_directory="$2"
timestamp=$(date +%Y%m%d%H%M%S)
backup_directory="$target_directory/backup_$timestamp"

# Validate input: check if source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Error: Source directory '$source_directory' does not exist."
    exit 1
fi

# Create target directory if not present
if [ ! -d "$backup_directory" ]; then
    mkdir -p "$target_directory"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create target directory '$target_directory'."
        exit 1
    fi
fi

# Copying files from src to target directory
cp -r $source_directory "$backup_directory/"

# if copy was successful, then we will check for old backup folders that need to be deleted
if [ $? -eq 0 ]; then
    echo "Backup created successfully at: $backup_directory"
    rotate_backups $target_directory
else
    echo "Error: Failed to create backup."
    exit 1
fi

exit 0
