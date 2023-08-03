# BashBlaze Scripting Challenge - Day 4

## About the Challenge 

Welcome to the Bash Scripting Challenge - Day 4! This challenge is designed to test your Bash scripting skills and problem-solving abilities in the context of process monitoring and management.

## Scenario - Write a Bash script that efficiently monitors a specific process on a Linux system. 

## Task 1 - Process Selection:

The script should accept a command-line argument to specify the target process to monitor. 


![image](https://github.com/isonalam/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/117289524/89ff312b-b290-43f4-866d-749123293cd1)

## Process Existence Check:

Implement a function that checks if the specified process is currently running or not on the system.
If the process is not running, print a message indicating its presence.

Here i have stopped the nginx manually using - sudo systemctl stop nginx

Output :

![image](https://github.com/isonalam/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/117289524/a32ff740-427b-4491-8b15-7ec9e8471e71)


## Restarting the Process:

If the process is not running, implement a function that attempts to restart the process automatically.

Print a message indicating the attempt to restart the process.

Ensure the script does not enter an infinite loop while restarting the process. I Limited the number of restart attempts to 3.

![image](https://github.com/isonalam/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/117289524/d89690cc-3c85-4738-8349-d873f563ef53)


## Check Nginx Status :

Before the execution of script :

![image](https://github.com/isonalam/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/117289524/9256626d-ed4c-47a7-a9d7-c218c7856682)


After the script attempts to restart the Nginx process automatically, you can verify its status using the following command:  sudo systemctl status nginx 

![image](https://github.com/isonalam/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/117289524/51282502-2fda-4405-ab15-3cb877df3b31)


## Bonus:

Implementing a notification mechanism (e.g., email, Slack message) to alert administrators if the process requires manual intervention after a certain number of restart attempts.



