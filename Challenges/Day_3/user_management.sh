#!/bin/bash
# check if a username exists
username_exists() {
    if id "$1" &>/dev/null; then
        return 0 # Username exists
    else
        return 1 # Username does not exist
    fi
}

# create a new user account
create_user() {
    read -p "Enter the new username: " new_username
    if username_exists "$new_username"; then
        echo "Error: Username already exists. Please choose a different username."
        exit 1
    fi

    read -s -p "Enter the password for the new user: " new_password
    echo
    read -s -p "Confirm the password: " confirm_password
    echo

    if [ "$new_password" != "$confirm_password" ]; then
        echo "Error: Passwords do not match. User account creation failed."
        exit 1
    fi

    # Create the new user account
    sudo useradd -m "$new_username" &>/dev/null
    echo "$new_username:$new_password" | sudo chpasswd
    echo "User account '$new_username' created successfully."
}

# delete an existing user account
delete_user() {
    read -p "Enter the username to be deleted: " del_username
    if ! username_exists "$del_username"; then
        echo "Error: Username does not exist. Deletion failed."
        exit 1
    fi

    # Delete the user account
    sudo userdel -r "$del_username" &>/dev/null
    echo "User account '$del_username' deleted successfully."
}

# reset the password of an existing user account
reset_password() {
    read -p "Enter the username for password reset: " reset_username
    if ! username_exists "$reset_username"; then
        echo "Error: Username does not exist. Password reset failed."
        exit 1
    fi

    read -s -p "Enter the new password for the user: " new_password
    echo
    read -s -p "Confirm the new password: " confirm_password
    echo

    if [ "$new_password" != "$confirm_password" ]; then
        echo "Error: Passwords do not match. Password reset failed."
        exit 1
    fi

    # Reset the user's password
    echo "$reset_username:$new_password" | sudo chpasswd
    echo "Password for user '$reset_username' reset successfully."
}

# list all user accounts on the system
list_users() {
    echo "List of user accounts:"
    echo "Username      UID"
    echo "-----------------"
#    cut -d: -f1,3 /etc/passwd
while IFS=: read -r username _ uid _; do
	echo "- $username   (UID: $uid)"
    done < /etc/passwd
}

# display usage information and available options
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset the password of an existing user account"
    echo "  -l, --list      List all user accounts on the system"
    echo "  -h, --help      Display this help message"
}

# Main script starts here
# Check if there are any command-line arguments
if [ $# -eq 0 ]; then
    usage
    exit 1
fi
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -c|--create)
            create_user
            ;;
        -d|--delete)
            delete_user
            ;;
        -r|--reset)
            reset_password
            ;;
        -l|--list)
            list_users
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Error: Invalid option. Use -h or --help to see available options."
            exit 1
            ;;
    esac
    shift
done

