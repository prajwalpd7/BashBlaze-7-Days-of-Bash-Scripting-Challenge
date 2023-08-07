#!/bin/bash
declare -A client_name_list
declare -A client_ip_list

function validate_cmd_arg_input(){
    echo "Step 1. Validating given files."
    
    for file in "$@"; do
        if [ ! -e "$file" ];then
            echo "$file doesnot exists."
            exit 1
        fi
        if [ ! -s "$file" ]; then
            echo "$file is empty."
            exit 1
        fi
    done
    echo "> File validation successful."
}

function populate_client_list() {
    echo
    echo "Step 2. Load client list data from $1 file into the script."
    
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

function transfer_file(){
    for client_name in "${client_name_list[@]}";do
        local client_ip="${client_ip_list[$client_name]}"
        echo "Transferring project file to $client_ip"
        scp -o StrictHostKeyChecking=no -i "$1" -r node_docker "ubuntu@$client_ip:/home/ubuntu" > /dev/null 2>&1
    done
}

function main(){
    if [ $# -ne 2 ];then
        echo "Usage: ./secure_transfer.sh client_list_file clint_auth_key"
    else
        validate_cmd_arg_input $@
        populate_client_list "$1"
        transfer_file "$2"
    fi
}
main "$1" "$2"