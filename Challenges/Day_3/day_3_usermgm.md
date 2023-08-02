## Challenge: User Account Management

In this challenge, you will create a bash script that provides options for managing user accounts on the system. The script should allow users to perform various user account-related tasks based on command-line arguments.

### Part 1: Account Creation

1. Implement an option `-c` or `--create` that allows the script to create a new user account. The script should prompt the user to enter the new username and password.

2. Ensure that the script checks whether the username is available before creating the account. If the username already exists, display an appropriate message and exit gracefully.

3. After creating the account, display a success message with the newly created username.

### Part 2: Account Deletion

1. Implement an option `-d` or `--delete` that allows the script to delete an existing user account. The script should prompt the user to enter the username of the account to be deleted.

2. Ensure that the script checks whether the username exists before attempting to delete the account. If the username does not exist, display an appropriate message and exit gracefully.

3. After successfully deleting the account, display a confirmation message with the deleted username.

### Part 3: Password Reset

1. Implement an option `-r` or `--reset` that allows the script to reset the password of an existing user account. The script should prompt the user to enter the username and the new password.

2. Ensure that the script checks whether the username exists before attempting to reset the password. If the username does not exist, display an appropriate message and exit gracefully.

3. After resetting the password, display a success message with the username and the updated password.

### Part 4: List User Accounts

1. Implement an option `-l` or `--list` that allows the script to list all user accounts on the system. The script should display the usernames and their corresponding user IDs (UID).

### Part 5: Help and Usage Information

1. Implement an option `-h` or `--help` that displays usage information and the available command-line options for the script.

### Bonus Points (Optional)

If you want to challenge yourself further, you can add additional features to the script, such as:

- Displaying more detailed information about user accounts (e.g., home directory, shell, etc.).
- Allowing the modification of user account properties (e.g., username, user ID, etc.).

Remember to handle errors gracefully, provide appropriate user prompts, and add comments to explain the logic and purpose of each part of the script.

## [Example Interaction: User Account Management Script](./example_interaction_with_usr_acc_mgmt.md)


## Submission Instructions

Create a bash script named `user_management.sh` that implements the User Account Management as described in the challenge.

Add comments in the script to explain the purpose and logic of each part.

Submit your entry by pushing the script to your GitHub repository.

Good luck with the User Account Management challenge! This challenge will test your ability to interact with user input, manage user accounts, and perform administrative tasks using bash scripting. Happy scripting and managing user accounts!
