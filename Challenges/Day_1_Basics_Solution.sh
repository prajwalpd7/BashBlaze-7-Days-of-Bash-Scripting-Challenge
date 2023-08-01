##############################################################################################
#!/bin/bash                                                                                  #
##############################################################################################
# Author : Gurudeo ray                                                                       #
##############################################################################################
#                                                                                            #
# Usage : Created this script to full fill Day 1 Bashblaze challenge                         #
#                                                                                            #
##############################################################################################

echo "Created this script to full fill Day 1 Bashblaze challenge"

#Defining 2 integer variable and assigning them a value
num1=2
num2=5

#Printing sum of num1 and num2
echo "Sum of $num1 and $num2 = $( expr $num1 + $num2 )"

#Built-in variables
echo $HOSTNAME
echo $BASH
echo $#
echo $HOME

#finding file name in home directoy and it's subdirectory with .jpg extension
#find /home -name "*.jpg"