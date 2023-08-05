##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# About : Developed a script to monitor a process if it is running, if not ? try to restart. #
#                                                                                            #
#                                                                                            #
##############################################################################################
#                                                                                            #
# Execution : sudo ./<script-name> <process-name>    (Recommended to execute with sudo user) #                                       #
#                                                                                            #
# Example   : sudo ./monitor_process.sh httpd                                                #
#                                                                                            #
##############################################################################################

# Function to check whether process is running or not

########### Start is_process_running() #######################################################

is_process_running () {
    systemctl status $1 1>/dev/null 2>/dev/null
    return $?
}

########### End of is_process_running() ######################################################

# Function to start and enable the service

########### Start start_process () ###########################################################

start_process () {
    systemctl start $1 1>/dev/null 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "$1 service is running...!"
    else
        echo "EROOR: $1 is not running...!"
    fi

    systemctl enable $1 1>/dev/null 2>/dev/null

}

########### End of start_process () #########################################################

# Check if service name is passed as a argument and check the process status
if [ $# -eq 1 ]; then
    is_process_running $1
    if [ $? -eq 0 ]; then
        echo "$1 is running..."
    else
        echo "ERROR: $1 is not running...!"
        echo ""
        echo "Please Note - We are starting the $1 service...!"
        start_process $1
    fi
else
    echo "ERROR: Please pass the service name with script or check the execution process of script as below: "
    echo ""
    head -16 monitor_process.sh
fi