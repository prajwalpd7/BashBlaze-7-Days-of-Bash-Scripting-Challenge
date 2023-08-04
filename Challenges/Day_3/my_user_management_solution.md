## **👩‍💻Introduction**

Welcome back to the Day 3 of the #TWSBashBlazeChallenge! I hope you guys are enjoying the challenge and learning a lot through it. In this blog, we will create a bash script that provides options for managing user accounts on the system. The script will allow users to perform account-related tasks based on command-line arguments.

Let's try to understand the real-life scenario based on this task. Let's suppose you are a system administrator and if we have a new employee joining your organization then you may need to add a new user. Similarly, if an employee leaves the organization this user needs to be deleted. In these cases, the system administrator has to perform these operations. So let's learn how to do it!

## **🔍🔐 Part 1: Account Creation 💻🚀**

In this task, we need to write a bash script that creates a user account. Here, the script should prompt the user to enter a new username and password. The script should check if the username already exists. If the user exists then the script should pass a statement throwing an error else it should create a user for you. Let's script it!

```
#!/bin/bash

function if_user_exists() {
    if id "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

function create_user() {
    read -p "Enter the new username: " username
    if if_user_exists "$username"; then
        echo "Error: The username '$username' already exists. Please choose a different username."
        exit 1 
    else
        read -s -p "Enter the password for $username: " password
        echo
        sudo useradd "$username" --create-home --password "$password"
        echo "User account '$username' created successfully."
    fi
}

```
