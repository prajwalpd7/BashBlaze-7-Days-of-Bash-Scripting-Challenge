#!/bin/bash

create_user() {
    echo "Welcome to the user creation script."
    read -p "Enter the new username: " username

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        exit 1
    fi

    read -s -p "Enter password for '$username': " password
    echo

    useradd "$username"
    echo "$username:$password" | chpasswd

    echo "User account '$username' created successfully."
}

delete_user() {
    echo "Welcome to the user deletion script."
    read -p "Enter the username to delete: " username

    # Check if the user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        exit 1
    fi

    userdel -r "$username"

    echo "User account '$username' deleted successfully."
}

reset_password() {
    echo "Welcome to the password reset script."
    read -p "Enter the username to reset password: " username

    # Check if the user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        exit 1
    fi

    read -s -p "Enter the new password for '$username': " password
    echo

    echo "$username:$password" | chpasswd

    echo "Password for user '$username' reset successfully."
}

list_users() {
    echo "List of user accounts:"
    awk -F: '{ print "Username:", $1, "UID:", $3 }' /etc/passwd
}

display_usage() {
    echo "Usage: $0 [-c|--create] [-d|--delete] [-r|--reset] [-l|--list] [-h|--help]"
}

case "$1" in
    -c | --create)
        create_user
        ;;
    -d | --delete)
        delete_user
        ;;
    -r | --reset)
        reset_password
        ;;
    -l | --list)
        list_users
        ;;
    -h | --help)
        display_usage
        ;;
    *)
        display_usage
        ;;
esac
