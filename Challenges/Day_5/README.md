# DAY 5 Submission: Log Analyzer and Report Generator
As part of day 5 of #TWSBashBlazeChallenge, I had to create a script that analyzes logs and creates a summary report. 
## Tasks:
1. Input: The script should take the path to the log file as a command-line argument.
2. Error Count: Analyze the log file and count the number of error messages. An error message can be identified by a specific keyword (e.g., "ERROR" or "Failed"). Print the total error count.
3. Critical Events: Search for lines containing the keyword "CRITICAL" and print those lines along with the line number.
4. Top Error Messages: Identify the top 5 most common error messages and display them along with their occurrence count.
5. Summary Report: Generate a summary report in a separate text file. The report should include:
  - Date of analysis
  - Log file name
  - Total lines processed
  - Total error count
  - Top 5 error messages with their occurrence count
  - List of critical events with line numbers
6. Optional Enhancement: Add a feature to automatically archive or move processed log files to a designated directory after analysis.

## Sample Logs Generator
To test the `log_analyzer.sh` script, We were provided with the `log_generator.sh` script which can generate sample logs for testing. It takes in the name of the sample log file that will be generated and the number of lines of sample logs needed. In the below picture, I have created a sample.log file containing 200 lines of logs
![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/d679a422-cf5d-482c-baf5-e1c4e6fa51c9)

## Logs Analyzer and Report Generator
```Usage: ./log_analyzer.sh <path to log file>```
Upon running the script with the sample.log file we created above, two things will happen:
1. A summary report text file will be generated under the `./summaryReport` folder
2. The log file will be archived in the `./archived_logs ` folder

![image](https://github.com/kunal-gohrani/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/47574597/999b8bb0-5cc9-4efd-8331-658a6985519e)
### Summary Report
After the script is run, a summary report of the given log file is created under the `./summaryReport` folder and the report will look like this:
```
---- BEGIN ----
Log File Path: sample.log
Date: Fri Aug  4 18:34:34 UTC 2023
Total Lines Processed: 200 sample.log
Total Error Count: 28
Top 5 Messages With Their Occurence Count:
     16 2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
     15 2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
     14 2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
      9 2023-08-04 18:29:27 [ERROR] Failed to connect
      8 2023-08-04 18:29:27 [ERROR] Out of memory,
Critical Events Found:
8:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
9:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
12:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
23:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
25:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
27:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
32:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
49:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
52:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
61:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
67:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
70:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
75:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
80:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
81:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
82:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
84:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
88:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
90:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
93:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
94:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
95:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
99:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
100:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
101:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
106:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
110:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
112:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
115:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
117:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
118:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
123:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
125:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
126:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
133:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
141:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
142:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
146:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
152:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
153:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
173:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
174:2023-08-04 18:29:27 [CRITICAL] Failed to connect to AWS service,
178:2023-08-04 18:29:27 [CRITICAL] Could not generate JWT Token
180:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
189:2023-08-04 18:29:27 [CRITICAL] Server Restarted - Out of Memory,
---- END ----
```




