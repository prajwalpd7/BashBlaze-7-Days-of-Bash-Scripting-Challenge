#!/bin/bash

# Function to read and display the menu from menu.txt file
function display_menu() {
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    
    local menu_file="menu.txt"
    local item_number=1
    
    # Read and display menu items and prices from menu.txt
    while IFS=',' read -r item price; do
        echo "$item_number. $item - ₹$price"
        ((item_number++))
    done < "$menu_file"
}

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
    local menu_file="menu.txt"

    # Create an associative array to store menu item prices
    declare -A item_prices
    while IFS=',' read -r item price; do
        item_prices["$item_number"]=${price//[^0-9]/}
        ((item_number++))
    done < "$menu_file"

    # Calculate the total bill based on the order
    for item_number in "${!order[@]}"; do
        quantity=${order["$item_number"]}
        price=${item_prices["$item_number"]}
        subtotal=$((price * quantity))
        total=$((total + subtotal))
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
echo -n "Please enter your name: "
read customer_name

# Ask for the order
echo "Please enter the item number and quantity (e.g., 1 2 for two Burgers):"
read -a input_order

# Process the customer's order
declare -A order
for (( i=0; i<${#input_order[@]}; i+=2 )); do
    item_number="${input_order[i]}"
    quantity="${input_order[i+1]}"
    order["$item_number"]=$quantity
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

# Display the total bill with a personalized thank-you message
echo "Thank you, $customer_name! Your total bill is ₹$total_bill."
