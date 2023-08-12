## **🌟Introduction**

Hey DevOps Enthusiasts, welcome back to our new blog. In this blog, you will encounter a mysterious Bash script named mystery.sh. The script lacks documentation and comments, leaving its purpose and functionality shrouded in mystery. The mission of this task is to unravel the secrets of this script, understand its objective, and improve it by adding comments and explanations. Let's dive in and try to understand and analyze the script!

## **📢 Mysterious Bash Script for the Challenge**

https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/blob/main/Challenges/Day_6/broken_myst/brokenday.md

## **🔍Run the Script🏃‍♂️**

On executing the script, it displays the message below and updates the 'output_file' and the 'reversed_temp.txt'.

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/7a6d1886-4534-4487-a224-f392eba6e493)

## **🎯 Objective**

The main objective of this task is to understand the `mystery.sh` file and accordingly add the comments and understandings. So, without wasting more time...let's get started!

## **🔍 Debugging and Decoding the Script 📜**

On Debugging the code, we understood that there are no potential errors or bugs in the script. The script runs without any errors.

The script begins with a shebang (#!/bin/bash) to specify the interpreter to be used (Bash in this case).

Let's analyze the mysterious_function().

* The function takes two files as input parameters and stores the values in the variable input_file and output_file.

* Encoding is performed on the input file where the characters in the file are rotated by 13 positions.

* The content ofoutput_file is then reversed and stored in a file named reversed_temp.txt

* A random number between 1 and 10 is generated and then the loop is executed random_number of times.

* The loop is initiated by reversing the content of reversed_temp.txt and stored in temp_rev.txt

* Again ROT13 algorithm is used to shift the characters by 13 positions.

* Then the content of temp_rev.txt is moved to reversed_temp.txt

* After exiting the loop, the temporary file temp_rev.txt is removed.

Now considering the Main Script

* While executing the script, two arguments containing the input and output files must be passed along with the shell script. If the number of arguments is not equal to 2 then the code exits by passing a meaningful message.

* The first parameter must be an input file or the file you want to operate.

* The second parameter is the output file which stores the result of the operation.

* The script also checks the existence of an input file. If it doesn't exist then the script execution stops and it exits with a meaningful message.

* If everything goes well, it then calls the function mysterious_function.

## **📜 The Mysterious Bash Script**

Let's add our understanding to the given script by adding the comments and explanations as follows:

```
#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    # Considering 2 parameters for the function and assigning the values to local variables
    local input_file="$1"
    local output_file="$2"
    
    # 'tr' is used to translate, delete, or squeeze characters from standard input or a file.
    # tr 'A-Za-z' 'N-ZA-Mn-za-m' translates the range of characters from A-Z to N-Z and A-M and a-z to n-z and a-m
    # In short, command below rotates the characters by 13 positions from the input file and then adds the result to the output file
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # rev command is used to reverse the text it is passed 
    # Here, the content of the output_file is reversed and saved to reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"

    # RANDOM is a built-in variable in Bash that generates a random integer between 0 and 32,767 each time it's accessed.
    # The randomly created number is operated by mod to get the unit digit and hence the range of value will be from 0 to 9
    # The number is then added to 1 which gives the range of random_number 
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Mystery loop: Reverses the content of the "reversed_temp.txt" file
    # The loop runs for 'random_number' of times. 
    for (( i=0; i<$random_number; i++ )); do
        # The reversed output of 'reversed_temp.txt' is stored in file 'temp_rev.txt'
        rev "reversed_temp.txt" > "temp_rev.txt"

        # Rotation of characters by 13 positions is performed on file 'temp_rev.txt' to store the content in 'temp_enc.txt'
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # Overwriting the file 'reversed_temp.txt' by newly encoded content
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
```

## **🚀 Optimizing the Code: Enhancing Efficiency 🛠**

Since we are making use of a loop in the file mystery.sh it is not efficient. In order to make it more efficient we tried optimizing it by replacing the loop with the if condition as shown in the code below:

```
#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    # Considering 2 parameters for the function and assigning the values to local variables
    local input_file="$1"
    local output_file="$2"
    
    # 'tr' is used to translate, delete, or squeeze characters from standard input or a file.
    # tr 'A-Za-z' 'N-ZA-Mn-za-m' translates the range of characters from A-Z to N-Z and A-M and a-z to n-z and a-m
    # In short, command below rotates the characters by 13 positions from the input file and then adds the result to the output file
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # rev command is used to reverse the text it is passed 
    # Here, the content of the output_file is reversed and saved to reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"

    # RANDOM is a built-in variable in Bash that generates a random integer between 0 and 32,767 each time it's accessed.
    # The randomly created number is operated by mod to get the unit digit and hence the range of value will be from 0 to 9
    # The number is then added to 1 which gives the range of random_number 
    random_number=$(( ( RANDOM % 10 ) + 1 ))
    echo "$random_number"

    # We just replace the loop with if condition to optimize the code.
    if [ $((random_number%2)) != 0 ]; then
        # If a random_number is odd then the reversed_temp.txt will have the same content as that of input_file
        cat "$input_file" > "reversed_temp.txt"
    else
        # If a random number is even then 
        # First, reverse the content of input_file and store it in temporary file 'temp.txt'
        rev "$input_file" > "temp.txt"
        # And then implement ROT13 algorithm on the temporary file to store it content in reversed_temp.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp.txt" > "reversed_temp.txt"
    fi   

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
```

## **Since we are making use of a loop in the file mystery.sh it is not efficient. In order to make it more efficient we tried optimizing it by replacing the loop with the if condition as shown in the code below:

#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    # Considering 2 parameters for the function and assigning the values to local variables
    local input_file="$1"
    local output_file="$2"
    
    # 'tr' is used to translate, delete, or squeeze characters from standard input or a file.
    # tr 'A-Za-z' 'N-ZA-Mn-za-m' translates the range of characters from A-Z to N-Z and A-M and a-z to n-z and a-m
    # In short, command below rotates the characters by 13 positions from the input file and then adds the result to the output file
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # rev command is used to reverse the text it is passed 
    # Here, the content of the output_file is reversed and saved to reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"

    # RANDOM is a built-in variable in Bash that generates a random integer between 0 and 32,767 each time it's accessed.
    # The randomly created number is operated by mod to get the unit digit and hence the range of value will be from 0 to 9
    # The number is then added to 1 which gives the range of random_number 
    random_number=$(( ( RANDOM % 10 ) + 1 ))
    echo "$random_number"

    # We just replace the loop with if condition to optimize the code.
    if [ $((random_number%2)) != 0 ]; then
        # If a random_number is odd then the reversed_temp.txt will have the same content as that of input_file
        cat "$input_file" > "reversed_temp.txt"
    else
        # If a random number is even then 
        # First, reverse the content of input_file and store it in temporary file 'temp.txt'
        rev "$input_file" > "temp.txt"
        # And then implement ROT13 algorithm on the temporary file to store it content in reversed_temp.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp.txt" > "reversed_temp.txt"
    fi   

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"

🎉 Conclusion**

Since we are making use of a loop in the file mystery.sh it is not efficient. In order to make it more efficient we tried optimizing it by replacing the loop with the if condition as shown in the code below:

#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    # Considering 2 parameters for the function and assigning the values to local variables
    local input_file="$1"
    local output_file="$2"
    
    # 'tr' is used to translate, delete, or squeeze characters from standard input or a file.
    # tr 'A-Za-z' 'N-ZA-Mn-za-m' translates the range of characters from A-Z to N-Z and A-M and a-z to n-z and a-m
    # In short, command below rotates the characters by 13 positions from the input file and then adds the result to the output file
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # rev command is used to reverse the text it is passed 
    # Here, the content of the output_file is reversed and saved to reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"

    # RANDOM is a built-in variable in Bash that generates a random integer between 0 and 32,767 each time it's accessed.
    # The randomly created number is operated by mod to get the unit digit and hence the range of value will be from 0 to 9
    # The number is then added to 1 which gives the range of random_number 
    random_number=$(( ( RANDOM % 10 ) + 1 ))
    echo "$random_number"

    # We just replace the loop with if condition to optimize the code.
    if [ $((random_number%2)) != 0 ]; then
        # If a random_number is odd then the reversed_temp.txt will have the same content as that of input_file
        cat "$input_file" > "reversed_temp.txt"
    else
        # If a random number is even then 
        # First, reverse the content of input_file and store it in temporary file 'temp.txt'
        rev "$input_file" > "temp.txt"
        # And then implement ROT13 algorithm on the temporary file to store it content in reversed_temp.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp.txt" > "reversed_temp.txt"
    fi   

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"

🎉 Conclusion

Congratulations! We have added all the required comments and explanations to the script wherever necessary. We also tried optimizing the code and tried to make it more efficient by removing the loop.

Hope you enjoyed this blog and learned something new! 📚✨

Keep learning and Happy Scripting! 🚀🖥
