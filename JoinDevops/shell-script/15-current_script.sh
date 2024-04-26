#!/bin/bash

COURSE="DevOps from current Script"

echo "Before callling the other script, Course name is $COURSE"
echo "Process ID of current script : $$"

./16-other_script.sh

#source ./16-other_script.sh

echo "After calling other script, course: $COURSE"
