#!/bin/bash

<<<<<<< HEAD
# Function to display usage information and available options
function display_usage {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."
}

# Function to create a new user account
function create_user {
    read -p "Enter the new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: The username '$username' already exists. Please choose a different username."
    else
        # Prompt for password (Note: You might want to use 'read -s' to hide the password input)
        read -p "Enter the password for $username: " password

        # Create the user account
        useradd -m -p "$password" "$username"
        echo "User account '$username' created successfully."
    fi
}

# Function to delete an existing user account
function delete_user {
    read -p "Enter the username to delete: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        userdel -r "$username"  # -r flag removes the user's home directory
        echo "User account '$username' deleted successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

# Function to reset the password for an existing user account
function reset_password {
    read -p "Enter the username to reset password: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        # Prompt for password (Note: You might want to use 'read -s' to hide the password input)
        read -p "Enter the new password for $username: " password

        # Set the new password
        echo "$username:$password" | chpasswd
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

# Function to list all user accounts on the system
function list_users {
    echo "User accounts on the system:"
    cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

# Check if no arguments are provided or if the -h or --help option is given
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    display_usage
    exit 0
fi

# Command-line argument parsing
while [ $# -gt 0 ]; do
    case "$1" in
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
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
    shift
done
=======
# Check for help option

if [ "$1" == "-h" ] || [ "$1" == "--help" ]
 then
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create  Create a new user account."
    echo "  -d, --delete  Delete an existing user account."
    echo "  -r, --reset   Reset password for an existing user account."
    echo "  -l, --list    List all user accounts on the system."
    echo "  -h, --help    Show this help message"
    exit 0
fi

# Create a new user account 

if [ "$1" == "-c" ] || [ "$1" == "--create" ]
 then
    read -p "Enter a new username: " username
    id "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "The username '$username' already exists. Please choose a different username."
    else
        sudo useradd -m "$username"
        sudo passwd "$username"
        echo "User account '$username' created successfully."
    fi

# Delete an existing user account 

elif [ "$1" == "-d" ] || [ "$1" == "--delete" ]
 then
    read -p "Enter the username to delete: " username
    id "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        sudo userdel -r "$username"
        echo "Done! Account '$username' deleted successfully."
    else
        echo "Sorry, The username '$username' doesn't exist.Please enter a valid username"

    fi
# Reset password for a user account

elif [ "$1" == "-r" ] || [ "$1" == "--reset" ]
 then
    read -p "Enter the username to reset password: " username
    id "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        sudo passwd "$username"
        echo "Password for '$username' reset successfully."
    else
        echo "Uh-oh! '$username' doesn't exist."
    fi

# List all the user accounts

elif [ "$1" == "-l" ] || [ "$1" == "--list" ]
 then
    echo "User accounts on the system :"
    echo "Username   UID"
    echo "----------------"
    awk -F: '{print $1 "   " $3}' /etc/passwd

# Handle invalid options

else
    echo "Oops! Invalid option: $1"
    echo "Use '$0 -h' to see available options."
    exit 1
fi
>>>>>>> d62a793 (Day03 solution added)
