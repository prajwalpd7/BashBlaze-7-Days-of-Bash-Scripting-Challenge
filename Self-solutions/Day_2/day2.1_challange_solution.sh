#!/bin/bash

#set -x #For debugging the script

#####################################################################
# Script Name: day2.1_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 1, 2023
# Description: This script contains solution for Day 2.1 Directory Backup with Rotation part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day2.1_challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################


################################Directory Backup with Rotation
                         #This is another challenge for Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that performs a backup of a specified directory and implements a rotation mechanism to manage backups.



################################Challenge Description
#Your task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

#Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.

#The script will create a timestamped backup folder inside the specified directory and copy all the files into it. It will also check for existing backup folders and remove the oldest backups to keep only the last 3 backups.


directoryPath=$1 #taking first command line argument

#this is to check the count of files starts with 'backup' name.
backupFilesCount=$( ls -1 /root| grep -c ^backup  ) 
# ls -1 : It will give the filenames in single column
# '|' pipe symbol will transfer the output of previous command to next command here
# grep -c ^backup: grep command useful to search the file starts with 'backup' name. ^ symbol useful to starts with and -c will give the count. 


if [ $backupFilesCount -le 3 ]; then

	#trying to give the unique name for every backup including date as below format as a file name
	# Get the current date to use in the backup filename
	backup_date=$(date +%Y%m%d%H%M%S) #date with the format YYYYMMDDHHMMSS

	#defining full name of the backup file
	backup_filename="backup_$backup_date.tar.gz"

	# Create the backup archive using tar
	tar -czf /root/"$backup_filename" --absolute-names  "$directoryPath" 

				       #first parameter is the backup file name with it's path to store
                                       # second paramter is from where we should take the backup(path of the backup folder)
                                       #here we are taking backup from curent folder
                                       #-cvzf is for compressinng the tar file and we can use -xvzf is for extractinv the tar file .
                                       #just a first letter change c:Create a new archive , x:extract here, z:Compress the archive using gzip, f:Specify the name of the archive file, v:output will of backup directorypath will be return.will display the names of the files it is processing as it performs its operations.
	echo "Backup created: $directoryPath/$backup_filename"

elif [ $backupFilesCount -gt 3  ]; then #this elif block will check for count is 3 
	oldestFileName=$( ls -1 /root | grep ^backup | sort -nr | tail -1  )
					#ls -1 /root: will give us the filenames in single column
					#grep ^backup: extract only files starts with backup' from previous command output
					#sort -nr: # sorting the files in descending order , for ascending we can use sort -n
					#tail -1 : taking the last file name from previous output as oldest file will be in descending order
	rm /root/"$oldestFileName" #removing the oldest file
	echo "Removed the oldest file: $oldestFileName"
	#creating the backup with the new file name, it's like replacing the new file after deleting the old file among 3 backup files.
	backup_date=$(date +%Y%m%d%H%M%S)
	backup_filename="backup_$backup_date.tar.gz"
	tar -czf /root/"$backup_filename" --absolute-names  "$directoryPath"
	echo "Backup created: $directoryPath/$backup_filename"
fi



#############################Improvised and automated this script using crontab like below as an advancement.
#I have used crontab to schedule the backup script to run every day at 11:50 PM.
#opened the crontab configuration by running : crontab -e and then you can run crontab -l to see the scheduled configurations.
#and added the following line at the end of the crontab file: 50 23 * * * /root/shell-scripting-projects/2_backup_log_files.sh >> /root/backup_log.log 2>&1
                                                                                                                                 #the >> operator appends the output (both standard output and standard error) of the cron job to the specified log file (backup_log.log). The 2>&1 part ensures that both standard output (1) and standard error (2) are redirected to the log file.

