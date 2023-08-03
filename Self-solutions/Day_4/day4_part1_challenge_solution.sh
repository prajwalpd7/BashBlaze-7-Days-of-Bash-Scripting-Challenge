#!/bin/bash

#####################################################################
# Script Name: day4_part1_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 3, 2023
# Description: This script contains solution for Day 4 part-1 process monitoring and management as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day4_part1__challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################



###########################################   BashBlaze Scripting Challenge - Day 4   #######################################
#Welcome to the Bash Scripting Challenge - Day 4! This challenge is designed to test your Bash scripting skills and problem-solving abilities in the context of process monitoring and management.

############################################# Scenario ###############
#You are tasked with writing a Bash script that efficiently monitors a specific process on a Linux system. The script's primary goal is to ensure the process is always running, and if it unexpectedly stops, it should be restarted automatically.

############################################ Task  ##############
#1.Process Selection:
#The script should accept a command-line argument to specify the target process to monitor. For example: ./monitor_process.sh <process_name>.

#2.Process Existence Check:
#Implement a function that checks if the specified process is currently running on the system.
#If the process is running, print a message indicating its presence.

#3.Restarting the Process:
#If the process is not running, implement a function that attempts to restart the process automatically.
#Print a message indicating the attempt to restart the process.
#Ensure the script does not enter an infinite loop while restarting the process. Limit the number of restart attempts.

#4.Automation:
#Provide instructions on how to schedule the script to run at regular intervals using a cron job or any other appropriate scheduling method.

#5.Documentation:
#Include clear and concise comments in the script to explain its logic and functionality.
#Write a separate document describing the purpose of the script, how to use it, and any specific considerations.

#6.Bonus
#Implement a notification mechanism (e.g., email, Slack message) to alert administrators if the process requires manual intervention after a certain number of restart attempts.

processNameByUser=$1 #taking first command line argument as a process name from user.

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


check_if_process_running "$processNameByUser"  #passing the process name to the function

if [ $? == 0  ]; then   #comparing the output of above function usign $? with 0 means process is running.
	echo
	echo "Mentioned process '$processNameByUser' is running in the system !!!"
	sudo systemctl status "$processNameByUser"   #displaying the status of process.
else
	echo
	echo "Mentioned process '$processNameByUser' is not running in the system, Attempting to restart..."
	echo
	echo "Attempting restart to the process '$processNameByUser' automatically !"	

	for ((restartAttempt=1; restartAttempt<=3; restartAttempt++))    #for loop to attempt for 3 times to restart the process
	do

		echo "Attempt number: '$restartAttempt'"

		sudo systemctl start "$processNameByUser"    #using systemctl command to start the service.

		
		#checking if our restart attempt is succsfull or not.
		check_if_process_running "$processNameByUser"
		if [ $? == 0  ]; then
			echo "process '$processNameByUser' is running successfully after restart attempt-'$restartAttempt' !!!"
			echo
			sudo systemctl status "$processNameByUser"  #displaying the status of the process.
			break  #if success then we break the loop.
		fi
		
		if [ $restartAttempt == 3 ]; then    #after 3 attempts also if not restarted showing message.
			echo "After 3 attempts to restart we could not able to start the process '$processNameByUser' please try manually !"
			echo
			echo "Sending slack notification !!!!!!!!!!!"
			echo 
			SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
			SLACK_CHANNEL="#shell-scripting-projects"
			SLACK_USERNAME="Process Monitor"
			SLACK_ICON_EMOJI=":warning:"
			MESSAGE=":warning: Process '$processNameByUser' is not running! So please check and restart manually!"
			PAYLOAD="{\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$SLACK_USERNAME\", \"icon_emoji\": \"$SLACK_ICON_EMOJI\", \"text\": \"$MESSAGE\"}"
			curl -s -X POST -H "Content-type: application/json" --data "$PAYLOAD" "$SLACK_WEBHOOK_URL"
			echo
			echo "Slack notification sent successfully !!! "
			echo
		fi
	done
fi


##################################     Automation     #########################
#############################Improvised and automated this script using crontab like below as an advancement.
#I have used crontab to schedule the backup script to run for every 30 minutes.
#opened the crontab configuration by running : crontab -e and then you can run crontab -l to see the scheduled configurations.
#and added the following line at the end of the crontab file: */30 * * * * /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4/day4_part1__challange_solution.sh  >> /root/backup_log.log 2>&1
                                                                                                                                 #the >> operator appends the output (both standard output and standard error) of the cron job to the specified log file (backup_log.log). The 2>&1 part ensures that both standard output (1) and standard error (2) are redirected to the log file.



