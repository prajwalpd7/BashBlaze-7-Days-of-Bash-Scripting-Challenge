##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# Usage : Created this script to full fill Day 2 Bashblaze challenge  (Interactive File and  # 
#         Directory Explorer)                                                                #
#                                                                                            #
##############################################################################################

echo "Welcome to Day2 chalenge"

#Printing all the file and directroies with their size in human redable format
echo "Files and directories in current path: "
ls -lh | awk -F " " '{ print $9 " ("$5")"}'

isCondition=true

#Creating interactive while loop to count characters provided by user as a input
while( $isCondition ); do 
    count=0
    read -p "Enter a line or characters (Press enter without any input to exit): " inputstring
    if [[ $inputstring != "" ]];then
        for(( i=0; i<${#inputstring}; i++ )); do
            $(( count++ )) 2>/dev/null
        done
        echo "Character count : $count"
    else
        exit;
    fi 
done