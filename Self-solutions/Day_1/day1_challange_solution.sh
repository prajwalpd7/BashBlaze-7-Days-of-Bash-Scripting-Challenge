#!/bin/bash

#####################################################################
# Script Name: day1_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: July 31, 2023
# Description: This script contains solution for all the 6 tasks for Day-1 part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day1_challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################

# set -x  Used it while debugging the script.

#Task 1: Comments
#In bash scripts, comments are used to add explanatory notes or disable certain lines of code. Your task is to create a bash script with comments explaining what the script does.

#Task_1 Solution:
     ## This is a comment in shell script


#Task 2: Echo
#The echo command is used to display messages on the terminal. Your task is to create a bash script that uses echo to print a message of your choice.

#Task-2 solution:
echo "This is Day-1 task-2 echo example"


#Task 3: Variables
#Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them.

#Task 4: Using Variables
#Now that you have declared variables, let's use them to perform a simple task. Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.


#Task-3 and Task-4 solution:
#note: Don't give space after '=' operand below , otherwise you will get errors
a=3
b=7
c=$(( a + b )) #The double parentheses are used for arithmetic evaluation in Bash. It allows you to perform arithmetic operations on numerical values within the shell script.
echo "sum of two elements $a + $b =  $c"

#Improvising the task3&4
echo "enter the first number: "
read a

echo "enter the second number: "
read b

c=$(( a + b  ))
echo "sum of $a and $b is $c"



#Task 5: Using Built-in Variables
#Bash provides several built-in variables that hold useful information. Your task is to create a bash script that utilizes at least three different built-in variables to display relevant information.

#task-5 solution:
echo "Disk  usage: "
df -h

echo "Checking exit status of the last commmand $?" #If we get 0 means successful

echo "To install any module, let's say net-tools for checking network connections"
sudo apt-get update
sudo apt-get install net-tools


echo "Checking network connections: "
echo "Display listening TCP and UDP ports"
netstat -tuln

#netstat -rn    # Display routing table


echo "Checking DNS resolution of google: "
nslookup www.google.com

echo "Checking if service is running: "
systemctl status ssh


#Task-6 Wildcards
#Wildcards are special characters used to perform pattern matching when working with files. Your task is to create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

#Task-6 solution:
#Wildcards in shell scripting are special characters used to represent one or more characters in a file or directory name. example ls, mv, cp rm etc. commonly used wildcards in shell scripting: 

#* (Asterisk): Represents zero or more characters.
ls *.txt # *.txt matches all files with the .txt extension within the directory.

#Wildcards are powerful tools for batch processing and manipulating files in shell scripts. However, it's essential to be cautious when using wildcards, especially with commands like rm.


