#!/bin/bash

# Display welcome message and list files and directories in the current path
echo "Welcome to the File and Directory Explorer!"
# List files and directories in the current path with their sizes in human-readable format
ls -lh | awk '{print $9 "\t" $5}'
while true; do

    #Prompt the user to enter a line of text
    read -p "Enter a line of text (Press Enter to exit): " input
    
    #Read user's input until an empty string is entered
    if [ -z "$input" ]; then
        echo "Exiting the File and Directory Explorer. Goodbye!"
        exit 0
    fi

    #Count the number of characters in the entered line of text
    char_count=$(echo -n "$input" | wc -m)
    echo "Character count: $char_count"
done
