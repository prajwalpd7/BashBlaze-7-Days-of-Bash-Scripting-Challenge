

Usage and sample output of script day5_challenge_solution.sh

Generated the sample log file(logfile.log) with 300 lines.
This script will handle multiple scenarios and error messages.

log_generator.sh - this will generate the logfile by providing the logfile path and number of lines you want in log file.
this will have 9 error messages and 5 log levels to generate the logfile.

Please read Sample_Log_Data.md for more details on how we are generating the log file.

This script is fully enhanced with a feature to automatically archive or move processed log files to a LogArchive/ directory after analysis.

```
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ./day5_challenge_solution.sh /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile1.log

Provided log file path is: /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile1.log
Path does not exist. So please provide the correct path. !!!


#Before Running the script directory have these files
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ls -ltr
total 48
-rw-r--r-- 1 root root     0 Aug  4 10:00 day5_solution_practice.sh
-rwxr-xr-x 1 root root  1274 Aug  4 14:51 log_generator.sh
-rw-r--r-- 1 root root 12068 Aug  4 14:52 logfile.log
-rw-r--r-- 1 root root    56 Aug  4 14:55 readme.txt
-rw-r--r-- 1 root root  8780 Aug  4 14:56 README.md
-rw-r--r-- 1 root root  2705 Aug  4 15:58 Sample_Log_Data.md
-rwxr-xr-x 1 root root  8442 Aug  4 17:59 day5_challenge_solution.sh

#after a first run 

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ./day5_challenge_solution.sh /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log

Provided log file path is: /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log

####################

INFO log_level count is: 72

####################

DEBUG log_level count is: 60

####################

ERROR log_level count is: 61

####################

WARNING log_level count is: 53

####################

CRITICAL log_level count is: 54


printing the 'CRITICAL' log level occurences with their line numbers of logfile.

Line number -2 : 2023-08-04 14:52:26 [CRITICAL]  - 9931
Line number -12 : 2023-08-04 14:52:26 [CRITICAL]  - 18610
Line number -15 : 2023-08-04 14:52:26 [CRITICAL]  - 32604
Line number -17 : 2023-08-04 14:52:26 [CRITICAL]  - 8022
Line number -28 : 2023-08-04 14:52:26 [CRITICAL]  - 6799
Line number -30 : 2023-08-04 14:52:26 [CRITICAL]  - 18552
Line number -32 : 2023-08-04 14:52:26 [CRITICAL]  - 11113
Line number -37 : 2023-08-04 14:52:26 [CRITICAL]  - 19571
Line number -39 : 2023-08-04 14:52:26 [CRITICAL]  - 2854
Line number -40 : 2023-08-04 14:52:26 [CRITICAL]  - 15066
Line number -42 : 2023-08-04 14:52:26 [CRITICAL]  - 28344
Line number -46 : 2023-08-04 14:52:26 [CRITICAL]  - 13775
Line number -47 : 2023-08-04 14:52:26 [CRITICAL]  - 31720
Line number -52 : 2023-08-04 14:52:26 [CRITICAL]  - 8107
Line number -58 : 2023-08-04 14:52:26 [CRITICAL]  - 4078
Line number -61 : 2023-08-04 14:52:26 [CRITICAL]  - 9364
Line number -66 : 2023-08-04 14:52:26 [CRITICAL]  - 22911
Line number -71 : 2023-08-04 14:52:26 [CRITICAL]  - 8673
Line number -74 : 2023-08-04 14:52:26 [CRITICAL]  - 23188
Line number -83 : 2023-08-04 14:52:26 [CRITICAL]  - 29553
Line number -86 : 2023-08-04 14:52:26 [CRITICAL]  - 29900
Line number -98 : 2023-08-04 14:52:26 [CRITICAL]  - 14104
Line number -99 : 2023-08-04 14:52:26 [CRITICAL]  - 31900
Line number -105 : 2023-08-04 14:52:26 [CRITICAL]  - 17537
Line number -106 : 2023-08-04 14:52:26 [CRITICAL]  - 32729
Line number -110 : 2023-08-04 14:52:26 [CRITICAL]  - 22285
Line number -111 : 2023-08-04 14:52:26 [CRITICAL]  - 17009
Line number -120 : 2023-08-04 14:52:26 [CRITICAL]  - 18616
Line number -121 : 2023-08-04 14:52:26 [CRITICAL]  - 31053
Line number -160 : 2023-08-04 14:52:26 [CRITICAL]  - 12532
Line number -161 : 2023-08-04 14:52:26 [CRITICAL]  - 28216
Line number -162 : 2023-08-04 14:52:26 [CRITICAL]  - 31835
Line number -163 : 2023-08-04 14:52:26 [CRITICAL]  - 5721
Line number -174 : 2023-08-04 14:52:26 [CRITICAL]  - 11648
Line number -178 : 2023-08-04 14:52:26 [CRITICAL]  - 8364
Line number -180 : 2023-08-04 14:52:26 [CRITICAL]  - 24481
Line number -186 : 2023-08-04 14:52:26 [CRITICAL]  - 5536
Line number -194 : 2023-08-04 14:52:26 [CRITICAL]  - 6033
Line number -196 : 2023-08-04 14:52:26 [CRITICAL]  - 12167
Line number -206 : 2023-08-04 14:52:26 [CRITICAL]  - 14222
Line number -212 : 2023-08-04 14:52:26 [CRITICAL]  - 10208
Line number -214 : 2023-08-04 14:52:26 [CRITICAL]  - 32682
Line number -220 : 2023-08-04 14:52:26 [CRITICAL]  - 5664
Line number -224 : 2023-08-04 14:52:26 [CRITICAL]  - 2668
Line number -228 : 2023-08-04 14:52:26 [CRITICAL]  - 5712
Line number -238 : 2023-08-04 14:52:26 [CRITICAL]  - 14774
Line number -241 : 2023-08-04 14:52:26 [CRITICAL]  - 5768
Line number -257 : 2023-08-04 14:52:26 [CRITICAL]  - 23214
Line number -264 : 2023-08-04 14:52:27 [CRITICAL]  - 11714
Line number -274 : 2023-08-04 14:52:27 [CRITICAL]  - 5122
Line number -286 : 2023-08-04 14:52:27 [CRITICAL]  - 19055
Line number -287 : 2023-08-04 14:52:27 [CRITICAL]  - 5441
Line number -291 : 2023-08-04 14:52:27 [CRITICAL]  - 9692
Line number -294 : 2023-08-04 14:52:27 [CRITICAL]  - 17933


Printing all the error messages with it's count.

Failed to connect: 11
Disk full: 8
Segmentation fault: 10
Invalid input: 6
Out of memory: 5
File not found: 6
Permission denied: 6
Connection refused: 4
Timeout: 5


Top 5 Error Messages are as follows:
11 - Failed to connect
10 - Segmentation fault
8 - Disk full
6 - Permission denied
6 - Invalid input


New log file has been created ( log_report-2023-08-04-18-04-18.txt )



Generating the report....

Report file log_report-2023-08-04-18-04-18.txt has been generated !!!

Showing the Analasys...


                            Log Analasys report

Date of analysis: 2023-08-04-18-04-18
Log file name: /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log
Total lines processed: 300
Total error count: 61

Top 5 Error Messages are as follows:
11 - Failed to connect
10 - Segmentation fault
8 - Disk full
6 - Permission denied
6 - Invalid input


printing the 'CRITICAL' log level occurences with their line numbers of logfile.

Line number -2 : 2023-08-04 14:52:26 [CRITICAL]  - 9931
Line number -12 : 2023-08-04 14:52:26 [CRITICAL]  - 18610
Line number -15 : 2023-08-04 14:52:26 [CRITICAL]  - 32604
Line number -17 : 2023-08-04 14:52:26 [CRITICAL]  - 8022
Line number -28 : 2023-08-04 14:52:26 [CRITICAL]  - 6799
Line number -30 : 2023-08-04 14:52:26 [CRITICAL]  - 18552
Line number -32 : 2023-08-04 14:52:26 [CRITICAL]  - 11113
Line number -37 : 2023-08-04 14:52:26 [CRITICAL]  - 19571
Line number -39 : 2023-08-04 14:52:26 [CRITICAL]  - 2854
Line number -40 : 2023-08-04 14:52:26 [CRITICAL]  - 15066
Line number -42 : 2023-08-04 14:52:26 [CRITICAL]  - 28344
Line number -46 : 2023-08-04 14:52:26 [CRITICAL]  - 13775
Line number -47 : 2023-08-04 14:52:26 [CRITICAL]  - 31720
Line number -52 : 2023-08-04 14:52:26 [CRITICAL]  - 8107
Line number -58 : 2023-08-04 14:52:26 [CRITICAL]  - 4078
Line number -61 : 2023-08-04 14:52:26 [CRITICAL]  - 9364
Line number -66 : 2023-08-04 14:52:26 [CRITICAL]  - 22911
Line number -71 : 2023-08-04 14:52:26 [CRITICAL]  - 8673
Line number -74 : 2023-08-04 14:52:26 [CRITICAL]  - 23188
Line number -83 : 2023-08-04 14:52:26 [CRITICAL]  - 29553
Line number -86 : 2023-08-04 14:52:26 [CRITICAL]  - 29900
Line number -98 : 2023-08-04 14:52:26 [CRITICAL]  - 14104
Line number -99 : 2023-08-04 14:52:26 [CRITICAL]  - 31900
Line number -105 : 2023-08-04 14:52:26 [CRITICAL]  - 17537
Line number -106 : 2023-08-04 14:52:26 [CRITICAL]  - 32729
Line number -110 : 2023-08-04 14:52:26 [CRITICAL]  - 22285
Line number -111 : 2023-08-04 14:52:26 [CRITICAL]  - 17009
Line number -120 : 2023-08-04 14:52:26 [CRITICAL]  - 18616
Line number -121 : 2023-08-04 14:52:26 [CRITICAL]  - 31053
Line number -160 : 2023-08-04 14:52:26 [CRITICAL]  - 12532
Line number -161 : 2023-08-04 14:52:26 [CRITICAL]  - 28216
Line number -162 : 2023-08-04 14:52:26 [CRITICAL]  - 31835
Line number -163 : 2023-08-04 14:52:26 [CRITICAL]  - 5721
Line number -174 : 2023-08-04 14:52:26 [CRITICAL]  - 11648
Line number -178 : 2023-08-04 14:52:26 [CRITICAL]  - 8364
Line number -180 : 2023-08-04 14:52:26 [CRITICAL]  - 24481
Line number -186 : 2023-08-04 14:52:26 [CRITICAL]  - 5536
Line number -194 : 2023-08-04 14:52:26 [CRITICAL]  - 6033
Line number -196 : 2023-08-04 14:52:26 [CRITICAL]  - 12167
Line number -206 : 2023-08-04 14:52:26 [CRITICAL]  - 14222
Line number -212 : 2023-08-04 14:52:26 [CRITICAL]  - 10208
Line number -214 : 2023-08-04 14:52:26 [CRITICAL]  - 32682
Line number -220 : 2023-08-04 14:52:26 [CRITICAL]  - 5664
Line number -224 : 2023-08-04 14:52:26 [CRITICAL]  - 2668
Line number -228 : 2023-08-04 14:52:26 [CRITICAL]  - 5712
Line number -238 : 2023-08-04 14:52:26 [CRITICAL]  - 14774
Line number -241 : 2023-08-04 14:52:26 [CRITICAL]  - 5768
Line number -257 : 2023-08-04 14:52:26 [CRITICAL]  - 23214
Line number -264 : 2023-08-04 14:52:27 [CRITICAL]  - 11714
Line number -274 : 2023-08-04 14:52:27 [CRITICAL]  - 5122
Line number -286 : 2023-08-04 14:52:27 [CRITICAL]  - 19055
Line number -287 : 2023-08-04 14:52:27 [CRITICAL]  - 5441
Line number -291 : 2023-08-04 14:52:27 [CRITICAL]  - 9692
Line number -294 : 2023-08-04 14:52:27 [CRITICAL]  - 17933

#Now the directory files as follows
#if you observe archive directory(LogArchive/ ) and log file has been generated.

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ls -ltr
total 44
-rw-r--r-- 1 root root     0 Aug  4 10:00 day5_solution_practice.sh
-rwxr-xr-x 1 root root  1274 Aug  4 14:51 log_generator.sh
-rw-r--r-- 1 root root 12068 Aug  4 14:52 logfile.log
-rw-r--r-- 1 root root    56 Aug  4 14:55 readme.txt
-rw-r--r-- 1 root root  2705 Aug  4 15:58 Sample_Log_Data.md
-rwxr-xr-x 1 root root  8442 Aug  4 17:59 day5_challenge_solution.sh
drwxr-xr-x 2 root root  4096 Aug  4 18:04 LogArchive
-rw-r--r-- 1 root root  3635 Aug  4 18:04 log_report-2023-08-04-18-04-18.txt

#lets run again

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ./day5_challenge_solution.sh /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log

Provided log file path is: /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log

####################

INFO log_level count is: 72

####################

DEBUG log_level count is: 60

####################

ERROR log_level count is: 61

####################

WARNING log_level count is: 53

####################

CRITICAL log_level count is: 54


printing the 'CRITICAL' log level occurences with their line numbers of logfile.

Line number -2 : 2023-08-04 14:52:26 [CRITICAL]  - 9931
Line number -12 : 2023-08-04 14:52:26 [CRITICAL]  - 18610
Line number -15 : 2023-08-04 14:52:26 [CRITICAL]  - 32604
Line number -17 : 2023-08-04 14:52:26 [CRITICAL]  - 8022
Line number -28 : 2023-08-04 14:52:26 [CRITICAL]  - 6799
Line number -30 : 2023-08-04 14:52:26 [CRITICAL]  - 18552
Line number -32 : 2023-08-04 14:52:26 [CRITICAL]  - 11113
Line number -37 : 2023-08-04 14:52:26 [CRITICAL]  - 19571
Line number -39 : 2023-08-04 14:52:26 [CRITICAL]  - 2854
Line number -40 : 2023-08-04 14:52:26 [CRITICAL]  - 15066
Line number -42 : 2023-08-04 14:52:26 [CRITICAL]  - 28344
Line number -46 : 2023-08-04 14:52:26 [CRITICAL]  - 13775
Line number -47 : 2023-08-04 14:52:26 [CRITICAL]  - 31720
Line number -52 : 2023-08-04 14:52:26 [CRITICAL]  - 8107
Line number -58 : 2023-08-04 14:52:26 [CRITICAL]  - 4078
Line number -61 : 2023-08-04 14:52:26 [CRITICAL]  - 9364
Line number -66 : 2023-08-04 14:52:26 [CRITICAL]  - 22911
Line number -71 : 2023-08-04 14:52:26 [CRITICAL]  - 8673
Line number -74 : 2023-08-04 14:52:26 [CRITICAL]  - 23188
Line number -83 : 2023-08-04 14:52:26 [CRITICAL]  - 29553
Line number -86 : 2023-08-04 14:52:26 [CRITICAL]  - 29900
Line number -98 : 2023-08-04 14:52:26 [CRITICAL]  - 14104
Line number -99 : 2023-08-04 14:52:26 [CRITICAL]  - 31900
Line number -105 : 2023-08-04 14:52:26 [CRITICAL]  - 17537
Line number -106 : 2023-08-04 14:52:26 [CRITICAL]  - 32729
Line number -110 : 2023-08-04 14:52:26 [CRITICAL]  - 22285
Line number -111 : 2023-08-04 14:52:26 [CRITICAL]  - 17009
Line number -120 : 2023-08-04 14:52:26 [CRITICAL]  - 18616
Line number -121 : 2023-08-04 14:52:26 [CRITICAL]  - 31053
Line number -160 : 2023-08-04 14:52:26 [CRITICAL]  - 12532
Line number -161 : 2023-08-04 14:52:26 [CRITICAL]  - 28216
Line number -162 : 2023-08-04 14:52:26 [CRITICAL]  - 31835
Line number -163 : 2023-08-04 14:52:26 [CRITICAL]  - 5721
Line number -174 : 2023-08-04 14:52:26 [CRITICAL]  - 11648
Line number -178 : 2023-08-04 14:52:26 [CRITICAL]  - 8364
Line number -180 : 2023-08-04 14:52:26 [CRITICAL]  - 24481
Line number -186 : 2023-08-04 14:52:26 [CRITICAL]  - 5536
Line number -194 : 2023-08-04 14:52:26 [CRITICAL]  - 6033
Line number -196 : 2023-08-04 14:52:26 [CRITICAL]  - 12167
Line number -206 : 2023-08-04 14:52:26 [CRITICAL]  - 14222
Line number -212 : 2023-08-04 14:52:26 [CRITICAL]  - 10208
Line number -214 : 2023-08-04 14:52:26 [CRITICAL]  - 32682
Line number -220 : 2023-08-04 14:52:26 [CRITICAL]  - 5664
Line number -224 : 2023-08-04 14:52:26 [CRITICAL]  - 2668
Line number -228 : 2023-08-04 14:52:26 [CRITICAL]  - 5712
Line number -238 : 2023-08-04 14:52:26 [CRITICAL]  - 14774
Line number -241 : 2023-08-04 14:52:26 [CRITICAL]  - 5768
Line number -257 : 2023-08-04 14:52:26 [CRITICAL]  - 23214
Line number -264 : 2023-08-04 14:52:27 [CRITICAL]  - 11714
Line number -274 : 2023-08-04 14:52:27 [CRITICAL]  - 5122
Line number -286 : 2023-08-04 14:52:27 [CRITICAL]  - 19055
Line number -287 : 2023-08-04 14:52:27 [CRITICAL]  - 5441
Line number -291 : 2023-08-04 14:52:27 [CRITICAL]  - 9692
Line number -294 : 2023-08-04 14:52:27 [CRITICAL]  - 17933


Printing all the error messages with it's count.

Failed to connect: 11
Disk full: 8
Segmentation fault: 10
Invalid input: 6
Out of memory: 5
File not found: 6
Permission denied: 6
Connection refused: 4
Timeout: 5


Top 5 Error Messages are as follows:
11 - Failed to connect
10 - Segmentation fault
8 - Disk full
6 - Permission denied
6 - Invalid input


Old log file log_report-2023-08-04-18-04-18.txt presents! Moving it to archive directory. !

New log file has been created ( log_report-2023-08-04-18-06-44.txt )


Generating the report....

Report file log_report-2023-08-04-18-06-44.txt has been generated !!!

Showing the Analasys...


                            Log Analasys report

Date of analysis: 2023-08-04-18-06-44
Log file name: /root/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/logfile.log
Total lines processed: 300
Total error count: 61

Top 5 Error Messages are as follows:
11 - Failed to connect
10 - Segmentation fault
8 - Disk full
6 - Permission denied
6 - Invalid input


printing the 'CRITICAL' log level occurences with their line numbers of logfile.

Line number -2 : 2023-08-04 14:52:26 [CRITICAL]  - 9931
Line number -12 : 2023-08-04 14:52:26 [CRITICAL]  - 18610
Line number -15 : 2023-08-04 14:52:26 [CRITICAL]  - 32604
Line number -17 : 2023-08-04 14:52:26 [CRITICAL]  - 8022
Line number -28 : 2023-08-04 14:52:26 [CRITICAL]  - 6799
Line number -30 : 2023-08-04 14:52:26 [CRITICAL]  - 18552
Line number -32 : 2023-08-04 14:52:26 [CRITICAL]  - 11113
Line number -37 : 2023-08-04 14:52:26 [CRITICAL]  - 19571
Line number -39 : 2023-08-04 14:52:26 [CRITICAL]  - 2854
Line number -40 : 2023-08-04 14:52:26 [CRITICAL]  - 15066
Line number -42 : 2023-08-04 14:52:26 [CRITICAL]  - 28344
Line number -46 : 2023-08-04 14:52:26 [CRITICAL]  - 13775
Line number -47 : 2023-08-04 14:52:26 [CRITICAL]  - 31720
Line number -52 : 2023-08-04 14:52:26 [CRITICAL]  - 8107
Line number -58 : 2023-08-04 14:52:26 [CRITICAL]  - 4078
Line number -61 : 2023-08-04 14:52:26 [CRITICAL]  - 9364
Line number -66 : 2023-08-04 14:52:26 [CRITICAL]  - 22911
Line number -71 : 2023-08-04 14:52:26 [CRITICAL]  - 8673
Line number -74 : 2023-08-04 14:52:26 [CRITICAL]  - 23188
Line number -83 : 2023-08-04 14:52:26 [CRITICAL]  - 29553
Line number -86 : 2023-08-04 14:52:26 [CRITICAL]  - 29900
Line number -98 : 2023-08-04 14:52:26 [CRITICAL]  - 14104
Line number -99 : 2023-08-04 14:52:26 [CRITICAL]  - 31900
Line number -105 : 2023-08-04 14:52:26 [CRITICAL]  - 17537
Line number -106 : 2023-08-04 14:52:26 [CRITICAL]  - 32729
Line number -110 : 2023-08-04 14:52:26 [CRITICAL]  - 22285
Line number -111 : 2023-08-04 14:52:26 [CRITICAL]  - 17009
Line number -120 : 2023-08-04 14:52:26 [CRITICAL]  - 18616
Line number -121 : 2023-08-04 14:52:26 [CRITICAL]  - 31053
Line number -160 : 2023-08-04 14:52:26 [CRITICAL]  - 12532
Line number -161 : 2023-08-04 14:52:26 [CRITICAL]  - 28216
Line number -162 : 2023-08-04 14:52:26 [CRITICAL]  - 31835
Line number -163 : 2023-08-04 14:52:26 [CRITICAL]  - 5721
Line number -174 : 2023-08-04 14:52:26 [CRITICAL]  - 11648
Line number -178 : 2023-08-04 14:52:26 [CRITICAL]  - 8364
Line number -180 : 2023-08-04 14:52:26 [CRITICAL]  - 24481
Line number -186 : 2023-08-04 14:52:26 [CRITICAL]  - 5536
Line number -194 : 2023-08-04 14:52:26 [CRITICAL]  - 6033
Line number -196 : 2023-08-04 14:52:26 [CRITICAL]  - 12167
Line number -206 : 2023-08-04 14:52:26 [CRITICAL]  - 14222
Line number -212 : 2023-08-04 14:52:26 [CRITICAL]  - 10208
Line number -214 : 2023-08-04 14:52:26 [CRITICAL]  - 32682
Line number -220 : 2023-08-04 14:52:26 [CRITICAL]  - 5664
Line number -224 : 2023-08-04 14:52:26 [CRITICAL]  - 2668
Line number -228 : 2023-08-04 14:52:26 [CRITICAL]  - 5712
Line number -238 : 2023-08-04 14:52:26 [CRITICAL]  - 14774
Line number -241 : 2023-08-04 14:52:26 [CRITICAL]  - 5768
Line number -257 : 2023-08-04 14:52:26 [CRITICAL]  - 23214
Line number -264 : 2023-08-04 14:52:27 [CRITICAL]  - 11714
Line number -274 : 2023-08-04 14:52:27 [CRITICAL]  - 5122
Line number -286 : 2023-08-04 14:52:27 [CRITICAL]  - 19055
Line number -287 : 2023-08-04 14:52:27 [CRITICAL]  - 5441
Line number -291 : 2023-08-04 14:52:27 [CRITICAL]  - 9692
Line number -294 : 2023-08-04 14:52:27 [CRITICAL]  - 17933

#now if you see below new log generated and old file has moved to archive directory

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ls -ltr
total 44
-rw-r--r-- 1 root root     0 Aug  4 10:00 day5_solution_practice.sh
-rwxr-xr-x 1 root root  1274 Aug  4 14:51 log_generator.sh
-rw-r--r-- 1 root root 12068 Aug  4 14:52 logfile.log
-rw-r--r-- 1 root root    56 Aug  4 14:55 readme.txt
-rw-r--r-- 1 root root  2705 Aug  4 15:58 Sample_Log_Data.md
-rwxr-xr-x 1 root root  8442 Aug  4 17:59 day5_challenge_solution.sh
drwxr-xr-x 2 root root  4096 Aug  4 18:06 LogArchive
-rw-r--r-- 1 root root  3635 Aug  4 18:06 log_report-2023-08-04-18-06-44.txt


#validate in archive directory

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# ls -ltr
total 44
-rw-r--r-- 1 root root     0 Aug  4 10:00 day5_solution_practice.sh
-rwxr-xr-x 1 root root  1274 Aug  4 14:51 log_generator.sh
-rw-r--r-- 1 root root 12068 Aug  4 14:52 logfile.log
-rw-r--r-- 1 root root    56 Aug  4 14:55 readme.txt
-rw-r--r-- 1 root root  2705 Aug  4 15:58 Sample_Log_Data.md
-rwxr-xr-x 1 root root  8442 Aug  4 17:59 day5_challenge_solution.sh
drwxr-xr-x 2 root root  4096 Aug  4 18:06 LogArchive
-rw-r--r-- 1 root root  3635 Aug  4 18:06 log_report-2023-08-04-18-06-44.txt
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5# cd LogArchive/
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_5/LogArchive# ls -ltr
total 4
-rw-r--r-- 1 root root 3635 Aug  4 18:04 log_report-2023-08-04-18-04-18.txt

```


