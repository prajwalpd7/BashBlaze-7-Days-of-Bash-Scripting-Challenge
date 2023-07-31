#!bin/bash

# The first line is called shebang. It tells the system which interpreter to use.

#printing to console using "echo"

echo "Hello Namaste!!"

#creating variables and storing values in them.

name="Bheeshma"
age=21
script="bash"

#Using the variables.

echo "Hi community my name is $name and I will be $(($age + 1)) next year. Currently I am writing $script. "

#There are built-in variables or environment variables that can be used in script. These values are set at system level.

echo "My current working directory is $PWD"

user=$USER

echo "The current user is $user"

#wildcards for pattern matching

echo "The files that are having .sh extension in current directors are"
ls *.sh
