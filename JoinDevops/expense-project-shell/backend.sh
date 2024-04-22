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
echo "Please enter DB password:"
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

dnf module disable nodejs -y &>>$LOGFILE
VALIDATE $? "Disabling default nodejs module"

dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "Enabling nodejs:20 module"

dnf install nodejs -y &>>$LOGFILE
VALIDATE $? "Installing Nodejs"

id expense &>>$LOGFILE
if [ $? -ne 0 ]
then 
 useradd expense &>>$LOGFILE
 VALIDATE $? "Creating expense user"
else
echo -e "expense user already created..$Y SKIPPING $N"
fi

mkdir -p /app &>>$LOGFILE
VALIDATE $? "creating app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
VALIDATE $? "Downloading backend code"

cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE
VALIDATE $? "Extracted backend code"

npm install &>>$LOGFILE
VALIDATE $? "Installing nodejs Dependencies"

#check your repo and path
cp /home/ec2-user/DevOps-Learning-Journey/JoinDevops/expense-project-shell/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
VALIDATE $? "Copied backend service"

systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "Daemon Reload"

systemctl start backend &>>$LOGFILE
VALIDATE $? "starting backend"

systemctl enable backend &>>$LOGFILE
VALIDATE $? "enabling backend"

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL Client"

mysql -h db.nagacharan.site -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>$LOGFILE
VALIDATE $? "Schema loading"

systemctl restart backend &>>$LOGFILE
VALIDATE $? "Restarting Backend" backend"







