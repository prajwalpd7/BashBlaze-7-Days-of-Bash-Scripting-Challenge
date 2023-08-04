#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 03/08/2023
# Description: #TWSBashBlazeChallenge Day-4
# Task - part - 1 : Monitoring system process
# script start
# Define the name of the process you want to monitor
PROCESS_NAME="$1"
# Maximum number of restart attempts
MAX_RESTART_ATTEMPTS=3

# function to check if the given service exists or not
check_service_exists(){
    systemctl list-unit-files -q -all "$PROCESS_NAME.service"  > /dev/null 2>&1
}

# Function to check if the process is running
check_process_status() {
    systemctl is-active $PROCESS_NAME 2> /dev/null
}

# Function to restart the process
restart_process() {
    echo "Process '$PROCESS_NAME' is not running. Attempting to restart..."
    # Loop to check and restart the process
    for ((attempt=1; attempt<=$MAX_RESTART_ATTEMPTS; attempt++)); do
        local process_status=$(check_process_status)
        if [[ "$process_status" == "active" ]]; then
            echo "Process '$PROCESS_NAME' is running properly now."
            break
        else
            if [ $attempt -lt $MAX_RESTART_ATTEMPTS ]; then
                sudo systemctl restart $PROCESS_NAME
                sleep 2
            else
                echo "Maximum restart attempts reached. Please check the process '$PROCESS_NAME' manually."
                exit 1
            fi
        fi
    done
}


main(){
    # check if the services exists for the given process name
    check_service_exists
    if [ $? -eq 1 ];
    then
        echo "Service for process '$PROCESS_NAME' doesnot exists."
    else
        local process_status=$(check_process_status)
        if [[ "$process_status" == "active" ]]; then
            echo "Process '$PROCESS_NAME' is running properly."
        else
            restart_process
        fi
    fi
}

main