#!/bin/bash

# Function to display system metrics (CPU, memory, disk space)
function view_system_metrics() {
    echo "---- System Metrics ----"
    # Fetch CPU usage using `top` command and extract the value using awk
    cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')
    # Fetch memory usage using `free` command and extract the value using awk
    mem_usage=$(free | grep Mem | awk '{printf("%.1f", $3/$2 * 100)}')
    # Fetch disk space usage using `df` command and extract the value using awk
    disk_usage=$(df -h / | tail -1 | awk '{print $5}')
    
    echo "CPU Usage:  $cpu_usage%   Mem Usage:  $mem_usage%   Disk Space:  $disk_usage"
}

# Function to monitor a specific service
function monitor_service() {
    echo "---- Monitor a Specific Service ----"
    read -p "Enter the name of the service to monitor: " service_name

    # Check if the service is running using `systemctl` command
    if systemctl is-active --quiet $service_name; then
        echo "$service_name is running."
    else
        echo "$service_name is not running."
        read -p "Do you want to start $service_name? (Y/N): " choice
        if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
            # Start the service using `systemctl` command
            systemctl start $service_name
            echo "$service_name started successfully."
        fi
    fi
}

# Main loop for continuous monitoring
while true; do
    echo "---- Monitoring Metrics Script ----"
    echo "1. View System Metrics"
    echo "2. Monitor a Specific Service"
    echo "3. Exit"

    read -p "Enter your choice (1, 2, or 3): " choice

    case $choice in
        1)
            view_system_metrics
            ;;
        2)
            monitor_service
            ;;
        3)
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Error: Invalid option. Please choose a valid option (1, 2, or 3)."
            ;;
    esac

    # Sleep for 5 seconds before displaying the menu again
    sleep 5
done
