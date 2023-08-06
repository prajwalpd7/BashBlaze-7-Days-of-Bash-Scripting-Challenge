#!/bin/bash

#  This script only allows sending file/folder from the server to client and it saves it to a fixed path in the remote directory.

showHelp(){
	echo "Usage: $0 \"<src file path>\""
        echo "Example: To transfer a file output.txt present in current directory from local to a client: $0  output.txt"
        echo "Example: To transfer a folder present in current directory from local to a client: $0  folder"
}

REMOTE_FOLDER_PATH="/home/ubuntu/received"
declare -A clients

if [[ $# -ne 1 || $1 == "-h" || $1 == "--help" ]];then
	showHelp
fi

clients["client1"]="ubuntu@172.31.43.191"
clients["client2"]="ubuntu@172.31.35.58"
src=$1
type="none"
if [[ -z $src ]];then
	echo "Please see $0 --help for correct usage"
	exit 1
elif [[ -d $src ]]; then
	type="folder"
elif [[ -f $src ]];then
	type="file"
else
	echo "Some error occurred, contact maintainer of the script"
	exit 1
fi

for key in ${!clients[@]};do
	echo "---- Beginning $key ----"
	if [[ $type == "folder" ]];then
		scp -r $src "${clients[$key]}:$REMOTE_FOLDER_PATH/"
	elif [[ $type == "file" ]];then
		scp $src "${clients[$key]}:$REMOTE_FOLDER_PATH/"
	fi
	echo "---- Ending $key ----"
done
