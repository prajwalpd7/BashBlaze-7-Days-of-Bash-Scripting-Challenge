please run day4_part2_challenge_solution.sh file.

sample output of this script as follows

```
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# ./day4_part2_challenge_solution.sh

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 1
CPU Usage: 6.20%   Mem Usage: 26.00%  Disk Usage: 39%%

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 1

Showing metrics again in 5 seconds... please wait!

CPU Usage: 0.00%   Mem Usage: 26.00%  Disk Usage: 39%%

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 2
Enter the name of the service to monitor: nginx

Mentioned process 'nginx' is running in the system !!!
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-08-03 13:44:00 UTC; 3h 19min ago
       Docs: man:nginx(8)
    Process: 47056 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 47057 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 47058 (nginx)
      Tasks: 2 (limit: 1141)
     Memory: 2.7M
        CPU: 171ms
     CGroup: /system.slice/nginx.service
             ├─47058 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             └─47060 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Aug 03 13:44:00 ip-172-31-91-38 systemd[1]: Starting A high performance web server and a reverse proxy server...
Aug 03 13:44:00 ip-172-31-91-38 systemd[1]: Started A high performance web server and a reverse proxy server.

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 4
Invalid option '4'. please try again wtih the availiable options.

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 3

Exiting ..


Stopping the nginx service manually to check this scenario

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# systemctl stop nginx

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# ./day4_part2_challenge_solution.sh

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 2
Enter the name of the service to monitor: nginx

Mentioned service 'nginx' is not running in the system...

Do you want to start nginx? (Y/N): Y
'nginx' service started successfully!!
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-08-03 17:07:11 UTC; 17ms ago
       Docs: man:nginx(8)
    Process: 48414 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 48415 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 48416 (nginx)
      Tasks: 2 (limit: 1141)
     Memory: 2.5M
        CPU: 22ms
     CGroup: /system.slice/nginx.service
             ├─48416 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             └─48418 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Aug 03 17:07:11 ip-172-31-91-38 systemd[1]: Starting A high performance web server and a reverse proxy server...
Aug 03 17:07:11 ip-172-31-91-38 systemd[1]: Started A high performance web server and a reverse proxy server.


Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option: 2
Enter the name of the service to monitor: dummy-nginx-service

Mentioned service 'dummy-nginx-service' is not running in the system...

Do you want to start dummy-nginx-service? (Y/N): Y
Failed to start dummy-nginx-service.service: Unit dummy-nginx-service.service not found.
Failed to start the service dummy-nginx-service. Please check the service name and try again!!!

Main Menu

------ Monitoring Metrics Script -------

Choose below options
    1. View System Metrics
    2. Monitor a Specific Service
    3. Exit

Enter your option:3

Exiting ..

```

