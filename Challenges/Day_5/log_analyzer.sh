#!/bin/bash

if [[ $# -eq 0 || $# -gt 1 ]];then
	echo "Usage: $0 <path to log file>"
	exit 1
fi

# Task 1: Take path to log file as input from command line argument
logFilePath=$1

if [[ ! -f $logFilePath ]];then
	echo "No File  $logFilePath found"
	exit 1
fi

# Task 2: Count Number of lines with Log Level as ERROR
countErrors() {
	echo "`grep -c -E "ERROR|FAILED" $logFilePath`"
}

# Task 3: Print lines containing log level 'CRITICAL'along with it line numbers
getCriticalLogs(){
	echo "`grep -nie "critical" $logFilePath`"
}

# Task 4: Identify top 5 most common error messages and display them with occurence count
getTopFiveErrorMessages() {
	echo "`grep -iE "ERROR|CRITICAL" $logFilePath | sort | uniq -c | sort -nr | head -n 5`"
}

# Task 5: Generate Summary Report text file
generateSummaryReport() {
	local SUMMARY_REPORT_FOLDER=$1
	local BEGINNING="---- BEGIN ----"
	local END="---- END ----"
	# Checking if summary report directory exists
	if [[ ! -d $SUMMARY_REPORT_FOLDER ]];then
		mkdir -p $SUMMARY_REPORT_FOLDER
		if [[ $? -ne 0 ]];then
			echo "An error occurred while trying to create folder for summary reports"
			exit 1
		fi
	fi

	date=`date +%Y%m%d`
	summaryFileName="${SUMMARY_REPORT_FOLDER}/${date}_summary_report.txt"
	# if summary report file does not exist in the folder then create the file
	if [[ ! -f $summaryFileName ]];then
		touch $summaryFileName
		if [[ $? -ne 0 ]];then
			echo "Could not create summary file"
			exit 1
		fi
	fi

	# Adding data to file
	echo "$BEGINNING" >> $summaryFileName
	echo "Log File Path: $logFilePath" >> $summaryFileName
	echo "Date: `date`" >> $summaryFileName 
	echo "Total Lines Processed: `wc -l $logFilePath`" >> $summaryFileName
	echo "Total Error Count: `countErrors`" >> $summaryFileName
	echo "Top 5 Messages With Their Occurence Count:" >> $summaryFileName
	echo "`getTopFiveErrorMessages`" >> $summaryFileName
	echo "Critical Events Found:" >> $summaryFileName
	echo "`getCriticalLogs`" >> $summaryFileName
	echo "$END" >> $summaryFileName

	echo "File created at $summaryFileName"
}

ARCHIVE_FOLDER="./archived_logs"
generateSummaryReport "./summaryReport"
if [[ $? -eq 0 ]];then
	# ENHANCEMENT TASK
	# If summary report was successful, then move the log file to archive folder
	if [[ ! -d $ARCHIVE_FOLDER ]];then
		mkdir -p $ARCHIVE_FOLDER
	fi

	cp "$logFilePath" "$ARCHIVE_FOLDER"

	if [[ $? -eq 0 ]];then
		echo "Log file $logFilePath moved to $ARCHIVE_FOLDER"
		# Did not use mv cmd because the fie should only be deleted from src directory if copy was successful
		rm $logFilePath
	else
		echo "ERROR: could not copy log file to archive directory"
	fi
fi
