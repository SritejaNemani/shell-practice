#!/bin/bash
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal-white

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR doesn't exist"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)
echo -e "Files that are older than 14 days are: $FILES_TO_DELETE"

while IFS= read -r filepath; do  
    echo "Deleting file: $filepath" #prints line by line - process each line # reads each line stores the line in variable filepath executed remaining commands in  while loop and repeats again 2nd line is stored in the variable filepath executed commands in while loop 
    rm -f $filepath
    echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE 