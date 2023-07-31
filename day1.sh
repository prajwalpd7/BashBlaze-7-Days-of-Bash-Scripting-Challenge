ubuntu@ip-172-31-23-12:~/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge$ vim day1.sh 





























#!/bin/bash

# The first line above is called shebang "#!", this tells the kernal which interpreter should be used to run the commands present in the file. In this case the kernel will execute /bin/bash day1.sh


# This is a bash script and it contains tasks given in "#TWSBashBlazeChallenge" by DevOps Mentor Mr.Shubham Londhe
echo "Task 1 has been completed inside the shell script day1.sh"

#-----------------------------------------------------------------------------------------------------------------

# Task 1 of challenge for Day 1 is to create a bash script with comments explaining what the script does.


#-----------------------------------------------------------------------------------------------------------------

echo "Task 2 : "
# Task 2 : Printing a messege of my choice using echo command as shown below.

echo "Bhooooom! Lets Bash it Off!"

#-----------------------------------------------------------------------------------------------------------------

echo "Task 3 : "
# Task 3 : Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them.

# Lets begin by declaring two variables namely variable_1 and variable_2 and assigning them values 4 and 7 respectively.

variable_1=4

variable_2=3

echo "Value of variable_1 is assigned as $variable_1"
echo "Value of variable_2 is assigned as $variable_2"
#-----------------------------------------------------------------------------------------------------------------

echo "Task 4 :"
# Task 4 : Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.

sum=$(( $variable_1 + $variable_2 ))

# In the above line I am adding two variables using "+" and assigning the sum to a variable called "sum".

# In the below line I am prining the value of sum using echo command.

echo " The sum of variale_1 and variable_2 is $sum"

#-----------------------------------------------------------------------------------------------------------------

echo "Task 5 : "
# Task 5 : Create a bash script that utilizes at least three different built-in variables to display relevant information. 

# In this task I am giving few important Shell Built-in variables that can be very helpful in knowing current shell, current PID, current user and current file name.

# 1.  Shell built in variable "$SHELL" stores the path to the shell program that is being used.
echo "The path of the shell program that is currently being used is  $SHELL"

# 2. Shell built in variable "$$" gives the value of the PID of the current shell.

echo "PID of the current shell is $$ "

# 3. Shell built in variable "USER" gives the name of the current user.

echo "I am $USER, the current user of this session"

# 4. Shell built in variable "$0" gives the current file name or file name of this shell script.

echo "Name of the file that is currently being executed is $0 "


#-----------------------------------------------------------------------------------------------------------------

echo "Task 6 :"
# Task 6 : Create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

# There are three basic sets of wild cards in linux. They are  "*","?" and "[]". In below example I am using "*" wildcard to list files with .md extention in the directory.

echo "Files with .md extention present in the current directory are :"
ls *.md

#-----------------------------------------------------------------------------------------------------------------

#Give read, write and execution permission to user for the file using below command.
# sudo chmod 700 day1.sh
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
~                                                                                                                                                                                        
                                                                                                                                                                       59,1          All

