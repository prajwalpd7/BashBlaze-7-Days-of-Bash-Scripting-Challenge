#!/bin/bash

# Initialize a counter variable
counter=0

# Loop 3 times
for ((i=1; i<=3; i++))
do
    echo "Iteration $i"
    
    # Increment the counter
    ((counter++))
    
    # Check if the counter is equal to 3
    if [ $counter -eq 3 ]; then
        echo "Reached 3 iterations. Exiting loop."
        break  # Exit the loop
    fi
done

