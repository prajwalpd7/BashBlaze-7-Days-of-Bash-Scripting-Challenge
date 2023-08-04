#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 02/08/2023
# Description: #TWSBashBlazeChallenge Day-2
# Task 1: Interactive File and Directory Explorer

# print a welcome message for the user
echo Welcome to the Interactive File and Directory Explorer!
# Format and display files and directories with their size in human readable format
echo "Files and Directories in current path - $PWD"
ls -lh | sed 1d | awk '{print "- ",$NF,"\t","(",$5,")"}'

# Infinite loop to continiously take user input
while true;
do
    # prompt user to enter a text
    echo -n "Enter a line of text (Press Enter without text to exit)"
    read input
    # use -z option to test for empty string
    if [[ -z $input ]];
    then
        echo Exiting the interactive explorer. Goodbye!
        exit
    else
        # bash built-in string length
        input_length=${#input}
        # print the character count on screen
        echo "Character count $input_length"
    fi
done

