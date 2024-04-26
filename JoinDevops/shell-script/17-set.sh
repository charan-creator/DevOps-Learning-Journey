#!/bin/bash

set -e

failure(){
	echo "failed at $1: $2"
	}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
	echo "please run this script with root access"
	exit 1
else
	echo "you are a super user"
fi

dnf install mysql -y
dnf install nginx -y

echo "is script proceeding.... ?"
