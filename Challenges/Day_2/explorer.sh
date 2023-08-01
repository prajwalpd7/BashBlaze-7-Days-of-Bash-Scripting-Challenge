#!/bin/bash

echo -e "Welcome to the Interactive File and Directory Explorer!\n"

echo "Files and Directories in the Current Path:"

# First we are using ls -shl command which prints out list of all files and directories
# in PWD, along with its sizes in human readable format, such as 1GB, 200MB etc.
# After receiving output of ls -shl, we pipe it to awk command which extracts the
# filename present in 10th column ($10), and the size of file present in 1st column ($1)
# We have avoided the first line (NR>1) because first line contains the header of the output.
echo "`ls -shl | awk 'NR > 1 {print "- " $10 " " "("$1")" }'`"
echo -e "\n"

# Now we will be running an infinite while loop which continously accepts sentences, and
# prints the number of characters in that sentence
# This loop will run until the user inputs an empty string.
while [[ true ]];
do
	read -p "Enter a line of text (Press Enter without text to exit): " SENTENCE
	length=${#SENTENCE}
	# If input is an empty line, then exit the script
	if [[ $length -eq 0 ]]; then
		echo "Exiting the Interactive Explorer. Goodbye!"
		break
	fi

	echo "Character Count: $length"
done

