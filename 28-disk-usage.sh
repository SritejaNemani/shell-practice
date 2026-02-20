#!/bin/bash

R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal-white


log(){
    echo -e "$(date "+%Y-%m %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line 
do

    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}') 
    if [ "$USAGE" -gt "$USAGE_THRESHOLD"]; then 
        MESSAGE+="High Disk Usage on $PARTITION : $USAGE" #       if given Message= then everytime loop is executed message gets replaced - but here (+=) it appends the exixting      
                  
    fi

done <<< $DISK_USAGE

echo "$MESSAGE"