#!/bin/bash
declare -A client_name_list
declare -A client_ip_list

function validate_cmd_arg_input(){
    echo
    echo "Step 1. Validating $1 file."
    # check if user has provided a file of clients to read from
    if [ $# -eq 0 ]; then
        # print usage information
        echo "Info  : This script prepares remote clients for remote connection throught the main server"
        echo "Usage : $0 /path/to/client_ip_list file"
        exit 1
    fi
    # check if the client list file provided by the user exists or not
    if [ ! -e "$1" ]; then
        echo "> The client ip list file provided does not exists."
        exit 1
    fi
    # check if the client list file is empty or not
    if [ ! -s "$1" ]; then
        echo "> The client ip list file provided is empty , please check and execute again"
        exit 1
    fi
    
    echo "> File validation successful."
}


function populate_client_list() {
    echo
    echo "Step 2. Load client list data from $1 file in the script."
    
    local index=1
    while IFS=', ' read -r name ip || [[ -n "$name" ]]; do
        if [[ -n "$name" ]]; then
            echo "Read: name='$name', ip='$ip'"
            client_name_list[$index]=$name
            client_ip_list["$name"]=$ip
            ((index++))
        fi
    done < "$1"
    
    echo "> Done."
}

function connect_and_execute(){
    ssh -o StrictHostKeyChecking=no -i ./ec2key "ubuntu@$1" "$2"
}

function install_packages(){
    echo "Step 3. Installing packages on all clients."
    
    for client_name in "${client_name_list[@]}";do
        local client_ip="${client_ip_list[$client_name]}"
        echo
        echo "Checking for docker on $client_ip"
        connect_and_execute "$client_ip" "which docker > /dev/null 2>&1"
        docker_installed=$?
        
        if [ $docker_installed -eq 0 ];then
            echo "Docker is already installed."
            echo
        else
            echo
            echo "Docker doesnot exists on $client_ip"
            echo "Installing now..."
            connect_and_execute "$client_ip" "sudo apt-get update && sudo apt install docker.io -y > /dev/null 2>&1"
            if [ $? -eq 0 ];then
                echo "Docker successfully installed on $client_ip"
            else
                echo "Unable to install docker."
            fi
        fi
        
        echo "Installing docker compose on $client_ip"
        connect_and_execute "$client_ip" "sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1"
        echo
        echo "Checking for nginx on $client_ip"
        
        connect_and_execute "$client_ip" "which nginx > /dev/null 2>&1"
        nginx_installed=$?
        
        if [ $nginx_installed -eq 0 ];then
            echo "Nginx is already installed."
        else
            echo
            echo "Nginx doesnot exists on $client_ip"
            echo "Installing now..."
            connect_and_execute "$client_ip" "sudo apt-get update && sudo apt install nginx -y > /dev/null 2>&1"
            if [ $? -eq 0 ];then
                echo "Nginx successfully installed on $client_ip"
            else
                echo "Unable to install nginx."
            fi
        fi
        
    done
}

function main(){
    # validate user input
    validate_cmd_arg_input "$1"
    sleep 1
    # populate client list data from the given flile
    populate_client_list "$1"
    sleep 1
    # if ssh key doesnot exists create it
    install_packages
}

main "$1"