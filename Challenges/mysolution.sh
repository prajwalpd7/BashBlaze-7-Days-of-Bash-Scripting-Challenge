#!/bin/bash

# In bash scripts, comments are used to add explanatory notes or disable certain lines of code. Your task is to create a bash script with comments explaining what the script does.

# This is the first script challenge of BreadcrumbsBashBlaze-7-Days-of-Bash-Scripting-Challenge

#-------------------------

# The echo command is used to display messages on the terminal. Your task is to create a bash script that uses echo to print a message of your choice.

echo 'Excited for the BreadcrumbsBashBlaze-7-Days-of-Bash-Scripting-Challenge'

#-------------------------

# Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them.

name=Shubham

#-------------------------

# Now that you have declared variables, let's use them to perform a simple task. Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.

num1=5
num2=10
sum=$(expr $num1 + $num2)
echo "The sum of two numbers is $sum"

#-------------------------

# Bash provides several built-in variables that hold useful information. Your task is to create a bash script that utilizes at least three different built-in variables to display relevant information.

echo "My home directory is $HOME, Trying to access with user $USER in the present working directory $PWD"

#-------------------------

# Wildcards are special characters used to perform pattern matching when working with files. Your task is to create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

ls *.txt



