
# Process Monitoring-Restart Script
The Process Monitoring and Restart Script is a versatile and user-friendly Bash script developed to verify that a specified process on a Linux system runs continuously and reliably. This script serves as a diligent watchdog, watching the target process and performing automatic corrective actions if it terminates suddenly.

Purpose

The primary goal of this script is to create an automated technique for monitoring a specific process and ensuring its continuous operation. It accomplishes this by:

1. Continuous Monitoring: The script constantly checks whether the specified process is running or not.

2. Automatic Restart: If the process is found to be inactive, the script will attempt to restart it automatically.

3. Threshold-based Notifications: If the process is unable to be restarted after a specific number of attempts, the script sends notifications to administrators for manual intervention.

## Usage
1. Running the Script: Open a terminal and navigate to the directory containing the script. Execute the script using the following command:

 
```bash
./monitor_process.sh <process_name>
```

Replace <process_name> with the name of the process you want to monitor

2. Customization: You can tailor the script's behavior by adjusting the following variables within the script:
 - max_attempts: Defines the maximum number of restart attempts   before notifications are triggered.
 - notification_threshold: Specifies the threshold for sending email notifications to administrators.
 - sleep_interval: Determines the time interval between each check for the process status.

# How it Works 
The script runs in a loop, constantly checking the status of the target process. The process monitoring and restart mechanism works as follows.

1. Process Check: The script utilizes the pgrep command to determine whether the designated process is active or not.

2. Restart Attempt: If the process is not running, the script initiates an automatic restart using the sudo systemctl restart command.

3. Attempt Tracking: The script keeps track of the number of restart attempts and compares this count to the predefined limit.

4. Notification: If the maximum number of restart attempts is reached, the script uses the mail command to send an email notification. This alerts administrators to intervene and investigate the status of the process.

# Customization & Configuration
To adapt the script to your specific needs:

- Modify the max_attempts and notification_threshold variables to align with your desired restart and notification thresholds.

- Adjust the sleep_interval to define the duration between each process status check.
# Note 
- The script requires the mail command to send email notifications. Ensure that your system's mail configuration is correctly set up.

- It's essential to replace the email address in the script with the actual recipient's address to ensure notifications reach the appropriate personnel.
# Example 
Suppose you want to monitor the Nginx web server process:
```bash
./monitor_process.sh nginx
```

