#!/bin/bash
#Author: Yashraj Jaiswal
# Date: 05/08/2023
# Description: #TWSBashBlazeChallenge Day-5
# Task : create a log analyzer script

function error_count(){
    egrep -i -c "ERROR|faliure" $1
}

function critical_events(){
    filename="your_file.txt"
    pattern="CRITICAL"
    line_number=1
    while IFS= read -r line; do
        if [[ $line == *"$pattern"* ]]; then
            echo "Line $line_number: $line"
        fi
        ((line_number++))
    done < "$1"
}

function top5_error_message(){
    egrep -i "ERROR|faliure" "$1" | sort | rev | cut -d ' ' -f 3- | rev | uniq -c | sort -r  | head -5
}

function generate_summary(){
    echo "Date of analysis      : $(date +"%D")"
    echo "Log file name         : $1"
    echo "Total line processed  : $(wc -l $1 | awk '{print $1}')"
    echo "Total error count     : $(error_count $1)"
    echo
    echo
    echo "Top 5 error messages:"
    echo
    top5_error_message "$1"
    echo
    echo
    echo "List of critical events with line number : "
    echo
    critical_events "$1"
}

function main(){
    # check if the user has passed any file in command line
    if (( $# == 0 )); then
        echo "Info  : this script analyzes a log file and creates a summary out of it."
        echo "Usage : $0 path-to-file."
        exit 1
    fi
    # check if the given file is empty or not.
    if [ ! -s "$1" ]; then
        echo "$1 file is empty"
        exit 1
    fi
    local log_summary_file="log_summary_$(date +"%Y_%m_%d").txt"
    touch "$log_summary_file"
    generate_summary "$1" > "$log_summary_file"
    sudo mv "./$log_summary_file" /var/log
    echo "Summary report generated: /var/log/$log_summary_file"
}

main "$1"