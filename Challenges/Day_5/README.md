
# Log Analyzer & Report Generator

This Bash script automates the process of analyzing log files and generates a daily summary report. It helps you quickly identify errors, critical events, and top error messages within your log files, providing valuable insights for troubleshooting and analysis.

## Features

- **Error Count:** Counts and displays the total number of error occurrences in the log file.
- **Critical Events:** Highlights lines containing the keyword "CRITICAL" along with their line numbers.
- **Top Error Messages:** Lists the five most common error messages and their occurrence counts.
- **Summary Report:** Generates a comprehensive summary report that includes key metrics for easy reference.
- **Optional Archiving:** Offers the choice to archive or move log files to a designated directory after analysis.

## Usage

1. Ensure you have a Bash shell environment.
2. Run the script using the following command:
  
   
 ```bash
  ./log_analyzer.sh <path_to_log_file>
```
   
  
- Replace <path_to_log_file> with the path to the log file you want to analyze.

- Follow the prompts to make your choices.

# Summary Report

The script generates a detailed summary report in a separate text file named summary_report.txt in the same directory as the script. The report contains:

- Date of analysis
- Log file name
- Total lines processed
- Total error count
- Top 5 error messages with occurrence count
- List of critical events with line numbers

# Archive Log File

After analysis, you have the option to archive the log file for future reference. If you choose to archive, you will be asked to provide a destination directory.

# Important Notes

- Ensure that the log file exists before running the script.
- You might need to grant execution permissions (chmod +x log_analyzer.sh).

