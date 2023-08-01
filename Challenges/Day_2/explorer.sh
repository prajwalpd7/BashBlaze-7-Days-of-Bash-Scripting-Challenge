#!/bin/bash

# Part 1: File and Directory Exploration

# Welcome message
echo "Welcome to the Explorer!"
echo "This script will list all files and directories in the current path."
echo "-----------------------------------------------------------------------"
# List files and directories
echo "Files and Directories in the current path:"
ls

# Welcome message
echo "Welcome to the Explorer!"
echo "This script will list all files and directories in the current path with their sizes."
echo "------------------------------------------------------------------------------------------"
# List files and directories with human-readable sizes
echo "Files and Directories in the current path with their sizes:"
ls -lh

#!/bin/bash

while true; do
    echo "Enter the directory path (or 'exit' to quit):"
    read directory

    if [ "$directory" = "exit" ]; then
        echo "Exiting the explorer."
        break
    fi

    if [ ! -d "$directory" ]; then
        echo "Error: Not a valid directory path. Please try again."
        continue
    fi

    echo "Files and directories in $directory:"
    echo "---------------------------------"

    ls -lh "$directory"

    echo "---------------------------------"
done

