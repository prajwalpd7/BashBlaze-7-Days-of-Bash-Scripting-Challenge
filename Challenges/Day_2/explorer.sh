
###################################################################
# Author: Sasiram Beeke
# Date: 01/08/2023
# Description: Interactive File and Directory Explorer
# Tip: to execute shell give permision +x scriptname
###################################################################

#!/bin/bash
echo "Welcome to the Interactive File and Directory Explorer!"
echo "Files and Directories in the Current Path:"
ls -lh| awk '{print $9, "(" $5 ")"}'
while true; do
 # Ask the user if they want to exit the explorer
    read -p "Enter a line of text (press Enter without text to exit):" input

    # Check the user's choice
    if [[ -z "$input" ]];then
        break
    fi
     echo "Character count:$(echo -n "$input" | wc -m)"  
done
    echo "Exiting the Interactive Explorer. Goodbye!"
