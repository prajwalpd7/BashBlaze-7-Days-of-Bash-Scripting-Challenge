#!/bin/sh

#Task1: Comments
#This script showcases the use of Comments in the Script. Comments are used to add explanatory notes or disable certain lines of code.

#Task2: Echo
#The echo command is used to display messages on the terminal
echo "Let's learn DevOps together"

#Task3: Variabes
#Variables in bash are used to store data and can be referenced by their name. 
name="Kunwar Shashwat"
age=32
country="India"

#Task4: Using Variables
#this sections takes two numbers as input and print their sum.
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

sum=$((num1 + num2))
echo "Sum of $num1 and $num2 is: $sum"

#Task5: Using Built-in Variables
#Bash provides several built-in variables that hold useful information. 
echo "Script name: $0"
echo "User running the script: $USER"
echo "Current working directory: $PWD"

#Task6: Wildcards
#Wildcards are special characters used to perform pattern matching when working with files. 
extension=".txt"
echo "Files with '$extension' extension:"
ls *$extension
