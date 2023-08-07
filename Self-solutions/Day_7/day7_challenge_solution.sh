#!/bin/bash

#####################################################################
# Script Name: day7_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 6, 2023
# Description: This script contains solution for Day 7-Mastering Remote Server Management and Web App Deployment as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day7_challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################





echo
echo  "Started the nginx and Dependancies installations"
echo

echo "Started for client-1"
echo
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S apt update && echo 'admin1234' | sudo -S apt install -y nginx"
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S apt-get install -y python3-pip"
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S pip3 install flask"

echo
echo "Completed for Client-1"
echo

echo "Started for client-2"
echo
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S apt update && echo 'admin1234' | sudo -S apt install -y nginx"
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S apt-get install -y python3-pip"
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S pip3 install flask"

echo
echo "Completed for Client-2"
echo


echo
echo  "Started copying the nginx configurations"
echo

echo "Started for client-1"
echo

# Copy Nginx configuration to client1
scp /tmp/client1-nginx.conf client1@192.168.0.12:/tmp/client1-nginx.conf 

echo
echo "Completed for Client-1"
echo

echo "Started for client-2"
echo
#Copy Nginx configuration to client2
scp /tmp/client2-nginx.conf client2@192.168.0.14:/tmp/client2-nginx.conf

echo
echo "Completed for Client-2"
echo


echo
echo  "Started Checking if symlink already created for my_app nginx configuration file."
echo

echo "Started for client-1"
echo
ssh client1@192.168.0.12 "bash -s" < check_and_unlink_symlink.sh

echo
echo "Completed for Client-1"
echo

echo "Started for client-2"
echo
ssh client2@192.168.0.14 "bash -s" < check_and_unlink_symlink.sh

echo
echo "Completed for Client-2"
echo


echo
echo  "Started Moving the nginx configurations"
echo

echo "Started for client-1"
echo
# Move Nginx configuration file on client1
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S mv /tmp/client1-nginx.conf /etc/nginx/sites-available/my_app"

echo
echo

ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S ln -s /etc/nginx/sites-available/my_app /etc/nginx/sites-enabled/"

echo
echo "Completed for Client-1"
echo

echo "Started for client-1"
echo
# Move Nginx configuration file on client2
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S mv /tmp/client2-nginx.conf /etc/nginx/sites-available/my_app"

echo
echo

ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S ln -s /etc/nginx/sites-available/my_app /etc/nginx/sites-enabled/"

echo
echo "Completed for Client-1"
echo

echo
echo  "Started copying the flask application code to nginx."
echo

echo "Started for client-1"
echo
scp -r /home/server/web-app-deploy-shell-scripting client1@192.168.0.12:/tmp
echo
echo
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S cp -pr /tmp/web-app-deploy-shell-scripting/* /etc/nginx/sites-available/"

echo
echo "Completed for Client-1"
echo

echo "Started for client-2"
echo
scp -r /home/server/web-app-deploy-shell-scripting client2@192.168.0.14:/tmp
echo
echo
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S cp -pr /tmp/web-app-deploy-shell-scripting/* /etc/nginx/sites-available/"
echo
echo "Completed for Client-2"
echo


echo
echo  "Started checking if app.py is running on the BOTH remote hosts ."
echo


#Check if app.py is running on the remote host
check_and_kill_app() {
    remote_host=$1    
    if ssh "$remote_host" 'ps aux | grep -q "[a]pp.py"'; then
        echo "app.py is running on $remote_host. Killing the process..."
        # Get the PID of the app.py process on the remote host
        app_pid=$(ssh "$remote_host" 'ps aux | grep "[a]pp.py" | awk "{print \$2}"')
        # Kill the process on the remote host
        ssh "$remote_host" "kill $app_pid"
        echo "app.py process (PID $app_pid) killed successfully on $remote_host."
    else
        echo "app.py is not running on $remote_host."
    fi
}
# Call the function for client1 and client2 VMs
check_and_kill_app "client1@192.168.0.12"
check_and_kill_app "client2@192.168.0.14"

echo
echo "Completed the checking.."
echo


echo
echo  "Running the app in both clients in the background and moving the terminal out to dummy file."
echo

ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S nohup python3 /etc/nginx/sites-available/app.py > /dev/null 2>&1 & "
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S nohup python3 /etc/nginx/sites-available/app.py > /dev/null 2>&1 & "

echo
echo "Completed Running.."
echo

echo
echo  "Reloaing the nginx configurations to ensure nginx knows about the changes."
echo
# Reload Nginx on client1
ssh client1@192.168.0.12 "echo 'admin1234' | sudo -S systemctl reload nginx"
# Reload Nginx on client2
ssh client2@192.168.0.14 "echo 'admin1234' | sudo -S systemctl reload nginx"

echo
echo "Completed All tasks.. validate in browser now"
echo

