#1/bin/bash

echo "All args/variables passed to the script : $@"
echo "Number of variables passes to script : $#"
echo "Script Name : $@"
echo "Present Working Directory : $pwd"
echo "Who is running the script : $user"
echo "Home directory of user : $home"
echo "PID of the script : $$"
sleep 100&
echo "PID of the recent background process is $!"
echo "all args passed: $*"
