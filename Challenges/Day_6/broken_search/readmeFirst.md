# Recursive Directory Search Challenge

## Description

The "Recursive Directory Search" challenge is part of the day-6. In this challenge, participants are tasked with creating a Bash script that performs a recursive search for a specific file within a given directory and its subdirectories. The script provided for this challenge is not functioning correctly, and participants must fix and improve it to achieve the desired behavior.

## Challenge Details

**Objective:** Your goal is to fix the provided Bash script, `recursive_search.sh`, and ensure it performs the recursive search as described below:

- The script should take two command-line arguments: the directory to start the search and the target file name to find.
- The search should be recursive, meaning it should look for the target file not only in the specified directory but also in all its subdirectories and their subdirectories, and so on.
- When the target file is found, the script should print the absolute path of the file and then exit.
- Proper error handling should be in place to handle cases where the directory does not exist or the target file is not found.

**Provided Files:**

1. `recursive_search.sh`: The main script file that requires fixing and improvement.

**Example Usage:**

```bash
./recursive_search.sh test_files target.txt
```

If the target file `target.txt` exists within any of the subdirectories of `test_files`, the script should print the absolute path of the file. Otherwise, it should print "File not found: target.txt".

**Note:** Ensure your script handles errors gracefully and provides informative messages to the user.

## Tips

- Take your time to understand the existing code before making changes.
- Make use of appropriate Bash commands and control structures to achieve the recursive search.
- Test your script thoroughly with different scenarios to ensure its correctness.

Happy scripting!
