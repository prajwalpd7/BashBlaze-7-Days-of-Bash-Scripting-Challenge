---

## Monitoring Metrics Script - User Interaction Example

Assume we have a script called `monitoring_script.sh` that implements the tasks mentioned in the challenge.

1. **Launching the Script**

   Open a terminal and navigate to the directory where `monitoring_script.sh` is located. Execute the script using the following command:

   ```bash
   $ ./monitoring_script.sh
   ```

2. **Main Menu**

   Once the script starts, you'll see a simple menu displayed on the terminal:

   ```
   ---- Monitoring Metrics Script ----

   1. View System Metrics
   2. Monitor a Specific Service
   3. Exit
   ```

3. **View System Metrics**

   If you choose option 1, the script will display the current system metrics, including CPU usage, memory usage, and disk space usage. The output might look like this:

   ```
   ---- System Metrics ----

   CPU Usage:  8%   Mem Usage:  24%   Disk Space:  62%

   Press Enter to continue...
   ```

   The script waits for a moment (based on the specified sleep interval) before displaying the metrics again.

4. **Monitor a Specific Service**

   If you choose option 2, the script will prompt you to enter the name of the service you want to monitor. Let's say you want to monitor Nginx. Enter "nginx" when prompted:

   ```
   ---- Monitor a Specific Service ----

   Enter the name of the service to monitor: nginx
   ```

   The script will check the status of Nginx and display whether it is running or not:

   ```
   ---- Nginx Status ----

   Nginx is running.

   Press Enter to continue...
   ```

   If Nginx is not running, you'll see:

   ```
   ---- Nginx Status ----

   Nginx is not running.

   Do you want to start Nginx? (Y/N): _
   ```

   If you choose "Y," the script will attempt to start Nginx.

5. **Exit**

   If you choose option 3, the script will gracefully exit, and the terminal prompt will be returned to you.

6. **Error Handling**

   In case of any errors, such as invalid input or failed commands, the script will display appropriate error messages. For example:

   ```
   Error: Invalid option. Please choose a valid option (1, 2, or 3).
   ```

---

Note: The above example assumes that the script is implemented according to the tasks mentioned in the challenge.

### Get Help and Stay Connected

If you have any questions or need assistance during the challenge, feel free to connect with me on LinkedIn. Click the button below to visit my profile:

[![LinkedIn Profile](../../assets/icons8-linkedin-96(@2x).png)](https://www.linkedin.com/in/d-prajwal/)

### Reference Videos

If you are new to bash scripting or need some helpful resources, check out these reference videos for beginners:

1. [EASIEST Shell Scripting Tutorial for Beginners](https://youtu.be/_-D6gkRj7xc)
2. [ADVANCED Shell Scripting Tutorial](https://youtu.be/UYstAfqkLtg)
3. [New ADVANCED Shell Scripting Tutorial for DevOps](https://youtu.be/IoUGl76kyLk)

These videos will give you a solid foundation in bash scripting and help you tackle this challenge with confidence.

Happy scripting and best of luck with the challenge! Don't hesitate to reach out if you need any assistance. Let's make this challenge a great learning experience together!
