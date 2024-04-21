#!/bin/bash

number=$1

if [ $number -gt 5 ]
then 
	echo "$number is greater than 5"
else 
	echo "$number is lessthan 5"
fi

#-gt -lt -eq -nq -ge -le
