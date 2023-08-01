#!/bin/bash

# First line of the script is the shebang which tells the system how to execute

# Task  2: Echo
echo "Scripting is fun with @TWS"

# Task  3: Variables
variable1="Hello"
variable2="Bash"

# Task  4: Using Variables
greeting="$variable1, $variable2!"
echo "$greeting Welcome to the world of Bash scripting!"

# Task  5: Using Built-in Variables
echo "My current bash path - $BASH"
echo "Bash version I am using - $BASH_VERSION"
echo "PID of bash I am running - $$"
echo "My home directory - $HOME"
echo "Where am I currently? - $PWD"
echo "My hostname - $HOSTNAME"

# Task  6: Wildcards
echo "Files with .txt extension in the current directory:"
ls *.txt



#Make sure to provide execution permission with the following command:
#chmod +x day1_script.sh
