##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# Usage : Created this script to backup resources in the directories provided by user as a   #
#         argument                                                                           #
#                                                                                            #
##############################################################################################
#                                                                                            #
# Execution : ./<Script-name> <location to take backup>                                      #
#                                                                                            #
# Example   :  ./backup_with_rotation.sh /home/guru/Documents/                               #
#                                                                                            #
##############################################################################################

# Taking directory input from user
backup_dir_input=$1

# Latest timestamp
time_stamp="$(date +'%Y-%m-%d_%H-%M-%S')"

# Locatin to store all backups
backup_dir=$backup_dir_input"/backup_"$time_stamp

# Backup Zip file name with latest timestamp 
backup_output_filename=backup_$time_stamp"".tar.gz

# Creating Backup directory
mkdir -p $backup_dir

# Creating backup and storing in backup location
tar -cvf ${backup_dir}/${backup_output_filename} ${backup_dir_input} 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
    echo "Backup created: $backup_dir"
else
    echo "Please enter valid directory name."
fi

# Steps to keep latest 3 backups and delete old backups

# Solution 1 (If we have more thank 1 extra backup except latest 3)
 for backuplist in  $(ls -t $backup_dir_input | tail -n +4 | grep backup)
 do
    rm -r $backup_dir_input/$backuplist
 done

#solution 2 (if we have only one extra backup except latest 3)
# rm -r $backup_dir_input/$(ls -t $backup_dir_input | awk 'NR>3' | grep backup)

#solution 3 (if we have only one extra backup except latest 3)
# rm -r $backup_dir_input/$(ls -t $backup_dir_input | tail -n +4 | grep backup)


#Dont forget to Give your script executable permission
#chmod +x backup_with_rotation.sh