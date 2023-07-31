#!bin/bash/

#task1- comments
#this is BashBlazeChallenge- Day1

#task2- echo
#echo prints on the screen
echo "This is BashBlazeChallenge- Day1"

#task3 - variables
name="Shivani"
yeo=2

#task4- using variables
echo "My name is $name and YEO is $yeo"

a=13 b=89
sum=$(($a+$b))
echo "The sum of $a and $b is $sum"

#task5 - using built-in variables
echo "My current working directory is $PWD"
echo "My home directory is $HOME"
echo "The PID of this bash process is $$"

#task6 - using wildcards
echo "making some files:"
touch day{8..11}.txt
touch hello.sh ls

echo "Using wildcard- ls .sh"
ls *.sh

echo "Using wildcard- ls .txt"
ls *.txt

echo "Using ? wildcard- ls day?.txt"
ls day?.txt

echo "Using [] wildcard- ls day[1-10].txt"
ls day[1-10].txt

echo "Using ? wildcard- ls day*"
ls day*
