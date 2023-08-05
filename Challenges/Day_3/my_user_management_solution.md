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

## **🗑️👋 Part 2: Account Deletion 🚫💻**

Now, let's try to perform the deletion of a user account. The script should prompt the user to enter the username of the account to be deleted. Also, we need to ensure that the account already exists. If the account doesn't exist then we need to display an appropriate message and exit.

```
function if_user_exists() {
    if id "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

function delete_user() {
    read -p "Enter the username to delete" username
    if if_user_exists "$username"; then
        sudo userdel --remove "$username"
        echo "User account '$username' deleted successfully."
    else
        echo "Error: the username '$username' does not exist. Please enter a valid username."
        exit 1
    fi
}

```

## **🔑🔄 Part 3: Password Reset 🔄🔐**

Next, we'll implement the password reset feature. The script should ask for the username and the new password. If the username doesn't exist, the script should gracefully inform you and exit.

```
function if_user_exists() {
    if id "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

function reset_passwd() {
    read -p "Enter the username to reset password: " username
    if if_user_exists "$username"; then
        read -s -p "Enter the password for $username: " password
        echo "$username:$password" | sudo chpasswd
        echo
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

```

## **📋👥 Part 4: List User Accounts 📝👤**

Now, let's try to implement a script that allows us to list all the user accounts along with their UIDs.

```
function list_users(){
    echo "User accounts on the system: "
    sudo cat /etc/passwd | cut -d: -f1,3 | awk -F : '{printf "- %s (UID: %s)\n", $1, $2}'
}

```

## **📚🆘 Part 5: Help and Usage Information 📝**

Now finally we need to add a help option to display usage information and the available command-line options. So let's write a function for the same.

```
function display_usage(){
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    printf "%-2s %-12s %-5s\n" "  -c," "--create" "Create a new user account."
    printf "%-2s %-12s %-5s\n" "  -d," "--delete" "Delete an existing user account."
    printf "%-2s %-12s %-5s\n" "  -r," "--reset" "Reset password for an existing user account."
    printf "%-2s %-12s %-5s\n" "  -l," "--list" "List all user accounts on the system."
    printf "%-2s %-12s %-5s\n" "  -h," "--help" "Display this help and exit."
}

```

## **✨🛠️ Fully Functional Script 🚀👨‍💻**

```
function display_usage(){
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    printf "%-2s %-12s %-5s\n" "  -c," "--create" "Create a new user account."
    printf "%-2s %-12s %-5s\n" "  -d," "--delete" "Delete an existing user account."
    printf "%-2s %-12s %-5s\n" "  -r," "--reset" "Reset password for an existing user account."
    printf "%-2s %-12s %-5s\n" "  -l," "--list" "List all user accounts on the system."
    printf "%-2s %-12s %-5s\n" "  -h," "--help" "Display this help and exit."
}

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

function delete_user() {
    read -p "Enter the username to delete" username
    if if_user_exists "$username"; then
        sudo userdel --remove "$username"
        echo "User account '$username' deleted successfully."
    else
        echo "Error: the username '$username' does not exist. Please enter a valid username."
        exit 1
    fi
}

function reset_passwd() {
    read -p "Enter the username to reset password: " username
    if if_user_exists "$username"; then
        read -s -p "Enter the password for $username: " password 
        echo "$username:$password" | sudo chpasswd
        echo
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

function list_users(){
    echo "User accounts on the system: "
    sudo cat /etc/passwd | cut -d: -f1,3 | awk -F : '{printf "- %s (UID: %s)\n", $1, $2}'
}

# If no options provided, display usage information
if [[ "$#" -eq 0 ]]; then
    echo "Error: No options provided."
    display_usage
    exit 1
fi

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case $1 in
        -c | --create)
            create_user
            ;;
        -d | --delete)
            delete_user
            ;;
        -r | --reset)
            reset_passwd
            ;;
        -l | --list)
            list_users
            ;;
        -h | --help)
            display_usage
            exit 0
            ;;
        *)
            echo "Error: Invalid option '$1'."
            display_usage
            exit 1
            ;;
    esac
    shift
done

```

## **Instructions for running the script:**

Write the script and save it as `user_management.sh.`

Make the script executable using chmod: `chmod +x user_management.sh`.

Execute the script for the required options as follows:

Create a new user: `./user_management.sh -c`

Delete an existing user: `./user_management.sh -d`

Reset user password: `./user_management.sh -r`

List all user accounts: `./user_management.sh -l`

Display help: `./user_management.sh -h`

## **📺📷 Interaction Output Screens 🖥️📸**

1. On executing `user_management.sh`

![Screenshot 08-04-2023 23 51 05](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/45266a77-8d56-4226-b8e1-287f7bd9b6d8)

2. For `./user_management.sh` -c or `./user_management.sh --create`

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/f97e4e1c-1e5c-4106-80f2-97ce0325f981)

3. On running `./user_management.sh -d` or `./user_management.sh --delete`

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/c096e782-e7ef-428e-b102-bd7b8a0a1997)

4. On executing `./user_management.sh -r` or `./user_management.sh --reset`

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/11c6ed73-053e-4848-9b24-0bddfdb0ff74)

5. For listing the user accounts when we execute `./user_management.sh -l` or `./user_management.sh --list`

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/a49b24e5-a88b-47a8-8298-04e5ac307f2c)

6. On executing the help option:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/f83ce4f0-35df-4c84-8ae4-1904c2da80bc)

## **📍 Conclusion:**

Now, you have a powerful Bash script to manage user accounts on your system. Whether you're administering a small network or a large organization, this script will save you time and effort, ensuring smooth user account management.








