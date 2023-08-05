#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.




#####################################################################
# Script Name: day6_mystery_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 5, 2023
# Description: This script contains solution for Day 6-The Mysterious Script as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day5_mystery_challange_solution.sh <input-file> <output-file>
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################



#################################################
#Day 6 Bash Scripting Challenge: The Mysterious Script

#Introduction
#Welcome to Day 6 of the 7-day Bash scripting challenge! In this challenge, you will encounter a mysterious Bash script named mystery.sh. The script lacks documentation and comments, leaving its purpose and functionality shrouded in mystery. Your mission is to unravel the secrets of this script, understand its objective, and improve it by adding comments and explanations.

#Challenge Steps
#Explore the Script
#Begin by examining the contents of mystery.sh. The script contains various Bash commands, functions, or variables without any comments or explanations. Make note of any patterns or interesting code segments that might give you hints about the script's purpose.

#Run the Script
#Execute mystery.sh using the command bash mystery.sh and observe its behavior. Pay attention to any output or changes in the system that might occur during the script's execution.

#Debugging and Decoding
#Identify and fix any potential errors or bugs in the script that may prevent it from running correctly. Analyze the logic of the script to understand how it processes data or performs operations.

#Identify the Objective
#Based on your observations and analysis, determine the main objective of the script. What is it trying to accomplish? Try to reverse-engineer the script's logic to understand its intended purpose.

#Add Comments and Explanation
#Now that you have a good understanding of the script's purpose, modify mystery.sh to add clear and concise comments at crucial points in the code. Explain the logic behind each major operation and any critical decisions made during the script's execution.

#Optimize (Optional)
#If you think there are opportunities to optimize the script's performance or make it more efficient, you can implement those changes. However, this step is entirely optional.


####################################



# The Mysterious Function

mysterious_function() {

    	local input_file="$1"
    	local output_file="$2"
    
    	# 
    	#encrypting the data there in the input file using ROT13 encryption technique and pass it to output file by overridiing.
	#ROT13 is a simple encryption technique that rotates each letter in the alphabet by 13 positions. 
	#It is also known as the Caesar Cipher with a shift of 13. ROT13 operates only on letters and leaves other characters unchanged.
	#If it is a lowercase letter from 'a' to 'm', add 13 to its ASCII code.
	#If it is a lowercase letter from 'n' to 'z', subtract 13 from its ASCII code.
	#If it is an uppercase letter from 'A' to 'M', add 13 to its ASCII code.
	#If it is an uppercase letter from 'N' to 'Z', subtract 13 from its ASCII code.
	#Keep all other characters (non-letters) unchanged.
    	tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    	# trying to reverse the text each line of text file in output file But as per analysys it is the culprit to confuse. LOL !!
    	#Hence, i am commenting the both rev commands 
    	#reason: below we are reversing the each line but again while going to loop we are again re-reversing the lines means again using the same text without reversing like we have data in input-file at the initial time. so commenting these two commands.
    
	#rev "$output_file" > "reversed_temp.txt"

    	# 
    	random_number=$(( ( RANDOM % 10 ) + 1 ))
	#set -x
	touch temp_enc.txt ##creating the temp file to do the ROT13 technique.
    	
	# Mystery loop: 

	#so this loop will not needed but what is assume is , this may used to encrypt the data with random number of times to just to play with the data
	#so just using this loop to perform encryption for random number of times and showing the data to the user.
	#if random number is ODD then the output file will have the normal text(decrypted text) because we if we perform ROT13 technique on same file for ODD number of times then it will be in decrypted format and including initial encrypt the output file will have decrypted format of the data. for EVEN it will be vise-versa.
    	for (( i=0; i<$random_number; i++ )); do
        	# Commenting the below rev command also because no use of above and this command as mentioned above.
       		#rev "reversed_temp.txt" > "temp_rev.txt"

        	# 
        	tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$output_file" > "temp_enc.txt"

        	#here one more culprit LOL! but changed as per my requirement to enhance. 
        	mv "temp_enc.txt" "$output_file"  #after moving the data from temp file this file will be removed automatically by mv command.
    	done

	echo 
	echo "After $random_number times encryption with ROT13 encryption technique on the input file $input_file. The output file looks like "
	echo
	cat $output_file
	echo

    	# Clean up temporary files is not required as i did not used this variable so just commenting.
    	#rm "temp_rev.txt"

    	# The mystery continues...
    	# The script will continue with more operations that you need to figure out!

	#i think the above line also should be culprit to confuse as we don't have any operations to do now. 
	#encrypting and descrypting is already done.

	#But as a end goal of the script i wanted to show the option to user to descrypt the data in the file by providing the options to chooose.
	
	if ((random_number % 2 == 0)); then
    		#if the random_number is even then that means the data is still in encrypted as we already encrypting above the loop one time.
		read -p "The data looks to be in encrypted format. Do you want to decrypt it (Y/N)? " userOption
		if [ $userOption == "Y"  ]; then
			touch temp_enc.txt #creating the temp file again to do the decrypting.
			tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$output_file" > "temp_enc.txt"
			mv "temp_enc.txt" "$output_file"
			echo
			echo "Now the data has been decrypted successfully !!"
			echo "Showing the content of file below!!"
			echo
			cat $output_file
			echo
		else
			echo
			echo "Data is not decrypted !!!"
			echo
		fi
	else
    		echo "Exiting .."
	fi
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
echo
