#!/bin/bash
#########################################################################################################################
# Version : 1.0                                                                                                         #
#########################################################################################################################
#                                                                                                                       #
# Author : Gurudeo ray                                                                                                  #
#                                                                                                                       #
#########################################################################################################################
#                                                                                                                       #
# Description : We can perform user related operations using this script.                                               #
#                                                                                                                       #
# Example : <script-name.sh> foldername<01> <foldername><90>                                                            #
#                                                                                                                       #
#########################################################################################################################

#Creating menu with options
echo "Select your option"
echo "1. List out all groups name"
echo "2. List out all the users name"
echo "3. Add or delete a group"
echo "4. Add a user"
echo "5. Modify a user"
echo "6. Delete a user"
echo "7. Exit from menu"
echo ''
echo ''
echo -n "Enter your menu choice [1 to 7]: "

# Running a forever loop using while statement
# This loop will run until select the exit option.
# User will be asked to select option again and again
while :
do

default=y
isvalue=true
RED="\e[31m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

#Reading choice
read choice

#Case statement is used to compare one value with multiple cases and based on choice it switch to option
case $choice in
1)  echo "List of group"
    cat /etc/group | awk -F':' '{ print $1 }'

2)  echo "List of users"
    cat /etc/passwd | awk -F':' '{ print $1 }';;

   ################### Group add or delete section ####################################################
3) read -p "Do you want to add a group (y -> to add user & n -> to delete user): " isgroup
   if [[ $isgroup == 'y' || $isgroup == 'Y' || $isgroup == 'yes' || $isgroup == 'YES' || $isgroup == '' ]]
   then 
	while ($isvalue)
	do
	read -p "Please enter your group name: " groupname
	if [[ $groupname == '' ]]
	then
		echo -e "$RED Please enter valid group name.$ENDCOLOR"
	else
		groupadd $groupname 2> /dev/null
		if [ $? -eq 0 ]; then
		  echo $groupname" has been added successfully."
		  isvalue=false
		else
		  echo -e "$RED Please enter a valid username. $ENDCOLOR"
		fi
	fi
	done
   fi
   if [[ $isgroup == 'n' || $isgroup == 'N' || $isgroup == 'no' || $isgroup == 'NO' ]]
   then
	   while ($isvalue); do
	   read -p "Please enter a groupname to be deleted: " deletegroup
           if [[ $deletegroup == '' ]]
	   then
		   echo -e "$RED Please enter a valid group name.$ENDCOLOR"
	   else
		   groupdel $deletegroup 2> /dev/null
		   if [ $? -eq 0 ]; then
		   	echo $deletegroup" has been deleted successfully."
			isvalue=false
		   else
			echo -e "$RED $deletegroup does not exist !  Please enter valid groupname.$ENDCOLOR"
		   fi
	   fi
   	   done
   fi;;
   ################### End of Group add or delete section ####################################################   
   
   ################### Add user section ######################################################################
4)  #Enter user details
    echo -e "$BLUE Enter all the user details $ENDCOLOR"
    istrue=true

    while($istrue); do

    read -p "Enter a username: " username
    read -p "Enter a group name (Optional): " group
    read -p "Enter y or Y if you want to add HOME directory (Optional): " ishomedirectory

    if [[ $username != '' ]]; then
	    if [[ $group != '' && $ishomedirectory != '' ]]; then
		useradd -g $group -m -d /home/$username -s /bin/bash $username 2>/dev/null
		passwd $username
		echo "$username addedd successfully."
		id $username
		istrue=false
	    elif [[ $group != ''  ]]; then
		useradd -g $group -s /bin/bash $username 2>/dev/null
		passwd $username
		echo "$username addedd successfully."
                id $username
		istrue=false
	    else
		useradd -m -d /home/$username -s /bin/bash $username  2>/dev/null
		passwd $username
                echo "$username addedd successfully."
                id $username
                istrue=false		
            fi
    else
	echo -e "$RED Username or password missing $ENDCOLOR"	    
    fi	    
    done;;
    ################### End Of Add user section ##############################################################

5)  bash /home/guru/guru/90DaysOfDevOpsChallenge/day05/modify_user.sh
    ;;
6)  read -p "Enter a username to be deleted: " deleteuser
    if [[ $deleteuser != '' ]]; then
	    userdel -r $deleteuser 2>/dev/null
	    if [[ $? -eq 0 ]]; then
		    echo "$deleteuser delete successfuly."
	    else
		    echo "Please enter valid user to be deleted."
	    fi
    else
	    echo "Please enter valid user to be deleted."
    fi;;
7)  exit;;

*)  echo "Invalid option";;

esac
    echo ''
    echo ''
    echo -n "Enter your menu choice [1 to 7] : "
done


