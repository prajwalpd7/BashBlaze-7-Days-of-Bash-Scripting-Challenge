#!/bin/bash

# Create a backup folder with timestamp 
function create_backup() {
    local source_dir="$1"
    local backup_dir="$source_dir/backup_$(date +%Y-%m-%d_%H-%M-%S)" #Create Backup File Formate

    cp -r "$source_dir" "$backup_dir"
    echo "Backup created: $backup_dir"
}

# Function to rotate backups and retain only the last 'n' backups
function rotate_backups() {
    local source_dir="$1"
    local max_backups=3

    # List all backup folders and sort them by modification time (oldest first)
    local backups=($(find "$source_dir" -maxdepth 1 -type d -name "backup_*" -printf '%T@ %p\n' | sort -n | awk '{print $2}')) #FInd Older then max_backup files no.

    # Calculate the number of backups to remove
    local num_backups="${#backups[@]}"
    local num_to_remove=$((num_backups - max_backups))

    # Remove the older backups
    if [ "$num_to_remove" -gt 0 ]; then
        for ((i = 0; i < num_to_remove; i++)); do
            echo "Removing backup: ${backups[$i]}"
            rm -r "${backups[$i]}"
        done
    fi
}

# Check if the source directory is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

source_dir="$1"

