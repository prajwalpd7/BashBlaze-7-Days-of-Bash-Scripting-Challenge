#!/bin/bash

# Function to create backup with timestamped folder
create_backup() {
    local source_dir=$1
    local source_dir="${source_dir}"
    local backup_dir="backup_$(date +'%Y-%m-%d_%H-%M-%S')"
    mkdir "$source_dir/$backup_dir"
    echo "path: $source_dir/$backup_dir/$backup_dir" 
    cp -r "${source_dir}"/* "$backup_dir"
    rm -r $source_dir/$backup_dir/$backup_dir
    echo "Backup created: $backup_dir"
}

# Function to rotate backups and keep only the last 3 backups
rotate_backups() {
    local source_dir=$1
    local backup_dirs=($(ls -d "${source_dir}"/backup_* | sort))

    local backup_count=${#backup_dirs[@]}
    if [ "$backup_count" -gt 3 ]; then
        local backups_to_remove=$((backup_count - 3))
        
        for ((i=0; i<"$backups_to_remove"; i++)); do
            rm -rf "${backup_dirs[$i]}"
            echo "Backup removed: ${backup_dirs[$i]}"
        done
    fi
}

# Check if a directory path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Error: Directory path not provided."
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Check if the provided directory exists
source_dir=$1
if [ ! -d "$source_dir" ]; then
    echo "Error: Directory '$source_dir' does not exist."
    exit 1
fi

# Create three backups with timestamped folders
for ((i=0; i<3; i++)); do
    create_backup "$source_dir"
done

# Rotate backups and keep only the last 3 backups
rotate_backups "$source_dir"



