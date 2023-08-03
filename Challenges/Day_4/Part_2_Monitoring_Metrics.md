# Monitoring Metrics Script with Sleep Mechanism

## Challenge Description

This project aims to create a Bash script that monitors system metrics like CPU usage, memory usage, and disk space usage. The script will provide a user-friendly interface, allow continuous monitoring with a specified sleep interval, and extend its capabilities to monitor specific services like Nginx.

## Tasks

### Task 1: Implementing Basic Metrics Monitoring

Write a Bash script that monitors the CPU usage, memory usage, and disk space usage of the system. The script should display these metrics in a clear and organized manner, allowing users to interpret the data easily. The script should use the top, free, and df commands to fetch the metrics.

### Task 2: User-Friendly Interface

Enhance the script by providing a user-friendly interface that allows users to interact with the script through the terminal. Display a simple menu with options to view the metrics and an option to exit the script.

### Task 3: Continuous Monitoring with Sleep

Introduce a loop in the script to allow continuous monitoring until the user chooses to exit. After displaying the metrics, add a "sleep" mechanism to pause the monitoring for a specified interval before displaying the metrics again. Allow the user to specify the sleep interval.

### Task 4: Monitoring a Specific Service (e.g., Nginx)

Extend the script to monitor a specific service like Nginx. Check if the service is running and display its status. If it is not running, provide an option for the user to start the service. Use the systemctl or appropriate command to check and control the service.

### Task 5: Allow User to Choose a Different Service

Modify the script to give the user the option to monitor a different service of their choice. Prompt the user to enter the name of the service they want to monitor, and display its status accordingly.

### Task 6: Error Handling

Implement error handling in the script to handle scenarios where commands fail or inputs are invalid. Display meaningful error messages to guide users on what went wrong and how to fix it.

### Task 7: Documentation

Add comments within the script to explain the purpose of each function, variable, and section of the code. Provide a clear and concise README file explaining how to use the script, the available options, and the purpose of the script.

Remember, the main goal of this challenge is to utilize various monitoring commands, implement a user-friendly interface, and create a script that is easy to understand and use.

Feel free to explore and research relevant commands and syntax while completing the tasks.Enjoy monitoring your system metrics effortlessly

## You can also check out the [interactive monitoring Metrics script repository](./usr_interaction_with_metrics.md) to see the code in action.

>>This project is an excellent addition to your portfolio. I can't wait to see what creative names you've given to this script. 
