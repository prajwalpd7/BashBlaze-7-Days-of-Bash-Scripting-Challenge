#!/bin/bash
# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    local input_file="$1"
    local output_file="$2"
    
    # This is performing ROT13 encryption algorithm to the input, Basically, it is shifting the characters by 13 places, like A becomes N
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # Overhere we are reversing the output of ROT13 encryption done above and storing in a new file reversed_temp.txt
    rev "$output_file" > "reversed_temp.txt"

    # Generating a random number from 1 to 10 (inclusive)
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    echo "Random Number is: $random_number"
    # Mystery loop: 
    for (( i=0; i<$random_number; i++ )); do
	# It is reversing the content of reversed_temp.txt file to temp_rev.txt file
        rev "reversed_temp.txt" > "temp_rev.txt"

        # It is applying ROT13 encryption to temp_rev.txt file and outputting the final value to temp_enc.txt file
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # It is renaming temp_enc.txt file to reversed_temp.txt file
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!

    # So the mystery ovehere depends upon the number of times encryption has been done to the input string
    # if the number of times encryption has been done is even (random number + 1 (before for loop)), then reversed_temp.txt file will contain the original input string after for loop
    # Similarly, if the number of times encryption has been done is odd (random number + 1 (before for loop)), then reversed.txt will contain the reversed encrypted value after for loop

    # we need to check if randomNumber + 1 is an odd integer, if so, then perform reversal on reversed_temp.txt and then encrypt using ROT-13 to get back the original string
    if [[ $(echo "($random_number + 1) % 2" | bc) -ne 0 ]];then
	    # Perform reversal on reversed_temp.txt file
	    reverse=$(rev "reversed_temp.txt")
	    decryption=$(echo "$reverse" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
	    if [[ $decryption == $(cat $input_file) ]];then
		    echo "decryption performed successfully"
		    echo "Decrypted String: $decryption"
		    echo "Original input: $(cat $input_file)"
	    fi
    else
	    # Total number of encryptions was even, so reversed_temp.txt should contain the original input string
	    decrypted_string=$(cat "reversed_temp.txt")
	    original_string=$(cat $input_file)
	    if [[ $decrypted_string == $original_string ]];then
		    echo "decryption performed successfully"
                    echo "Decrypted String: $decrypted_string"
                    echo "Original input: $original_string"
	    fi
    fi
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
