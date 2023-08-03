#!/bin/bash

## Task 1: Comments

# This is a bash script to automate the deployment process.

## Task 2: Echo

# Display a welcome message
echo "Welcome! This is Day 1 of the Bash Script Challenge initiated by Shubham Londhe Sir..."

## Task 3: Variables

# Declare and assign a variable
Var1="Gopal"

# Print the result
echo "Hi, My Name Is $Var1"

## Task 4: Using Variables

# Read input from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Calculate the sum of the two numbers
sum=$((num1 + num2))

# Print the result
echo "The sum of $num1 and $num2 is: $sum"

## Task 5: Using Built-in Variables

# Get the current date and time
current_date_time=$(date)

# Get the username of the current user
current_user=$(whoami)

# Get the hostname of the system
hostname=$(hostname)

# Display the information
echo "Current date and time: $current_date_time"
echo "Current user: $current_user"
echo "Hostname: $hostname"

## Task 6: Wildcards

# Specify the directory path
directory="/home/gopal/Pictures/BashBlaze-7-Days-of-Bash-Scripting-Challenge"

# Specify the file extension you want to search for
extension=".txt"

# Use the wildcard * to match files with the specified extension in the directory
files_with_extension=$(ls "$directory"/*"$extension")

# Check if any files with the specified extension were found
if [ -z "$files_with_extension" ]; then
    echo "No files with the extension $extension found in the directory $directory."
else
    echo "Files with the extension $extension in the directory $directory:"
    echo "$files_with_extension"
fi

