#!/bin/bash

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "," -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP
#setting up color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Please enter DB password: "
read -s mysql_root_password

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$2...$R FAILURE $N"
    exit 1
    else
    echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then 
echo "Please run this script with root user access"
exit 1
else 
echo "Cheers ! you are super user."
fi

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing MySql Server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling MySql Server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting MySql Server"

#ExpenseApp@1
# Below code for Idempotent nature

mysql -h db.nagacharan.site -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
VALIDATE $? "MySql Root Password Setup"
else
echo -e "MYSQL Root Password is already Setup...$Y SKIPPING $N"
fi

