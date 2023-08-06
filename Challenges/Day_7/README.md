# Day 7 Submission: Mastering Remote Server Management and Web App Deployment
In today's challenge, we were tasked with creating a shell script that automates the deployment of docker containers into two remote servers. This challenge required me to use the remote command execution feature of `ssh ` and copy files from the master server using `scp`. Four shell scripts and one Dockerfile were written to automate the deployment. 

The shell scripts are:
- `remote_execute.sh` - which remotely executes commands to all the remote servers listed within it.
- `secure_transfer.sh` - To transfer files and folders from master to remote servers
- `deploy_app.sh ` - To run deployment-related commands in the remote servers
- `main.sh` - To start the deployment procedure

## Steps
1. Establish key-based ssh authentication between the master and two remote servers. For this, I referred to this video https://www.youtube.com/watch?v=S1a7RmqeZ5E&t=185s
2. Install docker in the remote servers using the `remote_execute.sh` script
![Screenshot 2023-08-06 at 10 57 40 PM](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/5718e1c0-6ee6-4353-bc40-5a087277d2c5)

3. Add the user to the docker group
![Screenshot 2023-08-06 at 10 58 35 PM](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/a683c50f-b78d-4226-9c4e-bbfc9c478157)

4. Reboot the remote servers (this is important for docker to work)
5. Install nginx in the remote servers
![Screenshot 2023-08-06 at 11 06 52 PM](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/b45a5099-7f93-4bdd-9d57-ba70828436c4)

6. Write Dockerfile for your application, I used a python flask application for this project.
![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/01ed09ee-c750-481f-a028-029abd2839bb)

7. Configure nginx-reverse-proxy.conf to redirect requests from port 80 to my container (port 5000)

8. Run `main.sh` which uses `remote_execute.sh` and `secure_transfer.sh` scripts to start the deployment to remote servers

Feel free to contribute to my project and let's keep learning!
