# **🌟 Introduction**

Welcome to Day 2 of the #TWSBashBlaze Challenge. In this blog, we will create a bash script that serves as an interactive file and directory explorer. We'll create a script that will allow you to explore the files and directories in the current path interactively and also provide a character-counting feature for the user's input. So without wasting any time let's dive in!

### **📂 Part 1: File and Directory Exploration 🔍**

In this task, we are going to create a bash script explorer.sh which will display a welcome message and list all the files and directories in the current path upon execution. Our script will not only allow us to navigate through files and directories in the current path but also display their names and sizes in a human-readable format (e.g., KB, MB, GB). We'll achieve this functionality using the powerful ls command with appropriate options. The list of files and directories will be displayed in a loop until the user decides to exit the explorer.

### **🔤Part 2: Character Counting 📏**

🔍On displaying the file and directory list, the script will prompt the user to enter a text-based input. The script will keep running in a loop until the user enters an empty string (👉the user presses Enter without any text). If the script is non-empty then it will count the number of characters present in the input. The character count will be displayed immediately after the input is passed. 🔤

Now let's dive in and write a script that fulfills all the above requirements!💻🚀


```plaintext
#!/bin/bash

# Part 1: File and Directory Exploration
echo "Welcome to the Interactive File and Directory Explorer!👋"

# Run the infinite loop of while until user wants to exit
while true; do

    # Display the list of files and directories with their names and sizes
    echo "Files and Directories in the Current Path:"
    for item in *; do
        if [ -e "$item" ]; then
            size=$(ls -lh "$item" | awk '{print $5}')
            echo "Name: $item  Size: $size"
        fi
    done

    # Take the input from user to decide whether to continue looping
    read -p "Enter a text input and press enter if you want to exit" input

    # Exit if the input is empty
    if [ -z "$input" ]; then
        echo "Exit the Interactive Explorer! Bbyee...See you!👋"
        break
    fi

    # Count the number of characters in an input text and then display the count
    char_count=${#input}
    echo "Character count: $char_count"

done

```


### **🔍 Usage:**

Save the script in a file named explorer.sh.

Make the script executable using the command: chmod +x explorer.sh.

Execute the script using: ./explorer.sh.
    

### **🔍💻Output Screen:**

![image](https://github.com/gauri17-pro/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/60473255/2b31ca89-5109-4323-93e9-b546b3f29964)

# **📍 Conclusion:**

Congratulations! You have successfully completed Day 2 of the #TWSBashBlazeChallenge. You now have a versatile script that lets you explore files and directories in your current path, and it also includes a useful character-counting feature. 🚀 I hope you enjoyed building this script and learning more about Bash scripting. Stay tuned for more exciting challenges in the upcoming days!

Till then happy learning and keep exploring!🎈🌌


