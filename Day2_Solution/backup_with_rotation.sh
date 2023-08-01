#!/bin/bash

#argument passed to $1 and assigned to variable sourcedirectory

sourcedirectory=$1
echo "Source Directory path passed as argument is $sourcedirectory"
#---------------------------------------


timestamp() {
        date +%Y-%m-%d_%H-%M-%S
}



#-------------------------------


#Backup File names with timestamp
filename=backup_$(timestamp)


#--------------------------------
#Name of the backup directory created.

Backup_Dir="/home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/backup2/$filename"

#----------------------------------------
echo "Path of the backup directory is /home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/backup2/"

# Copy the source directory including subdirectories to source directory

cp -R $sourcedirectory $Backup_Dir

echo "Backup Name is $filename"

#go to backup directory using cd

cd /home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/backup2/

#delete the previous backups

ls -1t | tail -n +4 | xargs rm -rf


