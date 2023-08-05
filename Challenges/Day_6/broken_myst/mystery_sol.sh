#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# Function to perform mysterious transformations
mysterious_function() {
    local input_file="$1"
    local output_file="$2"

    # Step 1: Apply a Caesar cipher-like transformation (rotate letters by 13 positions)
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # Step 2: Reverse the content of the output file
    rev "$output_file" > "reversed_temp.txt"

    # Step 3: Generate a random number between 1 and 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Mystery loop: Repeat the following steps 'random_number' times
    for (( i=0; i<$random_number; i++ )); do
        # Step 4: Reverse the content of 'reversed_temp.txt'
        rev "reversed_temp.txt" > "temp_rev.txt"

        # Step 5: Apply the same Caesar cipher-like transformation on the reversed content
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # Step 6: Replace 'reversed_temp.txt' with the newly encrypted content
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # Step 7: Reverse the final content and save it to the output file
    rev "reversed_temp.txt" > "$output_file"

    # Step 8: Clean up remaining temporary files
    rm "reversed_temp.txt"

    # The mystery concludes!
}

# Main Script Execution

echo "Welcome to the Mysterious Script Challenge!"
echo "Please provide an input file and an output file."

# Ask for input and output file paths
read -p "Enter the input file path: " input_file
read -p "Enter the output file path: " output_file

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
