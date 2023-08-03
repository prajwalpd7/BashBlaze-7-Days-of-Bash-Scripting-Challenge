please run "day4_part1_challlenge_solution.sh" and "day4_part2_challlenge_solution.sh"

sample output for the script day3_challange_solution.sh:

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# ./day4_part1_challenge_solution.sh nginx

Mentioned process 'nginx' is running in the system !!!
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-08-03 13:37:51 UTC; 3min 22s ago
       Docs: man:nginx(8)
    Process: 46948 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 46949 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 46950 (nginx)
      Tasks: 2 (limit: 1141)
     Memory: 2.5M
        CPU: 20ms
     CGroup: /system.slice/nginx.service
             ├─46950 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             └─46952 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Aug 03 13:37:51 ip-172-31-91-38 systemd[1]: Starting A high performance web server and a reverse proxy server...
Aug 03 13:37:51 ip-172-31-91-38 systemd[1]: Started A high performance web server and a reverse proxy server.



root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# #stopping manually


root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# systemctl stop nginx

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# ./day4_part1_challenge_solution.sh nginx

Mentioned process 'nginx' is not running in the system, Attempting to restart...

Attempting restart to the process 'nginx' automatically !
Attempt number: '1'
process 'nginx' is running successfully after restart attempt-'1' !!!

● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-08-03 13:44:00 UTC; 25ms ago
       Docs: man:nginx(8)
    Process: 47056 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 47057 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 47058 (nginx)
      Tasks: 2 (limit: 1141)
     Memory: 2.5M
        CPU: 22ms
     CGroup: /system.slice/nginx.service
             ├─47058 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             └─47060 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Aug 03 13:44:00 ip-172-31-91-38 systemd[1]: Starting A high performance web server and a reverse proxy server...
Aug 03 13:44:00 ip-172-31-91-38 systemd[1]: Started A high performance web server and a reverse proxy server.



root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_4# ./day4_part1_challenge_solution.sh dummy-nginx

Mentioned process 'dummy-nginx' is not running in the system, Attempting to restart...

Attempting restart to the process 'dummy-nginx' automatically !
Attempt number: '1'
Failed to start dummy-nginx.service: Unit dummy-nginx.service not found.
Attempt number: '2'
Failed to start dummy-nginx.service: Unit dummy-nginx.service not found.
Attempt number: '3'
Failed to start dummy-nginx.service: Unit dummy-nginx.service not found.
After 3 attempts to restart we could not able to start the process 'dummy-nginx' please try manually !

Sending slack notification !!!!!!!!!!!

ok
Slack notification sent successfully !!!

#After sending the slack notification below notification we can see.


