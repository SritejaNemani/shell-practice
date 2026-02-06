#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Not root user - please run this script with root user"
   exit 1 #if we dont give this Even if there is an error the script executes the next lines as well. In order to prevent this we exit with any failure code generally 1
fi

echo "Installing Nginx"
dnf install nginxx -y

if [ $? -ne 0 ]; then
   echo "Installing Nginx Failure"
else 
   echo "Installing Nginx Success"
fi