#!/bin/bash

# Function to read and display the menu from menu.txt file
function display_menu() {
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    # TODO: Read the menu from menu.txt and display item numbers and prices
    # Format: 1. Burger - ₹120
    #        2. Pizza - ₹250
    #        3. Salad - ₹180
    #        ...
}

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
    # TODO: Calculate the total bill based on the customer's order
    # The order information will be stored in an array "order"
    # The array format: order[<item_number>] = <quantity>
    # Prices are available in the same format as the menu display
    # Example: If the customer ordered 2 Burgers and 1 Salad, the array will be:
    #          order[1]=2, order[3]=1
    # The total bill should be the sum of (price * quantity) for each item in the order.
    # Store the calculated total in the "total" variable.
    echo "$total"
}

# Function to handle invalid user input
function handle_invalid_input() {
    echo "Invalid input! Please enter a valid item number and quantity."
}

# Main script
display_menu

# Ask for the customer's name
# TODO: Ask the customer for their name and store it in a variable "customer_name"

# Ask for the order
echo "Please enter the item number and quantity (e.g., 1 2 for two Burgers):"
read -a input_order

# Process the customer's order
declare -A order
for (( i=0; i<${#input_order[@]}; i+=2 )); do
    item_number="${input_order[i]}"
    quantity="${input_order[i+1]}"
    # TODO: Add the item number and quantity to the "order" array
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

# Display the total bill with a personalized thank-you message
# TODO: Display a thank-you message to the customer along with the total bill
# The message format: "Thank you, <customer_name>! Your total bill is ₹<total_bill>."

