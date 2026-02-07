#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Not root user - please run this script with root user"
   exit 1 #if we dont give this Even if there is an error the script executes the next lines as well. In order to prevent this we exit with any failure code generally 1
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then
      echo "$2 Failure"
   else 
      echo "$2 Success"
   fi
}

echo "Installing Nginx"
dnf install nginx -y
VALIDATE $? "Nginx Installation"

echo "Installing NodeJs"
dnf install nodejs -y
VALIDATE $? "NodeJs Installation"

echo "Installing MySQL"
dnf install mysql -y
VALIDATE $? "MySQL Installation"