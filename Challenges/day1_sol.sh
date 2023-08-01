#!/bin/bash
#accepting the bash scripting challenge
echo "Hello this is day 1 of bash scripting challenge"
num1=10
num2=56
sum=$(( $num1+$num2 ))
echo "sum of numbers is: $sum"
#get the current user
current_usr=$USER
#get the hostname
hostname=$HOSTNAME
#get the present working directory
current_dir=$pwd
echo "current user is $current_usr, hostname is $hostname, current directory is $current_dir"
