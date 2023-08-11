## **🌟 Introduction**

Welcome back to Day 5 of BashBlazeChallenge! In this blog, we will create a Bash script that will act as a log analyzer and generate a report. As sysadmins, we come across many situations where we need to analyze log files, identify specific events, and generate a summary report. This log analyzer created using bash will help us in automating the process of analysis. So let's get started!

## **📜 Script Features and Implementation**

1. Input: The script should take the path to the log file as a command-line argument as shown below.

```
    ./log_analyzer.sh /path/to/log_file

```

2. Error Count: The script should analyze the log file and count the number of error messages that can be identified by a specific keyword (e.g., "ERROR" or "Failed"). It is expected that we print the total error count. Let's implement this feature using the script below:

```
   #!/bin/bash

# Function is used to count the number of error messages
function count_error_msgs() {
    file_name="$1"
    # Checks whether the file exists 
    if [ -f "$file_name" ]; then
        # Use grep to match the entered text with the text in file
        # -c is used to count the matched text
        # -i stands to make the match case insensitive 
        error_count=$(grep -c -i "ERROR" "$file_name")
        echo "Total number of error messages in file $file_name: $error_count"
    else
        echo "Error: File does not exist!"
        exit 1
    fi
}

count_error_msgs "$1"
```
   
3. Critical Events: Search for lines containing the keyword "CRITICAL" and print those lines along with the line number.

```
function print_critical_lines() {
    file_name="$1"
    echo
    echo "The CRITICAL lines along with their line numbers are as follows: "
    echo
    if [ -f "$file_name" ]; then
        # -n in grep command returns the number of lines matching the given text
        # The mapfile command reads lines of input into an array variable
        # -t is used to remove the unwanted newline trailing characters
        mapfile -t critical_events < <(grep -n -i "CRITICAL" "$file_name")
        for i in "${critical_events[@]}"; do
            echo "$i"
        done
    else
        echo "Error: File not found..."
        exit 1
    fi
}

print_critical_lines "$1"
```

4. Top Error Messages: Now the script should identify the top 5 most common error messages and display them along with their occurrence count. Let's do it.

```
function display_top_error_messages() {
    file_name="$1"

    if [ -f "$file_name" ]; then
        declare -A error_msgs
        while IFS= read -r line; do
            error_msg=$(awk '{printf $4}' <<< "$line")
            ((error_msgs["$error_msg"]++))
        done < <(grep -i "ERROR" $file_name)
        echo
        echo "The top 5 error messages are: "
        echo 
        for msgs in "${!error_msgs[@]}"; do
            echo "${error_msgs[$msgs]} $msgs"
        done | sort -rn | head -n 5
    else
        echo "Error: File not found..."
    fi
}

display_top_error_messages "$1"
```

5.Summary Report: Now, that we have completed all the above functions, we need to generate a summary report in a separate text file. The report should include:

* Date of analysis

* Log file name

* Total lines processed

* Total error count

* Top 5 error messages with their occurrence count

* List of critical events with line numbers

```
#Main script
summary_report="summary-report-$(date).txt"
{
    echo -e "\n=========================Summary=============================="
    echo -e "\nDate of Analysis: $(date)"
    echo -e "\n--------------------------------------------------------------"
    echo -e "\nLog File Name: $1"
    echo -e "\n--------------------------------------------------------------"
    echo -e "\nTotal Lines Processed: $(wc -l < "$1")"
    echo -e "\n--------------------------------------------------------------"
    count_error_msgs "$1"
    echo -e "\n--------------------------------------------------------------"
    display_top_error_messages "$1"
    echo -e "\n--------------------------------------------------------------"
    print_critical_lines "$1"
    echo -e "\n--------------------------------------------------------------"
} > "$summary_report"
```

## **✅Fully Functional Script!**

```
#!/bin/bash

# Function is used to count the number of error messages
function count_error_msgs() {

    file_name="$1"
    # Checks whether the file exists 
    if [ -f "$file_name" ]; then
        # Use grep to match the entered text with the text in file
        # -c is used to count the matched text
        # -i stands to make the match case insensitive 
        error_count=$(grep -c -i "ERROR" "$file_name")
        echo -e "\nTotal number of error messages in file $file_name: $error_count"
    else
        echo -e "\nError: File does not exist!"
        exit 1
    fi
}

function print_critical_lines() {
    file_name="$1"
    echo
    echo -e "\nThe CRITICAL lines along with their line numbers are as follows: "
    echo
    if [ -f "$file_name" ]; then
        mapfile -t critical_events < <(grep -n -i "CRITICAL" "$file_name")
        for i in "${critical_events[@]}"; do
            echo "$i"
        done
    else
        echo -e "\nError: File not found..."
        exit 1
    fi
}

function display_top_error_messages() {
    file_name="$1"

    if [ -f "$file_name" ]; then
        declare -A error_msgs
        while IFS= read -r line; do
            error_msg=$(awk '{printf $4}' <<< "$line")
            ((error_msgs["$error_msg"]++))
        done < <(grep -i "ERROR" $file_name)
        echo
        echo -e "The top 5 error messages are: "
        echo 
        for msgs in "${!error_msgs[@]}"; do
                echo "${error_msgs[$msgs]} $msgs"
        done | sort -rn | head -n 5
    else
        echo "Error: File not found..."
    fi
}

#Main Script
if [ "$#" -eq 0 ]; then
    echo "Usage $0: Pass the log file as an argument you want to analyze!"
    exit 1
fi

summary_report="summary-report-$(date).txt"
{
    echo -e "\n=========================Summary=============================="
    echo -e "\nDate of Analysis: $(date)"
    echo -e "\n--------------------------------------------------------------"
    echo -e "\nLog File Name: $1"
    echo -e "\n--------------------------------------------------------------"
    echo -e "\nTotal Lines Processed: $(wc -l < "$1")"
    echo -e "\n--------------------------------------------------------------"
    count_error_msgs "$1" 
    echo -e "\n--------------------------------------------------------------"
    display_top_error_messages "$1"
    echo -e "\n--------------------------------------------------------------"
    print_critical_lines "$1"
    echo -e "\n--------------------------------------------------------------"
} > "$summary_report"

mv "$1" analyzed_files
```

Instructions:

1. Create a file named log_analyzer.sh using: `touch log_analyzer.sh`

2. After this, add the above content to this log_analyzer.sh

3. Make the file executable using: `chmod +x log_analyzer.sh`

4. Then execute the script by passing a log file name as an argument.

`./log_analyzer.sh sample_log.log`

## **📊Resulting Output📋**

After execution of the above script, a report is generated.

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/69bde84d-74c7-4fc2-9350-094ec1234cbc)

The report looks something like this:

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/5722762e-1838-4e39-88eb-1291899a8551)

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/2862bf36-ef24-496d-9d9e-7c2bb3500938)

## **📝Conclusion✨**

In this way, we successfully created a bash script that analyzed the respective log file and also generated a summary report for the analysis. This tool will definitely help the DevOps Engineers and System Administrators for Log Analysis and Report Generation.

Hope you found this blog helpful and informative! 🌟

Keep learning and keep exploring! 🚀

