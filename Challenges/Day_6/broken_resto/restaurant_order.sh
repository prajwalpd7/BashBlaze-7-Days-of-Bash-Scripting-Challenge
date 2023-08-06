#!/bin/bash

# Function to read and display the menu from menu.txt file


function display_menu() {
    local menu=$(pwd)/menu.txt
    local i=1
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    while IFS=',' read -r item price; do
        echo "$i. $item - ₹$price"
        ((i++))
    done < "$menu"
}

# Store the prices of items in an associative array
declare -A item_prices
item_prices[1]=120
item_prices[2]=250
item_prices[3]=180
item_prices[4]=40
item_prices[5]=180
item_prices[6]=150
item_prices[7]=50
item_prices[8]=100
item_prices[9]=120

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
    for i in "${!order[@]}"; do
        total=$((total + (order[$i] * item_prices[$i])))
    done
    echo "$total"
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
if [ $(( ${#input_order[@]} % 2 )) -ne 0 ]; then
    echo "Please enter the quantity for the last item you mentioned."
    exit 1
fi

# Process the customer's order
declare -A order
for (( i = 0; i < ${#input_order[@]}; i += 2 )); do
    item_number="${input_order[i]}"
    quantity="${input_order[i + 1]}"
    order["$item_number"]=$quantity
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

# Display the total bill with a personalized thank-you message
echo "Thank you, $customer_name! Your total bill is ₹$total_bill."


