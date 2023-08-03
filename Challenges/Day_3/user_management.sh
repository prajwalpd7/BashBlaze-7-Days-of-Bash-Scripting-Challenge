#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Usage: ./user_management.sh [OPTIONS]"
   echo
   echo "Options:"
   echo "-c, --create	Create a new user account."
   echo "-d, --delete	Delete an existing user account."
   echo "-r, --reset	Reset password for an existing user account."
   echo "-l, --list	List all user accounts on the system."
   echo "-h, --help	Display this help and exit."
   echo "-i, --info	Display Extra User Info."
   echo "-u, --uname	Change username."
}


############################################################
# Main program                                             #
############################################################

	if [ "$1" = "--create" -o "$1" = "-c" ]; then
	   read -p "Enter username: " username
	   read -p "Enter password: " userpass
	   if id "$username" >/dev/null 2>&1; then
	   echo "ERROR: User already present. Please choose a different username."
	   else
	   sudo useradd $username
	   echo "SUCCESS: User account for $username created Successfully."
	   fi
	elif [ "$1" = "--delete" -o "$1" = "-d" ]; then
	    read -p "Enter username to delete: " username
	    read -p "Please confirm (y/n): " option
	    if [ $option = 'y' ]; then
	    	if id "$username" >/dev/null 2>&1; then
	        sudo userdel $username
	    	echo "SUCCESS: User deleted Successfully."
	        else
	    	echo 'ERROR: User not present. Please Check.'
		fi
	    else echo 'Cancelling User Deletion Process.'
	    fi
	elif [ "$1" = "--reset" -o "$1" = "-r" ]; then
	    read -p "Enter the username to reset password: " username
		if id "$username" >/dev/null 2>&1; then
		read -p 'Enter new password: ' userpass
		sudo chpasswd <<< "$username:$userpass"
		echo 'SUCCESS: Password reset successfully.'
		else echo 'ERROR: User not present'
		fi 
	elif [ "$1" = "--list" -o "$1" = "-l" ]; then
	cat /etc/passwd | awk -F':' '{print $1 " (ID: "$3")"}'
	elif [ "$1" = "--info" -o "$1" = "-i" ]; then
	read -p "Enter the username to get additional info: " username
                if id "$username" >/dev/null 2>&1; then
		echo '====== USER INFO ======'
                lslogins -u $username
                else echo 'ERROR: User not present'
                fi
	elif [ "$1" = "--uname" -o "$1" = "-u" ]; then
        read -p "Enter the username to change: " username
                if id "$username" >/dev/null 2>&1; then
		read -p "Enter new username: " newuser
		echo 'SUCCESS: Username updated successfully.'
		sudo usermod -l $newuser $username
                else echo 'ERROR: User not present'
                fi
	elif [ "$1" = "" -o "$1" = "--help" -o "$1" = "-h" ]; then Help
	fi
