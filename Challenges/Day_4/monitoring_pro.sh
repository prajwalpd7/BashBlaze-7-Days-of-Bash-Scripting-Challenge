#Author : Apurv Samadder
#Date : Aug 3 2023
#Version: v1
#Day 4  Bash Scripting Challenge - he script will check if the Nginx process is running and restart it if it's not.


#!/bin/bash

restart_serv(){
serv_active_restart=`sudo systemctl is-active $1`
        case "$serv_active_restart" in
                active)
                        #this will get printed in the 2nd or 3rd try if it wasn't running in the 1st or 2nd try
                        echo "Process $1 is running."
                        ;;
       		 failed|inactive)
        	echo "Process $1 is not running. Attempting to restart..."
		  #this will restart the process.
            	sudo systemctl restart $1
        	if [ systemctl is-active "$1" == true ] ;
        	then
            		echo "Service is started"
        	fi
        	;;
        	*)
       		 esac
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
            for i in {1..3}
             do
              restart_serv $service_name
              sleep 2
             done
        else
          echo "********************************"       
            echo "Service not started."
        fi
    fi
}
read -p "Enter the name of the service: " service_name
check_service "$service_name"
