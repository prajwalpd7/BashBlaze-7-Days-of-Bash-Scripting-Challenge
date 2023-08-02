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
	# Lists down the users, UIDs, Home Directory, and default shell
	awk -F":" 'BEGIN{print "USER" " " "UID" " " "HOME" " " "SHELL"}{print $1,$3,$6,$7}' /etc/passwd | column -t
}

showHelp() {
	# Shows the options available in the script
	echo "Usage: ./user_management.sh [Option]"
	echo "Options:"
	echo "-c, --create    Create a new user account (requires sudo permission)"
	echo "-d, --delete    Delete a user account (requires sudo permission)"
	echo "-r, --reset     Reset an existing user's password (requires sudo permission)"
	echo "-l, --list      List all user accounts present in the system."
	echo "-u, --update    Update user account"
	echo "-h, --help      Display help page"

}

updateUser() {
	echo "----- User Modification Menu -----"
    	echo "1. Change user's login name"
    	echo "2. Change user's home directory"
    	echo "3. Change user's default shell"
	echo "4. Lock user account"
	echo "5. Unlock user account"
	echo "6. Change UID of user"
    	echo "7. Exit"
	read -p "Choose option:" option
	case $option in
		7)
			exit;;
		1)
			read -p "Enter your old username:" username
			if ! usernameExists $username; then
				echo "$username user does not exits"
				exit 1
			fi
			read -p "Enter your new username:" newUsername
			sudo usermod -l $newUsername $username
			if [[ $? -ne 0 ]];then
				echo "An error occurred while trying to change login name"
				exit 1
			else
				echo "username changed from $username to $newUsername"
			fi
			;;
		2)
			read -p "Enter your username:" username
                        if ! usernameExists $username; then
                                echo "$username user does not exits"
                                exit 1
                        fi
			read -p "Enter path of new home directory:" homedirectory
			sudo usermod -m -d "$homedirectory" "$username"
			;;
		3)
            		read -p "Enter the username:" username
			if ! usernameExists $username; then
                                echo "$username user does not exits"
                                exit 1
                        fi
            		read -p "Enter new shell path:" newShell
			if [[ ! -f $newShell  ]]; then
				echo "Shell not found in path, please provide a valid shell path"
				exit 1
			fi
			sudo usermod -s "$newShell" "$username"
			if [[ $? -ne 0 ]];then
				echo "An error occurred while changing default shell of $username"
				exit 1
			else
				echo "Default shell of $username changed successfully to $newShell"
			fi
			;;
		4)
			read -p "Enter the username:" username
			if ! usernameExists $username; then
                                echo "$username user does not exits"
                                exit 1
                        fi
			sudo usermod -L "$username"
			if [[ $? -ne 0 ]];then
                                echo "An error occurred while locking the account of $username"
                                exit 1
                        else
                                echo "Account locked successfully"
                        fi
			;;
		5)
		       read -p "Enter the username:" username
                        if ! usernameExists $username; then
                                echo "$username user does not exits"
                                exit 1
                        fi
                        sudo usermod -U "$username"
                        if [[ $? -ne 0 ]];then
                                echo "An error occurred while unlocking the account of $username"
                                exit 1
                        else
                                echo "Account unlocked successfully"
                        fi
                        ;;
		6)
			read -p "Enter the username:" username
                        if ! usernameExists $username; then
                                echo "$username user does not exits"
                                exit 1
                        fi
			read -p "Enter new UID:" uid
			sudo usermod -u "$uid" "$username"
			;;
	esac
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
	-u | --update)
		updateUser
		;;
	*)
		echo "Invalid option. Check the help page for valid options"
		;;
esac

