#!/bin/bash

# The Mysterious Script - Solution

# This script takes an input file, applies a series of mysterious transformations, and saves the result in an output file.

# Function to Decrypt and Reverse Content
mysterious_function() {
    local input_file="$1"
    local output_file="$2"

    # Step 1: Decrypt the input file (ROT13 decryption)
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # Step 2: Reverse the content of the output file
    rev "$output_file" > "reversed_temp.txt"

    # Step 3: Generate a random number between 1 and 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Step 4: Mystery loop - Reverse and Encrypt the content multiple times
    for (( i=0; i<$random_number; i++ )); do
        # Reverse the output file again
        rev "reversed_temp.txt" > "temp_rev.txt"

        # Encrypt the reversed content (ROT13 encryption)
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # Swap the temporary files
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Step 5: Clean up temporary files
    rm "temp_rev.txt"

    # The script does not perform any harmful actions. It is designed to challenge participants' scripting skills and creativity.
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

# Display the completion message
echo "The mysterious process is complete. Check the '$output_file' for the result!"
