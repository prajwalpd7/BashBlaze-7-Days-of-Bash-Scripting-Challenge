#!/bin/bash

echo "Welcome to the Interactive File and Directory Explorer!"
pwd="$(pwd)"

echo "Here is list of all the files present in $pwd"
echo -e "\nFiles and Directories:"
ls -1
while true; do

    read -p "Enter your choice: " choice

    case $choice in
        1)
            #list_files_and_directories
            ;;
        2)
            echo "Exiting Explorer."
break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
                                                                                                                                1,10          Top
