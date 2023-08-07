#!/bin/bash

# The Mysterious Function
mysterious_function() {
	#make a input file and write a sentence in it
    local input_file="$1"
	#make a output file
    local output_file="$2"
    
    # replacing a-l alphabets with n-z and vice versa
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # reverse the order of the sentence
    rev "$output_file" > "reversed_temp.txt"

    # assign any random number between 1 to 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Mystery loop: 
    for (( i=0; i<$random_number; i++ )); do
        # reverse the order of the sentence and save it in temp_rev.txt
        rev "reversed_temp.txt" > "temp_rev.txt"

        # replacing a-l alphabets with n-z and vice versa from temp_rev.txt and saving to temp_enc.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # renaming the file temp_enc.txt to reversed_temp.txt
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
	rev "reversed_temp.txt" > "$output_file"
	rm "reversed_temp.txt"
}

# Main Script Execution
# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"
# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
