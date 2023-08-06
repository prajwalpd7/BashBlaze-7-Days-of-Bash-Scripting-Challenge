#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 05/08/2023
# Description: #TWSBashBlazeChallenge Day-6
# Task part - 2 : fix the restaurant ordering system script

# Declare associative arrays to store menu item values, ordered quantities, and menu items.
declare -A menu_item_value
declare -A item_quantity_ordered
declare -A menu_items

# Function to read menu items and their values from a file and populate the associative arrays.
function populate_menu() {
    local menu_file="./menu.txt"
    local index=0
    while IFS=", " read -r menu_item menu_item_value; do
        menu_items[$index]=$menu_item
        menu_item_value[$menu_item]=$menu_item_value
        ((index++))
    done < "$menu_file"
}

# Function to display the menu items and their corresponding values.
function display_menu() {
    local index=1
    for key in "${menu_items[@]}"; do
        echo -e "$index. $key \t- ₹ ${menu_item_value[$key]}"
        ((index++))
    done
}

# Function to take the customer's order for various menu items.
function take_order() {
    local index=1
    echo "Menu items will appear one at a time. Enter the quantity when prompted."
    echo "If you don't require an item, just press enter, and we will move to the next item."
    
    # take input for every item in the menu
    for key in "${menu_items[@]}"; do
        # take input from the customer until a numeric value is added
        while true; do
            read -p "$index. $key: " quantity
            # if input is empty move to next item
            if [[ -z "$quantity" ]]; then
                break
                # add to order only when input is a number
                elif [[ $quantity =~ ^[0-9]+$ ]]; then
                item_quantity_ordered["$key"]=$quantity
                break
                # for any input other than a number keep prompting the user for a numeric input
            else
                # Print an informative message to indicate the user that the input can only be a number.
                echo "Invalid input, enter quantity in number. Or press enter if item not required."
                continue
            fi
        done
        ((index++))
    done
}

# Function to calculate the total bill based on the ordered quantities and item values.
function calculate_total_bill() {
    local total=0
    for key in "${menu_items[@]}"; do
        total=$((total + menu_item_value[$key] * item_quantity_ordered[$key]))
    done
    echo $total
}

# Main function to execute the restaurant ordering process.
function main(){
    echo Welcome to the bash blaze restaurant
    read -p "What's your name please : " customer_name
    echo "$customer_name, here is our fantastic menu:"
    # Show the menu to the customer
    display_menu
    echo Ready to order!!
    # Take the customer's order
    take_order
    echo "Enjoy your meal, $customer_name..."
    echo
    echo
    sleep 2
    echo "Thank you, $customer_name, for dining at our Bash Blaze restaurant."
    # Generate the bill and present it to the customer
    echo "Your total bill is: ₹$(calculate_total_bill)"
}

# Populate the menu items and values from the file.
populate_menu
# Call the main function to start the ordering process.
main

