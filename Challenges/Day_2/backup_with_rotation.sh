#!/bin/bash

<<<<<<< HEAD
# Function to display usage information and available options
function display_usage {
    echo "Usage: $0 /path/to/source_directory"
}

# Check if a valid directory path is provided as a command-line argument
if [ $# -eq 0 ] || [ ! -d "$1" ]; then
    echo "Error: Please provide a valid directory path as a command-line argument."
    display_usage
    exit 1
fi

# Directory path of the source directory to be backed up
source_dir="$1"

# Function to create a timestamped backup folder
function create_backup {
    local timestamp=$(date '+%Y-%m-%d_%H-%M-%S')  # Get the current timestamp
    local backup_dir="${source_dir}/backup_${timestamp}"

    # Create the backup folder with the timestamped name
    mkdir "$backup_dir"
    echo "Backup created successfully: $backup_dir"
}

# Function to perform the rotation and keep only the last 3 backups
function perform_rotation {
    local backups=($(ls -t "${source_dir}/backup_"* 2>/dev/null))  # List existing backups sorted by timestamp

    # Check if there are more than 3 backups
    if [ "${#backups[@]}" -gt 3 ]; then
        local backups_to_remove="${backups[@]:3}"  # Get backups beyond the last 3
        rm -rf "${backups_to_remove[@]}"  # Remove the oldest backups
    fi
}

# Main script logic
create_backup
perform_rotation
=======
# Check if a directory path is provided as a command-line argument
# checks if the number of command-line arguments is not equal to 1
if [ $# -ne 1 ]
 then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Validate if the provided argument is a directory
backup_source="$1"
# The -d test operator checks if the given path exists and is a directory
if [ ! -d "$backup_source" ]
 then
    echo "Error: The provided path is not a valid directory."
    exit 1
fi

# Create a timestamp for the backup folder
backup_time=$(date +"%Y-%m-%d_%H-%M-%S")
backup_folder="${backup_source}/backup_${backup_time}"

# Perform the backup
# rsync is a powerful file copying tool
rsync -Rr "$backup_source" "$backup_folder" || {echo "Error: Backup failed." exit 1}

# Perform rotation to keep only the last 3 backups
# here we list the folders in reverse chronological order and remove the older backups
ls -dt "${backup_source}/backup_"* | tail -n +4 | xargs rm -rf

# Provide feedback to the user
echo "Backup created: $backup_folder."
>>>>>>> a790195 (day02 Solution added)
