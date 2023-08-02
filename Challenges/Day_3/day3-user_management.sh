#!/bin/bash

# Function to display help and usage information
function display_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset the password of an existing user account"
    echo "  -l, --list      List all user accounts"
    echo "  -h, --help      Display this help message"
}

# Function to create a new user account
function create_account() {
    read -p "Enter new username: " username
    id "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Username already exists. Please choose a different username."
        exit 1
    fi
    sudo useradd "$username"
    sudo passwd "$username"
    echo "User account '$username' created successfully."
}

# Function to delete an existing user account
function delete_account() {
    read -p "Enter username to delete: " username
    id "$username" &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Username does not exist."
        exit 1
    fi
    sudo userdel -r "$username"
    echo "User account '$username' deleted successfully."
}

# Function to reset password of an existing user account
function reset_password() {
    read -p "Enter username to reset password: " username
    id "$username" &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Username does not exist."
        exit 1
    fi
    sudo passwd "$username"
    echo "Password for user '$username' reset successfully."
}

# Function to list all user accounts
function list_accounts() {
    echo "List of user accounts:"
    awk -F':' '{print "Username: " $1 ", UID: " $3}' /etc/passwd
}

# Check if no arguments provided
if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--create)
            create_account
            ;;
        -d|--delete)
            delete_account
            ;;
        -r|--reset)
            reset_password
            ;;
        -l|--list)
            list_accounts
            ;;
        -h|--help)
            display_help
            exit 0
            ;;
        *)
            echo "Invalid option: $1"
            display_help
            exit 1
            ;;
    esac
    shift
done
