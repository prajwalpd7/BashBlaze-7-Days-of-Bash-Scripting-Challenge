#!/bin/bash

<<<<<<< HEAD
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
=======
# Display welcome message and list files/directories
echo "Welcome to the Interactive File and Directory Explorer!"
echo "Current path: $(pwd)"
echo -e "\nFiles and Directories in the Current Path:"
# /* is a glob pattern that matches all files and directories in the current directory
for item in ./*
do
     prefix="-"
     # 'du' -estimate file space usage , '-s'(short summary) tells
     # 'du' to display only the total size of the specified file or directory
     # '-h' display the size in human readable format 
     size=$(du -sh "$item" | cut -f1)
     # cut -f1 : we extract only the size portion and ignore the path
     name=$(basename "$item")
     echo "$prefix $name ($size)"
done
# Interactive loop
while true 
do
     # Ask the user to enter a line of text
     # Prompt the user to enter a line of text and store the input into the variable user_input
     read -p "Enter a line of text (Press Enter without text to exit): " user_input

     # Check if the user pressed Enter without entering any text (exit the loop in this case)
     # -z is a test operator used to check if the given string is empty
     if [ -z "$user_input" ] 
     then
         echo "Exiting the Interactive Explorer. Goodbye!"
         break
     fi

     # Count and display the number of characters in the entered text
     # '#' symbol, when used in this context, denotes the length of the variable's value.
     #  So, ${#user_input} returns the number of characters in the value of the user_input variable.
     echo "Character Count: ${#user_input}"
>>>>>>> a790195 (day02 Solution added)
done
