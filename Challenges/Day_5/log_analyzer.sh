#!/bin/bash

# Check if the user provided the log file path as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_logfile>"
    exit 1
fi

# Get the log file path from the command-line argument
log_file="$1"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file not found: $log_file"
    exit 1
fi

# Step 1: Count the total number of lines in the log file
total_lines=$(wc -l < "$log_file")

# Step 2: Count the number of error messages (identified by the keyword "ERROR" in this example)
error_count=$(grep -c -i "ERROR" "$log_file")

# Step 3: Search for critical events (lines containing the keyword "CRITICAL") and store them in an array
mapfile -t critical_events < <(grep -n -i "CRITICAL" "$log_file")

# Step 4: Identify the top 5 most common error messages and their occurrence count using associative arrays
declare -A error_messages
while IFS= read -r line; do
    # Use awk to extract the error message (fields are space-separated)
    error_msg=$(awk '{for (i=3; i<=NF; i++) printf $i " "; print ""}' <<< "$line")
    ((error_messages["$error_msg"]++))
done < <(grep -i "ERROR" "$log_file")

# Sort the error messages by occurrence count (descending order)
sorted_error_messages=$(for key in "${!error_messages[@]}"; do
    echo "${error_messages[$key]} $key"
done | sort -rn | head -n 5)

# Step 5: Generate the summary report in a separate file
summary_report="log_summary_$(date +%Y-%m-%d).txt"
{
    echo "Date of analysis: $(date)"
    echo "Log file: $log_file"
    echo "Total lines processed: $total_lines"
    echo "Total error count: $error_count"
    echo -e "\nTop 5 error messages:"
    echo "$sorted_error_messages"
    echo -e "\nCritical events with line numbers:"
    for event in "${critical_events[@]}"; do
        echo "$event"
    done
} > "$summary_report"

echo "Summary report generated: $summary_report"

