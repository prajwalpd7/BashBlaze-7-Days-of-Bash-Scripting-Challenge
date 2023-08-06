#!/bin/bash

# Continuous loop for the menu
while true
 do
    clear
    echo "Monitoring Script Menu:"
    echo "1. Display System Metrics"
    echo "2. Monitor a Specific Service"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case "$choice" in
        1)
            # Display system metrics
            clear
            echo "System Metrics:"
            echo "----------------"
            
            # Fetch CPU usage and format
            cpu_usage=$(top -bn 1 | awk '/Cpu/ {print $2}')
            cpu_usage="${cpu_usage}%"
            
            # Fetch memory usage and format
            mem_usage=$(free -h | awk '/Mem:/ {print $3}')
            
            # Fetch disk space usage and format
            disk_usage=$(df -h / | awk '/\// {print $5}')
            
            echo "CPU Usage: $cpu_usage   Mem Usage: $mem_usage   Disk Space: $disk_usage"
            ;;
    
        2)
            # Monitor a specific service
            clear
            read -p "Enter the name of the service to monitor: " service_name
            if systemctl is-active "$service_name" >/dev/null
	     then
                echo "$service_name is running."
            else
                echo "$service_name is not running."
                read -p "Do you want to start $service_name? (y/n): " start_choice
                if [ "$start_choice" = "y" ]
                 then
                    sudo systemctl start "$service_name"
                    echo "Starting $service_name..."
                fi
            fi
            ;;
        3)
            # Exit the script
            echo "Exiting the script."
            exit 0
            ;;
        *)
            # Handle invalid input
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    # Allow the user to specify the sleep interval
    read -p "Enter sleep interval in seconds (0 to exit): " sleep_interval

    # Exit the loop if sleep interval is 0
    if [ "$sleep_interval" -eq 0 ]; then
        echo "Exiting the script."
        exit 0
    fi

    # Sleep for the specified interval
    sleep "$sleep_interval"

    read -p "Press Enter to continue..."
done