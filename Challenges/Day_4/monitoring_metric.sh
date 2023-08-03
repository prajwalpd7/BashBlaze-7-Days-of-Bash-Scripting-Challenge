####################################
#Author : Apurv Samadder
#Date : Aug 3 2023
#Version: v1
#Day 4  Bash Scripting Challenge - Part_2_Monitoring_Metrics.md
####################################


#!/bin/bash

#Function to check get metrices

display_metric()
{

    # Get CPU usage percentage
    cpu_usage=$(top -bn 1 | awk '/%Cpu/{print $2}' | cut -d. -f1)

    # Get memory usage percentage
    mem_usage=$(free | awk '/Mem/{printf("%.2f", $3/$2 * 100)}')

    # Get disk usage percentage of root partition
    disk_usage=$(df -h / | awk '/\//{print $5}' | cut -d'%' -f1)

    # Display metrics
    echo "CPU Usage:  $cpu_usage%   Mem Usage:  $mem_usage%   Disk Space:  $disk_usage%"

    # Sleep for the specified interval (in seconds) before displaying metrics again
    sleep_interval=2
   sleep "$sleep_interval"
}



# Function to check and manage service
check_service() {
    service_name="$1"
    
    # Check if the service is running
    if systemctl is-active --quiet "$service_name"; then
	echo "**********************************"
        echo "$service_name is running."
    else
	echo "**********************************"    
        echo "$service_name is not running."
        read -p "Do you want to start $service_name? (y/n): " choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            sudo systemctl start "$service_name"
	 echo "*********************************"   
            echo "Starting $service_name..."
        else
	  echo "********************************"	
            echo "Service not started."
        fi
    fi
}


#User management function to get Input and work accordingly

user_mgmt()
{
echo "-------------------------------"	
echo "**MAIN MENU**"
echo " 1. View System Metrics"
echo " 2. Monitor a specific service"
echo " 3. Exit"
echo " Please enter a valid option:"
echo "-------------------------------"
read option

case $option  in
     1)
# here we firstly display the metrics and wait for user input and again display metrics or menu	     
	display_metric     
	while true; do
       	echo "Press Enter to continue & press 1  to for main menu"
	read temp
	if [ "$temp" == "1" ];
	then 
		user_mgmt
	  
        else
	       display_metric	
        fi	
    	done
      ;;
      2)
      read -p "Enter the name of the service: " service_name
      check_service "$service_name"
      user_mgmt
      ;;
      3)
      echo "Thanks for Visiting...."
      sleep 5 
      exit
      ;;
      *)
      echo "please enter valid option"
      user_mgmt
      ;;
esac
}

user_mgmt
