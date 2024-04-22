#!/bin/bash

USERID=$(id -u) #verifying the current user
TIMESTAMP=$(date +%f-%H-%M-%S) #Adding timestamp when it got executed
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m""
N="\e[0m"
echo -p "Please enter DB password: " mysql_root_password

# writing a function to validate our code
VALIDATE(){
	if [ $1 -ne 0 ]
	then
		echo -e "$2...$R FAILURE $N"
		exit 1 #manually exit
	else
		echo -e "$2.......$G SUCCESS $N"
	fi
}

if [ $USERID -ne 0 ]
then 
	echo "Please run the script as a admin user"
        exit 1
else
	echo "you are a super user, Let's go ahead champ"
	
fi

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing MySql server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling MySql server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting MySql Server"

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "Setting up root password"


# Below code for Idempotent nature

mysql -h db.nagacharan.site -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    VALIDATE $? "MySQL Root password Setup"
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi



	

