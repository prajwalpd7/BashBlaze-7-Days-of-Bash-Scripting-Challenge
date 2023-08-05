#!/bin/bash

#####################################################################
# Script Name: day_2.0_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 1, 2023
# Description: This script contains solution for Day 2 Bash Scripting Challenge - Interactive File and Directory Explorer part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day_2.0__challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################

####################Day 2 Bash Scripting Challenge - Interactive File and Directory Explorer
#Welcome to Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that serves as an interactive file and directory explorer. The script will allow you to explore the files and directories in the current path and provide a character counting feature for the user's input.

####################Challenge Description#######################
#The script will have two main parts:

###################Part 1: File and Directory Exploration
          #Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
          #For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the ls command with appropriate options.
          #The list of files and directories will be displayed in a loop until the user decides to exit the explorer.
##################Part 2: Character Counting
          #After displaying the file and directory list, the script will prompt the user to enter a line of text.
          #The script will read the user's input until an empty string is entered (i.e., the user presses Enter without any text).
          #For each line of text entered by the user, the script will count the number of characters in that line.
          #The character count for each line entered by the user will be displayed.

	
#################Example Interaction
   #$ ./explorer.sh
   #Welcome to the Interactive File and Directory Explorer!

#Files and Directories in the Current Path:
#- file1.txt (100 KB)
#- dir1 (2 MB)
#- script.sh (3 KB)
#...

#Enter a line of text (Press Enter without text to exit): Hello, this is a sample line.
#Character Count: 27

#Enter a line of text (Press Enter without text to exit): Another line to count.
#Character Count: 25

#Enter a line of text (Press Enter without text to exit):
#Exiting the Interactive Explorer. Goodbye!

echo
echo "Welcome to the Interactive File and Directory Explorer!"
while true; do #this will be worked as infinite loop in shell script
	
	echo
	echo "Files and Directories in the Current Path:"
	
	#This extract each and every directory and file in current path using $PWD and for loop to iterate over every item
	for directoryItemName in $PWD/*; do 

		if [ -f "$directoryItemName"  ]; then #checking if the item is file then we use ls -lh to get the file size
			directoryItemSize=$(ls -lh "$directoryItemName" | awk '{print $5}') #we are using awk command to extract the 5th item from ls output

		elif [ -d "$directoryItemName"  ]; then #here we are checking if item is directory or not using -d
			directoryItemSize=$(du -sh "$directoryItemName" | awk '{print $1}')  #using du -sh for directory size as ls will not gonna give and extractin												    g the first argument for size.
		fi

		directoryItemBaseName=$(basename "$directoryItemName") #using basename keyword to extract only name of the file otherwise we wil get whole path
		echo "- $directoryItemBaseName ($directoryItemSize)"

	done	
	echo
	read -p "Enter a line of text (Press Enter without text to exit): " userInputString #taking input from the user using read with -p argument , if we mention                 										   -p then it will ask the prompt and store the input to variable.
	if [ -z "$userInputString" ]; then  #checking if the statement length is 0 using -z means it is empty then we will exit the infinite loop.
		echo "Exiting the Interactive Explorer. Goodbye!"
		echo
		break #using break to exit from the infinite loop
	else
		characterCountOfStatement=$( echo -n "$userInputString" | wc -c  ) #counting the characters of a statement using wc -c means word count with -c      									argument for character counting. and we are eliminating newline with the help of echo -n here.
		echo "Character Count: $characterCountOfStatement"
	fi
done


#########################################################################################
#practice-1
#practicing infinite loop in shell script
#!/bin/bash

while true; do
    # Your code inside the infinite loop goes here

    # Example: Ask the user for input
    read -p "Enter 'exit' to stop the loop: " user_input

    # Check if the user wants to exit
    if [ "$user_input" = "exit" ]; then
        echo "Exiting the loop."
        break
    fi
done




#practice-2
#check if the user entered an empty string by comparing the input variable with an empty string. 
#!/bin/bash

read -p "Enter your input: " user_input

if [ -z "$user_input" ]; then
    echo "You entered an empty string."
else
    echo "Your input is: $user_input"
fi

#practice-3:
#practicing to get the file and directory size in a human-readable format. The -h option (or --human-readable) formats the sizes into KB, MB, GB, etc.
#!/bin/bash

# Replace "path/to/your/file_or_directory" with the actual file or directory path
path="path/to/your/file_or_directory"

# Get the size in human-readable format using du command
size=$(du -h "$path")

echo "Size of $path: $size"

#practice-4:
#practicing to get all the files and directories in specified path and get the size and its basename
#!/bin/bash

# Replace "path/to/your/directory" with the actual directory path
directory="path/to/your/directory"

# Loop through each item in the directory
for item in "$directory"/*; do
    # Get the size and name of the file/directory in human-readable format using ls command
    size=$(ls -lh "$item" | awk '{print $5}')
    name=$(basename "$item")

    echo "$name: $size"
done


#practice-5:
#practiciing to get the word count of statment 
#!/bin/bash

# Replace "Your statement here" with the actual statement you want to count characters for
statement="Your statement here"

# Get the character count using echo and wc commands
char_count=$(echo -n "$statement" | wc -c)

echo "Character count: $char_count"


#practice-6:
#practicing to check if the directory is having file or directory and extracting size based on the type and using ls -h and du -sh for file and directory accordingly.
#!/bin/bash

# Replace "path/to/your/directory" with the actual directory path
directory="path/to/your/directory"

# Loop through each item in the directory
for item in "$directory"/*; do
    if [ -f "$item" ]; then
        # For files, get the size using ls command
        size=$(ls -lh "$item" | awk '{print $5}')
    elif [ -d "$item" ]; then
        # For directories, get the size using du command
        size=$(du -sh "$item" | awk '{print $1}')
    fi

    name=$(basename "$item")

    echo "$name: $size"
done





