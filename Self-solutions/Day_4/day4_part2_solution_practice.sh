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


############################################ practice ####################


#practice-1
#practicing To get CPU, memory, and disk usage in shell scripting, you can use various commands and tools available in Linux
######CPU Usage:
#Use the top command with -n1 to get a one-time report of CPU usage:

top -n1

#use the mpstat command to get CPU statistics:
mpstat


### Memory Usage:
#Use the free command to get memory usage:

free -h

#use the top command to see memory usage along with other statistics:
top

####   Disk Usage:

#Use the df command to get disk usage information:
df -h

#use the du command to get disk usage of specific directories:
du -h /path/to/directory

#to capture the output of these commands in a shell script
#use command substitution with backticks or $():
#!/bin/bash

cpu_usage=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')
memory_usage=$(free -h | grep 'Mem:' | awk '{print $3}')
disk_usage=$(df -h | grep '/dev/sda1' | awk '{print $5}')

echo "CPU Usage: $cpu_usage"
echo "Memory Usage: $memory_usage"
echo "Disk Usage: $disk_usage"


#practice-2
#practicing to get CPU, memory, and disk usage in percentages in shell scripting, 
#!/bin/bash

# CPU Usage
cpu_usage=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')
cpu_usage_percentage=$(printf "%.2f" "$cpu_usage")

# Memory Usage
memory_total=$(free | grep 'Mem:' | awk '{print $2}')
memory_used=$(free | grep 'Mem:' | awk '{print $3}')
memory_usage_percentage=$(echo "scale=2; $memory_used / $memory_total * 100" | bc)

# Disk Usage
disk_usage=$(df -h | grep '/dev/sda1' | awk '{print $5}' | cut -d'%' -f1)

echo "CPU Usage: $cpu_usage_percentage%"
echo "Memory Usage: $memory_usage_percentage%"
echo "Disk Usage: $disk_usage%"



#explainig awk '{print $2 + $4}'

#awk: The command itself, which stands for "Aho, Weinberger, and Kernighan." It is a versatile text processing tool commonly used in shell scripting to manipulate and extract data from text files or command output.
#'{print $2 + $4}': This is the awk script enclosed in single quotes. It consists of a single awk action that instructs awk on what to do with each input line.
#it basically sum the 2nd and 4th arugment

#explaining the line also disk_usage=$(df -h | grep '/dev/sda1' | awk '{print $5}' | cut -d'%' -f1)
#df -h: This command is used to display disk space usage on Linux systems. The -h option stands for "human-readable," which means the output will be in a human-friendly format, displaying sizes in KB, MB, GB, etc., instead of raw blocks.

#grep '/dev/sda1': The grep command is used to search for a specific pattern or string in the output of the df command. In this case, we are searching for the line that corresponds to the /dev/sda1 partition, which is usually the main system partition.

#awk '{print $5}': Just like in the previous explanation, awk is used to extract a specific column from the input. In this case, it extracts the fifth column, which represents the "Use%" column in the output of df. The "Use%" column shows the percentage of disk space used.

#cut -d'%' -f1: The cut command is used to extract a specific portion of each line of text. In this case, we use it to remove the percentage sign (%) from the extracted "Use%" value obtained from the awk command. The -d'%' option specifies that the delimiter is the percentage sign, and -f1 indicates that we want to keep only the first field (before the percentage sign).

#The final result of this command chain is the disk usage percentage of the /dev/sda1 partition, which is then assigned to the disk_usage variable in the shell script.


#exaple-2
#To find the disk usage of the main system partition, you can modify the command to search for the root file system using the / mount point:
disk_usage=$(df -h / | awk 'NR == 2 {print $5}' | cut -d'%' -f1)
#we use / as the argument to df to specify the root file system. The awk command is used to extract the disk usage percentage from the second line of the df output (the first line contains headers). The cut command is then used to remove the percentage sign (%) from the extracted value.
#basically cut will remove the '%' symbol from the output
#replace / with the appropriate mount point in the df command.

#awk command, NR == 2 is a pattern that specifies a condition for selecting a specific line from the input
#NR is a built-in variable in awk that represents the current record (i.e., the line number).
#NR == 2 checks if the current line being processed is the second line of the input.
#cut -d'%' -f1: This cut command removes the percentage sign "%" from the disk usage percentage printed by the awk command, leaving only the numeric value.


#%.2f means?
#% is the formatting operator that indicates that a format specification follows.
#.2 is the precision specification, which tells printf to display two decimal places after the decimal point.
#f is the format character that specifies the format as a floating-point number.


#explaining the $(echo "scale=2; $memory_used / $memory_total * 100" | bc)

#The scale=2 sets the decimal precision to two decimal places, indicating that the result should have two digits after the decimal point.
#$memory_used: This is a variable containing the amount of used memory.
#$memory_total: This is a variable containing the total amount of memory available.
#| bc: The | (pipe) symbol is used to redirect the output of the echo command to the bc command. bc stands for "basic calculator" and is a command-line calculator that can perform arithmetic operations.



#









