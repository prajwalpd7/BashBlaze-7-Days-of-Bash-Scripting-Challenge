
# System Monitoring and Service Management Script
Welcome to the System Monitoring and Service Management Script, a versatile Bash tool designed to provide insights into the performance metrics and service status of your Linux system. This script combines an easy-to-use interface with powerful monitoring capabilities, allowing you to easily monitor the health of your system.

Purpose and Features

The following are the script's primary goals:

- Real-Time System Metrics: Get instant access to important system metrics such as CPU usage, memory consumption, and disc space utilisation. These metrics are presented in an easy-to-understand format that allows for quick interpretation.

- Service Monitoring Made Simple: Monitor the status of specific services on your system in real time. You can easily check if a service is operational or not, whether it's a web server, a database, or a custom application.

- Service Management: Take control of services by starting them if they aren't already running. The script allows you to start services directly from the menu.

- Customizable Refresh Interval: Set the frequency of metric updates based on your preferences. You can set the interval at which the script refreshes and displays the metrics.

## Usage
1. Running the Script: Open a terminal and navigate to the directory containing the script. Execute the script by typing: 

 
```bash
./monitor_metrics.sh
```

2. Menu that is Interactive:

- Display System Metrics: Instantly visualise critical system metrics such as CPU usage, memory utilisation, and disc space occupancy.

- Monitor a Specific Service: Enter the name of the service you want to monitor. The script will promptly check its status and provide the option to restart the service if necessary.

- When you're finished, exit the script.

3. Customizable Refresh Rate: You can set the time interval (in seconds) between metric updates. If you enter 0, the script will exit.

# How does the script Works 
How Does the Script Work?

The script operates in a loop, ensuring continuous interaction with the user. Here's a step-by-step breakdown of how it works:

1. Displaying System Metrics: The script retrieves system metrics using various commands (top, free, df). These metrics are then organised neatly and displayed to the user.

2. Monitoring Services: Enter the name of the service to be monitored. The script uses systemctl is-active to determine the status of the service and offers the option to restart it if it is inactive.

3. User Interaction: The script prompts you to select from a menu, enter service names, and set sleep intervals.
## Note
- Some service management operations may necessitate administrative privileges (sudo). When prompted, provide the necessary permissions.

- Email Notifications: By default, the script does not include email notifications. You can, however, integrate such notifications in a manner similar to the "Process Monitoring and Restart Script."

- Customization Potential: Feel free to tweak the script's sleep intervals, add new menu choices, or adjust commands to suit your specific needs.
## Example
To view system metrics and manage services interactively, run the following command in your terminal:
```bash
./monitor_metrics.sh
```

