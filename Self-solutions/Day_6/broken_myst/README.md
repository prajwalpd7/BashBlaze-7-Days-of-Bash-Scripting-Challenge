Please run "day6_mystery_challange_solution.sh <input-file> <output-file> " for solution.

The challenge script mystery.sh has multiple culprits to confuse to understand what this script is doing but when you know the commmands and some important lines then it will be easy to crack the purpose of the file.  it took for while for me to understand new commands like rev, and cipher encrypt technique and how it works and all but at the end i cracked it and modified with fully with lot of enhancemens with performance improvement.

The output of the script as follows

```
#checking the content of output file before running the script

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Hello World!

#running the script with input and output files

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 10 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Uryyb Jbeyq!

The data looks to be in encrypted format. Do you want to decrypt it (Y/N)? Y

Now the data has been decrypted successfully !!
Showing the content of file below!!

Hello World!

The mysterious process is complete. Check the 'output-file.txt' for the result!

#verifying the output file content

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Hello World!

#running again and now see the difference if the random number is ODD

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 7 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Hello World!

Exiting ..
The mysterious process is complete. Check the 'output-file.txt' for the result!


#Now running again but this time random number will be even number and choose NO to decrypt

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# ./day6_mystery_challange_solution.sh input-file.txt output-file.txt

After 4 times encryption with ROT13 encryption technique on the input file input-file.txt. The output file looks like

Uryyb Jbeyq!

The data looks to be in encrypted format. Do you want to decrypt it (Y/N)? N

Data is not decrypted !!!

The mysterious process is complete. Check the 'output-file.txt' for the result!

#verifying the output file content now

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_6/broken_myst# cat output-file.txt
Uryyb Jbeyq!

```
