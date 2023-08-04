#!/bin/bash

# Task 1 - Process Selection: 

# Check if a process name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

process_name="$1"

# Monitor the process
while true; do
    if ps aux | grep -v grep | grep "$process_name" > /dev/null; then
        echo "Process '$process_name' is running."
    else
        echo "Process '$process_name' is not running."
    fi
    sleep 5  # Check every 5 seconds
done




# Task 2 - Process Existence Check:

# Function to check if a process is running
is_process_running() {
    if pgrep "$1" >/dev/null 2>&1; then
        return 0  # Process is running
    else
        return 1  # Process is not running
    fi
}

# Specify the process name you want to check
process_to_check="$1"

if [ -z "$process_to_check" ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

if is_process_running "$process_to_check"; then
    echo "The process '$process_to_check' is currently running."
else
    echo "The process '$process_to_check' is not running."
fi



# Task 3 - Restarting the Process:

#!/bin/bash

echo "Stopping Nginx..."
sudo systemctl stop nginx

# Add a delay to allow time for the service to stop
sleep 2

if pgrep -x "nginx" > /dev/null; then
    echo "Failed to stop Nginx."
    exit 1
fi

echo "Nginx stopped successfully."

# Here you can add any additional actions before starting Nginx again

echo "Starting Nginx..."
sudo systemctl start nginx

# Add a delay to allow time for the service to start
sleep 2

if ! pgrep -x "nginx" > /dev/null; then
    echo "Failed to start Nginx."
    exit 1
fi

echo "Nginx started successfully."



# Task 4 - Automation 

# Specify the process name to monitor
process_to_monitor="nginx"

# Define the maximum restart attempts
max_restart_attempts=3

# Function to check if the process is running
function is_process_running() {
    if pgrep -x "$process_to_monitor" > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to restart the process
function restart_process() {
    echo "Restarting $process_to_monitor..."
    # Add your restart command here
    # For example: /etc/init.d/$process_to_monitor restart
}

# Loop to monitor and restart the process
attempts=0
while ! is_process_running; do
    if [ "$attempts" -lt "$max_restart_attempts" ]; then
        restart_process
        attempts=$((attempts + 1))
        sleep 5  # Delay between restart attempts
    else
        echo "Max restart attempts reached. Exiting."
        exit 1
    fi
done

echo "$process_to_monitor is running."



# Task 6 - BONUS

#!/bin/bash

# Specify the name of the thing we're checking
thing_to_check="nginx"

# Set the maximum number of tries before alerting
max_tries=3

# Who should be alerted if there's a problem?
admin_email="sonalpriya1597@gmail.com"

# Function to send an email alert
function send_email_alert() {
    echo "Sending an email alert to administrators..."
    # In real life, this is where we would send an email using a tool.
}

# Function to check if the thing is working
function is_thing_working() {
    if pgrep -x "$thing_to_check" > /dev/null; then
        return 0  # Thing is working fine
    else
        return 1  # Thing is not working
    fi
}

# Function to try restarting the thing
function restart_thing() {
    echo "Trying to restart $thing_to_check..."
    # In real life, this is where we would restart the thing.
}

# Start monitoring loop
tries=0
while ! is_thing_working; do
    if [ "$tries" -lt "$max_tries" ]; then
        restart_thing
        tries=$((tries + 1))
        sleep 5  # Wait for a while before trying again
    else
        echo "Maximum tries reached. Alerting administrators."
        send_email_alert
        exit 1  # Exit the script
    fi
done

echo "$thing_to_check is now working."




