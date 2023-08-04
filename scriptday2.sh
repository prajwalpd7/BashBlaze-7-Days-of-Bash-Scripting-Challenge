#!/bin/bash
echo "list files and directories"
ls -lh
# Display welcome message
echo "Welcome to the Line Character Count Script!"

# Read user input in a loop
while true; do
    read -p "Enter a line of text (or press Enter to quit): " input

    # Check if input is empty
    if [ -z "$input" ]; then
        echo "Exiting the script. Goodbye!"
        break
    fi

    # Calculate character count
    char_count=${#input}

    # Display character count
    echo "Character count for the entered line: $char_count"
done
