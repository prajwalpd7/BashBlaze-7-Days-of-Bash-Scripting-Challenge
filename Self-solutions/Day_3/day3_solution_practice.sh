#!/bin/bash
#set -x

#####################################################################
# Script Name: day_3_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 2, 2023
# Description: This script contains solution for Day 3  User Account Management as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day_3__challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################

########################################  Day-3 Challenge: User Account Management    #########################################

#In this challenge, you will create a bash script that provides options for managing user accounts on the system. The script should allow users to perform various user account-related tasks based on command-line arguments.

###########Part 1: Account Creation
#Implement an option -c or --create that allows the script to create a new user account. The script should prompt the user to enter the new username and password.

#Ensure that the script checks whether the username is available before creating the account. If the username already exists, display an appropriate message and exit gracefully.

#After creating the account, display a success message with the newly created username.


#########Part 2: Account Deletion
#Implement an option -d or --delete that allows the script to delete an existing user account. The script should prompt the user to enter the username of the account to be deleted.

#Ensure that the script checks whether the username exists before attempting to delete the account. If the username does not exist, display an appropriate message and exit gracefully.

#After successfully deleting the account, display a confirmation message with the deleted username.


#########Part 3: Password Reset
#Implement an option -r or --reset that allows the script to reset the password of an existing user account. The script should prompt the user to enter the username and the new password.

#Ensure that the script checks whether the username exists before attempting to reset the password. If the username does not exist, display an appropriate message and exit gracefully.

#After resetting the password, display a success message with the username and the updated password.


########Part 4: List User Accounts
#Implement an option -l or --list that allows the script to list all user accounts on the system. The script should display the usernames and their corresponding user IDs (UID).


#######Part 5: Help and Usage Information
#Implement an option -h or --help that displays usage information and the available command-line options for the script.


#######Bonus Points (Optional)
#If you want to challenge yourself further, you can add additional features to the script, such as:

#Displaying more detailed information about user accounts (e.g., home directory, shell, etc.).
#Allowing the modification of user account properties (e.g., username, user ID, etc.).
#Remember to handle errors gracefully, provide appropriate user prompts, and add comments to explain the logic and purpose of each part of the script.

#Created function to list out the User Options to run the script.
displayUserOptions() {

echo
echo "Usage: ./day3_challenge_solution.py [OPTIONS]"
echo "Options:"
echo "   -c, --create    Create a new user account"
echo "   -d, --delete    Delete an existing user account"
echo "   -r, --reset     Reset password for an existing user account"
echo "   -l, --list      List all user accounts on the system"
echo "   -h, --help      Display this help and exit."
echo
echo "For Bonus features please use below options"
echo "   -ui, --userinfo Display more information about an existed user account"
echo "   -mu, --modusername Modify username for an existing user account"
echo "   -muid, --moduserid Modify user ID for an existing user account"
echo "   -mh,   --modhome  Modify home directory for an existing user account "
echo "   -ms,   --modshell  Modify default shell for an existing user account"
echo
echo "############## Below options are for the future implementation ##############################"
echo "   -mg,   --modgroup  Modify group for an existing user account "
echo "   -mpa,  --modpassage Modify password expiration date for an existing user account"
echo "   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account"
echo

}

#Created the function to check if user is already existed or not in our system.
is_user_exists() {
	userName=$1   #we are taking function argument that passess while calling the function. here $1 is for user provided username input.

	if grep -q "^$userName:" /etc/passwd; then  #checking if user already present or not using 
						    #grep command checks if the specifie username that starts with $username is present in /etc/passwd output or 						     #not
						    #-q option with grep will hide the output of the grep command
		
		return 0  #returning 0 if username is present otherwise sending 1.
        else
                return 1
        fi

}

displayUserOptions   #calling this function to dispay the user option at the time of script runs.
    
userOption=$1        #taking the command line 1st argument that pass while running the script and assigning to this variable.

if [ "$userOption" == "-c"  ] || [ "$userOption" == "--create"  ]; then     #putting two conditions to check -c OR --create user option to create the user.
	

	read -p "Enter username to create the user account: " usernameByUser  #taking username input from the user to create the user
	is_user_exists "$usernameByUser"         #passing the user provided username to the is_user_exists function as a command line argument.

	if [ $? -eq 0  ]; then       #here $? - checks the previous command output and get the output here and i am comparing it with 0 means user exists.
		echo "user $usernameByUser already existed, so please create the user with different username!"
		exit 0              #existing from the script with safe command exit 0 with successful run if user exists.
	fi
	read -p "Enter password to create the account: " passwordByUser
	sudo useradd "$usernameByUser"   #using useradd command with sudo permission to create the user
	echo "$usernameByUser:$passwordByUser" | chpasswd  #assigning the user provided password to created user using echo to pass the output to chpasswd.
	echo "user account $usernameByUser has been created successfully!"

elif [ "$userOption" == "-d"  ] || [ "$userOption" == "--delete"  ]; then
	read -p "Enter username to delete the user account: " usernameByUser
	
	is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
                sudo userdel "$usernameByUser" #deleting the user if user is present in our system.
		echo "user account $usernameByUser has been deleted successfully!"
	else
		echo "user $usernameByUser is not existed, so please choose a existed user to delete!"

	fi
elif [ "$userOption" == "-r"  ] || [ "$userOption" == "--reset"  ]; then
        read -p "Enter username to reset the user account password: " usernameByUser
        
	is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		echo "please enter a new password for $usernameByUser: " 
		read -s newUserPasswordByUser  #read with -s option is to take the password by hiding the password to user while he enters.
		echo "$usernameByUser:$newUserPasswordByUser" | chpasswd  #same as assiging the password but also can useful to reset the new password.
                echo "user account $usernameByUser reset password has completed successfully!"
        else
                echo "user $usernameByUser is not existed, so please choose a existed user to reset the password!"

	fi

elif [ "$userOption" == "-l"  ] || [ "$userOption" == "--list"  ]; then

        echo "Username   UID   GID"                   #printing the username UID(User ID) and GID(group ID)
        echo "---------------------"
        while IFS=: read -r username _ uid gid _; do   #here IFS is a field seperator which seperates the all the lines output of /etc/passwd with : semicolon
        echo "$username   $uid   $gid"                 # that's why I have put = and : with IFS means IFS=:  and after seperating with semicolon i have read the
        done < /etc/passwd                             #username with $1 first argument , assigning $2 argument with dummy variable as we don't need this for now
                                                       #$2 argument is password basically and $3 and $4 arguments are UID and GID and leaving remaining arguments
                                                       #with _ dummy variable till end and we are iterating till last line so using while loop to iterate and
                                                       #/etc/passwd contains all the usernames with details.


        #we can also implement this with other approach as below
	# Using awk to print the username (first field) and UID (third field)
	#awk -F: '{print "Username:", $1, "UID:", $3}' /etc/passwd
	#here we use awk with print to display the output to terminal 
elif [ "$userOption" == "-h"  ] || [ "$userOption" == "--help"  ]; then	
	displayUserOptions #displaying the user options for help option.


#From here is for the bonus learning
elif [ "$userOption" == "-ui"  ] || [ "$userOption" == "--userinfo"  ]; then

	read -p "Enter username to know more information about the user account: " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		sudo grep "$usernameByUser" /etc/passwd | awk -F: '{print "\n Username: ", $1"\n", "UID:", $3"\n", "Home directory:", $6"\n", "Default shell:", $7"\n"}'
	#the above command will print out the Username, UID, Home directory, Default shell details for specific user.
	#here we are using grep to find the username in the /etc/passwd file this will return whole line of output with : semicolon 
	#passing the output via | pipe symbol to awk command and here we are splitting line of output with : semicolon using F:
	#using print to display the output to the terminal
	else
                echo "user $usernameByUser is not existed, so please choose an existed user to display more information about the user!"

        fi


elif [ "$userOption" == "-mu"  ] || [ "$userOption" == "--modusername"  ]; then  #this is for modification of username

        read -p "Enter username that you wanted to modify it's username:  " oldUsernameByUser 

        is_user_exists "$oldUsernameByUser"

        if [ $? -eq 0  ]; then
		read -p "Enter new username that you wanted to modify for user $oldUsernameByUser:  " newUsernameByUser #taking new username as a input
		sudo usermod -l "$newUsernameByUser" "$oldUsernameByUser"   #using -l option with usermod to change the username
		echo "Successfully Updated the username from $oldUsernameByUser to $newUsernameByUser! "
	else
		echo "user $usernameByUser is not existed, so please choose an existed user to modify it's username!"
	fi


elif [ "$userOption" == "-muid"  ] || [ "$userOption" == "--moduserid"  ]; then   #this is for modification of userID of an user

	read -p "Enter username that you wanted to modify it's user ID(UUID):  " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		oldUserID=$(id -u "$usernameByUser")   #extracting the existing userID using id command with -u it will return the userID of an user
		echo "Existed userID for user $usernameByUser is: $oldUserID" 
                read -p "Enter new userID that you wanted to modify for user $usernameByUser:  " newUserIdByUser  #taking new userID input
                sudo usermod -u "$newUserIdByUser" "$usernameByUser"     #using -u option with usermod command to modify it's userID 
                echo "Successfully Updated the userID for user $usernameByUser from $oldUserID to $newUserIdByUser ! "
        else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's user ID !"
        fi


elif [ "$userOption" == "-mh"  ] || [ "$userOption" == "--modhome"  ]; then   #this is for modification of default home directory of an user

        read -p "Enter username that you wanted to modify it's default home directory:  " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		oldHomeDirectory=$(grep "^$usernameByUser" /etc/passwd | awk -F: '{print $6}') ##extracting the existing home directory with the help of
											        #grep to search the username in the /etc/passwd file and 
												#pass the output to awk command and given -F: for splitting
												#with semicolon and using print with $6 6th argument to throw
												#the default home directory as an output and assigning to varaible.
												
                echo "Default user home directory for user $usernameByUser is: $oldHomeDirectory"
                read -p "Enter new user home directory that you wanted to modify for user $usernameByUser:  " newUserHomeDirByUser
                sudo usermod -d "$newUserHomeDirByUser" "$usernameByUser"     # using -d option with usermod command to modify the default home directory.
                echo "Successfully Updated the home directory for user $usernameByUser from $oldHomeDirectory to $newUserHomeDirByUser ! "
        else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's user default home directory !"
        fi


elif [ "$userOption" == "-ms"  ] || [ "$userOption" == "--modshell"  ]; then  ##this is for modification of default shell  of an user

        read -p "Enter username that you wanted to modify it's default shell:  " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
                oldShell=$(grep "^$usernameByUser" /etc/passwd | awk -F: '{print $7}') #extracting the existing home directory with the help of
                                                                                       #grep to search the username in the /etc/passwd file and
                                                                                       #pass the output to awk command and given -F: for splitting
                                                                                       #with semicolon and using print with $7 7th argument to throw
                                                                                       #the default shell path as an output and assigning to varaible.
                echo "Default Shell for user $usernameByUser is: $oldShell"
                read -p "Enter new shell path that you wanted to modify for user $usernameByUser:  " newShell
                sudo usermod -s "$newShell" "$usernameByUser"
                echo "Successfully Updated the new Shel for user $usernameByUser from $oldShell to $newShell ! "
        else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's user default shell !"
        fi



else  #if user enters any different option prompting the user to provide correct option.
        echo "Invalid option, Please enter the correct user option!"
fi

##############################################Future implementation plan for more user modification###############################
#pla-1
#input the group name(s) and add the user to the group.
#usermod -G sudo,ftp username

#plan-2
#input the date as same as format(2023-12-31) to set password expiration prefereably 90days and it will automatically send warning before expring the password in 7days using -w 7 as below.
#usermod -e 2023-12-31 -w 7 username

#plan-3
#take input option to (lock use -L) and (-U for unlock) the user account
#usermod -L username

###################################################################################################################




#########################practice#################

#practice-1
sudo useradd username
sudo passwd username


#practice-2 
#practicing to provide a customized home directory, shell, or other settings for a user while creating or after creating the user, 
#To specify a custom home directory, use the -d or --home option:
sudo useradd -d /path/to/custom_home_dir username
#To set a custom default shell, use the -s or --shell option:
sudo useradd -s /path/to/custom_shell username
#After Creating the User:
#If you have already created the user and want to modify their settings,  with various options:
#To change the user's home directory, use the -d or --home option:
sudo usermod -d /path/to/custom_home_dir username
#To change the user's default shell, use the -s or --shell option:
sudo usermod -s /path/to/custom_shell username
#Provide Custom Configuration Files:
#can also provide custom configuration files for the user in their home directory. For example, you can create a .bashrc file in the user's home directory to customize their bash shell behavior.


#practice-3
#practicing to view various user account details in a Unix-like operating system using different commands. 
#id: This command displays user and group information for the current user or a specified user.
id          # Display information for the current user
id username # Display information for the specified username

whoami: #This command prints the username of the current user.

finger: #The finger command provides information about a user's login name, real name, terminal, login time, idle time, and more. but we need to install this tool before use.

cat /etc/passwd: #This command shows the user account details stored in the /etc/passwd file, including the username, user ID (UID), group ID (GID), home directory, and default shell.

getent passwd: #This command retrieves user account details from the system database.

grep: #You can use grep to filter specific user details from /etc/passwd or other files.

grep username /etc/passwd    # Display details for the specified username
cat /etc/passwd | grep shell # Display users with a specific shell

ls -l /home: #This command shows the list of user home directories and their permissions.

cat /etc/shells: #This command displays the available shells on the system.



#practice-4
#practicing logical AND (&&) and logical OR (||) operators to perform conditional operations based on the success or failure of commands. These operators allow you to chain multiple commands together and control the flow of execution.

#Logical AND (&&):
#The && operator is used to execute the next command only if the previous command succeeds (returns an exit status of 0).
ls /path/to/directory && echo "Directory listing successful"

#Logical OR (||):
#The || operator is used to execute the next command only if the previous command fails (returns a non-zero exit status).
rm /path/to/file || echo "File not found"
#command1 && command2 || command3


#use the logical AND (&&) and logical OR (||) operators within an if statement to perform conditional checks based on the success or failure of commands.
if command1 && command2
then
    # Code block to execute if both command1 and command2 succeed
elif command3 || command4
then
    # Code block to execute if command3 succeeds or command4 fails
else
    # Code block to execute if all commands fail
fi

if ls /path/to/directory && grep "pattern" /path/to/file
then
    echo "Both commands succeeded."
elif grep "pattern1" /path/to/file || grep "pattern2" /path/to/file
then
    echo "At least one of the grep commands succeeded."
else
    echo "Both commands failed."
fi

#!/bin/bash

file="example.txt"

# Check if the file exists and is readable
if [ -r "$file" ] && [ -f "$file" ]
then
    echo "The file exists and is readable."
else
    echo "The file does not exist or is not readable."
fi


#practice-5
# find out if specific user present or not before deleting the user in shell scripting
#!/bin/bash

# Replace "username" with the username you want to check
username="testuser"

# Check if the user exists using the getent command and grep
if getent passwd | grep -q "^$username:"; then
    echo "User $username exists. Deleting the user..."

    # Add your code here to delete the user, e.g., using the userdel command
    # For example:
    # userdel "$username"

    echo "User $username has been deleted."
else
    echo "User $username does not exist."
fi



#practice-6
#Using grep to search for the user in /etc/passwd file:
username="someuser"

if grep -q "^$username:" /etc/passwd; then
    echo "User $username exists."
else
    echo "User $username does not exist."
fi


#practice-7
#practicing functions
# Function definition with arguments
add_numbers() {
    num1=$1
    num2=$2
    sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Function call with arguments
add_numbers 10 20

#exaple2
# Function definition with arguments
add_numbers() {
    num1=$1
    num2=$2
    sum=$((num1 + num2))

    # Set the sum as the exit status
    exit $sum
}

# Function call with arguments
add_numbers 10 20

# Access the exit status and print the result
result=$?
echo "The sum is: $result"

#note: we cannot return the non-integer values from function

#example3
# Function definition to check if a number is even
is_even() {
    num=$1
    if (( num % 2 == 0 )); then
        return 0  # Exit status 0 means the number is even
    else
        return 1  # Exit status 1 means the number is not even
    fi
}

# Function call within an if statement
number=10
if is_even "$number"; then
    echo "$number is even."
else
    echo "$number is not even."
fi



#for safe exit use exit 0 
#exit [status]
#status: The exit status that will be returned to the calling process. By convention, an exit status of 0 indicates success, and any non-zero value indicates an error or failure.
#!/bin/bash

# Your script commands here...

# Some error occurred, exit the script with a non-zero status
exit 1




#practice-8
#practicing To reset the password for a user in a shell script, you can use the passwd command along with some echo statements to provide the new password. 
#!/bin/bash

# Function to reset password for a user
reset_password() {
    local username="$1"

    # Check if the user exists
    if id "$username" &>/dev/null; then
        echo "Resetting password for user: $username"
        echo "Enter the new password for $username:"
        read -s new_password
        echo "$username:$new_password" | chpasswd
        echo "Password reset successfully."
    else
        echo "User $username does not exist."
    fi
}

# Call the function and pass the username as an argument
reset_password "your_username"





#practice-9
#To  display all the usernames and their associated user IDs (UIDs) and group IDs (GIDs) in a shell script, you can use the cut command along with the /etc/passwd file. The /etc/passwd file contains information about all the users on the system
#!/bin/bash

# Function to display all user information
display_all_users_info() {
    echo "Username   UID   GID"
    echo "---------------------"
    while IFS=: read -r username _ uid gid _; do
        echo "$username   $uid   $gid"
    done < /etc/passwd
}

# Call the function to display all user information
display_all_users_info

#The -r option with the read command is used to prevent backslashes \ from being interpreted as escape characters. When reading input from a file, using the -r option ensures that backslashes are treated as regular characters and not escape characters.

#how IFS=: works and each its = and ;
# shell scripting, IFS stands for "Internal Field Separator." It is a special environment variable that defines the delimiter used to split a line of text into fields when using commands like read or for loops.

#By default, the value of IFS is set to whitespace characters (space, tab, and newline). However, you can change its value to a different character or a string of characters to split input lines based on that specific separator.

#In the example you provided, IFS=:, the = sign is used to set the value of IFS, and : is the delimiter that will be used to split the input lines into fields.

#while IFS=: read -r username _ _ uid _; do: This is a while loop that reads each line from the users.txt file, splits it into fields using : as the delimiter (because of the IFS=: setting), and assigns those fields to the variables username, uid, and two dummy variables _. The dummy variables _ are used to skip the other fields that are not needed.

#practice-10
#to display all the username and its IDs in shell script with awk -F: optin
#!/bin/bash

# Assuming the user data is stored in a file called users.txt
# The format is: username:password:UID:GID:gecos:home:shell

# Using awk to print the username (first field) and UID (third field)
awk -F: '{print "Username:", $1, "UID:", $3}' users.txt
#we use awk with the -F option to specify that the field separator is : (colon). Then, we use $1 and $3 to refer to the first and third fields, respectively, which correspond to the username and UID in each line of the users.txt file.
#The print statement in awk is used to print text or data to the output.

#practice-11
#function that takes a string as a parameter
#!/bin/bash

# Define a function that takes a string as a parameter
print_string() {
    local input_string=$1
    echo "The input string is: $input_string"
}

# Call the function and pass a string as an argument
my_string="Hello, this is a sample string."
print_string "$my_string"


#practice-12
#function with passing the string and storing the return value and using in if statement
#!/bin/bash

# Define a function that takes a string as a parameter
check_string() {
    local input_string=$1

    # Check if the string is empty
    if [ -z "$input_string" ]; then
        return 1
    else
        return 0
    fi
}

# Call the function and pass a string as an argument
my_string="Hello, this is a sample string."
check_string "$my_string"

# Check the return value of the function in the if statement
if [ $? -eq 0 ]; then
    echo "The string is not empty."
else
    echo "The string is empty."
fi


#practice-13
#o add a new user and set a password in a shell script, you can use the useradd and passwd commands.
#!/bin/bash

# Function to add a new user and set the password
add_user_with_password() {
    local username=$1
    local password=$2

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        # Add the new user
        useradd "$username"

        # Set the password for the new user
        echo "$username:$password" | chpasswd

        echo "User '$username' added with the provided password."
    fi
}

# Call the function and pass the username and password as arguments
new_username="newuser"
new_password="mypassword"
add_user_with_password "$new_username" "$new_password"


#practice-14
#To add a new user and set a password in a shell script, you can use the useradd and passwd commands. 
#!/bin/bash

# Define the username and password
new_username="newuser"
new_password="mypassword"

# Check if the user already exists
if id "$new_username" &>/dev/null; then
    echo "User '$new_username' already exists."
else
    # Add the new user
    useradd "$new_username"

    # Set the password for the new user
    echo "$new_username:$new_password" | chpasswd

    echo "User '$new_username' added with the provided password."
fi


#practice-15
#To modify user account details like UID, username, and home directory in a shell script, you can use the usermod command. 
#!/bin/bash

# Define the old and new usernames
old_username="olduser"
new_username="newuser"

# Define the new UID
new_uid="1001"

# Define the new home directory
new_home="/path/to/new/home/directory"

# Check if the old user exists
if id "$old_username" &>/dev/null; then
    # Modify the username
    if [ "$old_username" != "$new_username" ]; then
        usermod -l "$new_username" "$old_username"
    fi

    # Modify the UID
    if [ "$(id -u "$old_username")" != "$new_uid" ]; then
        usermod -u "$new_uid" "$new_username"
    fi

    # Modify the home directory
    if [ "$(eval echo ~$old_username)" != "$new_home" ]; then
        usermod -d "$new_home" -m "$new_username"
    fi

    echo "User details modified successfully."
else
    echo "User '$old_username' does not exist."
fi





#more modifications for an existed user 
#n addition to modifying the username, UID, and home directory, the usermod command can be used to modify various other attributes of a user account. Some common attributes that can be modified with usermod include:

#Shell: You can change the default shell for the user using the -s option. For example, to change the shell to /bin/bash, use usermod -s /bin/bash username.

#User's groups: You can add or remove the user from specific groups using the -G option. For example, to add the user to the sudo and ftp groups, use usermod -G sudo,ftp username.

#Account expiration date: You can set an expiration date for the user account using the -e option. For example, to set the account to expire on a specific date, use usermod -e YYYY-MM-DD username.

#Account status: You can lock or unlock the user account using the -L (lock) and -U (unlock) options, respectively. For example, to lock the account, use usermod -L username.

#Password aging: You can modify password aging settings like password expiration and warning days using the -e and -w options. For example, to set the password to expire after 90 days and provide a 7-day warning, use usermod -e 2023-12-31 -w 7 username.

#User's full name or comment: You can change the user's full name or add a comment using the -c option. For example, to set the full name to "John Doe" and add a comment "DevOps Engineer", use usermod -c "John Doe, DevOps Engineer" username.

#Disable login: To disable login for a user, you can use the -s /sbin/nologin option. This will prevent the user from logging in with a shell.


#note
## Modify the home directory
    if [ "$(eval echo ~$old_username)" != "$new_home" ]; then
        usermod -d "$new_home" -m "$new_username"
    fi

#what is -d and -m here
#-d: This option is used to change the user's home directory. When -d is followed by a directory path, it will set the new home directory for the user account.

#-m: This option is used to move the contents of the user's old home directory to the new home directory. It is typically used in conjunction with the -d option to move the home directory when changing the user's home directory.


#practice-16
#get the UID of a user by their username:
#!/bin/bash

username="your_username_here"

# Get the UID using the 'id' command
user_id=$(id -u "$username")

# Print the UID
echo "User ID for $username: $user_id"


#practice-17
#To find out the primary group of a user in shell scripting, 
#use the id command along with the -gn option. 
#!/bin/bash

# Replace 'username' with the actual username you want to check
username="username"

# Get the primary group name of the user
group_name=$(id -gn $username)

echo "The primary group of $username is: $group_name"
#In the id command, the -gn option is used to display the group name of a user.
#-g: Display the numeric group ID (GID) of the user.
#-n: Display the name of the user or group.


#practice-18
#To check if a group exists before adding a user to it in shell scripting, 
#use the grep command to search for the group in the /etc/group file.
#!/bin/bash

group_name="developers"
user_name="john"

# Check if the group exists
if grep -q "^$group_name:" /etc/group; then
    echo "Group $group_name exists."
    # Add the user to the group
    usermod -aG "$group_name" "$user_name"
    echo "User $user_name added to group $group_name."
else
    echo "Group $group_name does not exist."
fi
#In the shell script provided above, the -aG options are used with the usermod command to add a user to a group
#a: This option tells the usermod command to append the user to the specified group(s) without removing them from any other groups.
#-G: This option specifies the list of supplementary groups to which the user should be added. Multiple group names can be provided, separated by commas, to add the user to multiple groups at once.
#In the script, the line usermod -aG "$group_name" "$user_name" is used to add the user specified by $user_name to the group specified by $group_name without affecting their membership in any other groups.


#practice-19
#To check the expiration date of a user account password in shell scripting,
#use the chage command with the -l option. The chage command is used to change user password expiry information, and the -l option displays the current password expiry details for the user.
#!/bin/bash

# Provide the username whose password expiry information you want to check
username="your_username"

# Get the password expiry information using chage -l command
password_expiry_info=$(chage -l "$username" 2>/dev/null)

# Check if the password expiry information is available
if [ -n "$password_expiry_info" ]; then
    echo "Password Expiry Information for User: $username"
    echo "$password_expiry_info"
else
    echo "User $username does not exist or password expiry information is not available."
fi

#practice-20
#checking command to set the password expiration for a user:
passwd -x <max_days> <username>
#ex:passwd -x 30 john
#The passwd command is used to set or change a user's password in Linux. The -x option is used to set the maximum number of days a password can be used before it expires.
#When you run the passwd command with the -x option and a number (e.g., passwd -x 30 john), it means that you are setting the password expiration policy for the user "john" to 30 days. This means that after 30 days, the user "john" will be required to change their password.



#practice-21
#To display the password expiration date for a user account in Linux, 
# use the chage command. The chage command allows you to view and modify the password aging information for a user. To see the password expiration date,
chage -l username
#The chage command in Linux is used to manage user password aging information. It allows you to view and modify password expiration and other related settings for user accounts. When you run the chage command without any options, it displays the current password aging information for the specified user.
#The -l option is used with the chage command to display the password aging information for a user account.

#When you run chage -l username, it shows the following information for the specified user:
#Last password change date: This is the date when the user's password was last changed.

#Password expiration date: This is the date when the user's password will expire, and the user will be required to change it.

#Minimum password age: This is the minimum number of days a password must be used before it can be changed again.

#Maximum password age: This is the maximum number of days a password can be used before it expires.

#Password inactive days: This is the number of days after the password has expired before the account is locked.

#Account expiration date: This is the date when the user account will expire, and the user will no longer be able to log in.

#Account inactive days: This is the number of days after the account has expired before it is permanently disabled.

#By using the chage -l command, you can check the password aging settings for a user account and ensure that password policies are properly configured for security purposes.



#practice-22
#practicing to check if a user account is locked or not in shell scripting by using the passwd command along with the -S option. The passwd -S username command will display the status of the user account, including whether it is locked or not.
#!/bin/bash

# Replace "username" with the actual username you want to check
username="username"

# Use passwd -S to check the status of the user account
status=$(passwd -S "$username" | awk '{print $2}')

# Check if the account is locked
if [ "$status" = "L" ]; then
    echo "The account $username is locked."
else
    echo "The account $username is not locked."
fi
# use the passwd -S command to get the status of the user account
#The status code "L" indicates that the account is locked, and "P" indicates that the account is active and not locked.





