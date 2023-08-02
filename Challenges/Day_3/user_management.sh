#!/bin/bash

#this will be called when the user inputs nothing, -h or --help
help(){
	echo "Usage: ./user_management.sh [OPTIONS]"
	echo "Options:"
	echo " -c, --create     Create a new user account."
	echo "-d, --delete      Delete and existing user account."
	echo "-r, --reset       Reset password for an existing user account."
	echo "-l, --list        List all user accounts on the system."
	echo "-h, --help        Display this help and exit."
}

#this will be called when the user inputs -c or --create
create(){
	read -p "Enter the new username: " username

	#this line will check if the user exists or not
	a=`grep -w $username /etc/passwd`

	#the length of "a" will not be zero if the user already exists
	if [ ${#a} -ne 0 ]
	then echo "Error: The username $username already exists. Please choose a different username."
	else
		#this will create the user as the user doesnt exist
		read -p "Enter the password for $username: " password
		sudo useradd $username

		#this will give password to the command and any output will be not displayed on terminal
		echo -e "$password\n$password" | sudo passwd $username 2>>/dev/null
		echo "User account '$username' created successfully."
	fi
}

#this will be called when the user inputs -d or --delete
delete(){
	read -p "Enter the username to delete: " uname_del

	#this line will check if the user exists or not
	a=`grep -w $uname_del /etc/passwd`

	#the length of "a" will not be zero if the user already exists
	if [ ${#a} -eq 0 ]
	then echo "Error: The username $uname_del doesn't exist. Please enter a valid username."
	else
		#this will delete the user as the user exists
		sudo userdel $uname_del
		echo "User account $uname_del deleted successfully"
	fi
}

#this will be called when the user inputs -r or --reset
reset(){
	read -p "Enter the username to reset password: " uname_res
	
	#this line will check if the user exists or not
	a=`grep -w $uname_res /etc/passwd`
	
	#the length of "a" will not be zero if the user already exists
	if [ ${#a} -eq 0 ]
	then echo "Error: The username $uname_res doesn't exist. Please enter a valid username."
	else
		#this will reset the password of the user as the user exists
		read -p "Enter the new password for $uname_res: " newp
		echo -e "$newp\n$newp" | sudo passwd $uname_res 2>>/dev/null
		echo "Password for user '$uname_res' reset successfully." 
	fi
}

#this will be called when the user inputs -l or --list
list(){
	#this will print the 1st and 3rd column from the /etc/passwd file with required formatting.
	awk -F: '{print "- "$1,"(UID: "$3")"}' /etc/passwd
}

#we will use better than if-elif to call the functions based on the arguemnt passed
#in case, we can use "and" to combine conditions, i have written multiple times.
case "$1" in 
	"")
		help
                ;;	
	"-h")
                help
                ;;
	"-help")
                help
                ;;
	"--create")
		create
		;;
	"-c")
                create
                ;;
	"--delete")
		delete

		;;
	"-d")
                delete
                ;;
	"--reset")
		reset
		;;
	"-r")
                reset
                ;;
	"--list")
                list
                ;;
	"-l")
                list
                ;;
	*)
		;;
esac



		
