# Day 4 Submission Part 1: Monitoring Processes in Linux Using Shell Scripting
For this task, I have created a script `monitor_process.sh` which can monitor & start processes given in command line argument. This script also has the functionality to send mails to default recipients in case of any errors.

## Available Options
![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/ed1a416a-7855-4bd8-b0ce-29610e11f216)

## Monitoring nginx process
![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/5b8937ec-0810-49e3-86bc-347d2991ec05)
As you can see in the image, the nginx service was in a stopped state before running the script.

![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/e4400278-a151-4e84-a8eb-35d4177f94e3)
This shows that process is already running

## Send Mail In Case of Error While Starting the Service
`monitor_process.sh` has the ability to send mails to recipients in case a service cannot be started. We need to enable sending emails using the `--sendmail` option.

![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/f04910b8-ab78-470c-b4e4-f86440ea6773)
![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/55a896e6-f956-44e0-bbe5-c9902c644ee4)
In this case, the script failed to start nginx after 3 tries and then sent a mail to me.

**NOTE:** Certain configurations need to be done to enable sending mails from Linus shell, please refer to this video for the configurations: https://www.youtube.com/watch?v=blYx6VQEPXY 

# How to automate monitoring using a cron job?
The script can be automated by creating an entry in the crontab in Linux. For example I have created an entry in crontab to monitor the process every 1 minute:

![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/b95bae84-515e-42c4-81c4-6beea5dd55b1)





