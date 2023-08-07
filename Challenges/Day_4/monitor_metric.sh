#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 03/08/2023
# Description: #TWSBashBlazeChallenge Day-4
# Task - part - 2 : Monitoring system metrics
# display metrics and monitor spcific process

check_service_exists(){
    systemctl list-unit-files -q -all "$1.service"  > /dev/null 2>&1
}

is_process_active() {
    local process_status=$(systemctl is-active "$1" 2> /dev/null)
    if [[ "$process_status" == "active" ]]; then
        exit 0
    else
        exit 1
    fi
}

# Function to restart the process
restart_process() {
    echo "Attempting to start process: $1"
    sudo systemctl restart $1
    if $(is_process_active "$1"); then
        echo "Process '$1' is running properly now."
    else
        echo "Unable to start $1 process."
    fi
    echo
}

display_system_metrics(){
    local continue_script=1
    until [[ $continue_script -eq 0 ]]
    do
        echo "----- System metrics -----"
        local cpu_usage=$(top -bn1 | grep '%Cpu' | awk '{print $2 + $4}')
        local mem_usage=$(free | awk '/Mem/{print $3/$2 * 100.0}')
        local disk_usage=$(df -h | awk '/\/dev\/root/{print $5}')
        echo "CPU Usage     : $cpu_usage%"
        echo "Memory Usage  : $mem_usage%"
        echo "Disk Space    : $disk_usage"
        echo "----- System metrics -----"
        echo "1. Print metrics again | 2. Go to main menu"
        read -p "Enter your choice: " choice
        
        if [[ $choice -eq 1 ]]; then
            continue_script=1
        else
            continue_script=0
        fi
    done
}

monitor_service(){
    echo
    echo "---------- Monitor a specific service ----------"
    read -p "Enter the name of the service you want to monitor : " service_name
    check_service_exists "$service_name"
    if [ $? -eq 1 ];
    then
        echo "Service for process - $service_name doesnot exists."
    else
        if $(is_process_active "$service_name"); then
            echo "$service_name is running."
        else
            echo "$service_name process is not running"
            read -p "Do you want to start $service_name (y/n) " choice
            if [ "$choice" == "y" ]; then
                restart_process "$service_name"
            fi
        fi
    fi
}

main() {
    local continue_script=0
    while [[ $continue_script -eq 0 ]]
    do
        echo
        echo "---------- Monitoring metrics script ----------"
        echo "1. View system metrics."
        echo "2. Monitor a specific service."
        echo "3. Exit"
        echo "---------- Monitoring metrics script ----------"
        echo
        read -p "Enter your choice: " choice
        case $choice in
            1) display_system_metrics;;
            2) monitor_service;;
            3) continue_script=1 ;;
            *) continue_script=1 ;;
        esac
    done
}

main