#!bin/bash/

echo "Welcome to the Interactive File and Directory Explorer!"

#ls -lh will give us the list of files and directories with their size in human readable format
# awk will help us to print the 9th and 5th column of that output
echo "Files and Directories in the Current Path:"
ls -lh | awk '{print "-",$9,"(",$5,")"}'

#checking if the length of msg variable is 0, it will break out of the loop
while [ True ];
do
	read -p "Enter a line of text(Press enter without text to exit): " msg
	if [ ${#msg} -eq 0 ]
	then
		break	
	fi	
	echo "Character Count: ${#msg} \n"
done

echo "Exiting the Interactive Explorer. Goodbye!"

