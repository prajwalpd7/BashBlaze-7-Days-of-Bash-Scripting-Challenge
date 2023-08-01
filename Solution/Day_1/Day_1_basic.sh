#!/bin/bash
#Below is an example of the shebang statement. First line of the script is the shebang which tells the system how to execute.

## Task 1: Comments

In bash scripts, comments are used to add explanatory notes or disable certain lines of code. Your task is to create a bash script with comments explaining what the script does.

## Task 2: Echo date
echo "Hello World !!"

##Task 3: Variables
## Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them.

fName="John"
lName="Doe"
city="Bengaluru"

# printing the variable referenced by their name

echo "Name: $fName"
echo "Last Name:" $lName
echo "City:" $city



## Task4: Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.

sum=$(( $1 + $2 ))

echo "Sum is: $sum"

## Task5: Script that utilizes at least three different built-in variables
echo "My current bash path - $BASH"
echo "Bash version I am using - $BASH_VERSION"
echo "PID of bash I am running - $BASHPID"
echo "My home directory - $HOME"
echo "Where am I currently? - $PWD"
echo "My hostname - $HOSTNAME"

## Task6 : Utilizes wildcards to list all the files with a specific extension in a directory
echo "Files with .txt extension in the current directory:"
ls *.txt

#Make sure to provide execution permission with the following command:
#chmod +x Day1_basic
# .sh