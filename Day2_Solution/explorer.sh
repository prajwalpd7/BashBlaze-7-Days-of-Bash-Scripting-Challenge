#!/bin/bash

# This is solution bash script of Day_2.0 Challenge.

# First line is called shebang it tells kernel which interpreter to be used to run the below commands.

# Day_2.0 challenge has two parts.

# Part 1 : File and Directory Exploration.

# Below echo command will give a welcome message.
echo "------------------------File and Directory Exploration---------------------"

echo "Welcome to Day2 of BashBlazeChallenge! "

echo "Thses are the list of directories and files along with their sizes, in the current path"

# Below command has two parts. First is "du -sh *", here du is a bash command that is used to get information about disk usage statistics. Option -s gives display for each specified entry. -h option gives output in human readable format.  "*" option gives sizes of all the files present in the current path. 

# The output of "du -sh *" is piped using [|] to be fed in to awk command. awk command first prints 2nd line which has files and directory  names and the 1st column that has files and directory size. Two paranthesis are "()" added to separate file name and size info.

du -sh * | awk -F " " '{print $2,"("$1")"}'

echo "--------------------------Character Counting-------------------------------"
# Part 2 : Character Counting

# Here I am using while loop to make the program run continuously, and continuously ask the user to enter a line of text or press Enter to stop and come out of the program.

while :
do
	echo -n "Enter a line of text or just press enter without text to exit"

# Bash read is a built-in utility command used to record the line entered by user.

# The text line entered by used is stored in variable "line"
	read -r line


# if loop is used to check if the user has pressed enter.If Enter is pressed the zero will be passed to read command.
# Expresion ${#line} is used to count characters. line is the parameter passed to the expression. The expression gives character count.

# Expression inside if [ ${#line} -eq 0 ] will check if value entered by user is equal to  0. If true then break command is given to come out of the program after "Enter was Hit" message was displayed.		
	if [ ${#line} -eq 0 ];
	then
		echo "Enter was hit by User"
# break command is given here to exit the loop.
		break
	else
# if user enters a text line then its calculated by ${#parameter} expression. And echo is used to display the value.
		echo "Character count: ${#line}"
	fi
# if loop is closed using fi
# while loop is closed using done
done

echo "-----------------------Exiting the Interactive Explorer. Thank You!--------------"

# Give execution permission to user using command
# chmod 700 filename
