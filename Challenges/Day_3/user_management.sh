#!/bin/bash

options() {
    echo Usage: $(basename "$0") [OPTIONS]
    echo Options:
    echo "  -c, --create     Ceate a new user account."
    echo "  -d, --delete     Delete an existing user account."
	echo "  -r, --reset      Reset the password of an existing user account."
  	echo "  -l, --list       List all user accounts on the system."
  	echo "  -h, --help       Display this help and exit."
}

# Function to create a new user account
create_user_account() {
    read -p "Enter new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "the Username '$username' already exists. Please choose a different username."
        exit 1
    fi

    # Prompt for password and create the user account
    read -s -p "Enter new password: " password
    echo
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd
    echo "user Account '$username' created successfully."
}

# Function to delete an existing user account
delete_user_account() {
    read -p "Enter username to delete: " username

    # Check if the username exists
    if ! id "$username" &>/dev/null; then
        echo "the Username '$username' does not exists. Please enter a valid username."
        exit 1
    fi

    sudo userdel -r "$username"
    echo "user Account '$username' deleted successfully."
}

# Function to reset the password of an existing user account
reset_password() {
    read -p "Enter username to reset password: " username

    # Check if the username exists
    if ! id "$username" &>/dev/null; then
        echo "the Username '$username' does not exists. Please enter a valid username."
        exit 1
    fi

    read -s -p "Enter new password: " password
    echo
    echo "$username:$password" | sudo chpasswd

    echo "Password for user '$username' reset successfully."
}

# Function to list all user accounts
list_user_accounts() {
    echo "User Accounts on the system:"
    awk -F':'  '{print "- " $1 "\t(UID: " $3")"}' /etc/passwd
}

# Function to display usage information
display_usage() {
    options
    }

# Check if no argument is provided
if [ -z "$1" ]; then
    options
    exit 1
fi

# Check for command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
    -c|--create)
        create_user_account
        ;;
    -d|--delete)
        delete_user_account
        ;;
    -r|--reset)
        reset_password
        ;;
    -l|--list)
        list_user_accounts
        ;;
    -h|--help)
        display_usage
        ;;
    *)
        echo "'$1' is not a valid option. See '$(basename "$0")' -h or --help' for available options."
        exit 1
        ;;
esac
shift
done
