Please run the script "day6_search_challange_solution.sh <directory-path> <target-file>" for the solution.

This script will return the path of the file that you wanted to search in current directory or in all its subdirectories.

This script will handle the file and directory presence before processing.

Output of the file will look like as below




```
#Below is the file directory structure that is created for demo purpose with all the directories.

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_search# tree testDirectory/
testDirectory/
├── test1
│   └── test1sub
│       ├── test1sub-file.txt
│       └── test1sub.txt
├── test2
│   └── test2-file.txt
│       └── test2-file.txt
└── test3

5 directories, 3 files

#running the script with wrong directory

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_search# ./day6_search_challange_solution.sh testDirectory-dummy/  test1sub-file.txt

Error: Directory 'testDirectory-dummy/' is not found. Please provide the correct directory !!!

#running now with file that is not present

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_search# ./day6_search_challange_solution.sh testDirectory/  test1sub-file-2.txt
File not found: test1sub-file-2.txt


#running the script to search  test1sub-file.txt file

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_search# ./day6_search_challange_solution.sh testDirectory/   test1sub-file.txt
File has been found in the path: testDirectory//test1/test1sub/test1sub-file.txt


```

