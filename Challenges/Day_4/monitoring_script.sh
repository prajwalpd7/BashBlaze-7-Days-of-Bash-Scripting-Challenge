#!/bin/bash

#this will print the menu
metrics(){
	echo ""
	echo "---Monitoring Metrics Script---"
	echo "1. View system metrics"
	echo "2. Monitor a specific service"
	echo "3. Exit"
	echo ""
}

first(){
	
	#this will calculate the system's cpu usage
	cpu_usage=`top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'| awk '{print 100-$8}'`

	#this will calculate the system's memory usage
	mem_usage=`free | grep "Mem" | awk '{print 100*$3/$2}'`

	#this will calculate the usage of the volume we have mounted(shared directory)
	disk_usage=`df | grep dtworkspace | awk '{print 100*$4/$3}'`

	echo "CPU Usage : $cpu_usage% Mem usage: $mem_usage% Disk Space: $disk_usage%"
	read -p "Press enter to continue: " opt
}

start_ser(){
	case "$2" in
                Y)
			#if the user wants to restart the service, this will get executed.
			sudo systemctl restart nginx.service
                        if [ `sudo systemctl is-active $1`=="active" ]
                        then
                                echo "$1 restarted successfully."
			else
                        	echo "$1 couldn't be restarted."
			fi
                        ;;
		N)
			#if the user doesnt want to restart the service, this will get executed.
			echo "We didn't restart $1"
			;;
		 *)
        esac
}


second(){
	echo "---Monitor a specific service---"
	read -p "Enter the name of the service to monitor: " service_name

	#this will check if the service is present in system
	#we will get nothing if the service is not present
	a=`systemctl list-unit-files --type service | grep -F $service_name`

	if [ ${#a} -eq 0 ]
	then
        	echo "The process '$service_name' doesn't exist."
	else

	#if the process exists, this will get executed.
	echo "---$service_name Status---"

	#checking if the process is active or not
	serv_active=`sudo systemctl is-active $service_name`
        case "$serv_active" in
                active)
                        echo "$service_name is running."
                        ;;
                failed|inactive)
                        echo "$service_name is not running."
			read -p "Do you want to start $service_name? (Y/N): " ans
			start_ser $service_name $ans
                        ;;
                *)
        esac
	fi
	read -p "Press enter to continue: " opt
}

third(){
	exit 0
}

while [ true ]
do
	metrics
	read -p "Enter the selection: " opt
	echo ""
	case "$opt" in
	1)
		first
		;;
	2)
		second
		;;
	3)
		third
		;;
	*)
		echo "This is an invalid option."
		;;
esac

#we will ask how much seconds to wait before re-entering the options.
read -p "How much seconds would you like to wait before entering the next option? " sl
sleep $sl
done
