#!/bin/bash

# Welcome Message for the user
echo 'Welcome to the Interactive File and Directory Explorer!'
echo ''
echo 'Files and Directories in the Current Path:'
# echo ''

# Using ls command to list all the content in current path. 
# -lhR flags with print items in listing format showing size in human readable format recursively.
# awk command will filter out only file or folder name and their size.
# sed will delete the lines with blank () in the output.
ls -lhR | awk 'NF>0 {print $9 "("$5")"}' | sed '/()/d'


# Creating a while loop which will ask user to provide any line of text and as show total characters in that line as output.
# Pressing Enter key will exit out of the program.
while true
do
    read -p "Enter a line of text (Press Enter without text to exit): " line_of_text
    if [[ $line_of_text = "" ]]; 
    then echo "Exiting the Interactive Explorer. Goodbye!" 
    break
    else
    echo "No. of characters: ${#line_of_text}"
    fi
done


