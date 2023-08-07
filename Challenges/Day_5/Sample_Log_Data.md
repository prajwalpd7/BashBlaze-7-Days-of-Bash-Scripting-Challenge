# Welcome, Challenger!

## Sample Log Data for Testing

Congratulations on reaching Day 5 of the 7-day Bash scripting challenge! To assist you in testing your log analyzer and report generator script, we have something below.

## Create Your Own Data

Feeling adventurous? If you want to go beyond the provided sample data(which you won't find because i haven't uploaded it ), you can generate your own log data using the `log_generator.sh` script. This script allows you to create log files with custom log levels, error messages, and line counts.

**How to Generate Your Own Log Data:**

1. Execute the `log_generator.sh` script with the desired log file path and the number of lines you want to generate.
2. Customize the `log_levels` and `error_messages` arrays in the script to tailor the log data to your needs.

Remember, the more diverse log data you test with, the better you can fine-tune your script!

Wishing you the best of luck in this challenge. Happy scripting!

---

```Bash
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
error_messages=("Failed to connect" "Disk full" "Segmentation fault" "Invalid input" "Out of memory")

# Function to generate a random log line
generate_log_line() {
    local log_level="${log_levels[$((RANDOM % ${#log_levels[@]}))]}"
    local error_msg=""
    if [ "$log_level" == "ERROR" ]; then
        error_msg="${error_messages[$((RANDOM % ${#error_messages[@]}))]}"
    fi
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$log_level] $error_msg - $RANDOM"
}

# Create the log file with random log lines
touch "$log_file_path"
for ((i=0; i<num_lines; i++)); do
    generate_log_line >> "$log_file_path"
done

echo "Log file created at: $log_file_path with $num_lines lines."

```

---

Usage:
To use the log generator script, participants can execute the following command:

```
./log_generator.sh /path/to/logfile.log 100
```

> This will create a log file named "logfile.log" in the specified path with 100 random log lines. Participants can adjust the number of lines as needed for testing their log analyzer and report generator scripts.

The log lines generated will have timestamps, log levels (INFO, DEBUG, ERROR, WARNING, CRITICAL), and randomly chosen error messages for lines with "ERROR" log level.
