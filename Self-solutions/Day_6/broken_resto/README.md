
Please Run the script "day6_resto_challange_solution.sh" and choose the options to process the order.

This script will take inputs
        - customer name
        - item number and item quantity

And perform the total amount based on each item price and the quantity.

Used menu.txt file read the menu items and this file can change means you can add as many items with prices at the end like existed ones. our script wil take dynamically and display the user with the menu and calculate the total.

Script is desinged to handle multiple errors as well validated the user inputs before process the order.

Sample output of the script as follows...


```

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad basha shaik
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
3 4

Thank you, salwad basha shaik! Your total bill is 720.

Do you want to order more items (Y/N)? Y

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad basha shaik
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
10 20

Thank you, salwad basha shaik! Your total bill is 400.

Do you want to order more items (Y/N)? N

Exiting...

#handline invalid inputs

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
-1 20

Invalid item number! Please enter a valid item number between 1 to 9.

#one more invalid input

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
12 20

Invalid item number! Please enter a valid item number between 1 to 9.


#one more

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad basha
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
7 -12

Invalid  quantity entered! Please enter a valid quantity in numbers.


#more scenarios

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: basha
Please enter the item number and quantity (e.g., 1 2 for two Burgers):

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_resto# ./day6_resto_challange_solution.sh

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
1 5

Thank you, salwad! Your total bill is 600.

Do you want to order more items (Y/N)? Y

Welcome to the Restaurant!
Menu:
1. Burger - 120
2. Pizza - 250
3. Salad - 180
4. Soda - 40
5. Pasta - 180
6. Sandwich - 150
7. Coke - 50
8. Fries - 100
9. IceCream - 120
10. EggPuff - 20
Please enter your name to continue with the order: salwad
Please enter the item number and quantity (e.g., 1 2 for two Burgers):
3 4

Thank you, salwad! Your total bill is 720.

Do you want to order more items (Y/N)? N

Exiting...


```



