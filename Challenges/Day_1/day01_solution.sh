#!/bin/bash

#Task 1: Comments
# First line of the script is the shebang which tells the system how to execute and is used to specify the correct shell to use for a shell script

# Task  2: Echo 
# Used for displaying lines of text or string which are passed as arguments on the command line

echo "Hello , Welcome to my GitHub"


# Task  3: Variables
# A variable is a character string to which we assign a value, we have assigned "Hello" to f1 and "Doston" to f2

f1="Hello"
f2="doston"

# Task  4: Using Variables
# In this we takes/ read two numbers as input and print their sum.
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

sum=$((num1 + num2))
echo "Sum of $num1 and $num2 is: $sum"

# Task  5: Using Built-in Variables 
# Builtin shell variables are predefined

echo "My current bash path - $BASH"
echo "Bash version I am using - $BASH_VERSION"
echo "PID of bash I am running - $$"
echo "My home directory - $HOME"
echo "Where am I currently? - $PWD"
echo "My hostname - $HOSTNAME"
echo "I am Using - $OSTYPE"

# Task  6: Wildcards
# Allow the matching of files in an abstracted way

echo "Files with .sh extension in the current directory:"
ls *.sh	
echo " lets create 10 txt files using single command"
touch day{1..10}.txt


#Make sure to provide execution permission with the following command:
#chmod +x day1_script.sh
