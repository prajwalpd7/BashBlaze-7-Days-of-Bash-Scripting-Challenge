#####################################################################################
# Author: Sasiram Beeke
# Date: 31/07/2023
# Description: Basics of shell scripting.
# Tip: to execute shell give permision +x scriptname
#####################################################################################

#!/bin/bash
echo '############### Task1 Comments start here #####################################'
echo '############### With single lineComment #######################################'
echo "welcome to my first example for single line comment"
#echo "this line us for comment purpose"
echo "single line comment  example ends here" ## in this by usng # symbol we can give single line comment
echo '############### using << With multi line comment ##############################'
<<EOF
echo "this is example for multi line comment"
echo "multi line comment example"
EOF
echo 'after multiline comment code print here' # in this by usng << multiline comment in used.
echo '############ using : operator with multi line comment #########################'
: '
echo "this is first line"
echo "this is second line"
echo "this is third line"
'
echo "this is fourth line"  # in this by using : operator multiline commnet is used.
echo '##################Task1 Comments ends here ####################################'

echo '################## Task2 echo starts here #####################################'
echo "echo is used to display text or message in terminal"
echo "welcome to the shell scripting"  #in this both echo statement prints whatever message is gien to display in terminal
echo '################## Task2 echo Ends here #######################################'

echo '################# Task3 variables starts here #################################'
name="sasiram beeke"
echo "my name is $name"
address='pune'
echo "I am from $address"
echo "I am $name and i am from $address" #in this name and address are variables which are used to store values.
echo '################# Task3 variables ends here ###################################'

echo '################## Task4 using variables addition starts here #################'
echo 'Enter first number'
read a
echo 'Enter second number'
read b
echo "Addition for $a and $b is:- $((a+b))"  #it will accept user input and print addition of it
echo '################## Task4 using variables addition ends here ###################'

echo '################## Task5 built-in variables starts here #######################'
echo "todays date is `date`" ##describe current date
echo "$0"  ##describe name of your file or script
echo "$#"  ##describe number of arguments passed to the script
echo "$USER"  ##desribe current username of the user
echo "$SHELL" ##describe path to the shell program being used
echo '################## Task5 built-in variables ends here #########################'

echo '################### Task6 wildcards starts here ###############################'
echo "All text files which are available in current directory:"
ls *.txt  #it will display all text files using * wildcard
echo '################### Task6 wildcards ends here #################################'

