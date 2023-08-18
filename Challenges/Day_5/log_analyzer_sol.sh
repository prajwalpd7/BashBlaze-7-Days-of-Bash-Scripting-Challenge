#!/bin/bash

echo "Welcome to Log Analyzer"

log_path="$1"

# Function to extract errors count
function err_count(){
    error_count=$(grep -i  "Error\|Failed" $log_path | wc -l)
    echo "Number of Errors in log file: $error_count"
}

# Function to print critical errors
function critical(){
    critical_issues=$(grep -i -n "Critical" $log_path)
    echo "These are the Critical logs"
    echo "$critical_issues"
}

# Function to extract top 5 common logs
function common_logs(){
    number_of_top_messages=5
    most_frequent_log=$(tr -cs '[:alpha:]' '[\n*]' < ~/Desktop/logfile.log | sort | uniq -ci | sort -nr | head  -5 | awk '{ print $2 " ------ "$1}')

    echo "The most common Log Messages are (showing top 5)"
    echo "Log Message ---- Count"
    echo "$most_frequent_log"
}

# Function to export summary to a file
function export(){

        echo "Date of Analysing logs : $(date)"
        echo -e "\nName of log file: $log_path"
        echo -e "\nNumber of lines processed: $(wc -l $log_path | awk '{print $1}')\n"
        err_count;
        echo
        critical;
        echo
        common_logs
}

#Calling the functions
err_count;critical;common_logs

# Asking user to export summary
read -p "Do you want to export the summary of log analytics to a seperate file [Y/N]: " response

if [[ $response == "Y" ]] || [[ $response == "y" ]]; then
    echo "Exporting summary of log analytics to a seperate file."
    export > $( dirname $log_path )/log_summary.txt
else
    echo "Thanks for using our script"
fi

# Moving the log file to another location after analysis
echo "Analysis complete. Moving the logfile to $HOME"
mv $log_path ~
