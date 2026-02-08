#!/bin/bash

set -e # this will be checking for errors, if errors it will exit

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal-white

if [ $USER_ID -ne 0 ]; then
   echo -e "$R Not root user - please run this script with root user$N" | tee -a $LOGS_FILE
   exit 1 #if we dont give this Even if there is an error the script executes the next lines as well. In order to prevent this we exit with any failure code generally 1
fi

mkdir -p $LOGS_FOLDER


VALIDATE(){
   if [ $1 -ne 0 ]; then
      echo -e "$2 $R Failure $N" | tee -a $LOGS_FILE
      #exit 1 # here if it is one installation like prev screipt exiit 1 isn't required but here if we don'r exit the script will continue with next installations which may lead to problem
   else 
      echo -e "$2 $G Success $N" | tee -a $LOGS_FILE
   fi
}

for package in $@ # sudo sh 15-loops.sh nginxx mysql nodejs
do
    dnf list installed $package &>> $LOGS_FILE

    if [ $? -eq 0 ]; then

     echo -e " $package already exists $Y so skipping$N"
        
    elses

        echo "$package not Installed so Installing $package"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package Installation"

    fi
done

#echo "Installing Nginx"
#dnf install nginx -y &>> $LOGS_FILE
#VALIDATE $? "Nginx Installation"

#echo "Installing NodeJs"
#dnf install nodejs -y &>> $LOGS_FILE
#VALIDATE $? "NodeJs Installation"

#echo "Installing MySQL"
#dnf install mysql -y &>> $LOGS_FILE
#VALIDATE $? "MySQL Installation"