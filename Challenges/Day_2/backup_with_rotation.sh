#Author : Apurv Samadder
#Date : Aug 1 2023
#Version: v1
#Day 2 Bash Scripting Challenge - This is another challenge for Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that performs a backup of a specified directory and implements a rotation mechanism to manage backups.

######################################################################################





#!/bin/bash

#src_dir=/home/f5617049/Documents/shell_demo/shell_script

# As per requirement we need to take "directory path as a command-line argument" for that we use positional argument feature of shell, where the first argument is recognized as $1 and same has been 
#assigned to src_dir variable in program

# Creating backup folder as this is a kind of bug, it should get creatd automaticallt , however its throwing as error if below mkdir is not executed

# mkdir /home/f5617049/Documents/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/backups

src_dir=$1

tgt_dir=/home/f5617049/Documents/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/backups


#For Timestamp , we have Inbuilt function as date and we can use it to extract values of our choise based on below format.

curr_timestamp=$(date "+%Y-%m-%d-%H-%M-%S")

backup_file=$tgt_dir/$curr_timestamp.tgz

backup_file=$tgt_dir/$curr_timestamp.tgz
echo "Taking back on $curr_timestamp"

#tar is a tool in a linux used to backup the files, where :
# option c will create a new file 
# option z will compress it with gzip
# option f sets the archive filename
# --absolute-name is a used to remvove the error " tar removing leading '/' from member names"
# That's actually a feature, not a erroe. Archives with absolute locations are a security risk. Attackers could use such archives to trick users into installing files in critical system locations.
# we can also use -P to disable this feature

tar czf $backup_file --absolute-names $src_dir

echo " checking for files older than past 3 backups.. will delete them as per request"
sleep 2
# As per requirement we need " rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained."

# ls -lth backup_*.tar will give the sorted list of backup files (newest being at top)
# awk '{print $NF}' will print file names and pass it to tail
# tail -n +4 , will print file from number 3
# At last tail's result is fed to rm to act

rm -rf $(ls -lth /home/f5617049/Documents/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/backups/*.tgz | awk '{print $NF}' | tail -n +4)                                                                                                                                                 1,0-1         Top
