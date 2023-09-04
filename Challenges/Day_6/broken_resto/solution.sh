#!/bin/bash

# Function to read and display the menu from menu.txt file
function display_menu() {
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    # Read the menu from menu.txt and display item numbers and prices
    local item_number=1
    while IFS= read -r line; do
        name="$(echo "$line" | cut -d',' -f1)"
        price="$(echo "$line" | cut -d',' -f2)"
        echo "$item_number. $name - ₹$price"
        ((item_number++))
    done < "menu.txt"
}

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
    # Calculate the total bill based on the customer's order
    for item_number in "${!order[@]}"; do
        price=$(sed -n "${item_number}p" "menu.txt" | cut -d',' -f2)
        quantity="${order[$item_number]}"
        ((total += price * quantity))
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
    if [[ $item_number =~ ^[0-9]+$ && $quantity =~ ^[0-9]+$ ]]; then
        order["$item_number"]="$quantity"
    else
        handle_invalid_input
        exit 1
    fi
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

# Display the total bill with a personalized thank-you message
echo "Thank you, $customer_name! Your total bill is ₹$total_bill."
