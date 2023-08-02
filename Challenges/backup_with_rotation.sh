##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# About : Developed a shell script to backup resources, present in the directory provided    #
#         by a user as a input.                                                              #
#                                                                                            #
#                                                                                            #
##############################################################################################
#                                                                                            #
# Execution : ./<script-name> <location to take backup>                                      #
#                                                                                            #
# Example   :  ./backup_with_rotation.sh /home/guru/Documents/                               #
#                                                                                            #
##############################################################################################

# Taking directory input from user
backup_input_dir=$1

# Latest timestamp
time_stamp="$(date +'%Y-%m-%d_%H-%M-%S')"

# Locatin to store all the backups
backup_storage_location=$backup_input_dir"/backup_"$time_stamp

# Backup file name with latest timestamp 
backup_file_name=backup_$time_stamp"".tar.gz

# Creating backup storage location (storage directory)
mkdir -p $backup_storage_location

# Taking backup and storing at the backup storage location
tar -cvf ${backup_storage_location}/${backup_file_name} ${backup_input_dir} 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
    echo "Backup created: $backup_storage_location"
else
    echo "Please enter valid directory name."
fi

# Steps to keep latest 3 backups and delete old backups
for backup_list_item in  $(ls -t $backup_input_dir | tail -n +4 | grep backup)
do
    rm -r $backup_input_dir/$backup_list_item
done



# Solution 1 (If we have more thank 1 extra backup except latest 3)
#solution 2 (if we have only one extra backup except latest 3)
# rm -r $backup_input_dir/$(ls -t $backup_input_dir | awk 'NR>3' | grep backup)

#solution 3 (if we have only one extra backup except latest 3)
# rm -r $backup_input_dir/$(ls -t $backup_input_dir | tail -n +4 | grep backup)


#Dont forget to Give your script executable permission
#chmod +x backup_with_rotation.sh