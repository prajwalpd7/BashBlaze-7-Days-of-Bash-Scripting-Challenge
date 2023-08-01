# Day 2 Bash Scripting Challenge - Interactive File and Directory Explorer

Welcome to Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that serves as an interactive file and directory explorer. The script will allow you to explore the files and directories in the current path and provide a character counting feature for the user's input.

## Challenge Description

The script will have two main parts:

### Part 1: File and Directory Exploration

1. Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
2. For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the `ls` command with appropriate options.
3. The list of files and directories will be displayed in a loop until the user decides to exit the explorer.

### Part 2: Character Counting

1. After displaying the file and directory list, the script will prompt the user to enter a line of text.
2. The script will read the user's input until an empty string is entered (i.e., the user presses Enter without any text).
3. For each line of text entered by the user, the script will count the number of characters in that line.
4. The character count for each line entered by the user will be displayed.

## Example Interaction

```
$ ./explorer.sh
Welcome to the Interactive File and Directory Explorer!

Files and Directories in the Current Path:
- file1.txt (100 KB)
- dir1 (2 MB)
- script.sh (3 KB)
...

Enter a line of text (Press Enter without text to exit): Hello, this is a sample line.
Character Count: 27

Enter a line of text (Press Enter without text to exit): Another line to count.
Character Count: 25

Enter a line of text (Press Enter without text to exit):
Exiting the Interactive Explorer. Goodbye!
```

## Submission Instructions

1. Create a bash script named `explorer.sh` that implements the Interactive File and Directory Explorer as described in the challenge.
2. Add comments in the script to explain the purpose and logic of each part.
3. Submit your entry by pushing the script to your GitHub repository.

Congratulations! You've completed Day 2 of the Bash Scripting Challenge. The challenge focuses on Command-Line Argument Parsing and Loops to build an interactive script that explores files, directories, and performs character counting. Happy scripting and exploring!
