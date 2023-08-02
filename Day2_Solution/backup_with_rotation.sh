#!/bin/bash

# Above is the shebang command, this will let the kernel know which interpreter to be used to run the below comands. In this case it is /bin/bash

#Challenge of Day_2.1 is to create backup of a directory (path of this directory is passed as argument), this backup needs to be saved in other particular directory and retain only the latest three backups along with any other files present in this directory.

# Path of directory that needs backup is passed as argument to $1 and assigned to variable "sourcedirectory" as shown below.

sourcedirectory=$1

echo "Source Directory path whose backup is required is :  $sourcedirectory"
#---------------------------------------------------------------------------------------------------------------

# Creating a time stamp function. The output of this function is a timestamp. This will be used to name the Backup Directory.
# The format of the time stamp is YYYY-MM-DD_HH-MM-SS. Using the "date" bash command to get runtime date and time.



timestamp() {
        date +%Y-%m-%d_%H-%M-%S
}



#----------------------------------------------------------------------------------------------------------------

# Providing a format of names given to newly created backup directories, with timestamp.
# Here function "timestamp" is called and appeded its value to "backup_" text. This overall text + timestamp format is assigned to a variable "filename".

filename=backup_$(timestamp)


#-----------------------------------------------------------------------------------------------------------------

# Here I am storing all the new backups in to "/home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Backup_Dir/" 

# Using echo command to specifiy the path of the Backup Directory where all new and old backups are stored.

echo "Path of the backup directory is : /home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Day2_Solution/Backup_Dir/"

# Here I am creating a new variable "Backup_Dir", this will give the name of the new backup (using variable "filename") that will be created along with its path.


Backup_Dir="/home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Day2_Solution/Backup_Dir/$filename"

#----------------------------------------------------------------------------------------------------------------

# I am using a simple copy command "cp" to create backup.

# Below command will copy "sourcedirectory" and its contents including subdirectories to "Backup_Dir" directory.

# Using -R optoin to copy all subdirectories.

cp -R $sourcedirectory $Backup_Dir

echo "---------------------------------New Backup file Name is $filename ------------------------------------------"

echo "Backup created: $Backup_Dir"
#-----------------------------------------------------------------------------------------------------------------


# In this part of the code we will implement a rotation mechanism to keep only three latest backups.


# First we need to change the current workning directory to the directory that contains all the backups. This is done using "cd" command.

cd /home/ubuntu/challenge/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Day2_Solution/Backup_Dir/

# After getting into Backup_Dir directory, below command is executed to remove all directories excpt for last three backups.

# Here "ls -1tp" comand is used to list contents in the present directory and sort them by modification time.

# Standard output of "ls -1tp" is given to grep command using pipe [|]. Here "grep" will filter all files and directories except for files and directories starting with "backup_*". Next this list is given to tail command using [|] pipe. Tail command skips the first three entries in the listing. 

# "rm" is used to remove all the entries. Since "rm command accepts arguments and not parameters like grep, "xarg" command is used. "xarg" command will invoke "rm" separately for each line withthe help of " -d '\n' ", this makes "xarg" consider each input line a separate argument. "-rf" option is used to remove all directories and files present in the list"

ls -1tp |grep 'backup_*' | tail -n +4 | xargs  -d '\n' -r rm -rf



