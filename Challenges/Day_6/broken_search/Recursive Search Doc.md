
# Project Title

A brief description of what this project does and who it's for

# Recursive File Search Script

The `recursive_search.sh` script is a Bash utility designed to perform a recursive search for a target file within a specified directory and its subdirectories. It prints the absolute path of the found file if located, and if the target file is not found, it displays an appropriate error message.

## Usage

To use the `recursive_search.sh` script, follow these steps:

1. Make sure you have the necessary permissions to execute the script.

    ```bash
    chmod +x recursive_search.sh
    ```

2. Run the script by providing the search directory and the target file name as command-line arguments.

    ```bash
    ./recursive_sol.sh <directory> <target file>
    ```

    Replace `<directory>` with the directory in which you want to start the search, and `<target file>` with the name of the file you're looking for.

## Features

- Performs a recursive search for the target file within the specified directory and its subdirectories.
- Prints the absolute path of the found file, starting from the root directory.
- Provides informative error messages for cases where the directory does not exist or the target file is not found.

## Example

Suppose you have the following directory structure:
 ```bash
    my_files/
├── dir1/
│ ├── target.txt
│ └── file1.txt
└── dir2/
├── file2.txt
└── sub_dir/
└── target.txt
```
To search for the file target.txt within the directory my_files, you would run the script as follows:
```bash
    ./recursive_sol.sh my_file target.txt
```
If the script finds the target.txt file within any of the subdirectories, it will display the absolute path of the file. Otherwise, it will print "File not found: target.txt".
# Notes

- The script assumes that the target file has a unique name within the specified directory and its subdirectories.
- Use relative or absolute paths for the search directory, as appropriate.
- This script is designed for Bash environments and may not work on all platforms.