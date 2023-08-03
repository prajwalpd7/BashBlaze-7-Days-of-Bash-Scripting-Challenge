#!/bin/bash 

# task 1- Function to display CPU and memory usage

function show_system_status() {
    clear
    echo "System Status Monitor"
    echo "---------------------"
    
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

    echo -e "\nMemory Usage:"
    free -h | awk '/^Mem:/ {print "Total: " $2, "Used: " $3, "Free: " $4, "Cached: " $7}'

    echo -e "\nDisk Space Usage:"
    df -h
}

# Call the function to display system status
show_system_status



# Task 2 - User-Friendly Interface

# Function to display CPU and memory usage
function show_system_status() {
    clear
    echo "System Status Monitor"
    echo "---------------------"
    
    echo "1. CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "   " 100 - $1"%"}'

    echo -e "\n2. Memory Usage:"
    free -h | awk '/^Mem:/ {print "   Total: " $2, "Used: " $3, "Free: " $4, "Cached: " $7}'

    echo -e "\n3. Disk Space Usage:"
    df -h

    echo -e "\n4. Exit"
}

# Function to handle user menu choice
function user_menu() {
    while true; do
        show_system_status
        echo -e "\nSelect an option (1-4): "
        read choice
        
        case $choice in
            1) show_system_status ;;
            2) show_system_status ;;
            3) show_system_status ;;
            4) echo "Exiting. Goodbye!"; exit 0 ;;
            *) echo "Invalid choice. Please select a valid option." ;;
        esac
    done
}

# Call the function to display user menu
user_menu


# Task 3 - Continuous Monitoring with Sleep

#!/bin/bash

# Function to display CPU and memory usage
function show_system_status() {
    clear
    echo "System Status Monitor"
    echo "---------------------"
    
    echo "1. CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "   " 100 - $1"%"}'

    echo -e "\n2. Memory Usage:"
    free -h | awk '/^Mem:/ {print "   Total: " $2, "Used: " $3, "Free: " $4, "Cached: " $7}'

    echo -e "\n3. Disk Space Usage:"
    df -h

    echo -e "\n4. Exit"
}

# Function to handle user menu choice
function user_menu() {
    while true; do
        show_system_status
        echo -e "\nSelect an option (1-4): "
        read choice
        
        case $choice in
            1) show_system_status ;;
            2) show_system_status ;;
            3) show_system_status ;;
            4) echo "Exiting. Goodbye!"; exit 0 ;;
            *) echo "Invalid choice. Please select a valid option." ;;
        esac

        echo -e "\nEnter sleep interval (in seconds): "
        read sleep_interval
        echo "Monitoring paused for $sleep_interval seconds..."
        sleep "$sleep_interval"
    done
}

# Call the function to display user menu
user_menu



# Task 4 - Monitoring a Specific Service (e.g., Nginx)

# Function to display CPU and memory usage
function show_system_status() {
    clear
    echo "System Status Monitor"
    echo "---------------------"
    
    echo "1. CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "   " 100 - $1"%"}'

    echo -e "\n2. Memory Usage:"
    free -h | awk '/^Mem:/ {print "   Total: " $2, "Used: " $3, "Free: " $4, "Cached: " $7}'

    echo -e "\n3. Disk Space Usage:"
    df -h

    echo -e "\n4. Check Nginx Status"
    echo "5. Exit"
}

# Function to handle user menu choice
function user_menu() {
    while true; do
        show_system_status
        echo -e "\nSelect an option (1-5): "
        read choice
        
        case $choice in
            1) show_system_status ;;
            2) show_system_status ;;
            3) show_system_status ;;
            4) check_nginx_status ;;
            5) echo "Exiting. Goodbye!"; exit 0 ;;
            *) echo "Invalid choice. Please select a valid option." ;;
        esac

        echo -e "\nEnter sleep interval (in seconds): "
        read sleep_interval
        echo "Monitoring paused for $sleep_interval seconds..."
        sleep "$sleep_interval"
    done
}

# Function to check Nginx status and start if not running
function check_nginx_status() {
    nginx_status=$(systemctl is-active nginx 2>&1)
    if [ "$nginx_status" = "active" ]; then
        echo "Nginx is running."
    else
        echo "Nginx is not running."
        echo -e "\nDo you want to start Nginx? (y/n): "
        read start_nginx
        if [ "$start_nginx" = "y" ]; then
            sudo systemctl start nginx
            echo "Nginx has been started."
        fi
    fi
}

# Call the function to display user menu
user_menu


# Task 5 - Allow User to Choose a Different Service

# Function to display CPU and memory usage
function show_system_status() {
    clear
    echo "System Status Monitor"
    echo "---------------------"
    
    echo "1. CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "   " 100 - $1"%"}'

    echo -e "\n2. Memory Usage:"
    free -h | awk '/^Mem:/ {print "   Total: " $2, "Used: " $3, "Free: " $4, "Cached: " $7}'

    echo -e "\n3. Disk Space Usage:"
    df -h

    echo -e "\n4. Monitor a Service"
    echo "5. Exit"
}

# Function to handle user menu choice
function user_menu() {
    while true; do
        show_system_status
        echo -e "\nSelect an option (1-5): "
        read choice
        
        case $choice in
            1) show_system_status ;;
            2) show_system_status ;;
            3) show_system_status ;;
            4) monitor_service ;;
            5) echo "Exiting. Goodbye!"; exit 0 ;;
            *) echo "Invalid choice. Please select a valid option." ;;
        esac

        echo -e "\nEnter sleep interval (in seconds): "
        read sleep_interval
        echo "Monitoring paused for $sleep_interval seconds..."
        sleep "$sleep_interval"
    done
}

# Function to monitor a specific service
function monitor_service() {
    echo -e "\nEnter the name of the service you want to monitor: "
    read service_name

    service_status=$(systemctl is-active "$service_name" 2>&1)
    if [ "$service_status" = "active" ]; then
        echo "$service_name is running."
    else
        echo "$service_name is not running."
        echo -e "\nDo you want to start $service_name? (y/n): "
        read start_service
        if [ "$start_service" = "y" ]; then
            sudo systemctl start "$service_name"
            echo "$service_name has been started."
        fi
    fi
}

# Call the function to display user menu
user_menu


