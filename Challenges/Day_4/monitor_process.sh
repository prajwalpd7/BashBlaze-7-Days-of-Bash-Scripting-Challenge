#!/bin/bash

# Function to check if a process is running
is_process_running() {
    if systemctl is-active --quiet "$1"; then
        return 0  # Process is running
    else
        return 1  # Process is not running
    fi
}


# Function to restart the process
restart_process() {
    echo "Process  $1 is not running. Attempting to restart..."
    sudo systemctl restart $1
}

# Check if a process name is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Error: Process name not provided."
    echo "Usage: $0 <process_name>"
    exit 1
fi

process_name=$1
max_attempts=3
current_attempts=0

# Monitor loop
while true; do
    if is_process_running "$process_name"; then
        echo "$process_name is running."
    else
        if [ "$current_attempts" -lt "$max_attempts" ]; then
            restart_process "$process_name"
            current_attempts=$((current_attempts + 1))
        else
            echo "Maximum restart attempts reached. Please check the process manually."
            exit 1
        fi
    fi
    sleep 5  # Adjust interval as needed
done



