#!bin/bash/

#we will take source path from user and gets stored in $1
src_path=$1

#we will store the current date and time in 2 variables
fname="$(date '+%Y-%m-%d')"
time="$(date '+%I-%M-%S')"

#storing the name of the backup file in f_name
f_name=backup_$fname"_"$time.tar.gz

#this line will zip the files present in $src_path
tar -czf $f_name $src_path

echo "Backup Created: $PWD/$f_name"

#deleting the files except the 3 latest backup files
rm -f $(ls -1t *.tar.gz | tail -n +4)

