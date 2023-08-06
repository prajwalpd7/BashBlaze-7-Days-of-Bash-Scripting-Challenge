#!/bin/bash


read -p "Enter Your Project name: " PROJECT_NAME
# Define the public IPs of client1 and client2
CLIENT1_PUBLIC_IP="13.234.32.101"
CLIENT2_PUBLIC_IP="3.111.213.192"
deploy_file=$(pwd)/deploy.sh

# Execute a command on client1
ssh ubuntu@$CLIENT1_PUBLIC_IP "bash $deploy_file $CLIENT1_PUBLIC_IP $PROJECT_NAME"

# Execute a command on client1
ssh ubuntu@$CLIENT2_PUBLIC_IP "bash $deploy_file $CLIENT2_PUBLIC_IP $PROJECT_NAME"
