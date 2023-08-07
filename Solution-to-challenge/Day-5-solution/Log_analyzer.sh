#!/bin/bash


logfile="$1"

#To cheeck whether a file is specified on the terminal or not
	if [ $# -ne 1 ];
	then
		echo "Usage: $0 <log-file>"
		exit 1
	fi	

#To check whether the log file specified is really a file and to check whether it does exist or not
	if [ ! -f "$logfile" ];
	then
		echo "Error: logfile $logfile does not exist"
		exit 1
	fi
#To Analyze the log file and count the number of error messages present i.e the ones that has the keyword Error or Failed present in them
Error_count=0

while IFS= read -r line;
do
	if [[ $line == *"ERROR"* || $line == *"FAILED"* ]];
	then
		(( Error_count++ ))
	fi
done < "$logfile"
echo "Number of error messages: $Error_count "

#To search for lines with the keyword "CRITICAL" and then print out the lines along with their line numbers
Line_number=0
while IFS= read -r line;
do
	(( Line_number++ ))
	if [[ $line == *"CRITICAL"* ]];
	then
		echo "Line $Line_number: $line"
	fi
done < "$logfile"

#To identify the top 5 most common error messages and display them along with the number of times they appear
Error_messages=$(grep -E "ERROR|FAILED" "$logfile")

echo "Most Common Error Messages: "
echo "$Error_messages" | sort | uniq -c | sort -nr | head -n 5

Current_date=$(date "+%Y-%m-%d %H:%M:%S")

#To count the total lines
Total_lines=$(wc -l < "$logfile")

#To count the total number of errors
Total_number_of_errors=$(grep -cE "ERROR|FAILED" "$logfile")

#Generate summary report
Summary_report="Summary Report
Date_of_analysis: $Current_date
Log_file_name: 	$logfile
Total_lines_processed: $Total_lines
Total_error_count: $Total_number_of_errors

Top 5 error messages with their occurence count:
$(grep -E "ERROR|FAILED" "$logfile" | sort | uniq -c | sort -nr | head -n 5)
List of critical events with line numbers:
$(awk '/CRITICAL/ { print "Line " NR ": " $0 }' "$logfile")"

#To save the summary report to a different text file
Summary_file="Summary_report.txt"
echo "$Summary_report" > "$Summary_file"

echo "Summary_report_generated: $Summary_file"

#To automatically archive or move processed log files to a designated directory after analysis

#To define a designated directory for the archived log files
archive_dir="Archive_directory"

#To Generate a filename  
archive_filename=$(date "+%Y%m%d%H%M%S")_"$(basename "$log_file")"


#Move the logfile to the archived directory
mv "$logfile" "$archive_dir/$archive_filename"
