#!/bin/bash


echo "Welcome to UserMangerinator"

#Function to create user
function createUser(){
    echo "Creating User"
    #Prompting user for username and password
    read -p "Enter the new Username: " username
    read -s -p "Enter the Password for $username: " password
    #checking if username already exists
    egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username already exists!, Please choose another username."
		exit 1
	else
        #Adding user with the entered password
		useradd -m -p "$password" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
    fi

}

#Function to delete an existing user
function deleteUser(){
    echo "Deleting User"
    read -p "Enter the new Username to delete: " username
    #Checking if the username exists or not
    egrep "^$username" /etc/passwd >/dev/null
    if [ $? -ne 0 ]; then
		echo "$username does not exists!, Please enter a valid username that exist."
		exit 1
    else
        #Deleting the user and home directory of user
        userdel -r username
        [ $? -eq 0 ] && echo "User $username deleted from system successfully!" || echo "Failed to deleted the user!"
    fi
}

#Function to reset the user password
function resetPassword(){
    read -p "Please enter username:" username
    read -s -p "Please enter the new password:" password1
    read -s -p "Please repeat the new password:" password2
    # Check if both passwords match
    if [ $password1 != $password2 ]; then
        echo "Passwords do not match. Please try again."
        exit    
    fi
    # Checking if user exists
    id $username &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$username does not exists!, Please enter a valid username that exist."
        exit 1 
    fi
    # Change password for specified username
    echo -e "$password1n$password1" | passwd $username
    echo "Password for user $username reset successfully."
}

#Function to list of all system users
function listUsers(){
    echo "Listing Users in System"
    awk -F':' '{ print $1" (User ID: "$3")"}' /etc/passwd
}

#Function to list of all system users and additional details
function listUsersDetailed(){
    echo "Listing Users in System and Additional details"
    awk -F':' '{ print $1" (User ID: "$3") (Home Directory: "$6") (bash: "$7")"}' /etc/passwd
}

#Function to display help
function help(){
    echo "Usage ./user_management.sh [options]"
    echo "Options:"
    echo -e "\t -c, --create     Create a new user account"
    echo -e "\t -d, --delete     Create an existing user account"
    echo -e "\t -r, --reset      Reset Password for an existing user account"
    echo -e "\t -l, --list       List all User account on systme"
    echo -e "\t -h, --help       Display help"

}

VALID_ARGS=$(getopt -o cdrlhu --long create,delete,reset,list,help,list_detailed -- "$@")

# Check for argument provided
if [[ $1 == "" ]]; then
    help
    exit 1;
fi

eval set -- "$VALID_ARGS"

# Loop to call specific function based on argument provided.
while [ : ]; do
    case $1 in
        -c | --create)
            createUser
            shift;;
    
        -d | --delete)
            deleteUser
            shift;;

        -r | --reset)
            resetPassword
            shift;;

        -l | --list)
            listUsers
            shift;;

        -h | --help)
            help
            shift;;
        
        -u | --list_detailed)
            listUsersDetailed
            shift;;

        --)shift;
            break;;
        
    esac
done
shift $(( $OPTIND - 1))

