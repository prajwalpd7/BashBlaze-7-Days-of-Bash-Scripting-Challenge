##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# About : Developed a script to monitor metrics with sleep mechanism                         #
#                                                                                            #
#                                                                                            #
##############################################################################################
#                                                                                            #
# Execution : sudo ./<script-name>                                                           #
#                                                                                            #
# Example   : sudo ./metrics_monitoring.sh                                                   #
#                                                                                            #
#########################   Script file sourcin section   ####################################

source function_scripts_file.sh
source monitor_process.sh

############################ End of script file sourcin section  #############################

echo "---- Monitoring Metrics Script ----"
echo ""

# Menu choices
echo "1. View syetem metrics."
echo "2. Monitor a specific service."
echo "3. Exit."
echo ""
echo -n "Enter a menu choice [1 to 3]: "

# while loop to execute menu in loop
while :
do
    read choice

    case $choice in

        #########  Case 1 : View syetem metrics ######
        1) 
        echo "---- System Metrics ----"
        # function to print system metrics.
        view_system_metrics
        echo ""
        while : 
        do
            read -p "Press enter to continue..." metrics
            if [ "$metrics" == "" ]; then
                echo ""
                view_system_metrics
            else
                break
            fi
        done;;

        #########  Case 2 : Monitor a specific service ######
        2)
        echo "Monitor a specific service"

        while :
        do
        read -p "Enter the name of the service: " service_name
        if [ "$service_name" != "" ]; then
            bash monitor_process.sh $service_name
            read -p "Press enter to continue [press EXIT to exit]:" decision
            
            if [ "$decision" != "" ]; then
                break
            else
                continue
            fi
        else
            echo ""
            echo "ERROR: Please enter a valid service name."
        fi
        done
        ;;

        #########  Case 3 : Exit ######
        3) exit;;

        *) 
        echo "WARNING: Please enter valid choice."
        echo ""
        ;;
    esac
    echo -n "Enter a menu choice [1 to 3]: "
    echo ""

done    
