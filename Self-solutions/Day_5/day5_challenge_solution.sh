#!/bin/bash

#set -x


#####################################################################
# Script Name: day5_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 4, 2023
# Description: This script contains solution for Day 5-Log Analyzer and Report Generator as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day5_challange_solution.sh <logfile-path>
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################


#####################################  Day 5: Bash Scripting Challenge - Log Analyzer and Report Generator     ####################

######   Challenge Title: Log Analyzer and Report Generator   ###############

#Scenario
#You are a system administrator responsible for managing a network of servers. Every day, a log file is generated on each server containing important system events and error messages. As part of your daily tasks, you need to analyze these log files, identify specific events, and generate a summary report.

#Task
#Write a Bash script that automates the process of analyzing log files and generating a daily summary report. The script should perform the following steps:

#Input: The script should take the path to the log file as a command-line argument.

#Error Count: Analyze the log file and count the number of error messages. An error message can be identified by a specific keyword (e.g., "ERROR" or "Failed"). Print the total error count.

#Critical Events: Search for lines containing the keyword "CRITICAL" and print those lines along with the line number.

#Top Error Messages: Identify the top 5 most common error messages and display them along with their occurrence count.

#Summary Report: Generate a summary report in a separate text file. The report should include:

#Date of analysis
#Log file name
#Total lines processed
#Total error count
#Top 5 error messages with their occurrence count
#List of critical events with line numbers

#Optional Enhancement: Add a feature to automatically archive or move processed log files to a designated directory after analysis.

#Tips
#Use grep, awk, and other command-line tools to process the log file.
##Utilize arrays or associative arrays to keep track of error messages and their counts.
#Use appropriate error handling to handle cases where the log file doesn't exist or other issues arise.

#Sample Log File
#A sample log file named Sample_Log_Data.md has been provided in the same directory as this challenge file. You can use this file to test your script.

#i have used the above log_generator.sh from above and created the log file as logfile.log with 300 lines with multiple log levels.


#checking if user provided command line arguments or not if not displaying the below message.

logFilePath=$1

if [ "$#" == 0 ]; then
	echo
	echo "No arguments provide to the script so please follow below usage format !!!!"
    	echo "Usage: $0 <logfile_path>"
	echo
    	exit 1
fi

if [ -e "$logFilePath" ]; then
	#ignoring if path presents!!
	echo
	echo "Provided log file path is: $logFilePath"
	echo
else
	echo
	echo "Provided log file path is: $logFilePath"
    	echo "Path does not exist. So please provide the correct path. !!!"
	echo    
	exit 1
fi

# Function to count of loglevels of with their corresponding lines and print them

count_log_level() {
    
	local log_level="$1"
    	local log_level_count=$(grep -c "$log_level" "$logFilePath")
   	echo "####################" 
	echo
    	echo "$log_level log_level count is: $log_level_count"
	echo
}

# Calling the function for each log level to check the count.
count_log_level "INFO"
count_log_level "DEBUG"
count_log_level "ERROR"
count_log_level "WARNING"
count_log_level "CRITICAL"


#searching for lines containing the keyword "CRITICAL" and printing those lines along with the line number.

list_critical_events() {

	echo
	echo "printing the 'CRITICAL' log level occurences with their line numbers of logfile."
	echo
	grep -n "CRITICAL" "$logFilePath" | sed 's/^\([0-9]\+\):/Line number -\1 : /'
	echo

}

list_critical_events #calling this fucntion to print the critical events with their line numbers of logfile.

#Identifying the top 5 most common error messages and displaying them along with their occurrence count. 

# Declaring an array to store the 9 error messages
error_messages=( "Failed to connect" "Disk full" "Segmentation fault" "Invalid input" "Out of memory" "File not found" "Permission denied" "Connection refused" "Timeout" )

# Declaring an associative array to store error counts . associative arrays are similar to dictionaries in other programming languages. 
declare -A error_messages_count_array

all_loglevels_error_count=0

#for loop to count each error message in the log file
echo
echo "Printing all the error messages with it's count."
echo
for error_message in "${error_messages[@]}"; do
	log_level_count=$(grep -c "$error_message" "$logFilePath")   #here using grep -c to count the error message in logfile.
	error_messages_count_array["$error_message"]=$log_level_count     #here using storing the count in error_messages_count_array associative array with error_message key.
	all_loglevels_error_count=$(( all_loglevels_error_count + log_level_count  ))
	echo "$error_message: $log_level_count"
done
echo

#displaying top 5 error messages and their counts 

top_5_error_messages() {

	echo
	echo "Top 5 Error Messages are as follows: "
	sort -nr  <<< "$(for error in "${!error_messages_count_array[@]}"; do echo "${error_messages_count_array[$error]} - $error"; done)" | head -n 5
	echo
#above command explanation
#<<< : this command will pass the for loop output to sort command 
#sort command with -nr (numberically reverse ) will sort descendent the output with based on first filed that is error message count ). we can sort the second field using -k2 option with sort like (sort -nr -k2) but it's not working so sorting based on first field.
#and finally using head -n 5 top list out the top 5 error messages.

}

top_5_error_messages  #calling the function to print the top 5 error messages.



#Generating a summary report in a separate text file
date=$(date +"%Y-%m-%d-%H-%M-%S")  #storing date with this format looks like YYYY-MM-DD HH:MM:SS
#creating a log_report.txt file and checking if it exists or not before creating
log_filename="log_report-$date.txt"
archive_directory="LogArchive"


log_report_pattern="log_report-*"

#checking if all the files in current directory is starts with log_report-* text to moved it to archive directory.
for file in *; do
	# Check if the file is a regular file
    	if [[ -f "$file" ]]; then 
		#comparing two files if matches means old log file present hence,moving to archive
		if [[ "$file" == $log_report_pattern ]]; then
				echo
				echo "Old log file $file presents! Moving it to archive directory. !"
                        	mv "$file" "$archive_directory"  #moving the log file to archive directory..
		
		fi
	fi
done

touch "$log_filename"
echo
echo "New log file has been created ( $log_filename )"
echo

# Check if the directory exists
if [ -d "$archive_directory" ]; then
	echo
else #if directory not present then create directory.
	echo
	mkdir "$archive_directory"
	echo
fi



echo "Generating the report...."
echo
echo >> "$log_filename"

echo "                            Log Analasys report                               " >> "$log_filename"
echo >> "$log_filename"
echo "Date of analysis: $date" >> "$log_filename"  #date has been stored in report

echo "Log file name: $logFilePath" >> "$log_filename"

#checking how many number of lines present in the logfile.
line_count=$(grep -c "" "$logFilePath")   #grep is for searching text
				       #-c option is for counting the occurences of pattern
				       #"" is an empty pattern, which will match all lines in the file.

echo "Total lines processed: $line_count" >> "$log_filename"

echo "Total error count: $all_loglevels_error_count" >> "$log_filename" #i have calculaed this while counting the log levels above


top_5_error_messages >> "$log_filename"  #calling function and passing the output to report file

list_critical_events >> "$log_filename"  #calling fuction and passing the output to report file.

echo "Report file $log_filename has been generated !!! "
echo
echo "Showing the Analasys..."
echo
cat "$log_filename"
echo



