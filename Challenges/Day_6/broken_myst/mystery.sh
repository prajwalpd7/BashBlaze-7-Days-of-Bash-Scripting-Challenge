#!/bin/bash
# Date: 06/08/2023
# Description: #TWSBashBlazeChallenge Day-6
# Task, part -1 : Analyzing the Mysterious Function

mysterious_function() {
    local input_file="$1"  # Store the input file path
    local output_file="$2" # Store the output file path
    # Step 1: Apply a ROT13-like cipher to input_file and save the result in output_file
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"
    # Step 2: Reverse the text from output_file and save it in reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"
    # Step 3: Generate a random number between 1 and 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))
    # Repeat the following block of operations random_number times
    for (( i=0; i<$random_number; i++ )); do
        # Step 4: Reverse the text from reversed_temp.txt and save it in temp_rev.txt
        rev "reversed_temp.txt" > "temp_rev.txt"
        # Step 5: Apply the same ROT13-like cipher to temp_rev.txt and save it in temp_enc.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"
        # Step 6: Replace reversed_temp.txt with temp_enc.txt
        mv "temp_enc.txt" "reversed_temp.txt"
    done
    # Clean up: Remove the temporary file temp_rev.txt
    rm "temp_rev.txt"
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"  # Store the input file path
output_file="$2" # Store the output file path

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"