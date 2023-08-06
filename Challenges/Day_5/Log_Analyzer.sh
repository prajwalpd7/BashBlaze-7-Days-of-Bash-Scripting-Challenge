#!/bin/bash

# Check if a log file path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Error: Log file path not provided."
    echo "Usage: $0 <log_file_path>"
    exit 1
fi

log_file="$1"
summary_file="Day_5/summary_$(date +'%Y-%m-%d').txt"
archive_dir="/home/gopal/Pictures/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/Day_5"  
error_keyword="ERROR\|Failed"
critical_keyword="CRITICAL"

# Count total lines and error count
total_lines=$(wc -l < "$log_file")
error_count=$(grep -i -c "$error_keyword" "$log_file")

# Print total error count
echo "Total error count: $error_count"

# Print critical events with line numbers
echo "Critical events:"
grep -i -n "$critical_keyword" "$log_file"

# Extract error messages and their counts
top_errors=$(cat "$log_file" | awk -F'] |- ' '{print $2}' | sort | uniq -c | sort -nr | head -n 6 | tail -n 5)

# Generate summary report
echo "Date of analysis: $(date +'%Y-%m-%d %H:%M:%S')" > "$summary_file"
echo "Log file name: $log_file" >> "$summary_file"
echo "Total lines processed: $total_lines" >> "$summary_file"
echo "Total error count: $error_count" >> "$summary_file"
echo "Top 5 error messages:" >> "$summary_file"
echo "$top_errors" >> "$summary_file"
echo "Critical events:" >> "$summary_file"
grep -i -n "$critical_keyword" "$log_file" >> "$summary_file"

echo "Summary report generated: $summary_file"


if [ -n "$archive_dir" ]; then 
    archive_file="$archive_dir/$(basename $log_file)_$(date +'%Y%m%d%H%M%S').log"   
    mv $log_file $archive_file
    echo "Log file archived: $ $archive_dir"
fi