#!/bin/bash

# Part 1: File and Directory Exploration
echo "Welcome to the Interactive File and Directory Explorer!"

while true; do
    # List all files and directories in the current path
    echo "Files and Directories in the Current Path:"
    ls -lh

    # Part 2: Character Counting
    read -p "Enter a line of text (Press Enter without text to exit): " input

    # Exit if the user enters an empty string
    if [ -z "$input" ]; then
        echo "Exiting the Interactive Explorer. Goodbye!"
        break
    fi

    # Calculate and print the character count for the input line
    char_count=$(echo -n "$input" | wc -m)
    echo "Character Count: $char_count"
done
