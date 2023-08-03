#!/bin/bash

echo "Welcome to ProcessWatch"

process="$1"

# Function to check if the process is running
function check_running(){
    if systemctl is-active --quiet "$process" > /dev/null
    then
        return 1
    fi
}

# Function to restart the process if not running
function restart(){
    
    echo "Process Nginx is not running. Attempting to restart..."
    systemctl restart apache2

}

# Argument check
if [[ "$1" == "" ]]; then
    echo "Please specify a process name"
    echo "Usage ./process.sh <process name>"
    exit
fi

# Calling the function to check if the process is running
check_running

if [[ "$?" -eq 1 ]]; then
    # Display this message if process is already running
    echo "$1 is already running"
else
    # If not running trying to restart it for three times
    for i in 1 2 3;do
        restart
        check_running
        if [[ "$?" -eq 1 ]]; then
            # Displayed if process restart successful
            echo "Process Started Successfully"
            exit
        fi
    done
    # Displayed if the process restart failes for three times
    echo "Maximum restart attempts reached. Please check the process manually."
    # Sending email to the user
    sudo apt install mailutils
    mail -s 'Important! Failed to start the service. Manual restart required' username@gmail.com
fi
