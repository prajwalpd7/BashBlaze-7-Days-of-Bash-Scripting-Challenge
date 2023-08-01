#Author : Apurv Samadder
#Date : Aug 1 2023
#Version: v1
#Day 2 Bash Scripting Challenge - Interactive File and Directory Explorer #TWS

#!/bin/bash

#This is just echo the printed message on screen
echo "Welcome to the Interactive File and Directory Explorer!"

echo "Files and Directories in the Current Path:"
# ls is used to list files given the option -l to list all files and -h in human readable format.
# -h option in ls will not read less than KB , its lesser value will be displayed in numneric only
# | symbol is used to combine two comands together
# awk script is used for string processing basically output from ls command along with | symbol is being took as input for awk, which is only showing the cloumn 5th and 9th, as per 
# requirement
ls -lh | awk '{print $5,$9}'

# We are using while loop here to as a condition , where the initial condition is true to enter inside the loop and when
# read is used to read the value input by user and stored inside word variable

while true; do
  echo "Enter a line of text (Press Enter without text to exit): "
  read word  
  echo "Entered String is $word"

# Below script is echoing the value stored in word variable and along with Pipe symbol we are using wc command along with -c is doing a character count
  char=$(echo -n "$word" | wc -c)
  echo "Character Count: $char"   

# Finally it is checking the condition of variable if its not equal to 'ENTER' it will keep the control inside while loop and when condition is true it breaks the loop
  if [ "$word" == "" ]; then
                break
        fi
done
