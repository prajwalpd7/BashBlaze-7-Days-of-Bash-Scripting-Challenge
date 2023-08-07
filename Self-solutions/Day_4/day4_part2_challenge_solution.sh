#!/bin/bash

#####################################################################
# Script Name: day4_part2_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 3, 2023
# Description: This script contains solution for Day 4 part-2 Monitoring Metrics Script with Sleep Mechanism as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day4_part2__challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################

#set -x
####################################################  Day-4 part2 Monitoring Metrics Script with Sleep Mechanism    #############################
#######################  Challenge Description   ####################
#This project aims to create a Bash script that monitors system metrics like CPU usage, memory usage, and disk space usage. The script will provide a user-friendly interface, allow continuous monitoring with a specified sleep interval, and extend its capabilities to monitor specific services like Nginx.


#Tasks
#Task 1: Implementing Basic Metrics Monitoring
#Write a Bash script that monitors the CPU usage, memory usage, and disk space usage of the system. The script should display these metrics in a clear and organized manner, allowing users to interpret the data easily. The script should use the top, free, and df commands to fetch the metrics.

#Task 2: User-Friendly Interface
#Enhance the script by providing a user-friendly interface that allows users to interact with the script through the terminal. Display a simple menu with options to view the metrics and an option to exit the script.

#Task 3: Continuous Monitoring with Sleep
#Introduce a loop in the script to allow continuous monitoring until the user chooses to exit. After displaying the metrics, add a "sleep" mechanism to pause the monitoring for a specified interval before displaying the metrics again. Allow the user to specify the sleep interval.

#Task 4: Monitoring a Specific Service (e.g., Nginx)
#Extend the script to monitor a specific service like Nginx. Check if the service is running and display its status. If it is not running, provide an option for the user to start the service. Use the systemctl or appropriate command to check and control the service.

#Task 5: Allow User to Choose a Different Service
#Modify the script to give the user the option to monitor a different service of their choice. Prompt the user to enter the name of the service they want to monitor, and display its status accordingly.

#Task 6: Error Handling
#Implement error handling in the script to handle scenarios where commands fail or inputs are invalid. Display meaningful error messages to guide users on what went wrong and how to fix it.

#Task 7: Documentation
#Add comments within the script to explain the purpose of each function, variable, and section of the code. Provide a clear and concise README file explaining how to use the script, the available options, and the purpose of the script.

#Remember, the main goal of this challenge is to utilize various monitoring commands, implement a user-friendly interface, and create a script that is easy to understand and use.

check_if_process_running() {

	process_name=$1
	
	if pgrep "$process_name" >/dev/null; then  #checking if provided process is running or not
						   #The >/dev/null part in the shell script is used for redirecting the standard output of a command to the null dev							          -ice (/dev/null),which is a special device that discards any data written to it.
						   #If the process is running, pgrep will return a success status (exit code 0), and the output will be discarded. 
						   # If the process is not running, pgrep will return a non-zero status, and the output will be discarded as well.
						   #The if statement checks the exit status, and based on that, it print the appropriate message without showing any 								output from the pgrep command itself.
		return 0
	else
		return 1
	fi
}


while true; do
	echo
	echo "Main Menu"
	echo
	echo "------ Monitoring Metrics Script -------"
	echo
	echo "Choose below options"
	echo "    1. View System Metrics "
	echo "    2. Monitor a Specific Service "
	echo "    3. Exit"
	echo

	read -p "Enter your option: " userOption
    	
	case $userOption  in
		1) 
			
			if [ "$reEnterTheMetrix" == 1  ]; then
				echo
				echo "Showing metrics again in 5 seconds... please wait! "
				echo
				sleep 5   #implementing the sleep mechanism if user wants to see metric details from second timewe will show the metrics detaisl with hiafter 5 seonds.
				reEnterTheMetrix=0
		
			fi
			cpu_metric_usage=$( top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}' )  #the awk command is used to extract specific columns from the output of the top command.  and '{print $2 + $4}': will sum the second  %CPU column from the output of the top command and $4: Represents the fourth column of the input (in this case, the %us column, which represents the percentage of CPU used by user processes).

			cpu_metric_usage_percentage=$( printf "%.2f" "$cpu_metric_usage" ) #displaying only 2 decimal values.
			
			memory_metric_total=$( free | grep 'Mem:' | awk '{print $2}' )  #this free command will give us the memory usage details. and here we are taking 2nd and 3rd argument of free command output and calculating the percentage.
			memory_metric_total_used=$( free | grep 'Mem:' | awk '{print $3}' )
			memory_metric_usage_percentage=$(echo "scale=2; $memory_metric_total_used / $memory_metric_total * 100" | bc) 
							#bc: basic calculator operation and to  store only two decimal value as a output we are using scal=2.
			
			disk_usage_metric=$( df -h / | awk 'NR == 2 {print $5}' )   #here NR===2 means taking the second line from df -h / disk space outpur and extracting 5th argument as a disk usage metric.

			echo "CPU Usage: $cpu_metric_usage_percentage%   Mem Usage: $memory_metric_usage_percentage%  Disk Usage: $disk_usage_metric%"
			
			reEnterTheMetrix=1

			;;
        	
		
		2)

			read -p "Enter the name of the service to monitor: "  serviceNameByUser #taking service nameinput to monitor.
			check_if_process_running "$serviceNameByUser" #passing the service name to the function.
			
			if [ $? == 0  ]; then   #comparing the output of above function usign $? with 0 means service is running.
				echo
				echo "Mentioned process '$serviceNameByUser' is running in the system !!!"
				sudo systemctl status "$serviceNameByUser"   #displaying the status of process.

			else
				echo
				echo "Mentioned service '$serviceNameByUser' is not running in the system..."
				echo
				
				read -p "Do you want to start $serviceNameByUser? (Y/N): " userOptionToStart

				if [ "$userOptionToStart" == "Y"  ]; then
					sudo systemctl start "$serviceNameByUser" #using systemctl command to start the service.

					check_if_process_running $serviceNameByUser
					if [ $? == 0  ]; then
						echo "'$serviceNameByUser' service started successfully!! "
				        	sudo systemctl status $serviceNameByUser	
						echo
					else
						echo "Failed to start the service $serviceNameByUser. Please check the service name and try again!!!"
					fi
				else	
					echo "We did not try to start the service, Exiting..."
				fi
			fi

			;;



		3)
			echo
			echo "Exiting .."
			echo
			break

			;;


		*)
            		echo "Invalid option '$userOption'. please try again wtih the availiable options."

            		;;
    	esac
  	
done



