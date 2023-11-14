
# Restaurant Order System

The Restaurant Order System is a Bash script that simulates a restaurant ordering process. It allows customers to view the menu, place an order using item numbers and quantities, calculates the total bill, and displays a personalized thank-you message.

## Features

- **Display Menu:** The script reads the menu items and prices from a `menu.txt` file and displays them for the user upon execution.

- **Order Placement:** Customers are prompted to input their name and place an order by providing item numbers and quantities.

- **Total Bill Calculation:** The script calculates the total bill based on the ordered items and their quantities, using the prices from the menu.

- **Personalized Message:** After processing the order and calculating the total bill, the script displays a thank-you message to the customer, including their name and the total bill amount.

## Usage

1. Ensure you have a `menu.txt` file in the same directory as the script, containing menu items and their corresponding prices in the format `item, price`.

2. Open a terminal and navigate to the directory containing the script and `menu.txt`.

3. Run the script by entering the following command:

   ```bash
   ./menu.sh

 Follow the prompts:
- Enter your name when prompted.
- Enter the item numbers and quantities for your order (e.g., 1 2 for two Burgers).
- The script will display the menu, process your order, calculate the total bill, and provide a thank-you message with the total amount.
# Important Notes

- Make sure the menu.txt file is properly formatted and contains valid item names and prices.

- The script processes orders based on item numbers. Ensure you enter the correct item numbers and quantities when prompted.

- The script assumes that the user provides valid input. Incorrect input may lead to unexpected behavior.