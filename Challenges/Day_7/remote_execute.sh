#!/bin/bash

#This script accepts multiple commands as a single command line argument enclosed with double quotes
#It then runs those commands and both the clients

declare -A clients
clients["client1"]="ubuntu@172.31.43.191"
clients["client2"]="ubuntu@172.31.35.58"

executeCommand(){
	for key in ${!clients[@]};do
		echo "---- BEGINNING $key ----"
        	ssh ${clients[$key]} "${command}"
        	echo "---- ENDING $key ----"
	done
}

if [[ $# -ne 1 ]];then
	echo "Usage: $0 \"command1;command2;command3\""
	exit 1
fi

command=$1

if [[ -z $command ]];then
	echo "Received Empty command"
	exit 1
fi

executeCommand
