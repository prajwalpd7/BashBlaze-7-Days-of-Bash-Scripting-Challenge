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
			SLACK_WEBHOOK_URL="https://hooks.slack.com/services/place-your-webhook-url"
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


######################       practice           ####################

#practice-1
#check if a particular process is running in shell scripting
#!/bin/bash

# Process name to check
process_name="example_process"

# Check if the process is running
if ps aux | grep -q "[${process_name:0:1}]${process_name:1}"; then
  echo "The process '$process_name' is running."
else
  echo "The process '$process_name' is not running."
fi
#sing the ps command and then filtering the output.
#we use ps aux to list all running processes and then use grep to search for the process name in the output
#The -q option of grep is used to make it quiet, so it doesn't print anything to the output. If the process is found, the if statement will be true, indicating that the process is running. Otherwise, it will print that the process is not running.

#[${process_name:0:1}]${process_name:1}
#${process_name:0:1}: This part of the expression extracts the first character of the process_name variable.
#${process_name:1}: This part of the expression extracts all characters of process_name starting from the second character (index 1) to the end of the string. This effectively removes the first character from process_name, leaving only the rest of the characters.

#checking the output of 'ps aux | grep [s]sh'
#it will print all the output that matchs with ssh but except grep itself due to [s] this bracket.
#ps aux: This command is used to list all running processes on the system.
#|: This is the pipe symbol, which is used to redirect the output of the ps aux command to the grep command.
#grep [s]sh: The grep command is used to search for a pattern in the input. In this case, it is searching for the pattern [s]sh.
#without the brackets, the grep command would normally match itself, resulting in an additional line in the output that includes the grep process. 


#practice-2
#check if a particular process is running or not in shell scripting using various commands like pgrep, ps, or pidof.
######Using pgrep:
if pgrep "process_name" >/dev/null; then
    echo "Process is running."
else
    echo "Process is not running."
fi

#Using ps:
if ps -C "process_name" &>/dev/null; then
    echo "Process is running."
else
    echo "Process is not running."
fi

#Using pidof:
if pidof "process_name" >/dev/null; then
    echo "Process is running."
else
    echo "Process is not running."
fi


#
#>/dev/null : usage
#The >/dev/null part in the shell script is used for redirecting the standard output of a command to the null device (/dev/null), which is a special device that discards any data written to it.

#>: Redirects the standard output of the command to a file or device.
#/dev/null: A special device in Unix-like systems that discards any data written to it.
if pgrep "process_name" >/dev/null; then
    echo "Process is running."
else
    echo "Process is not running."
fi


#practice-3
#for loop in shell scritping
# the for loop is used to iterate over a list of items and perform a set of commands for each item in the list.
for item in list
do
    # Commands to be executed for each item
done

#exaple-2
for fruit in apple orange banana
do
    echo "I like $fruit"
done

#exaple-3
for file in $(ls *.txt)
do
    echo "Processing file: $file"
    # Add commands to process the file here
done


#example-4 for loop with with break statement

#he break statement is used within loops (like for or while loops) to prematurely exit the loop. When the break statement is encountered, the loop immediately terminates, and the control of the program moves to the first line of code following the loop.

for number in 1 2 3 4 5
do
    echo "Processing number $number"

    # Check if the current number is equal to 3
    if [ "$number" -eq 3 ]; then
        echo "Found number 3. Exiting loop."
        break  # Exit the loop when the number is 3
    fi
done


#loop 3 times and break

#!/bin/bash

# Initialize a counter variable
counter=0

# Loop 3 times
for ((i=1; i<=3; i++))
do
    echo "Iteration $i"
    
    # Increment the counter
    ((counter++))
    
    # Check if the counter is equal to 3
    if [ $counter -eq 3 ]; then
        echo "Reached 3 iterations. Exiting loop."
        break  # Exit the loop
    fi
done


#practice-5
#practicing to send slack notification if process is not running in shell scripting
#To send a Slack notification from a shell script when a certain process is not running,

#Set Up Incoming Webhook in Slack:
#Go to your Slack workspace.
#Click on your workspace name in the top left corner, then click "Settings & administration" > "Manage apps."
#In the "Apps" section, search for "Incoming Webhooks" and click on it.
#Click "Add to Slack" next to the channel where you want to receive the notifications.
#Follow the prompts to complete the setup. You'll get a webhook URL that you'll use in the shell script.

#!/bin/bash

# Function to check if the process is running
check_process() {
    if pgrep -x "$1" >/dev/null; then
        return 0  # Process is running
    else
        return 1  # Process is not running
    fi
}

# Replace these variables with your values
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
SLACK_CHANNEL="#your-slack-channel"
SLACK_USERNAME="Process Monitor"
SLACK_ICON_EMOJI=":warning:"

# Process to check (replace "your-process" with the actual process name)
PROCESS_NAME="your-process"

# Check if the process is not running
if ! check_process "$PROCESS_NAME"; then
    # Send Slack notification
    MESSAGE=":warning: Process '$PROCESS_NAME' is not running!"
    PAYLOAD="{\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$SLACK_USERNAME\", \"icon_emoji\": \"$SLACK_ICON_EMOJI\", \"text\": \"$MESSAGE\"}"

    curl -s -X POST -H "Content-type: application/json" --data "$PAYLOAD" "$SLACK_WEBHOOK_URL"
fi

#Schedule the Script:
#To regularly check if the process is running and send notifications if it's not, you can schedule the script to run at a specific interval using cron. For example, to run the script every 5 minutes
*/5 * * * * /path/to/check_process.sh


#practice-6
#practicing the switch case in shell scripting
#!/bin/bash

day="Monday"

case $day in
  Monday)
    echo "It's the start of the week."
    ;;
  Tuesday|Wednesday|Thursday)
    echo "It's a weekday."
    ;;
  Friday)
    echo "TGIF! It's Friday."
    ;;
  Saturday|Sunday)
    echo "It's the weekend!"
    ;;
  *)
    echo "Invalid day."
    ;;
esac

#the script checks the value of the variable day and executes different code blocks based on the day of the week. The esac marks the end of the case statement.


#exaple-2
#infinite loop using a while loop with switch cases in shell scripting:
#!/bin/bash

while true; do
    echo "Enter your choice:"
    echo "1. Option 1"
    echo "2. Option 2"
    echo "3. Option 3"
    echo "4. Exit"

    read choice

    case $choice in
        1)
            echo "You chose Option 1"
            # Add your logic for Option 1 here
            ;;
        2)
            echo "You chose Option 2"
            # Add your logic for Option 2 here
            ;;
        3)
            echo "You chose Option 3"
            # Add your logic for Option 3 here
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done





