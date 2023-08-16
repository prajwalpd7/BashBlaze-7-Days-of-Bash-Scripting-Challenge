# BashBlaze Scripting Challenge - Day 4

Welcome to the Bash Scripting Challenge - Day 4! This challenge is designed to test your Bash scripting skills and problem-solving abilities in the context of process monitoring and management.

## Scenario

You are tasked with writing a Bash script that efficiently monitors a specific process on a Linux system. The script's primary goal is to ensure the process is always running, and if it unexpectedly stops, it should be restarted automatically.

## Task

1. **Process Selection:**

   - The script should accept a command-line argument to specify the target process to monitor. For example: `./monitor_process.sh <process_name>`.

2. **Process Existence Check:**

   - Implement a function that checks if the specified process is currently running on the system.
   - If the process is running, print a message indicating its presence.

3. **Restarting the Process:**

   - If the process is not running, implement a function that attempts to restart the process automatically.
   - Print a message indicating the attempt to restart the process.
   - Ensure the script does not enter an infinite loop while restarting the process. Limit the number of restart attempts.

4. **Automation:**

   - Provide instructions on how to schedule the script to run at regular intervals using a cron job or any other appropriate scheduling method.

5. **Documentation:**

   - Include clear and concise comments in the script to explain its logic and functionality.
   - Write a separate document describing the purpose of the script, how to use it, and any specific considerations.

6. **Bonus:**
   - Implement a notification mechanism (e.g., email, Slack message) to alert administrators if the process requires manual intervention after a certain number of restart attempts.

Remember to test your script thoroughly on a test system before deploying it to a production environment. Ensure it does not interfere with critical processes or cause any unintended side effects. Consider edge cases and potential race conditions during process monitoring and restarting.

## Example Interaction

Check the [example_interaction.md](./usr_example_interaction.md)
file to see a sample interaction with the script, demonstrating its usage and behavior.

## Submission Guidelines

1. Fork this repository to your GitHub account.
2. Implement the Bash script according to the provided scenario and tasks.
3. Create a new branch in your forked repository for your changes.
4. Commit your changes with meaningful commit messages.
5. Push your changes to your forked repository.
6. Create a pull request from your branch to the original repository.

## Notes

- You can customize the script, add more features, or enhance the error handling as you see fit.
- If you encounter any issues or have questions, feel free to open an issue in this repository.

Happy scripting and good luck with the challenge!
