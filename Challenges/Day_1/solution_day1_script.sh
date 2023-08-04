#!/bin/bash
# Author: Yashraj Jaiswal
# Date: 01-08-2023
# Description: #TWSBashBlazeChallenge Day - 1

# Task 1: Comments
# - Comments are lines in a script that are ignored by the interpreter and help us describe the script.

# Task 2 : echo
echo "Today is Day 1 of #TWSBashBlazeChallenge an amazing bash scripting challenge"

# Task 3: Variables

# declaring and initializing variables
name = "Yashraj Jaiswal"
interests = "web dev | devops"

# Task 4: Using Variables

echo "Hello, my name is $name and I am interesed in $interests"

# Task 5: Using Built-in Variables
#use built-in variables from bash to print useful information

# print the host name
echo "Hostname: $HOSTNAME"

# print the current user
echo "Current user: $USER"

# print the current working directory
echo "Current directory: $PWD"

# Task 6: Wildcards

# using * wild card to search for files ending in .txt
ls -al *.txt

# using ? wild card to search for files names ending with a single unknown character
ls -al file?.txt

# using [] wild card to search for files that start with 'file' and have numbers 0-5
ls -al 'file[0-5]'.txt

