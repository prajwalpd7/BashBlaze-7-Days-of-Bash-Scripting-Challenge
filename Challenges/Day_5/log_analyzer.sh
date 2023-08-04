#!/bin/bash

<<<<<<< HEAD
# Check if the user provided the log file path as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_logfile>"
    exit 1
fi

# Get the log file path from the command-line argument
=======
echo "Log Analyzer & Report Generator"

# Check if a log file path is provided as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

>>>>>>> 6224192 (Day5 solution script added)
log_file="$1"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
<<<<<<< HEAD
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
=======
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
>>>>>>> 6224192 (Day5 solution script added)

