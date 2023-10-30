#Author : Apurv Samadder
#Date : Aug 2 2023
#Version: v1
#Day 3  Bash Scripting Challenge - User Account Management.



#!/bin/bash

#Create a user 
add_user()
{
echo "enter username "
read username

#echo "Enter password"
#read pass

if grep "${username}" /etc/passwd >/dev/null 2>&1; then

  echo "User alread present"

else
	echo "enter password"
	read pass
	useradd  -m -p $pass $username && echo "Successfully added user"

fi 
}

#delete user

delete_user()
{

if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges."
    exit 1
fi

# Prompt the user for the username to delete
read -p "Enter the username you want to delete: " username

# Check if the username exists
if id "$username" &>/dev/null; then
    # Delete the user and their home directory
    userdel -r "$username"
    echo "User '$username' and home directory deleted."
else
    echo "User '$username' does not exist."
fi
}


reset_passwd()
{

if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges."
    exit 1
fi

# Prompt the user for the username to changes password
read -p "Enter the username you want to delete: " username

# Check if the username exists
if id "$username" &>/dev/null; then
    # Changes the password if user exist
    passwd "$username"
    echo "User '$username' Password changed."
else
    echo "User '$username' does not exist."
fi
}

list_user()
{
	# Read uid column  /etc/passwd
	for userid in `awk -F: '{print $3}' /etc/passwd`
        do
                if ("$userid" >= 1000); then
                        echo "Valid User" :`cat /etc/passwd | grep $userid | awk -F: '{print $1,$3}'`
                fi
        done
}


user_mgmt()
{
echo "options"
echo "-c,--create  create a new user accoutn"
echo "-d, --delete Delete and existing user account"
echo "-r, --reset  Reset a password for existing user"
echo "-l, --list  List all the user in system"
echo "-h, --help Display this help and exit"

read option

case $option  in
    -c|--create)
      add_user
      ;;
    -d|--delete)
      echo "inside delete" 
      delete_user
      ;;
    -r|--reset)
      echo "inside reset"
      reset_passwd  
      ;;
    -l|--list)
      list_user
      echo "inside list" 
      ;;
    -h|--help)
      echo "inside help" 
      ;;  
      *)
      echo "please enter valid option"
      user_mgmt
      ;;
esac
}

user_mgmt


