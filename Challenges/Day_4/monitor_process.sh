#!/bin/bash

#storing the service name
serv=$1
if [ ${#1} -eq 0 ]
then
	echo "Please enter a service name after the bash filename."
fi

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
			sudo systemctl restart nginx.service

			#if the process is activated, this will print this statement.
			if [ `sudo systemctl is-active $1`=="active" ]
			then
				echo "Process $1 restarted successfully."
			fi
			;;
               	*)
       	esac
}

#if user has entered something
if [ ${#1} -ne 0 ]
then

#this will check if the service is present in system
#we will get nothing if the service is not present
a=`systemctl list-unit-files --type service | grep -F $1`


if [ ${#a} -eq 0 ]
then
	echo "The process '$1' doesn't exist."
else
	#this will check if process is active or not
	serv_active=`sudo systemctl is-active $1`
	case "$serv_active" in
		active)
			echo "Process $1 is running."
			;;
		failed|inactive)
			#if process is not active, we will try to restart it 3 times
			for i in {1..3}
	        	do
        		        restart_serv $1
			done	
			;;
		*)
	esac

	#this will be used to check the status of process after the 3 attempts
	serv_active_r=`sudo systemctl is-active $1`

	#if the process is still not active, we will tell to do it manually
	case "$serv_active_r" in
                failed|inactive)
                        echo "Maximum restart attempts reached. Please check the process manually."
                        ;;
                *)
        esac
fi
fi
