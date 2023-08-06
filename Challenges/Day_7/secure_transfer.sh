#!/bin/bash

# Check if the user provided the log file path as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_project_directory>"
    exit 1
fi

# Define the source directory to transfer
source_directory=$1
if [ ! -d "$source_directory" ]; then
        echo "directory does not exist. Please enter an existing directory name."
        exit 0
fi

# Define the public IPs of client1 and client2
client1_public_ip="13.234.32.101"
client2_public_ip="3.111.213.192"

# Define the remote user and destination path for both clients
remote_user="ubuntu"
destination_path="/home/ubuntu"

# Transfer the directory to client1
scp -r "$source_directory" "$remote_user@$client1_public_ip:$destination_path"

#Transfer the directory to client2 (similarly)
scp -r "$source_directory" "$remote_user@$client2_public_ip:$destination_path"
