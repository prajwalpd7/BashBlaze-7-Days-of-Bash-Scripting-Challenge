#!/bin/bash

#Part -1 Challenge
#Welcome Message
echo "Welcome to the interactive File and Directory explorer"

#Displays Files and Directories in the current directory

echo "These are the files and directories in the current folder."
echo "The current directory is $PWD"
echo "The files will be displayed in a loop. To exit the Directory explorer press q and enter"
echo -e "\n"
echo -e "Note: The files ending with '/' are directories \n"
echo "Name   Size" 

#Loop to display files in current directory until user exits the explorer.
while [[ 5 -ge true ]]
do
    ls -sh --group-directories-first | awk {'print "- "$2" ""("$1")"'};
    echo -e "\n"

    #Reads user input to stop showing result
    read -t 2 -N 1 input

    #Terminates loop if q is pressed
    if [[ $input == "q" ]] || [[ $input == "Q" ]]; then
        echo
        break
    fi
done

#Part 2 Challenge
#Infinite loop to input the text.
while true
do
    #Takes user input and store it in variable.
    read -p "Enter a line of text (Press Enter without text to exit): " inp_text
    #Exits program if the input is empty.
    if [[ $inp_text == "" ]]; then 
        echo "Exiting"
        exit

    else 
        len=${#inp_text}
        echo "Character Count: $len"
    fi
done

