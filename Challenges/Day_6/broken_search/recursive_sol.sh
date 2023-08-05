#!/bin/bash

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <target file>"
    exit 1
fi

# Define a recursive function to search for the target file
recursive_search() {
    local dir="$1"
    local target="$2"

    # Loop through entries (files and directories) in the given directory
    for entry in "$dir"/*; do
        if [ -f "$entry" ] && [ "$(basename "$entry")" = "$target" ]; then
            # If a file with the target name is found, print its path and exit
            echo "File found: $entry"
            exit 0
        elif [ -d "$entry" ]; then
            # If an entry is a directory, recursively search within it
            recursive_search "$entry" "$target"
        fi
    done
}

# Get the search directory and target file from command-line arguments
search_directory="$1"
target_file="$2"

# Check if the specified directory exists
if [ ! -d "$search_directory" ]; then
    echo "Directory not found: $search_directory"
    exit 1
fi

# Get the absolute path of the search directory
absolute_path=$(cd "$search_directory" && pwd)


# Initiate the recursive search
recursive_search "$absolute_path" "$target_file"

# If target file is not found, print an error message
echo "File not found: $target_file"
exit 1
