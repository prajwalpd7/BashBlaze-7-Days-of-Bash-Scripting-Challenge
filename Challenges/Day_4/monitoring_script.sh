#!/bin/bash

# Function to display system metrics
display_metrics() {
    clear
    echo "---- System Metrics ----"
    # CPU Usage
    cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}' | cut -d'.' -f1)
    echo "CPU Usage:  $cpu_usage%"
    
    # Memory Usage
    mem_usage=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')
    echo "Mem Usage:  $mem_usage%"
    
    # Disk Space Usage
    disk_usage=$(df -h / | awk '/\// {print $5}')
    echo "Disk Space:  $disk_usage"
}

# Function to monitor a specific service
monitor_service() {
    local service_name=$1
    if systemctl is-active --quiet "$service_name"; then
        echo "---- Nginx Status ----"
        echo "$service_name is running."
    else
        echo "$service_name is not running."
        read -p "Do you want to start $service_name? (y/n): " choice
        if [ "$choice" == "y" ]; then
            sudo systemctl start "$service_name"
            echo "$service_name has been started."
        fi
    fi
}

# Main loop
while true; do
    clear
    echo "---- Monitoring Metrics Script ----"
    echo "1. Display System Metrics"
    echo "2. Monitor a Specific Service"
    echo "3. Exit"
    read -p "Enter your choice: " option

    case "$option" in
        1)
            display_metrics
            read -p "Press Enter to continue..."
            ;;
        2)
            read -p "Enter the name of the service to monitor: " service_name
            monitor_service "$service_name"
            read -p "Press Enter to continue..."
            ;;
        3)
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            read -p "Press Enter to continue..."
            ;;
    esac
done

