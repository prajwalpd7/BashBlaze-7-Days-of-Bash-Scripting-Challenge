Please run "day7_challange_solution.sh" for the solution.

This project is full meals with the shell scripting including devops concepts. 

This script will deploy the sample web application to the nginx as well as docker using shell scripting.

I have depoloyed a sample flask web application in both nginx and docker environments.

This script will handle major issues like if application is running already and again if someone try to deploy then it will kill the previous session and re-deploy the updated version.

Also handles the symlink creation(which is a major part of nginx reverse proxy) if symlink created earlier then it will unlink and re-create again to make sure ngin awareness.

Below are the snapshots of the project



Created 3 VMs(server, client1 and client2) with the below details.

![image (1)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/a970a49c-d719-4498-b192-cf2010584116)


![image (2)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/6cb80e5f-0cc3-47ed-a259-656dc61a362c)


![image (3)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/536c2780-d877-4a0a-842e-e9754a8c218d)


And this is the network adapter(bridge adapter) that i have used to communicate with each other VMs.

![image (4)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/00bb9164-2b90-4653-b02b-2b610cc67cdf)


Copied the SSH files to both the clients.

![image (5)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/23c5bf85-84c8-4967-98c1-fafa6682f253)


Below is the snap while building the docker image.

![image (6)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/b34eed5e-fe03-409d-9562-7bd429f9c1d2)

![image (7)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/b14f8a22-c26d-4a92-97f0-9b8a59c3c783)



Below are the successful remote command execution.

```
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

```



After running the script validating whether application is running in background or not

![image (11)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/827ed759-a7f5-493b-aac6-779e3b0c1d78)

Validating whether we can accessible the application using our vm ip(basically here we are accessing with only ip means it runs with 80 port this happens due to i have used nginx reverse proxy here).

validating in client-1

![image (8)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/20df1d66-e465-4f25-aa38-1c4c1d00001d)

validating in client-2

![image (12)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/14cfe635-2695-4de2-a5ad-39864ec2f898)


Deploying application on docker manually as VMs are capable to handle as of now.

Running the docker image with 1234 port

![image (13)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/9d2ed8b8-0ee8-41cf-98f0-c14cb1580278)

Validating the application with 1234 port in browser.

![image (14)](https://github.com/salvathshaik/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39498166/d0bd94a0-1ec1-42a3-8daf-474e455a122d)


