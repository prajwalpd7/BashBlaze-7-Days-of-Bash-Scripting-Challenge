#!/bin/bash

#this script is to take the backup of logs or any work you done. and this is automated shell script that runs everyday at 11:50PM IST using cronttab

#trying to give the uniqueu name for every backup including date as below format as a file name
# Get the current date to use in the backup filename
backup_date=$(date +%Y%m%d%H%M%S)

#defining full name of the backup file
backup_filename="backup_$backup_date.tar.gz"

# Create the backup archive using tar
tar -cvzf /root/"$backup_filename" ./* #first parameter is the backup file name with it's path to store
                                       # second paramter is from where we should take the backup(path of the backup folder)
                                       #here we are taking backup from curent folder
                                       #-cvzf is for compressinng the tar file and -xvzf is for extractinv the tar file .
                                       #just a first letter change c:compress , x:extract here.

echo "Backup created: $backup_filename"


#I have used crontab to schedule the backup script to run every day at 11:50 PM.
#opened the crontab configuration by running : crontab -e and then you can run crontab -l to see the scheduled configurations.
#and added the following line at the end of the crontab file: 50 23 * * * /root/shell-scripting-projects/2_backup_log_files.sh >> /root/backup_log.log 2>&1
         #the >> operator appends the output (both standard output and standard error) of the cron job to the specified log file (backup_log.log). The 2>&1 part ensures that both standard output (1) and standard error (2) are redirected to the log file.
#then it will run this at specified timing and take the logs or your work done.
#To remove all crontab schedules for the current user, you can use the crontab -r command.
#Remember to be cautious when editing crontab, especially with root privileges, as incorrect changes can cause unintended issues with your scheduled tasks. Double-check your changes before saving the crontab file. so prepare first and setup at once.


#practice-1
#practicing the To count the number of files that start with "backup" in a given directory path
#!/bin/bash

# Directory path where you want to count files
directory="/path/to/directory"

# Count the number of files starting with "backup" in the directory
file_count=$(ls -1 "$directory" | grep -c '^backup')

echo "Number of files starting with 'backup': $file_count"

#practice-2
#To find the oldest file among the files starting with "backup" in the given directory path
#!/bin/bash

# Directory path where you want to find the files
directory="/path/to/directory"

# Find all files starting with "backup" and get their modification time
oldest_file=$(find "$directory" -maxdepth 1 -name 'backup*' -type f -exec stat -c '%Y %n' {} + | sort -n | head -n 1 | awk '{print $2}')

echo "The oldest file among files starting with 'backup' is: $oldest_file"



#practice-3
#To get the files in descending order (from the newest to the oldest) among the files starting with "backup" in the given directory path
#!/bin/bash

# Directory path where you want to find the files
directory="/path/to/directory"

# Find all files starting with "backup" and get their modification time
newest_file=$(find "$directory" -maxdepth 1 -name 'backup*' -type f -exec stat -c '%Y %n' {} + | sort -nr | head -n 1 | awk '{print $2}')

echo "The newest file among files starting with 'backup' is: $newest_file"
#The modification made to the script is in the sort -nr part, where we use the -r flag to sort the files in reverse (descending) order based on their modification time.

#practice-4
#practicing the conditional statements in shell scripting
#!/bin/bash

# Variables for comparison
number1=10
number2=20

# Check if the numbers are equal
if [ "$number1" == "$number2" ]; then
  echo "Numbers are equal"
else
  echo "Numbers are not equal"
fi

# Check if the numbers are not equal
if [ "$number1" != "$number2" ]; then
  echo "Numbers are not equal"
else
  echo "Numbers are equal"
fi

# Check if number1 is greater than number2
if [ "$number1" -gt "$number2" ]; then
  echo "Number1 is greater than Number2"
else
  echo "Number1 is not greater than Number2"
fi

# Check if number1 is less than or equal to number2
if [ "$number1" -le "$number2" ]; then
  echo "Number1 is less than or equal to Number2"
else
  echo "Number1 is not less than or equal to Number2"
fi


#practice-5
#following the below approach to avoice the error tar: Removing leading `/' from member names
tar -czf your_archive.tar.gz --absolute-names /path/to/files

#practice-6
#practicing the command line arguments in shell scripting

#These arguments allow you to provide input to the script at runtime, enabling you to customize the script's behavior based on the provided values.
# In bash (a popular shell used on many Unix-like systems), you can access command-line arguments using special variables:

# $0: The name of the script itself.
# $1, $2, $3, ...: These variables represent the first, second, third, and so on, command-line arguments passed to the script.
# $@: Represents all the command-line arguments as separate words. It is an array-like variable.
# $#: The number of command-line arguments passed to the script.
#!/bin/bash

# Access command-line arguments using $1 and $2
echo "First argument: $1"
echo "Second argument: $2"

# Access all command-line arguments using $@
echo "All arguments: $@"

# Access the number of arguments using $#
echo "Number of arguments: $#"



