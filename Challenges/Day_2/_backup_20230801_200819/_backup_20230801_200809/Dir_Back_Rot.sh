#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 
fi

directory_path="$1"

if [ ! -d "$directory_path" ]; then
    echo "Error: Not a valid directory path."
    exit 
fi

backup_folder="${directory_path}_backup_$(date +'%Y%m%d_%H%M%S')"

echo "Creating backup folder: $backup_folder"
mkdir "$backup_folder"

cp -r "$directory_path"/* "$backup_folder"

echo "Backup completed successfully."

