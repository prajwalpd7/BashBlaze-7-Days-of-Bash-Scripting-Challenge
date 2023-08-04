#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 03/08/2023
# Description: #TWSBashBlazeChallenge Day-3
# Task : User Account management

check_user_exists(){
    id "$1" &> /dev/null
    
}
check_group_exists(){
    getent group "$1" &> /dev/null
}

create_user(){
    echo
    local user_create_success
    local passwd_create_success
    read -p "Enter username: " username
    check_user_exists "$username"
    if (( $? == 0 ))
    then
        echo Error : $username user already exists
    else
        read -p  "Enter password for user - $username : " password
        if (( ${#password} <= 4 ))
        then
            echo Password should be atleast of 4 characters
        else
            check_group_exists "$username"
            if (( $? == 0 ))
            then
                sudo useradd -g $username -m $username
            else
                sudo useradd -m $username
            fi
            user_create_success=$?
            echo "$username:$password" | sudo chpasswd
            passwd_create_success=$?
            if (( user_create_success == 0 && passwd_create_success == 0  ))
            then
                echo User added successfully
            else
                sudo userdel -r $username > /dev/null 2>&1
                echo Unable to add user
            fi
        fi
    fi
    echo
}

delete_user(){
    echo
    read -p "Enter username : " username
    check_user_exists "$username"
    if (( $? == 0 ))
    then
        sudo userdel -r "$username"
        if (( $? == 0 ))
        then
            echo User - "$username", deleted successfully
        else
            echo Error : unable to delete user
        fi
    else
        echo Error : $username user doesnot exists
    fi
    echo
}

reset_user_passwd(){
    echo
    read -p "Enter username to reset password : " username
    check_user_exists "$username"
    if (( $? == 1  ))
    then
        echo Error : $username user doesnot exists
    else
        read -p "Enter new password for $username : " password
        if (( ${#password} <= 4 ))
        then
            echo Password should be atleast of 4 characters
        else
            echo "$username:$password" | sudo chpasswd
            if (( $? == 0 ))
            then
                echo Password for user "$username" changed successfully
            else
                echo Error : Unable to change password for user "$username"
            fi
        fi
    fi
    echo
}

list_users(){
    echo
    echo "List of users on the system:"
    sudo cat /etc/passwd | awk -F: '{print $1}'
    echo
}

display_script_options(){
    echo
    echo "Usage: $0 [OPTIONS]"
    echo Options:
    echo "-c, --create	Create a new user account."
    echo "-d, --delete	Delete an existing user account."
    echo "-r, --reset	Reset password for an existing user account."
    echo "-l, --list	List all user accounts on the system."
    echo "-h, --help	Display this help and exit."
    echo
}

main(){
    case $1 in
        "-c" | "--create") create_user ;;
        "-d" | "--delete") delete_user;;
        "-r" | "--reset") reset_user_passwd;;
        "-l" | "--list") list_users;;
        "-h" | "--help") display_script_options;;
        *) display_script_options;;
    esac
}

main "$1"

