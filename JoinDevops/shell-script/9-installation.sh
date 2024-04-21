#!/bin/bash

USERID=$(id -u) #executing inside the server

os-version=$(uname -a) #to know os

if [ $USERID -ne 0 ]
then 
	echo "please run the script with root user"
	exit 1 #manually exit if error comes
else
	echo "you are super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
	echo "installation of mysql ....FAILURE"
	exit 1
else
	echo "installation of mysql .....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
	echo "installation of git ....FAILURE"
	exit 1
else
	echo "Installation of git ....SUCCESS"
fi

echo "Is Script Proceeding?"

