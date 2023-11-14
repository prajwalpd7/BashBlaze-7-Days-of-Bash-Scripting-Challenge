#!/bin/bash

echo "Log Analyzer & Report Generator"

# Check if a log file path is provided as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

log_file="$1"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi

# Count and print the total error count based on keywords using grep
count_errors=$(grep -ciE "Error|failed" "$log_file")
echo -e "\nNumber of errors found in log file: $count_errors"

# Printing critical errors 
critical_error=$(grep -n "CRITICAL" "$log_file")
echo -e "\nThese are the lines containing the keyword 'CRITICAL':"
echo -e "\n$critical_error"

# Identify and display top 5 most common error messages with occurrence count
top_errors=$(grep -iE "error|failed" "$log_file" | sort | uniq -c | sort -nr | head -n 5 | awk '{$1=$1; for(i=1;i<=NF;i++) { printf "%-2s ", $i } printf "\n"}')
# Display the results with left-aligned columns
echo -e "\nTop 5 most common error messages:"
echo "___________________________________"
echo "$top_errors"

# Generate Summary Report
summary_file="summary_report.txt"

{
    echo "Date of analysis: $(date)"
    echo "Log file name: $log_file"
    echo "Total lines processed: $(wc -l < "$log_file")"
    echo "Total error count: $count_errors"
    echo -e "\nTop 5 error messages with occurrence count:"
    echo "$top_errors"
    echo -e "\nList of critical events (with line numbers):"
    echo "$critical_error"
} > "$summary_file"

echo -e "\nSummary report generated: $summary_file"

# Ask the user if they want to archive the log file
read -p "Do you want to archive the log file? (y/n): " choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    read -p "Enter the destination directory for archiving: " destination_dir
    if [ ! -d "$destination_dir" ]; then
        echo "Creating destination directory: $destination_dir"
        mkdir -p "$destination_dir"
    fi

    archive_name=$(basename "$log_file").$(date +"%Y%m%d%H%M%S").tar.gz
    tar -czvf "$destination_dir/$archive_name" "$log_file"
    echo -e "\nLog file archived to: $destination_dir/$archive_name"
else
    echo "You chose not to archive the log file."
    echo "Thank you for using our script."
fi

