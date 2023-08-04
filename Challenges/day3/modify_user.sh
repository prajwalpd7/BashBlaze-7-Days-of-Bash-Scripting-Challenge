#!/bin/bash

#Menu option to modifu users
echo ''
echo ''
echo "Modify user menu: "
echo ''
echo "1. Add a user to a new group without chaging default group."
echo "2. Update a user's default group."
echo "3. Unlock a user."
echo "4. Lock a user."
echo "5. Update a user's password."
echo "6. Exit"
echo -n "Enter a menu choice [1 to 6]: "

while :
do
read choice
case $choice in
	1) read -p "Please enter a group name: " groupupdate
	   read -p "Please enter username to add in group: " username
	   if [[ $groupupdate != '' && $username != ''  ]]; then
		   usermod -G $groupupdate $username 2>/dev/null
		   if [[ $? -eq 0  ]]; then
			   echo "$username has been added to $groupupdate group."
		   else
			   echo "Please enter valid username or group name."
		   fi
	   else
		   echo "Please enter valid username or groupname."
	   fi;;

           2) read -p "Please enter a group name: " groupupdate
           read -p "Please enter username to add in group: " username
           if [[ $groupupdate != '' && $username != ''  ]]; then
                   usermod -g $groupupdate $username 2>/dev/null
                   if [[ $? -eq 0  ]]; then
                           echo "Default usergroup has been changed of $username"
                   else
                           echo "Please enter valid username or password."
                   fi
           else
                   echo "Please enter valid username or groupname."
           fi;;
           
           3) read -p "Enter a username to unlock: " unlockuser
	      if [[ $unlockuser != '' ]]; then
		usermod -U $unlockuser
		if [[ $? -eq 0  ]]; then
			echo "$unlockuser unlocked successfully."
		else
			echo "Please enter a valid username."
		fi
	      else
		echo "Please enter valid username."
              fi;;
	   4) read -p "Enter a username to lock: " lockuser
               if [[ $lockuser != '' ]]; then
                 usermod -L $lockuser
                 if [[ $? -eq 0  ]]; then
                         echo "$lockuser locked successfully."
                 else
                         echo "Please enter a valid username."
                 fi
               else
                 echo "Please enter valid username."
               fi;;
 
           5) read -p "Enter a username: " passupdateuser
	     if [[ $passupdateuser != '' ]]; then
		     passwd $passupdateuser
		     if [[ $? -eq 0  ]]; then
			     echo "Password updated successfully for $passupdateuser"
		     else
			     echo "Please enter correct username or password."
		     fi
	     else
		     echo "Please enter correct username or password."
	     fi;; 
           6) exit;;
	   *) echo "Please enter a valid menu choice."
esac
echo -n "Enter a menu choice in [1 to 6]: "
done
