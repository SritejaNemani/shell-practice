#!/bin/bash

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shel;l-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USER_ID -ne 0 ]; then
   echo "Not root user - please run this script with root user"
   exit 1 #if we dont give this Even if there is an error the script executes the next lines as well. In order to prevent this we exit with any failure code generally 1
fi

mkdir -p $LOGS_FOLDER

exit 1

VALIDATE(){
   if [ $1 -ne 0 ]; then
      echo "$2 Failure"
      exit 1 # here if it is one installation like prev screipt exiit 1 isn't required but here if we don'r exit the script will continue with next installations which may lead to problem
   else 
      echo "$2 Success"
   fi
}

echo "Installing Nginx"
dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "Nginx Installation"

echo "Installing NodeJs"
dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "NodeJs Installation"

echo "Installing MySQL"
dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "MySQL Installation"