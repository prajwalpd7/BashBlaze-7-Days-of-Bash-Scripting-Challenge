#!/bin/bash

getCpuUsage() {
	echo "$( top -n 1 -b | awk '/%Cpu/ {print $2"%"}' )"
}

getRamUsage() {
	echo "$( free -h | awk '/Mem:/ {print $3}' )"
}

getDiskUsage() {
	echo "$( df -h | awk '/\/dev\/root/ {print $3}' )"
}

printSystemUsageStats() {
	cpu=`getCpuUsage`
	ram=`getRamUsage`
	disk=`getDiskUsage`
	echo "CPU Usage: $cpu Mem Usage: $ram Disk Space Used: $disk"
}

processExists() {
        # Returns code 0 if process is available else non zero
        local processName=$1
        systemctl list-unit-files | grep "$processName" >& /dev/null
}

isProcessRunning(){
        # Returns code 0 is process is active else non zero
        local processName=$1
        systemctl is-active $processName >& /dev/null
}

startProcess() {
	local processName=$1
	sudo systemctl start $processName
}


while [[ True ]];do
	echo "---- Monitoring Metrics Script ----"
	echo "1. View System Metrics"
	echo "2. Monitor a Specific Service"
	echo "3. Exit"
	read -p "Option:" option

	case $option in 
		3)
			exit;;
		1) 
			while [[ true ]];do
				echo "---- System Metrics ----"
				printSystemUsageStats
				echo "Press any key to continue..."
				read -t 5 -n 1 -s
				if [[ $? -eq 0 ]];then
					break
				fi
			done
			;;
		2)
			read -p "Enter the name of service:" service
			if ! processExists "$service";then
				echo "No such service found"
				continue
			fi

			echo "---- $service Status ----"

			if isProcessRunning "$service";then
			       echo "$service is running"
		        else
			       echo "$service is not running"
			       read -n 1 -p "Do you want to start $service? (y/n):" char
			       echo ""
			       if [[ $char =~ ^[Yy]$ ]]; then
				       startProcess $service
				       if [[ $? -eq 0 ]];then
					       echo "$service started successfully."
				       else
					       echo "$service could not be started, please try manually"
				       fi
			       fi
			fi
			echo "Press any key to conitnue..."
			read -n 1 -s 
			;;		
		*)
			echo "Invalid option, choose between 1, 2, and 3"
			;;
	esac
done
