#!/bin/bash

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
