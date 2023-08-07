Please run "day7_challange_solution.sh" for the solution.

This project is full meals with the shell scripting including devops concepts. 

This script will deploy the sample web application to the nginx as well as docker using shell scripting.

I have depoloyed a sample flask web application in both nginx and docker environments.

This script will handle major issues like if application is running already and again if someone try to deploy then it will kill the previous session and re-deploy the updated version.

Also handles the symlink creation(which is a major part of nginx reverse proxy) if symlink created earlier then it will unlink and re-create again to make sure ngin awareness.

Below are the snapshots of the project


```
Created 3 VMs(server, client1 and client2) with the below details.

<3picks>

And this is the network adapter(bridge adapter) that i have used to communicate with each other VMs.
<n/w pic>


Copied the SSH files to both the clients.
<ssh pic>

Below is the snap while building the docker image.

Dockerhub validation snapshot

Below are the successful remote command execution.

<server@server-VirtualBox:~$ cd BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_7/
server@server-VirtualBox:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_7$ ./day7_challenge_solution.sh 

Started the nginx and Dependancies installations

Started for client-1

[sudo] password for client1: 
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://security.ubuntu.com/ubuntu focal-security InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu focal InRelease
Hit:3 http://in.archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu focal-backports InRelease
Reading package lists...
Building dependency tree...
Reading state information...
53 packages can be upgraded. Run 'apt list --upgradable' to see them.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
nginx is already the newest version (1.18.0-0ubuntu1.4).
0 upgraded, 0 newly installed, 0 to remove and 53 not upgraded.
[sudo] password for client1: Reading package lists...
Building dependency tree...
Reading state information...
python3-pip is already the newest version (20.0.2-5ubuntu1.9).
0 upgraded, 0 newly installed, 0 to remove and 53 not upgraded.
[sudo] password for client1: Requirement already satisfied: flask in /usr/local/lib/python3.8/dist-packages (2.3.2)
Requirement already satisfied: blinker>=1.6.2 in /usr/local/lib/python3.8/dist-packages (from flask) (1.6.2)
Requirement already satisfied: click>=8.1.3 in /usr/local/lib/python3.8/dist-packages (from flask) (8.1.6)
Requirement already satisfied: importlib-metadata>=3.6.0; python_version < "3.10" in /usr/local/lib/python3.8/dist-packages (from flask) (6.8.0)
Requirement already satisfied: Jinja2>=3.1.2 in /usr/local/lib/python3.8/dist-packages (from flask) (3.1.2)
Requirement already satisfied: Werkzeug>=2.3.3 in /usr/local/lib/python3.8/dist-packages (from flask) (2.3.6)
Requirement already satisfied: itsdangerous>=2.1.2 in /usr/local/lib/python3.8/dist-packages (from flask) (2.1.2)
Requirement already satisfied: zipp>=0.5 in /usr/local/lib/python3.8/dist-packages (from importlib-metadata>=3.6.0; python_version < "3.10"->flask) (3.16.2)
Requirement already satisfied: MarkupSafe>=2.0 in /usr/local/lib/python3.8/dist-packages (from Jinja2>=3.1.2->flask) (2.1.3)

Completed for Client-1

Started for client-2

[sudo] password for client2: 
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://in.archive.ubuntu.com/ubuntu focal InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:3 http://security.ubuntu.com/ubuntu focal-security InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu focal-backports InRelease
Reading package lists...
Building dependency tree...
Reading state information...
53 packages can be upgraded. Run 'apt list --upgradable' to see them.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
nginx is already the newest version (1.18.0-0ubuntu1.4).
0 upgraded, 0 newly installed, 0 to remove and 53 not upgraded.
[sudo] password for client2: Reading package lists...
Building dependency tree...
Reading state information...
python3-pip is already the newest version (20.0.2-5ubuntu1.9).
0 upgraded, 0 newly installed, 0 to remove and 53 not upgraded.
[sudo] password for client2: Requirement already satisfied: flask in /usr/local/lib/python3.8/dist-packages (2.3.2)
Requirement already satisfied: Werkzeug>=2.3.3 in /usr/local/lib/python3.8/dist-packages (from flask) (2.3.6)
Requirement already satisfied: click>=8.1.3 in /usr/local/lib/python3.8/dist-packages (from flask) (8.1.6)
Requirement already satisfied: importlib-metadata>=3.6.0; python_version < "3.10" in /usr/local/lib/python3.8/dist-packages (from flask) (6.8.0)
Requirement already satisfied: itsdangerous>=2.1.2 in /usr/local/lib/python3.8/dist-packages (from flask) (2.1.2)
Requirement already satisfied: Jinja2>=3.1.2 in /usr/local/lib/python3.8/dist-packages (from flask) (3.1.2)
Requirement already satisfied: blinker>=1.6.2 in /usr/local/lib/python3.8/dist-packages (from flask) (1.6.2)
Requirement already satisfied: MarkupSafe>=2.1.1 in /usr/local/lib/python3.8/dist-packages (from Werkzeug>=2.3.3->flask) (2.1.3)
Requirement already satisfied: zipp>=0.5 in /usr/local/lib/python3.8/dist-packages (from importlib-metadata>=3.6.0; python_version < "3.10"->flask) (3.16.2)

Completed for Client-2


Started copying the nginx configurations

Started for client-1

client1-nginx.conf                           100%  283   143.2KB/s   00:00    

Completed for Client-1

Started for client-2

client2-nginx.conf                           100%  283   125.2KB/s   00:00    

Completed for Client-2


Started Checking if symlink already created for my_app nginx configuration file.

Started for client-1

./day7_challenge_solution.sh: line 73: check_and_unlink_symlink.sh: No such file or directory

Completed for Client-1

Started for client-2

./day7_challenge_solution.sh: line 81: check_and_unlink_symlink.sh: No such file or directory

Completed for Client-2


Started Moving the nginx configurations

Started for client-1

[sudo] password for client1: 

[sudo] password for client1: ln: failed to create symbolic link '/etc/nginx/sites-enabled/my_app': File exists

Completed for Client-1

Started for client-1

[sudo] password for client2: 

[sudo] password for client2: ln: failed to create symbolic link '/etc/nginx/sites-enabled/my_app': File exists

Completed for Client-1


Started copying the flask application code to nginx.

Started for client-1

requirements.txt                             100%   19     5.0KB/s   00:00    
app.py                                       100%  514   140.9KB/s   00:00    
index.html                                   100%  144    38.6KB/s   00:00    
README.md                                    100% 1603   338.4KB/s   00:00    
Dockerfile                                   100%  149    34.4KB/s   00:00    


[sudo] password for client1: 
Completed for Client-1

Started for client-2

requirements.txt                             100%   19     6.4KB/s   00:00    
app.py                                       100%  514   192.3KB/s   00:00    
index.html                                   100%  144    59.8KB/s   00:00    
README.md                                    100% 1603   581.2KB/s   00:00    
Dockerfile                                   100%  149    66.8KB/s   00:00    


[sudo] password for client2: 
Completed for Client-2


Started checking if app.py is running on the BOTH remote hosts .

app.py is not running on client1@192.168.0.12.
app.py is not running on client2@192.168.0.14.

Completed the checking..


Running the app in both clients in the background and moving the terminal out to dummy file.


Completed Running..


Reloaing the nginx configurations to ensure nginx knows about the changes.

[sudo] password for client1: [sudo] password for client2: 
Completed All tasks.. validate in browser now


web deployment snapshots on nginx


on docker

command and image of docker






```



The challenge script mystery.sh has multiple culprits to confuse to understand what this script is doing but when you know the commmands and some important lines then it will be easy to crack the purpose of the file.  it took for while for me to understand new commands like rev, and cipher encrypt technique and how it works and all but at the end i cracked it and modified with fully with lot of enhancemens with performance improvement.

The output of the script as follows

```
#checking the content of output file before running the script

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Hello World!

#running the script with input and output files

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 10 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Uryyb Jbeyq!

The data looks to be in encrypted format. Do you want to decrypt it (Y/N)? Y

Now the data has been decrypted successfully !!
Showing the content of file below!!

Hello World!

The mysterious process is complete. Check the 'output-file.txt' for the result!

#verifying the output file content

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Hello World!

#running again and now see the difference if the random number is ODD

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 7 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Hello World!

Exiting ..
The mysterious process is complete. Check the 'output-file.txt' for the result!


#Now running again but this time random number will be even number and choose NO to decrypt

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 4 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Uryyb Jbeyq!

The data looks to be in encrypted format. Do you want to decrypt it (Y/N)? N

Data is not decrypted !!!

The mysterious process is complete. Check the 'output-file.txt' for the result!

#verifying the output file content now

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Uryyb Jbeyq!

```
