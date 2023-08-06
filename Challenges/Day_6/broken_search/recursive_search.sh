#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 05/08/2023
# Description: #TWSBashBlazeChallenge Day-6
# Task part -3 : fix the recursive search script

if [ $# -ne 2 ]; then
    echo "Usage : ./recursive_search.sh <directory> <target_file>"
    exit 1
fi

search_dir="$1"
target_file="$2"

# Function to perform recursive search for the target file
function recursive_file_search {
    local current_dir="$1"
    
    # Loop through the contents of the current directory
    for file in "$current_dir"/*; do
        if [ -d "$file" ]; then
            # If the current item is a directory, call the recursive_file_search function to check within the sub directory
            recursive_file_search "$file"
            elif [ -f "$file" ] && [[ "$(basename "$file")" == "$target_file" ]]; then
            # If the current item is a file and its name matches the target file, print a success message
            # then print the absolute path of the file
            echo "File found!!!"
            echo "Absolute path of $target_file - $file"
            exit 0
        fi
    done
}

# Check if the provided directory exists
if [ ! -d "$search_dir" ]; then
    echo "Error: Directory '$search_dir' not found."
    exit 1
fi

# Start the recursive search by calling the recursive_file_search function with the provided search directory
recursive_file_search "$search_dir"

# If the loop completes without finding the target file, display a "File not found" message and exit with an error
echo "File not found: $target_file"
exit 1
