## **👋 Introduction**

🚀 Welcome to our Blog: Monitoring System Metrics with a User-Friendly Bash Script! 📊

In this article, we delve into an exciting project centered around the development of a Bash script. Our main objective is to craft a versatile tool capable of monitoring crucial system metrics, such as CPU utilization, memory consumption, and disk space usage.

But that's not all – we're not content with just basic functionality. Our script comes equipped with a user-friendly interface, making system monitoring a breeze for users of all levels. And the best part? It's not a one-time deal. Our script allows for continuous monitoring, thanks to a customizable sleep interval that suits your needs.

And here's where it gets even more interesting: we're not stopping at system-wide metrics. Our Bash script goes the extra mile by extending its capabilities to monitor specific services. Think Nginx and more – you name it, we monitor it.

So, whether you're a seasoned sysadmin or just dipping your toes into the world of system monitoring, this blog is your gateway to understanding how our innovative Bash script can revolutionize the way you oversee system performance. Let's dive in! 💡🔍📈

## **📋 Task 1: Implementing Basic Metrics Monitoring**

In Task 1, our objective is to develop a Bash script that effectively monitors key system metrics, including CPU usage, memory utilization, and disk space usage. The script's design will present the collected data in a user-friendly format that facilitates easy interpretation. To achieve this, we will leverage the power of essential commands such as 'top', 'free', and 'df' to gather and display the metrics accurately, contributing to a comprehensive and insightful system monitoring solution.

```
#!/bin/bash

# Function to display CPU metrics
function cpu_usage() {
    echo -e "\nCPU Usage:"
    top -bn 1 | grep '%Cpu' | awk '{printf "   - CPU Usage: %.2f%\n", $8}'
}

# Function to display memory usage
function memory_usage() {
    echo -e "\nMemory Usage:"
    free -m | awk 'NR==2{printf "   - Used Memory: %dMB (%.2f%%)\n", $3, $3*100/$2}'
}

# Function to display disk space usage
function disk_space_usage() {
    echo -e "\nDisk Space Usage:"
    df -h | awk '$NF=="/"{printf "   - Used Disk Space: %s (%s)\n", $3, $5}'
}

cpu_usage
memory_usage
disk_space_usage

```

## **🖥️ Task 2: Crafting a User-Friendly Interface**

To make the script easier to use and understand we will be adding a friendly menu in the terminal. This menu lets you see the metrics or exit the script quickly. It's all about making things simple and user-friendly.

```
# Crafting a User-Friendly Interface
function display_menu() {
    echo "===== System Metrics Monitoring ====="
    echo "1. View CPU Usage"
    echo "2. View Memory Usage"
    echo "3. View Disk Space"
    echo "4. Monitor Nginx Service"
    echo "5. Monitor a Different Service"
    echo "6. Exit"
    echo "====================================="
    echo
}

```

## **⏰ Task 3: Continuous Monitoring with Sleep**

Continuous monitoring is a key feature. We'll introduce a loop to keep fetching metrics until the user decides to exit. We'll also add a "sleep" mechanism to pause monitoring at a specified interval.

```
# Allow the user to specify the sleep interval
read -p "Enter the sleep interval: " span

# Execute a while loop for continuous looping
while true; do
    cpu_usage
    memory_usage
    disk_space_usage

    # Using sleep to wait for the desired interval
    sleep $span

    # Asking the user to exit or not
    read -p "Do you want to exit? (Yes/No): " ans
    if [ "$ans" == "Yes" ]; then
        exit 0
    fi
done

```

## **🔍 Task 4: Monitoring a Specific Service**

Now we are going to create a script for monitoring a specific service. It will check if the service is running and display its status. If it is not running, it will provide an option for the user to start the service. Let's create a function for it.

```
function monitor_service() {
    service_name="$1"

    if systemctl is-active --quiet "$service_name"; then
        echo "The service $service_name is active and running!"
    else
        echo "Service $service_name is not running!"
        read -p "Do you want to start the service $service_name? (Yes/No)" ans
        if [ "$ans" == "Yes" ]; then
            sudo systemctl start "$service_name"
            echo "Service $service_name started successfully!"
            sudo systemctl status "$service_name"
        fi
    fi
}

monitor_service nginx

```

## **🛠️ Task 5: Allow the User to Choose a Different Service**

Instead of passing the service name as a parameter to the function, we'll prompt the user to enter the name of the service.

```
function monitor_service() {
    # Prompt the user to enter the service name
    read -p "Enter the service you want to monitor: " service_name

    if systemctl is-active --quiet "$service_name"; then
        echo "The service $service_name is active and running!"
    else
        echo "Service $service_name is not running!"
        read -p "Do you want to start the service $service_name? (Yes/No): 
" ans
        if [ "$ans" == "Yes" ]; then
            sudo systemctl start "$service_name"
            echo "Service $service_name started successfully!"
            sudo systemctl status "$service_name"
        fi
    fi
}

monitor_service

```

## **🚫 Task 6: Enhancing Error Handling**

Now, we'll be implementing the error handling for the previous script

```

function monitor_service() {
    # Prompt the user to enter the service name
    read -p "Enter the service you want to monitor: " service_name    

    if systemctl is-active --quiet "$service_name"; then
        echo "The service $service_name is active and running!"
    else
        echo "Service $service_name is not running!"
        read -p "Do you want to start the service $service_name? (Yes/No): 
" ans
        if [ "$ans" == "Yes" ]; then
            sudo systemctl start "$service_name"

            # If the $? value is equal to 0, then the command completed without any service
            if [ $? -eq 0 ]; then
                echo "The $service_name service has been started successfully!"
                sudo systemctl status "$service_name"
            else
                echo "Error: Failed to start the $service_name service."
            fi
         elif [ "$ans" == "No" ]; then
            echo "Ok. Proceeding without starting the service!"
         else
            echo "Error: Invalid Input!"
        fi
    fi
}

monitor_service

```

## **🔧 Fully Functional Script**

```
#!/bin/bash

# Crafting a User-Friendly Interface
function display_menu() {
    echo "===== System Metrics Monitoring ====="
    echo "1. View CPU Usage"
    echo "2. View Memory Usage"
    echo "3. View Disk Space"
    echo "4. Monitor a Specific Service"
    echo "5. Exit"
    echo "====================================="
    echo
}

# Function to display CPU metrics
function cpu_usage() {
    echo -e "\nCPU Usage:"
    top -bn 1 | grep '%Cpu' | awk '{printf "   - CPU Usage: %.2f%\n", $8}'
}

# Function to display memory usage
function memory_usage() {
    echo -e "\nMemory Usage:"
    free -m | awk 'NR==2{printf "   - Used Memory: %dMB (%.2f%%)\n", $3, $3*100/$2}'
}

# Function to display disk space usage
function disk_space_usage() {
    echo -e "\nDisk Space Usage:"
    df -h | awk '$NF=="/"{printf "   - Used Disk Space: %s (%s)\n", $3, $5}'
}

# Function to monitor a specific service
function monitor_service() {
    # Prompt the user to enter the service name
    read -p "Enter the service you want to monitor: " service_name    

    if systemctl is-active --quiet "$service_name"; then
        echo "The service $service_name is active and running!"
    else
        echo "Service $service_name is not running!"
        read -p "Do you want to start the service $service_name? (Yes/No): 
" ans
        if [ "$ans" == "Yes" ]; then
            sudo systemctl start "$service_name"

            # If the $? value is equal to 0, then the command completed without any service
            if [ $? -eq 0 ]; then
                echo "The $service_name service has been started successfully!"
                sudo systemctl status "$service_name"
            else
                echo "Error: Failed to start the $service_name service."
            fi
         elif [ "$ans" == "No" ]; then
            echo "Ok. Proceeding without starting the service!"
         else
            echo "Error: Invalid Input!"
        fi
    fi
} 

# Handle an error
function handle_error(){
    echo "Error: Invalid option. Please enter a valid option!"
    exit 1
}

# Main Script
while true; do
    display_menu
    read -p "Enter your choice: " choice
    echo

    case "$choice" in
         1) cpu_usage ;;
         2) memory_usage ;;
         3) disk_space_usage ;;
         4) monitor_service ;;
         5) exit 0 ;;
         *) handle_error
    esac 

    echo
    read -p "Press Enter to continue..." -t 3
    echo
done

```

## **▶️ Running the Script**

Now that we are ready with the script, we're ready to make it executable.

In order to make your script executable use the command:

`chmod +x monitor_metrics.sh`

After making it executable we're ready to run it using the command below

`./monitor_metrics.sh`

## **📊 Results**

Output screens for the above script are as follows:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/e99683b4-7201-4d43-8d6b-3efb5e240963)

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/ec385f8c-cec3-416b-96e6-cba9d1ef3bc0)

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/5e296520-a8a5-4a1b-b00a-60492daa2de0)

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/47782a38-df3a-4f44-adc3-044d6fd653bf)

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/8e6463f6-5d8a-4b0d-b52f-784b6df4f205)

## **🔍 Conclusion**

In this way, we successfully created a bash script that will help us to monitor the system metrics efficiently and in a user-friendly manner.




