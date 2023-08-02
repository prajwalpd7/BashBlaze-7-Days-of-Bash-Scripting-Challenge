#!/bin/bash

usernameExists () {
	# Checks if a user ($1) already exists in the system
	id $1 >& /dev/null
}

createUser() {
	# Creates a new user if not already present in the system
	# The user's home directory is created by default and it uses bash as default shell.
	read -p "Enter new username:" username
	if usernameExists $username; then
		echo "The username '$username' already exists, please choose a different one."
		exit 1
	fi
	read -sp "Enter a password:" password
	echo ""
	sudo useradd -m -s /bin/bash $username
	if [[ $? -ne 0 ]]; then
                echo "There was a error while trying to create the user."
		exit 1
        fi
	echo "$username:$password" | sudo chpasswd
	if [[ $? -eq 0 ]]; then
		echo "User account '$username' created successfully."
	else
		echo "There was a error while assigning password to the user."
		exit 1
	fi
}

deleteUser() {
	# Delete's user account from the system along with its home directory
	read -p "Enter username:" username
	if ! usernameExists $username; then
		echo "Username '$username' does not exist, pleae enter a valid username"
		exit 1
	fi
	sudo userdel -r $username >& /dev/null
	if [[ $? -eq 0 ]]; then
		echo "User account '$username' deleted successfully."
	else
		echo "There was a error while trying to delete '$username' account."
		exit 1
	fi
}

resetPassword() {
	# Reset's a valid user's password
	read -p "Enter username:" username
        if ! usernameExists $username; then
                echo "User '$username' does not exist. Please try again with valid username"
                exit 1
        fi
        read -sp "Enter a password:" password
        echo ""
        echo "$username:$password" | sudo chpasswd
        if [[ $? -eq 0 ]]; then
                echo "Password Changed for '$username'"
        else
                echo "There was a error while trying to change the password of '$username'."
		exit 1
	fi
}

listUsers() {
	# Lists down the users along with their UIDs taken from /etc/passwd file
	awk  'BEGIN{FS=":"}{print $1 " (UID: " $3 ")"}' /etc/passwd
}

showHelp() {
	# Shows the options available in the script
	echo "Usage: ./user_management.sh [Option]"
	echo "Options:"
	echo "-c, --create    Create a new user account (requires sudo permission)"
	echo "-d, --delete    Delete a user account (requires sudo permission)"
	echo "-r, --reset     Reset an existing user's password (requires sudo permission)"
	echo "-l, --list      List all user accounts present in the system."
	echo "-h, --help      Display help page"

}


OPTION=$1
case $OPTION in
	-c | --create)
		createUser
		;;
	-d | --delete)
		deleteUser
		;;
	-l | --list)
		listUsers
		;;
	-r | --reset)
		resetPassword
		;;
	-h | --help)
		showHelp
		exit;;
	*)
		echo "Invalid option. Check the help page for valid options"
		;;
esac

