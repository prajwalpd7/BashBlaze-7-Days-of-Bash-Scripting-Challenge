#!/bin/bash


#####################################################################
# Script Name: day6_search_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 4, 2023
# Description: This script contains solution for Day 5-Log Analyzer and Report Generator as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day6_search_challange_solution.sh <directory-path> <target-file>
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################



######################

##Recursive Directory Search Challenge
#
#Description
#The "Recursive Directory Search" challenge is part of the day-6. In this challenge, participants are tasked with creating a Bash script that performs a recursive search for a specific file within a given directory and its subdirectories. The script provided for this challenge is not functioning correctly, and participants must fix and improve it to achieve the desired behavior.


#Challenge Details
#Objective: Your goal is to fix the provided Bash script, recursive_search.sh, and ensure it performs the recursive search as described below:

#The script should take two command-line arguments: the directory to start the search and the target file name to find.
#The search should be recursive, meaning it should look for the target file not only in the specified directory but also in all its subdirectories and their subdirectories, and so on.
#When the target file is found, the script should print the absolute path of the file and then exit.
#Proper error handling should be in place to handle cases where the directory does not exist or the target file is not found.

#If the target file target.txt exists within any of the subdirectories of test_files, the script should print the absolute path of the file. Otherwise, it should print "File not found: target.txt".




#####################


#checking if user provided two arguments or not
if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi


search_directory=$1
target_file=$2



# Checking if the specified directory exists or not
if [ ! -d "$search_directory" ]; then
    	echo
	echo "Error: Directory '$search_directory' is not found. Please provide the correct directory !!!"
    	echo
    	exit 1
fi


#Implementing the recursive search logic here

#this function will search in all sub directories and return the path of the file.
search_the_file() {

	local dir_to_search="$1"

	# Loop through each file in the directory
    	for file in "$dir_to_search"/*; do   #this will search all the directories
        	# Checking if the current file is the one we are looking for or not
        	if [ -f "$file" ] && [ "$(basename "$file")" = "$target_file" ]; then
            		echo "File has been found in the path: $file"
            		exit 1  #existing after i found the file otherwise it will keep on looing for the file.
				

        	# Check if the current file is a directory, then recursively search in it to go to subdirectories
        	elif [ -d "$file" ]; then
            		search_the_file "$file" "$target_file"
        	fi
    	done

	#explanation
	#"$file": This is the variable that contains the current file or directory path. It is taken from the loop,
	#basename "$file": The basename command is used to extract the base name of the file or directory from the full path. 
	#"$(basename "$file")": The $(...) syntax is used for command substitution. It executes the command within the parentheses and replaces it with the command's output. 
	#So, $(basename "$file") gives us the base name of the current file.
	#" = ": This is a comparison operator. It checks if the base name of the current file is equal to the target filename.

}

search_the_file $1 $2

echo "File not found: $target_file"
exit 1


