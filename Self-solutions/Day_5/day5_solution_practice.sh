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


#################################  practice ####################

#practice-1
#practicing to count the occurrences of each log level ("INFO," "DEBUG," "ERROR," "WARNING," "CRITICAL") in a given log file using shell scripting
#use the grep and wc commands.
#!/bin/bash

log_file="path/to/your/log_file.log"

# Count occurrences of each log level and store them in variables
info_count=$(grep -c "INFO" "$log_file")
debug_count=$(grep -c "DEBUG" "$log_file")
error_count=$(grep -c "ERROR" "$log_file")
warning_count=$(grep -c "WARNING" "$log_file")
critical_count=$(grep -c "CRITICAL" "$log_file")

# Print the counts
echo "INFO count: $info_count"
echo "DEBUG count: $debug_count"
echo "ERROR count: $error_count"
echo "WARNING count: $warning_count"
echo "CRITICAL count: $critical_count"



#practice-2
#practicing to print the occurrence lines along with their counts
#!/bin/bash

log_file="path/to/your/log_file.log"

# Function to count occurrences of each log level and print them
count_logs() {
    local level="$1"
    local count=$(grep -c "$level" "$log_file")
    echo "$level count: $count"
    if [ "$count" -gt 0 ]; then
        grep "$level" "$log_file" | awk '{print NR, $0}'
    fi
    echo "-------------------"
}

# Call the function for each log level
count_logs "INFO"
count_logs "DEBUG"
count_logs "ERROR"
count_logs "WARNING"
count_logs "CRITICAL"

#explaining the below line
grep "$level" "$log_file" | awk '{print NR, $0}'

#grep "$level" "$log_file": This part uses the grep command to search for lines containing the log level specified by the variable $level in the log file specified by the variable $log_file.
#|: The vertical bar, also known as the pipe symbol |, is used to connect the output of one command as the input to another command. In this case, it takes the output of the grep command and passes it as input to the awk command.
#awk '{print NR, $0}': This part uses the awk command to manipulate and format the output from grep. awk is a powerful text processing tool that can operate on individual fields of each line.
#NR: It is a built-in awk variable that stores the current line number. awk '{print NR, $0}' prints the line number NR followed by the entire line $0.
#$0: It is a built-in awk variable that represents the entire current line.
#o, when you combine grep "$level" "$log_file" and awk '{print NR, $0}' using the pipe symbol |, it will search for lines containing the log level specified by $level in the log file specified by $log_file


#practice-3
#practicing to To find the count of lines with "CRITICAL" log level and display their line numbers in the log file
grep -n "CRITICAL" "$log_file"


#practice-4
#practicing to check if a path exists or not in shell scripting using the -e flag with the test command or the equivalent [ -e ... ] construct. 
#Using the test command:

if test -e "/path/to/directory_or_file"; then
    echo "Path exists."
else
    echo "Path does not exist."
fi

#Using the [ ] construct (note that there should be spaces inside the brackets):
if [ -e "/path/to/directory_or_file" ]; then
    echo "Path exists."
else
    echo "Path does not exist."
fi


#practice-5
#practicing to  add some text with each line number while using the grep -n command to search for "CRITICAL" in the log file
#can achieve this using the sed command to replace the line numbers with your desired text.
grep -n "CRITICAL" "$log_file" | sed 's/^\([0-9]\+\):/Line \1:/'

#we can add space after the original line number by modifying the sed command. 
grep -n "CRITICAL" "$log_file" | sed 's/^\([0-9]\+\):/Line \1: /'
#The only change here is the addition of a space after the replacement text "Line \1:". This will insert a space after the original line number, giving you the desired output with the space after each line number.

#practice-6
#practicing to identify the top 5 most common error messages and display them along with their occurrence count
##we can use a combination of grep, sort, and uniq commands in shell scripting. 
#Assuming the error messages are logged in a file named error.log, 
grep -o "ERROR .*" error.log | sort | uniq -c | sort -nr | head -5
#Explanation of each part of the command:
#grep -o "ERROR .*" error.log: This command extracts all lines that start with "ERROR" from the error.log file.
#sort: This sorts the extracted error messages alphabetically.
#uniq -c: This counts the occurrences of each unique error message and adds the count in front of each message.
#sort -nr: This sorts the error messages based on the occurrence count in descending order, so the most common errors appear at the top.
##head -5: This displays only the top 5 most common error messages along with their occurrence count.


#practice-7
#practicing To count and list the top 5 occurrences of each log level (INFO, DEBUG, ERROR, WARNING, CRITICAL) from the logfile,
#!/bin/bash

logfile="your_log_file.log"

# Function to count and list the top 5 occurrences of a log level
count_and_list_log_level() {
    log_level="$1"
    echo "Top 5 occurrences of $log_level:"
    grep -o "$log_level .*" "$logfile" | sort | uniq -c | sort -nr | head -5
    echo
}

# Call the function for each log level
count_and_list_log_level "INFO"
count_and_list_log_level "DEBUG"
count_and_list_log_level "ERROR"
count_and_list_log_level "WARNING"
count_and_list_log_level "CRITICAL"


#practice-8
#practicing arrays in shell scripting
#Arrays in shell scripting allow you to store multiple values under a single variable name. Shell scripts support one-dimensional arrays. You can access individual elements, loop through the array, and perform various operations on it.

#Declaring an array:
# Declare an array
my_array=("value1" "value2" "value3")
#Accessing array elements:
# Access an element using its index (starts from 0)
echo "${my_array[0]}" # Output: value1
echo "${my_array[1]}" # Output: value2
#Assigning values to array elements:
# Assign values to individual elements
my_array[2]="new_value"
#Getting the length of the array:
# Get the length of the array
length=${#my_array[@]}
echo "Array length: $length" # Output: Array length: 3
#Looping through an array:
# Loop through the array using a for loop
for item in "${my_array[@]}"; do
    echo "$item"
done
#Appending elements to the array:
# Append elements to the end of the array
my_array+=(value4 value5)
#Removing elements from the array:
# Remove a specific element from the array
unset my_array[2]

# Remove all elements from the array
unset my_array
#Using array in command substitution:
# Command substitution with an array
result=$(ls -l) # Stores the output of "ls -l" command in the "result" variable
echo "$result"


#practice-8
#practicing to store 6 error messages in array and count each error message in logfile and store each error message with its count and in the end display the top 5 error messages based on with its count in shell scripting. 
#!/bin/bash

# Declare an array to store error messages
error_messages=("Error: File not found" "Error: Permission denied" "Error: Connection refused" "Error: Invalid input" "Error: Timeout" "Error: Out of memory")

# Declare an associative array to store error counts
declare -A error_counts

# Log file path
log_file="path/to/your/logfile.log"

# Count each error message in the log file
for error in "${error_messages[@]}"; do
    count=$(grep -c "$error" "$log_file")
    error_counts["$error"]=$count
done

# Display error messages with their counts
echo "Error Messages and their Counts:"
for error in "${!error_counts[@]}"; do
    echo "$error: ${error_counts[$error]}"
done

# Display the top 5 error messages based on their counts
echo "Top 5 Error Messages:"
sort -nr -k2 <<< "$(for error in "${!error_counts[@]}"; do echo "$error ${error_counts[$error]}"; done)" | head -n 5

#-k2 option not working so use below command
sort -nr  <<< "$(for error in "${!error_counts[@]}"; do echo "${error_counts[$error]} $error"; done)" | head -n 5
#for error in "${!error_counts[@]}"; do echo "${error_counts[$error]} $error"; done: This loop iterates through the associative array error_counts and echoes each error message with its count in the format "count error_message".
#<<<: This is a Here String in Bash, which feeds the output of the preceding loop as input to the next command.
#|: The pipe symbol (|) is used to pass the sorted output to the next command.
#head -n 5: This command selects the top 5 lines from the sorted output, displaying the error messages with the highest counts.
#sort -nr will sort based on first firled of the out of for loop by defualt


#practice-9
#practing associative arraysin shell scripting
#in shell scripting, associative arrays are similar to dictionaries in other programming languages. They allow you to store key-value pairs, where each key is unique and maps to a specific value. The key-value pairs in an associative array can be accessed, added, modified, or deleted using the key.
#we can create an associative array using
declare -A my_array
#The -A option indicates that the array is associative
#assign values to the array using the keys:
my_array["key1"]="value1"
my_array["key2"]="value2"
#To access the values,
echo ${my_array["key1"]} # This will print "value1"
#we can iterate through the associative array using a for loop:
for key in "${!my_array[@]}"; do
    echo "Key: $key, Value: ${my_array[$key]}"
done
#Keep in mind that associative arrays are available in Bash version 4 and above. If you are using an older version of Bash, you won't be able to use associative arrays.

#practice-10  but not worked out
#practicing other way of sort based on occurrence count in the shell script.
#One common approach is to use the awk command to rearrange the fields in the desired order before sorting. 
for error in "${!error_counts[@]}"; do
    echo "${error_counts[$error]} $error"
done | awk '{print $2, $1}' | sort -nr | head -n 5


#practice-10
#practicing to use the date command to print the current date and time in a formatted manner. To pass the formatted date to a text file,
# Get the current date in a specific format (e.g., YYYY-MM-DD HH:MM:SS)
formatted_date=$(date +"%Y-%m-%d %H:%M:%S")

# Print the formatted date to the terminal
echo "Current date: $formatted_date"

# Append the formatted date to a text file
echo "Current date: $formatted_date" >> output.txt
#The echo command is used to print the formatted date to the terminal, and the >> redirection appends the output to the output.txt file
##to create a new file or overwrite an existing one, you can use > instead of >>.

#to ass more text into the same file in the next line using the >> redirection operator
# Append the second line to the file
echo "This is the second line." >> output.txt
##This will append the text to the end of the file on a new line.


#practice-11
#practicing to create a text file and check if it already exists in shell scripting
#!/bin/bash

filename="example.txt"

# Check if the file already exists
if [ -e "$filename" ]; then
    echo "File already exists."
else
    # Create the file
    touch "$filename"
    echo "File created: $filename"
fi


#practice-12
#practicing to check the number of lines in a file using various methods in shell scripting. 
#Using wc command:
#!/bin/bash

filename="example.txt"

# Check the number of lines in the file
line_count=$(wc -l < "$filename")

echo "Number of lines in $filename: $line_count"
#Using grep and wc:
#!/bin/bash

filename="example.txt"

# Check the number of lines in the file
line_count=$(grep -c "" "$filename")

echo "Number of lines in $filename: $line_count"
#Using a loop:
#!/bin/bash

filename="example.txt"
line_count=0

# Count lines using a loop
while IFS= read -r _; do
  ((line_count++))
done < "$filename"

echo "Number of lines in $filename: $line_count"

#explaining this line 
line_count=$(grep -c "" "$filename")

#grep is a command-line utility in Linux used for searching text patterns in files.
#-c is the option for counting the number of occurrences of the pattern.
#"" is an empty pattern, which will match all lines in the file.
#"$filename" is the variable that holds the name of the file you want to search.


#practice-13:
#practicing To pass the output of a function to a file in shell scripting, 
#use command substitution and output redirection
my_function > output.txt
my_function >> output.txt
# use the >> redirection operator for append 


#practice-14
#practicing to use a for loop to iterate through the files in the current directory and check if the filename starts with 'log_report-'. 
#!/bin/bash

log_report="log_report-*"  # The prefix you want to check

# Loop through all files in the current directory
for file in *; do
	if -e $file[ ]
	 	# Check if the file starts with the specified prefix
    		if [[ "$file" == "$log_report" ]]; then  #use vairiable only dont use direct text here
        		echo "$file starts with '$log_report'"
        		# You can add more actions here if needed
    	fi
	fi
done
#the [[ ... ]] construct is used for the string comparison

#practice-15
#practicing to use the -d flag with the test or [ command to check if a directory is present in the current directory.
#!/bin/bash

directory_name="my_directory"  # The name of the directory you want to check

# Check if the directory exists
if [ -d "$directory_name" ]; then
    echo "Directory '$directory_name' exists in the current directory."
    # You can add more actions here if needed
else
    echo "Directory '$directory_name' does not exist in the current directory."
fi










