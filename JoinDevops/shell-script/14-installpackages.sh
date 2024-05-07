#!/bin/bash

USERID=$(id -u) #checking who is the logged in user
TIMESTAMP=$(date +%F-%H-%M-%S) #script running time as timestamp value
SCRIPT_NAME=$(echo $0 | cut -d "," -f1) #Script name
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log #logfilename

# Adding color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#writing validate function
VALIDATE(){
	if [ $1 - ne 0 ]
	then
		echo -e "$2....$R FAILURE $N"
		exit 1
	else
		echo -e "$2...$G SUCCESS $N"
	fi
}

if [ $USERID -ne 0 ]
then 
	echo "Please run this script with root access"
	exit 1
else
	echo "you are super user"
fi

for i in $@
do
	echo "package to install $1"
	dnf list installed $i &>>$LOGFILE
	if [ $? - eq 0 ]
	then 
		echo -e "$1 is already installed...$Y SKIPPING $N"
	else
		dnf install $i -y &>>$LOGFILE
		VALIDATE $? "Installation of $i"
	fi

done

