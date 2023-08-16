#!/bin/bash

# Usage: ./log_generator.sh <log_file_path> <num_lines>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <log_file_path> <num_lines>"
    exit 1
fi

log_file_path="$1"
num_lines="$2"

if [ -e "$log_file_path" ]; then
    echo "Error: File already exists at $log_file_path."
    exit 1
fi

# List of possible log message levels
log_levels=("INFO" "DEBUG" "ERROR" "WARNING" "CRITICAL")

# List of possible error messages
error_messages=("Failed to connect" "Disk full" "Segmentation fault" "Invalid input" "Out of memory", "Could not connect to DB", "No Value returned from DB")

critical_messages=("Failed to connect to AWS service", "Server Restarted - Out of Memory", "Could not generate JWT Token")

# Function to generate a random log line
generate_log_line() {
    local log_level="${log_levels[$((RANDOM % ${#log_levels[@]}))]}"
    local error_msg=""
    if [ "$log_level" == "ERROR" ]; then
        error_msg="${error_messages[$((RANDOM % ${#error_messages[@]}))]}"
    fi
    if [[ $log_level = "CRITICAL" ]];then
	    error_msg=${critical_messages[$((RANDOM % ${#critical_messages[@]}))]}
    fi
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$log_level] $error_msg"
}

# Create the log file with random log lines
touch "$log_file_path"
for ((i=0; i<num_lines; i++)); do
    generate_log_line >> "$log_file_path"
done

echo "Log file created at: $log_file_path with $num_lines lines."
