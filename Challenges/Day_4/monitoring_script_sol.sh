#!/bin/bash

echo -e "---- Monitoring Metrics Script ---- \n"
echo "1. View System Metrics"
echo "2. Monitor a Specific Service"
echo "3. Exit"
read -p "Please select [1/2/3]: " selection

# Function to show system metrics
function showMetrics(){
    #cpu load average of 15 minutes
    load_average=$(uptime | awk '{print $10}')
    load_percent=$(bc <<<"scale=0; $load_average * 100")

    # memory usage calculation
    available_mem=$(free -m | awk '/Mem/ {print $7}')
    total_mem=$(free -m | awk '/Mem/ {print $2}')
    used_mem=$(( $total_mem - $available_mem ))
    percentage_used=$(bc <<<"scale=2; $used_mem* 100 / $total_mem")

    # disk usage calculation
    disk_used=$(df -h | grep -w '/' | awk '{print $5}')
    disk_used=$(printf %s "$disk_used" | tr -d [="%"=])
    
    echo "CPU Usage: $load_percent %"
    echo "Memory Usage: $percentage_used %"
    echo "Disk Usage: $disk_used %"
}

# Function to monitor or start a service
function monitorService(){
    echo "---- Monitor a Specific Service ----"
    read -p "Enter the name of the service to monitor:" service
    # Checking if process is running
    if systemctl is-active --quiet "$service" > /dev/null
    then
        echo "---- $service Status ----"
        echo "$service is running."
        read -p "Press Enter to continue..." key
        exit
    else
        echo "---- $service Status ----"
        echo "$service is not running."
        read -p "Do you want to start $service? (Y/N): " response
        echo "$response"

        # Checking response of user Yes/No
        if  [[ "$response" == "Y" ]]  || [[ "$response" == "y" ]]; then
            echo "Starting $service"
            sudo systemctl start $service
            if systemctl is-active --quiet "$service" > /dev/null ; then
                echo "Service started successfully" 
            else
                echo "Could not start $service"
            fi

        elif [[ "$response" == "N" ]] || [[ "$response" == "n" ]] ; then
            echo "Thank You for using our script"
        # Providing neither Yes nor No
        else
            echo "Invalid response. Please select [Y/N]"

        fi
    fi
}

# Case statements for different inputs
case $selection in
    1) 
        # Calling function to show system metrics
        showMetrics
        ;;
    2) 
        # Calling function to monitor a service
        monitorService
        ;;
    3) 
        echo "Exiting"
        echo "Thanks for using our script"
        ;;
    *) 
        echo "Invalid option please choose between [1/2/3]"
        ;;
esac
