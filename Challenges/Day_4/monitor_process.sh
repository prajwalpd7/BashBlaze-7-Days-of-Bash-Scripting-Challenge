#!/bin/bash

SEND_MAIL=false

showHelp() {
	echo "Usage: ./monitor_process.sh [processName]"
        echo "OPTIONS:"
	echo "--sendmail    send mail on errors"
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

sendMail() {
	RECIPIENT="gohrani.kunal8@gmail.com"
	subject=$1
	message=$2
	echo "$message" | mail -s "$subject" $RECIPIENT
}

startProcess() {
	# Returns 0 if process started successfully, else 1
	local processName=$1
	local i=1
	local sleepValue=5
	local maxLimit=3
	while [[ $i -le $maxLimit ]];do
		sudo systemctl start $processName
		if [[ $? -eq 0 ]];then
			echo "Process $processName started successfully.."
			return 0
		else
			echo "Failed to start $processName, trying again in $sleepValue seconds ($i/$maxLimit)" 
			if [[ $i -ne $maxLimit ]]; then
				# Sleep only until the 2nd last try
				sleep $sleepValue
			fi
			i=$(( $i + 1 ))
			continue
		fi
	done
	echo "Could not start $processName process, please try manually.."
	if [[ $SEND_MAIL = true ]];then
		# If $SEND_MAIL is true, then it will send mail on failure
		echo "Sending Mail..."
		sendMail "$processName Service Start Failure" "Error (`date`): Could not start $processName on `hostname -f`"
	fi

	return 1
}

# Main Script

if [[ $# -eq 0 || $1 == "-h" || $1 == "--help" ]];then
	# If no arguments given, then show help page
	showHelp
	exit;
fi

processName=$1
sendMail=$2

if [[ -n $sendMail && $sendMail == "--sendmail" ]];then
	# Checks if --sendmail option has been used
	SEND_MAIL=true
fi
if ! processExists $processName; then
	# If process does not exist then will exit with exit code 1
	echo "Process Not found, Please check the process name and try again."
	exit 1
fi

if isProcessRunning $processName; then
	# If process is running then print it, else try starting the process
	echo "$processName is running"
else
	startProcess $processName
fi

