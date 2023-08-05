#!/bin/bash

# Function to read and display the menu from menu.txt file
function display_menu() {
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    echo "1. Burger - ₹120"
    echo "2. Pizza - ₹250"
    echo "3. Salad - ₹180"
    echo "4. Soda, 40"
    echo "5. Pasta, 180"
    echo "6. Sandwich, 150"
    echo "7. Coke, 50"
    echo "8. Fries, 100"
    echo "9. Ice Cream, 120"
}

#to store the items
declare -A item
item[1]=120
item[2]=250
item[3]=180
item[4]=40
item[5]=180
item[6]=150
item[7]=50
item[8]=100
item[9]=120

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
	for i in "${!order[@]}"; do
		total=$(($total+(${order[$i]}*${item[$i]})))
	done
    echo "$total"
}

# Function to handle invalid user input
function handle_invalid_input() {
    echo "Invalid input! Please enter a valid item number and quantity."
}

# Main script
display_menu

# Ask for the customer's name
read -p "Please enter your name: " customer_name
if [ ${#customer_name} -eq 0 ]; then
    echo "No name was entered"
	exit 1
fi

# Ask for the order
echo "Please enter the item number and quantity (e.g., 1 2 for two Burgers):"
read -a input_order
if [ `expr ${#input_order[@]} % 2` -ne 0 ]
	then echo "Please enter the quantity of the last item you mentioned."
	exit 1
fi


# Process the customer's order
declare -A order
for (( i=0; i<${#input_order[@]}; i+=2 )); do
    item_number="${input_order[i]}"
    quantity="${input_order[i+1]}"
	order[$item_number]=$quantity
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

echo "Thank you $customer_name! Your total bill is ₹$total_bill."
