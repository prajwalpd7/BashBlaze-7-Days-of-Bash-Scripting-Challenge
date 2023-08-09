## **📚Introduction**

🚀 Welcome to the world of Linux process monitoring! In this blog, we'll explore the power of Bash scripting 📜 to ensure uninterrupted operations on your Linux system. In this fast-paced digital era, server uptime and application availability are vital for businesses and organizations to deliver seamless user experiences and maintain their competitive edge. As a Linux enthusiast or system administrator, you may have encountered situations where a specific process unexpectedly stops, leading to downtime and potential disruptions.

Join us on this exciting journey as we learn how to create an efficient process monitoring solution that keeps critical applications running smoothly. 🏃💨

## **👉Monitoring the Process and Ensuring its uptime**

👩‍💻 As a DevOps Engineer, I have come across many situations where I had to create, monitor, and ensure the uptime of the process. 💼 One of the most common issues faced by System administrators and DevOps engineers is monitoring a specific process's uptime and ensuring it remains active at all times. 🕰️ Performing this task manually is impractical and time-consuming. Hence needs to be automated using Bash script. 🤖 So let's dive into the solution! 🚀

## **👉Script**

According to the requirement, the script should accept a command-line argument to specify the target process to monitor.

For example: ./monitor_process.sh <process_name>

Process Existence Check:

We need to check if the specified process is running on our system. If yes then we have to print the message accordingly.

Create a file named `monitor_process.sh`

```
#!/bin/bash

function check_process() {

    # Get the process name as a parameter of the function
    process_name="$1"

    # Check if the process is running.
    # If the process is running then return 0 else return 1.
    if pgrep -x "$process_name" > /dev/null ; then
        return 0
    else
        return 1
}

```

Restarting the Process

If the desired process is not running, implement a function that will restart the process.

```
function restart_process() {
    # Considering the first parameter as the process name
    process_name="$1"

    # Considering the number of attempts to restart the process.
    attempts=3

    for ((i=0; i<attempts; i++)); do
        if check_process "$process_name"; then
            echo "Process $process_name restarted successfully."
            exit 0
        else
            echo "Process $process_name is not running. Attempting to restart ..."
            # Command to start the process
            sudo systemctl restart "$process_name"
            # Waiting for 1 second to let the service start
            sleep 1
        fi
    done
    if ! check_process "$process_name"; then
    echo "Maximum restart attempts reached. Please check manually."
    fi
}
```

Automation

Now that our script is ready, the next task is to automate the script. To schedule the script at regular intervals of time, we will be making use of cron jobs.

Open the Cron table for editing: crontab -e.

Add an entry to the Crontab file to specify the frequency of script execution. For example, to run the script every 1 hour:

```
 0 * * * * /path/to/monitor_process.sh <process_name>

```

Replace /path/to/monitor_process.sh with the actual path to the script, and <process_name> with the process, you want to monitor.

In our case, our crontab file will be like:

```
 0 * * * * monitor_process.sh nginx

```

To check the cron job:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/128c5b15-1c86-427b-8a6b-589abad28daa)

## **✨ Fully Functional Script**

```
#!/bin/bash

function check_process() {
    
    # Get the process name as a parameter of the function
    process_name="$1"

    # Check if the process is running.
    # If the process is running then return 0 else return 1.
    if pgrep -x "$process_name" > /dev/null ; then
        return 0
    else
        return 1
}

function restart_process() {
    # Considering the first parameter as the process name
    process_name="$1"

    # Considering the number of attempts to restart the process.
    attempts=3

    for ((i=0; i<attempts; i++)); do
        if check_process "$process_name"; then
            echo "Process $process_name restarted successfully."
            exit 0
        else
            echo "Process $process_name is not running. Attempting to restart ..."
            # Command to start the process
            sudo systemctl restart "$process_name"
            # Waiting for 1 second to let the service start
            sleep 1
        fi
    done
    if ! check_process "$process_name"; then
    echo "Maximum restart attempts reached. Please check manually."
    fi
}

if check_process "$1"; then
    echo "Process is running!"
    exit 0
else
    echo "Process is not running!"
    restart_process "$1"
fi
```

## **🖥️ Output Screens**

For the process that is not available on the system:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/8cd62f86-31e7-4235-96a9-a6c32e01871d)

For the process that's already running:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/fda0f490-4770-46be-a00d-4e2b3f0e7f95)

For the process that is available on the system and not running:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/a9ceb6d4-c13c-4c59-95ac-61ddde9cc039)

## **👉 Conclusion**

Our Bash monitoring script, monitor_process.sh, is a valuable tool for DevOps professionals to keep critical processes running smoothly without constant manual intervention. It helps you to ensure high availability and also reduce downtime!

Hope you found this blog useful! 😊

Happy learning! 🌟




