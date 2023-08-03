# Example Interaction - Monitoring Nginx Process

In this example, we will demonstrate the usage of the `monitor_process.sh` script to monitor the Nginx process on a Linux system. The script will check if the Nginx process is running and restart it if it's not.

## Prerequisites

Before proceeding, make sure you have the following:

- A Linux-based system (Ubuntu, CentOS, etc.) with Nginx installed.

> Assuming the script is saved as monitor_process.sh, and the process to monitor is Nginx.

1. Execute the monitor_process.sh script with "nginx" as the process name to monitor:

```
./monitor_process.sh nginx
```

The script will check if the Nginx process is running and provide appropriate output based on its status.

2. Simulate Nginx Process Stopping

For demonstration purposes, let's simulate the Nginx process stopping. You can stop the Nginx service using the following command:

```
sudo systemctl stop nginx
```

3. Monitor the Nginx Process

Now, let's run the monitor_process.sh script again to see how it automatically restarts the Nginx process:

The script will detect that the Nginx process is not running and attempt to restart it. It will display messages indicating the attempt to restart the process.

The script will attempt to restart the process automatically for three times:

```
Process Nginx is not running. Attempting to restart...
Process Nginx is not running. Attempting to restart...
Process Nginx is not running. Attempting to restart...
Maximum restart attempts reached. Please check the process manually.

```

4. Check Nginx Status

After the script attempts to restart the Nginx process, you can verify its status using the following command:

```
sudo systemctl status nginx
```

"You should see that the Nginx process is **now running**."

5. Automation (Optional)
   To automate the process monitoring, you can set up a cron job to run the script at regular intervals.









![Ssofterminal](https://github.com/sk3pp3r/cheat-sheet-pdf/raw/main/assets/71492927/d82ea770-db45-40ea-9f3d-1007f5d2cb4c.png)

![Ssofterminal](https://github.com/sk3pp3r/cheat-sheet-pdf/raw/main/assets/71492927/3f32cc66-dc31-4264-907a-06d003f4716c.png)
