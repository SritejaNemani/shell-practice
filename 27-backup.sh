#!/bin/bash
USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal-white
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #14 days is default if user not supplied


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

log(){
    echo -e "$(date "+%Y-%m %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $# -lt 2 ]; then
    USAGE                # we are calling usage function when the argumenst are given are l;ess than 2  that is we are showing the actyual usage kfj 
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source Directory $SOURCE_DIR doesn't exixit $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination Directory $DEST_DIR doesn't exixit $N"
    exit 1
fi

#### Find th efiles

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "backup started"
log "Source Directory : $SOURCE_DIR"
log "DEstination Directory : $DEST_DIR"
log "Days : $DAYS"

if [ -z $FILES]; then
    log "Nothing to archive....$Y Skipping $N"   # checking if there are any log files to back up
else
    #Format: app-logs-$timestamp.zip
    log "Files found to archive : $FILES"
    TIMESTAMP=$(date +%F-%H:%M:%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo " Archive name = $ZIP_FILE_NAME"
fi

