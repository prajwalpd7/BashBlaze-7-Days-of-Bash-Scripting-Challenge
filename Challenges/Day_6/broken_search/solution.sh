#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory="$1"
target_file="$2"

# Function to perform recursive search for the target file
function search_recursive {
  local current_dir="$1"

  # Iterate through the contents of the current directory
  for file in "$current_dir"/*; do
    if [ -d "$file" ]; then
      # If the current item is a directory, call the function recursively with the subdirectory
      search_recursive "$file"
    elif [ -f "$file" ] && [ "$(basename "$file")" = "$target_file" ]; then
      # If the current item is a file and its name matches the target file, print its absolute path and exit
      echo "File found: $file"
      exit 0
    fi
  done
}

# Check if the provided directory exists
if [ ! -d "$search_directory" ]; then
  echo "Error: Directory '$search_directory' not found."
  exit 1
fi

# Start the recursive search by calling the search_recursive function with the provided search directory
search_recursive "$search_directory"

# If the loop completes without finding the target file, display a "File not found" message and exit with an error
echo "File not found: $target_file"
exit 1
