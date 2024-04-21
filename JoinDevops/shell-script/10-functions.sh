#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "," -f1)

VALIDATE(){
if [ $1 -ne 0 ]
then
	echo "$2...FAILURE"
	exit 1
else
	echo "$2...SUCCESS"
fi
}

if [ $USERNAME -ne 0 ]
then
	echo "Please Run as sudo user"
	exit 1 #manually exit if error comes
else
	echo "Bang! you are Super User"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing Mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"

