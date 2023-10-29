#!/bin/bash

# Above is a shebang command.

# Create user function if called will ask for new user name and create a new user name. If user already exist then error message will be displayed.
create_user()
{

                echo "Enter the New Username:  "
		#read command will assign username entered by user in terminal to variable "user"
		read -p " " user
		# If statement will check for valid user. "getent" will check for username in /etc/passwd file.
		if [ $(getent passwd $user) ] ; then
                        echo "Sorry, User "$user" already exist in the system. Please enter different User Name"
                       
                else
		# If the "IF" condition is false then user is added using sudo useradd command.
			sudo useradd $user
			echo "User account "$user" created successfully"
                        echo "Please Enter the Password for USER: $user  "
			#read command will assign password entered by user in terminal to variable "password"
                        read -p " " password
			# This password variable is assigned as password to the user using sudo passwd command. "\n" is used to give to separate lines of same 				password.
                        echo -e "$password\n$password" | sudo passwd $user
			echo "Password for USER $user has been ADDED Successfully"
		# Ending If loop using "fi".
                fi

}

delete_user()
{
		echo "Enter username that needs to be deleted :   "
		#read command will assign username entered by user in terminal to variable "user"
		read -p " " user
		# If statement will check for valid user. "getent" will check for username in /etc/passwd file.
		if [ $(getent passwd $user) ] ; then
			echo "User $user is present, Deleting User"
			# cd /root is changing directory to root.
			cd /root
			# "userdel" command is used to delete user.
			sudo userdel -rf $user
			echo "USER: $user has been DELETED Successfully"
		else

		# If "IF" statement becomes false then below messege will be displayed.
                        echo "Sorry, USER: "$user" does not exist in the system. Please enter valid User Name"
		# Ending If loop using "fi".
		fi

}	

reset_password()
{
                echo "Enter the username whose password needs to be reset:  "
		#read command will assign username entered by user in terminal to variable "user"
                read -p " " user
                
		# If statement will check for valid user. "getent" will check for username in /etc/passwd file.
                if [ $(getent passwd $user) ] ; then
         
                        echo "Please enter the New Password for user $user :  "
			#read command will assign new password entered by user in terminal to variable "password"
                        read -p " " password
			# This new password will be assigned to username using passwd command.
                        echo -e "$password\n$password" | sudo passwd $user
                        echo "Password for user '$user' has been RESET Successfully"
		else
		# If "IF" statement becomes false then below messege will be displayed.	
			echo "Sorry, User "$user" does not exist in the system. Please enter valid Username"
		# Ending If loop using "fi".
		fi
}

list_useraccounts()
{	
		echo "User account on the system:"
		# User account details such as user name and UID will be present in /etc/passwd file.
		# Here cat command is used to print contents in passwd file and these lines will be passed as parameters to awk command. Using awk command we 			can display required column. First colunm is printed using $1, third column is printed using $3. ":" is  the field separator.
		sudo cat /etc/passwd | awk -F ":" '{print "-" $1,"(UID: "$3 ")"}'

}

help_option()
{
	echo "
                Usage : ./user_management.sh [OPTIONS]
                Options:
                  -c, --create      	Create a new user account.
                  -d, --delete      	Delete an existing user account.
                  -r, --reset       	Reset password for an existing user account.
                  -l, --list        	List all user accounts on the system.
                  -h, --help        	Display this help and exit.
 		  -n, --changename      Change the name of a user.
                  -m, --homedirectory   Displey Home Directory and User Shell Details."
}

homedirectory()
{
                echo "Home Dirctory and shell of USER"
		echo "Enter the Username that needs to be changed"
	        read -p " " user
		# If statement will check for valid user. "getent" will check for username in /etc/passwd file.
        	if [ $(getent passwd $user) ] ; then
                	echo "User $user is present."
			#Here cat command is used to print contents in passwd file and these lines will be passed as parameters to awk command. Using awk comm			       and we can display required column. First colunm is printed using $1, 6th column is printed using $6 and 7th column using "$7". ":" 			     is  the field separator.
			sudo cat /etc/passwd | awk -F ":" '{print "USERNAME--"$1,"-- HOME DIRECTORY:" $6,"( -- USER SHELL: "$7 ")"}' | grep -w $user

		else
		# If "IF" statement becomes false then below messege will be displayed.
			echo "Entered Username is invalid"
        	fi

}

changename()

{
	echo "Enter the Username that needs to be changed"
	read -p " " user
	# If statement will check for valid user. "getent" will check for username in /etc/passwd file.
	if [ $(getent passwd $user) ] ; then
		echo "User $user is present."
		echo "Enter new name for USER: $user"
		# Read command will take new username.
		read -p " " newname
		# usermod command is used to make changes to the username.
		sudo usermod -l $newname $user
	else
	# If "IF" statement becomes false then below messege will be displayed.

		echo "Entered Username is invalid"
	fi



}


# Main program starts from here
# Below if statement will check for the argument passed in command line. If argument is not passed then "$#" system variable will give "0" and the if statement hold true.

if [[ $# -eq 0 ]]; then
	# Below message will be displayed no argument is passed.
	echo " Wrong Option arument or No argument is given "

fi

# If any value is entered then it will the first argument, whose value will be store in "$1" system variable.
# This value is assigned to user defined variable "option" using below command.

option=$1

# Below is a CASE statement that checks the input passed as argument and matches variables and executes particular function thats been mentioned in the path.

case $option in
-c | --create)
	echo "Option -c or --create is pressed"
	# if -c or --create is pressed then create_user() function is called.
	create_user ;;
-d | --delete)
	echo "Option -d or --delete is pressed"
	# if Option -d or --delete is pressed then delete_user() function is called.
	delete_user ;;
-r | --reset)
        echo "Option -r or --reset is pressed"
	# if Option -r or --reset is pressed then reset_password() function is called.
	reset_password;;
-l | --list)
        echo "Option -l or --list  is pressed"
	# if Option -l or --list  is pressed then list_useraccounts() function is called.
	list_useraccounts;;
-h | --help)
	echo "Option -h or --help is pressed"
	#if Option -h or --help is pressed then help_option() functon is called.
	help_option;;
-n | --changename)
	echo "Option -n or --changename is pressed"
	# if Option -n or --changename is pressed then changename() function is called.
	changename;;
-m | --homedirectory)
	echo "Option -h or --homedirectory is pressed"
	# if Option -h or --homedirectory is pressed then homedirectory() function is called.
	homedirectory;;
*)
	echo "Invalid Option Pressed"
	# if Invalid Option is Pressed help_option() functoion is called.
	help_option;;
esac

