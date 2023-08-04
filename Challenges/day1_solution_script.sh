#!/bin/bash 

#Task1: Comment

#First line tells the system which interpreter to use to execute shell script in this case bash shell interpreter.

#Task2: echo command

echo -e "welcome to bash scripting\n" 

#Task3: Variables

variable1="Hello"
variable2="Learners"

#Task4: use variables

message="$variable1 $variable2"

echo -e "$message, Welcome to bash scripting\n"

#Task5: Built-in variables

echo -e "hostname = $HOSTNAME\n"

echo -e "bash = $BASH\n"

echo -e "OS = $OS\n"

echo -e "pid = $$\n"

#Task6: wildcard

echo "list txt files: `ls *.txt` "

#end of script
