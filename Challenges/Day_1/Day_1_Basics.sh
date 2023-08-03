#!/bin/bash

# Welcome to Day 1 of the Bash Scripting Challenge! Today, we will cover the basics of bash scripting to get you started. Let's dive in:

# Task 1: You can add comments by adding '#' before any sentence to make it a comment. Usually it is a best practice to add comments before the program/ code to let reader know what next line will do.
# or we can add comments along with code line for better understading of that particular line of code.

# Task 2: Echo. The echo command is used to display messages on the terminal. 
# Let's print a message of our choice.
echo "Welcome to the World of Bash Scripting!"
echo ''

# Task 3: Variables. Variables in bash are used to store data and can be referenced by their name. 
# Let's create two variables 'num1' and 'num2' and assigns some integer values to them.
# CAUTION! : DO NOT ADD SPACES WHILE ASSIGNING VALUES TO VARIABLES.
var1=5
var2=10

name='Randhawa Verma'     # You can assign string as well to the variables just like we added integers above.


# Task 4: Using Variables.
# Let's Create a bash script that takes above created two numbers as input and prints their sum using those variables.
# First we will create a new variable called sum and add the two numbers. INFO - Use $ sign before variable name to use the variable.
sum=$(( $var1 + $var2 ))    #$(()) will evaluate the expression we provided in it.
echo 'Total of the two variables'  $var1  'and'  $var2 'is:' $sum
echo ''


# Task 5: Using Built-in Variables. Bash provides several built-in variables that hold useful information. 
# Let's Use following three built-in - $#, $@ & $?. When running script, we need to provide arguments like this ./Day1_script.sh 1 2 3 4
echo 'Using $#, Numbers you entered total are:' $#
echo 'Using $@, You entered following numbers:' $@
echo 'Using $?, Let us confirm if last command was successful or not. (0 is for Yes)' $?
echo ''

# $# = Tells number of arguments passed. 
# $@ = What parameters were passed to the command line. 
# $? = Was last command successful. If Answer is 0 that means 'yes'.


# Task 6: Wildcards. Wildcards are special characters used to perform pattern matching when working with files. 
# Let's create a bash script that lists all the files with a specific extension in a directory.
# let's print all script files i.e. to print files with .sh extension.
echo "Listing all scripts in the current directory- "
ls *.sh
