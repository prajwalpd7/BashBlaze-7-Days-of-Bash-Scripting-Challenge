#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

if [ ! -d "$search_directory" ]; then
	echo "directory does not exist. Please enter an existing directory name."
	exit 0
fi

search_directory=$1
target_file=$2

# Function to perform recursive search
function search_recursive() {
    local current_directory="$1"
    
    # Loop through each item in the current directory
    for item in "$current_directory"/*; do
        if [ -f "$item" ] && [ "$(basename "$item")" == "$target_file" ]; then
            echo "File found: $item"
            exit 0
        elif [ -d "$item" ]; then
            search_recursive "$item"
        fi
    done
}

# Start the recursive search
search_recursive "$search_directory"

echo "File not found: $target_file"
exit 1