## ** Introduction: **

Bash scripting is a powerful and versatile skill that allows you to automate tasks and perform complex operations using the command-line interface of a Unix-based operating system, such as Linux or macOS. Bash which stands for "Bourne Again Shell" is the default shell for many Unix-like systems and serves as a command interpreter for executing commands and scripts.

Today we are going to cover the basics of Bash scripting. By the end of this challenge, we will be able to improve our understanding of bash scripting and will be able to create a bash script for the respective requirements. So, let's begin!

## ** Task 1: Comments **

In bash scripts, comments are the non-executed part of the script. They provide useful information or explanations about the code. They play an important role in making the script more understandable not only for the author but also for the developers who might need to work with the script.

Single-line comments: Single-line comments begin with (#) and extend till the end of the line. A line beginning with the # symbol will be completely ignored by the compiler. For example: 

```plaintext
#!/bin/bash

# Task 1: Comments
# This is a single-line comment
echo "Hello World!"

```

Multi-line comments: There are multiple ways through which you can mention multiple comments in a bash script. One such method is to use (:'). For example:

```plaintext
#!/bin/bash
: '
This is a multi-line comment block.
You can add as many lines as you want.
The code below will not be executed:

echo "This line will not be executed."
'
echo "Hello World!"
```

## ** Task 2: Echo **

In bash, an `echo` command is a command used to output or display messages on the terminal. It is one of the most commonly used commands in bash script. Now let's create a bash script to print a message using `echo` command.

```plaintext
#!/bin/bash

# Task 2: Echo
# In this task, we will use the 'echo' to display a message.
echo "Let's explore the world of bash scripting!"
```

## ** Task 3: Variables **

In bash, variables are used to store data and values that can be referenced and manipulated throughout the script. They are a fundamental part of shell scripting and allow you to store temporary or permanent data. In this task, we will create a bash script that declares variables and assigns value to them. Here's how you declare and use variables in bash:

```plaintext
#!/bin/bash

# Task 3: Variables
# Remember to avaoid space between the '=' and variable
name="Tony Stark"
book="Think and Grow Rich"

echo "My name is $name"
echo "And my favourite book is $book"
```

## ** Task 4: Using Variables **

In the previous task, we declared the variables. In this task, we will now make use of them to perform the given task. So we'll simply create two variables of type number and then print their sum.

```plaintext
#!/bin/bash

# Task 4: Using Variables
# In this task we will perform the addition of two numbers 

# Take the input for the variables from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Calculate the sum of two numbers
result=$((num1 + num2))

# Display the result
echo "The sum of two given numbers is: $result"
```

## ** Task 5: Using Built-in Variables **

Built-in variables are the special variables whose values are defined and maintained by the bash or the operating system. These variables are predefined and have specific names that are recognized by the shell. In this task, we will create a bash script that utilizes at least three different built-in variables to display relevant information.

```plaintext
#!/bin/bash

# Task 5: Built-in Variables
# In this task we will be utilizing built-in variables

# $HOME represents the home directory of the current user
echo "Your home directory is: $HOME"

# $USER holds the username of the current user
echo "Your username is: $USER"

# $PWD represents the present working directory
echo "You are currently in: $PWD"

# $HOSTNAME represents the current name of the host/machine
echo "Host name: $HOSTNAME"

# $OSTYPE defines the operating system type 
echo "Operating system type: $OSTYPE"
```

## ** Task 6: Wildcards **

Wildcards are special characters used to represent and match one or more filenames or paths. They are powerful tools that allow you to perform operations on multiple files or directories at once. In this task, we will create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

```plaintext
#!/bin/bash

# Task 6: Wildcards
# In this task, we will use wildcards to list files 

# Define the target directory
target_directory="/home/devops/"

# List all files with a specific extension in the target directory
echo "Files with the '.txt' extension:"
ls "$target_directory"/*.txt
```


