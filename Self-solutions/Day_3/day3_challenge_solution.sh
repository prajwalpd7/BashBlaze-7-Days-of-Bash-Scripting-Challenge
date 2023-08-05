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


#From here is for the bonus features!!
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
                sudo usermod -d "$newUserHomeDirByUser" -m "$usernameByUser"     # using -d option with usermod command to modify the default home directory.
										 #-m: moving all the files there in old directory to new directory.
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
                echo "Successfully Updated the new Shell for user $usernameByUser from $oldShell to $newShell ! "
        else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's user default shell !"
        fi


elif [ "$userOption" == "-mg"  ] || [ "$userOption" == "--modgroup"  ]; then  ##this is for modification user group of an user

        read -p "Enter username that you wanted to modify it's group:  " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		oldGroup=$(id -gn $usernameByUser) #-g: Display the numeric group ID (GID) of the user.
						   #-n: Display the name of the user or group.
						   # using -gn, combines both options, and the command will display the name of the primary group associated with the user.
                echo "Existed group name for user $usernameByUser is: $oldGroup"
                read -p "Enter group name that you wanted to modify for user $usernameByUser:  " newGroup
                
		if grep -q "^$newGroup:" /etc/group; then  #checking if provided group name is exists or not in /etc/group file and add the username to group.
			sudo usermod -aG $newGroup $usernameByUser  #using -aG option with usermod command to add the specified group to the user.
								    #-a: This option tells the usermod command to append the user to the specified group(s) without r										removing them from any other groups.
								    #-G: This option specifies the list of supplementary groups to which the user should be added. Mu								ltiple group names can be provided, separated by commas, to add the user to multiple groups at once.
                echo "Successfully Updated the new group for user $usernameByUser from $oldGroup to $newGroup ! "
		else
			echo "mentioned group is not present in system , please provided the existed group name !"
        	fi
	else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's group name !"
        fi


elif [ "$userOption" == "-mpa"  ] || [ "$userOption" == "--modpassage"  ]; then  #this is for modification of password expiration date for user account.

        read -p "Enter username that you wanted to add a account password expiration date: " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
                read -p "Enter how many number of days password will expire for user $usernameByUser:  " passExpireDays #taking password expiry in days as a input
                passwd -x "$passExpireDays" "$usernameByUser" 	#The passwd command is used to set or change a user's password in Linux
								#The -x option is used to set the maximum number of days a password can be used before it expires.

                echo "Successfully Updated the password expiry for user $usernameByUser ! "
		echo
		echo "Now the password expiry date information as follows..."
		chage -l $usernameByUser      #The chage command in Linux is used to manage user password aging information. It allows you to view and modify passwor						    d expiration.
					      #The -l option is used with the chage command to display the password aging information for a user account
        else
                echo "user $usernameByUser is not existed, so please choose an existed user to modify it's password expiry !"
        fi


elif [ "$userOption" == "-mas"  ] || [ "$userOption" == "--modaccstatus"  ]; then  #this is for locking/unlocking the user account.

        read -p "Enter username that you wanted to Lock/Unlock:  " usernameByUser

        is_user_exists "$usernameByUser"

        if [ $? -eq 0  ]; then
		echo "Enter your choice 1 or 2: "
		echo "choose 1 to Lock the user account"
		echo "choose 2 to unlock the user account"
		read accountStatusByUser
		if [ $accountStatusByUser == 1 ]; then
			usermod -L $usernameByUser 	#-L option is to lock the useraccount with usermod command.
			echo "user account $usernameByUser is locked successfully !"
		elif [ $accountStatusByUser == 2  ]; then
			usermod -U $usernameByUser      #-U option is to unlock the useraccount with usermod command.
			echo "user account $usernameByUser is unlocked successfully !"
		else
			echo "Please enter the valid option !"
		
		#To view the user account status whether it is locked or not we can use: passwd -S "$username"
		fi		
	else
                echo "user $usernameByUser is not existed, so please choose an existed user to Lock/Unlock !"
        fi

else  #if user enters any different option prompting the user to provide correct option.
        echo "Invalid option, Please enter the correct user option!"
fi



