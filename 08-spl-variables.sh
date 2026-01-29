#1/bin/bash

echo "Input 1st arg for testing"
read var1

echo "Input 2nd arg for testing"
read var2

echo "All args/variables passed to the script : $@"
echo "Number of variables passes to script : $#"
echo "Script Name : $0"
echo "Present Working Directory : $PWD"
echo "Who is running the script : $USER"
echo "Home directory of user : $HOME"
echo "PID of the script : $$"
sleep 100&
echo "PID of the recent background process is $!"
echo "all args passed: $*"
