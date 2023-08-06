#!/bin/bash

# Check if the correct number of command-line arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

# Get the process name from the command-line argument
process_name="$1"

# Set the maximum number of restart attempts and the notification threshold
max_attempts=3
notification_threshold=2

# Initialize the counter for restart attempts
restart_attempts=0

# Continuous loop to monitor and restart the process
while true
 do
    # Check if the specified process is running
    if pgrep -x "$process_name" >/dev/null; then
        echo "Process '$process_name' is running."
        restart_attempts=0  # Reset restart attempts if the process is running
    else
        # Check if restart attempts are within the limit
        if [ "$restart_attempts" -lt "$max_attempts" ]; then
            echo "Process $process_name is not running. Attempting to restart..."
            
            # Add the command to restart the process here
            sudo systemctl restart "$process_name"

            # Increment the restart attempts counter
            ((restart_attempts++))  
        else
            echo "Maximum restart attempts reached. Please check the process manually."
            
            # Send notification if restart attempts reach the threshold
            if [ "$restart_attempts" -ge "$notification_threshold" ]; then
                echo "Sending email notification to administrators..."
                subject="Process Monitoring Alert"
                message="Process '$process_name' failed to restart after $max_attempts attempts."
                
                # Send email using the mail command
                echo -e "$message" | mail -s "$subject" srahul.sr0502@gmail.com
            fi
            # Exit the script with an error status
            exit 1  
        fi
    fi
    # Adjust the interval as needed before checking agains
    sleep 5  # Adjust the interval as needed before checking again
done