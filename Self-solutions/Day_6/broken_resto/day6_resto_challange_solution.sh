#!/bin/bash



#####################################################################
# Script Name: day6_resto_challange_solution.sh
# Author: Salwad Basha Shaik
# Date: August 3, 2023
# Description: This script contains solution for Day 6 Restaurant Order System Challenge as part of BashBlaze: 7 Days of Bash Scripting Challenge.
# Usage: ./day6_resto_challange_solution.sh
# Email: salvathshaik786143@gmail.com
# LinkedIn: https://www.linkedin.com/in/salwad-basha-shaik/
# Github: https://github.com/salvathshaik/
#####################################################################


#Challenge Description


#In this challenge, you will be working on a Bash-based restaurant order system. The provided script, restaurant_order.sh, is partially broken and missing some crucial parts. Your task is to fix and complete the script to create a fully functional restaurant order system.

#The Broken Script
#The restaurant_order.sh script is provided to you, but some essential parts are missing or not functioning correctly. Here are the broken parts:

#Missing Menu Display: The script is missing the code to read and display the menu from the menu.txt file. You need to implement the function to read the menu and display it to the customers.

#Invalid User Input Handling: The script is not handling invalid user input, such as entering a non-existent item number or negative quantities. You need to implement error handling to prompt users for valid inputs when necessary.

#Total Bill Calculation: The script is not calculating the correct total bill based on the customer's order. You need to implement the function to calculate the total bill accurately.

#Your Task
#Your mission is to complete the restaurant_order.sh script and make it fully functional. Once you fix all the broken parts, the script should provide a smooth dining experience for our customers.


###############################



# Function to read and display the menu from menu.txt file
function display_menu() {
	echo
    	echo "Welcome to the Restaurant!"
   	echo "Menu: "


	file_name="menu.txt"
    	# Check if the file exists
    	if [ ! -f "$file_name"  ]; then
       		echo "File not found: $file_name. please check!!!"
       		exit 1
  	fi


    	# Loop through each line in the file
    	while IFS= read -r line; do
        	# Process the item name and item price variables here
        	cleaned_line=$(echo "$line" | tr -d '[:space:]')  
		
		# Split the cleaned line into string and integer variables
  		IFS=',' read -r item_name item_price <<< "$cleaned_line"
		declare -i int_variable="$item_price"
		echo "$line_number. $item_name - $item_price"
		
		main_menu_index=$(( line_number - 1 ))
		line_number=$(( line_number + 1  ))
		main_menu[$main_menu_index]="$int_variable"

    	done < "$file_name"

	#explanation:
	#The IFS= read -r line command reads a line from the file and stores it in the variable line.
	#To remove spaces and newlines from the line used the tr command. The tr -d '[:space:]' command removes all whitespace characters from the line
	#used IFS=',' read -r string_val integer_val <<< "$cleaned_line" to split the cleaned_line into two variables: string_val and integer_val. 
	#The <<< notation is called a here-string, which is used to pass the value of cleaned_line as input to the read command.
	#declare -i int_variable="$integer_val" declares a new integer variable called int_variable and assigns the value of integer_val to it.
	             #otherwise we will not gonna use it for our calculation as this will be treat as string at initial time
}


# Function to calculate the total bill
function calculate_total_bill() {
    	local total=0
    	
	#looping through all the order items and calculate the total
    	for item_number in "${!order[@]}"; do   #${!order[@]}: this is to repeat till total order items. here in for loop we will get key value item_number
		item_count="${order[$item_number]}"     #extracting item count from order associative array with itemnumber
		
		item_index_number_in_main_menu=$((item_number - 1))  #we are decreasing value by one as i have store menu items from 0 in main_menu assoc array.
		
		price="${main_menu[$item_index_number_in_main_menu]}"   #getting price based on main menu index from main menu array
		total=$((price * item_count))   #total is price *no of items.
	done

    	echo "$total"
}

# Function to handle invalid user input
function handle_invalid_input() {
    	
	item_number="${input_order[0]}"
	quantity="${input_order[1]}"
	#validating if user entered any negative or other tahn the total count of items for both the inputs item number and item count.
	if [ ! $item_number -le $line_number ] || [ $item_number -le 0 ]; then
       		echo
       		echo "Invalid item number! Please enter a valid item number between 1 to 9."
       		echo
       		exit 1
	fi

	if [ $quantity -le 0 ]; then
       		echo
       		echo "Invalid  quantity entered! Please enter a valid quantity in numbers."
       		echo
       		exit 1
	fi
	
}


#function is created to use it for multiple times based on user option after the first order run.
starting_the_restaurant_system() { 

#declaring these two associative array as well as line_number variable as we will be gonna use this whenever possible in script.
declare -A main_menu
line_number=1
# Main script
display_menu

#storing menu
#declare -A main_menu
#main_menu[0]=120
#main_menu[1]=250
#main_menu[2]=180
#main_menu[3]=40
#main_menu[4]=180
#main_menu[5]=150
#main_menu[6]=50
#main_menu[7]=100
#main_menu[8]=120

#declare -A main_menu

read -p "Please enter your name to continue with the order: " customer_name

echo "Please enter the item number and quantity (e.g., 1 2 for two Burgers):"
read -a input_order


#calling this function to valiadate the user inputs.
handle_invalid_input

# Process the customer's order
declare -A order

#storing the order items using assocaitive array item as a key and quantity as a value.
for (( i=0; i<${#input_order[@]}; i+=2 )); do
    	item_number="${input_order[i]}"
    	quantity="${input_order[i+1]}"
   	

	order["$item_number"]=$quantity  #storiing the value with key here
	


done

# Calculate the total bill
total_bill=$(calculate_total_bill)
echo
echo "Thank you, $customer_name! Your total bill is $total_bill."
echo

}


#this will run first and started the system.
starting_the_restaurant_system


#after above function runs means if user done with first order then provide option to choose to order multiple times and calling the above function again to process the order. if user chooses No then it infinite loop will end.

while true; do
	
	read -p "Do you want to order more items (Y/N)? " more_item_option
	if [ $more_item_option == "Y" ] || [ $more_item_option == "N" ]; then
	
		if [ $more_item_option == "Y" ]; then
			starting_the_restaurant_system
		else
			echo
			echo "Exiting..."
			echo
			break
		fi
	else
		echo
		echo "Invalid Option please try again !!"
		echo
	fi

done


