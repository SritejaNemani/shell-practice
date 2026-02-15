#!/bin/bash
USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal-white


#testing if root user or not 
if [ $USER_ID -ne 0 ]; then
   echo -e "$R Not root user - please run this script with root user$N" 
   exit 1 #if we dont give this Even if there is an error the script executes the next lines as well. In order to prevent this we exit with any failure code generally 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R Sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE                # we are calling usage function when the argumenst are given are l;ess than 2  that is we are showing the actyual usage kfj 
fi

