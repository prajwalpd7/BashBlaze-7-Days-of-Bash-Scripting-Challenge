#!/bin/bash

# This Whole Function tois to  display welcome message and list files and directories.
function list_files_and_directories() {
    echo "Welcome to File and Directory Exploration!" #Echo Welcome Message
    echo "Listing all files and directories of $PWD:" #List All Files of Current Directories
    ls -lh | awk '{print "- "$9 " (" $5 ")"}'
}

# Function to count characters in user input
function count_characters() {
    echo "Enter a line of text (press Enter without any text to exit):"
    while read -r line; do
        if [ -z "$line" ]; then 
            echo "Exiting the character counting."
            break
        fi
        characters=$(echo -n "$line" | wc -m)
        echo "Number of characters: $characters"
    done
}
