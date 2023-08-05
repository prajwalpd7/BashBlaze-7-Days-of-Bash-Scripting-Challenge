#!/bin/bash

set -x

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

## There are more as follows

#Download a file using wget: wget http://example.com/file.zip
#Generate an SSH key pair: ssh-keygen -t rsa -b 4096
#Install Python dependencies from requirements.txt: pip install -r requirements.txt
#Monitor log files in real-time: tail -f /var/log/<log_file>
#Search for a specific pattern in files: grep "pattern" /path/to/files/*
#Check the content of a log file: cat /var/log/<log_file>
#Use curl to test APIs or URLs: curl http://example.com/api
#Restart a service: sudo systemctl restart <service_name>
#Create a backup of a directory using tar: tar -czvf backup.tar.gz /path/to/directory
#View running processes: ps aux
#Monitor system resources with top: top
#to check and list all runnig services: systemctl list-units --type=service --state=running
                                       #service --status all
## Display the name of the script file:  echo "Script name: $0"
# Display the number of arguments passed to the script: echo "Number of arguments: $#"
## Display the process ID of the current script: echo "Process ID of the current script: $$"
## Display the parent process ID: echo "Parent process ID: $PPID"
## Display the username of the current user: echo "Current username: $USER"
# Display the home directory of the current user: echo "Home directory: $HOME"
# Display the exit status of the last executed command: echo "Exit status of the last command: $?"
## Display the current working directory: echo "Current working directory: $PWD"


##


#Task-6 Wildcards
#Wildcards are special characters used to perform pattern matching when working with files. Your task is to create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

#Task-6 solution:
#Wildcards in shell scripting are special characters used to represent one or more characters in a file or directory name. example ls, mv, cp rm etc. commonly used wildcards in shell scripting: 

#* (Asterisk): Represents zero or more characters.
#Example: *.txt matches all files with the .txt extension.
ls *.txt

#? (Question Mark): Represents a single character.
#Example: file?.txt matches files like file1.txt, file2.txt, etc.

#[] (Square Brackets): Represents a range of characters or a character set.
#Example: [aeiou] matches any vowel character.
#Example: [0-9] matches any digit.

#! (Exclamation Mark): Negates the pattern.
#Example: !*.txt matches all files except those with the .txt extension.

#{} (Curly Braces): Used for brace expansion, which generates multiple strings based on a pattern.
#Example: file{1,2,3}.txt expands to file1.txt, file2.txt, file3.txt.

#Wildcards are powerful tools for batch processing and manipulating files in shell scripts. However, it's essential to be cautious when using wildcards, especially with commands like rm, to avoid accidentally deleting important files. Always double-check your patterns before executing commands with wildcards.

















