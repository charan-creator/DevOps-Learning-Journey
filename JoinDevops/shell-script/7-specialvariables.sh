#!/bin/bash

echo "All variables: $@"
echo "number of variables passed $#"
echo "script name $0"
echo "present working directory: $PWD"
echo "home directory: $HOME"
echo "hostname $HOSTNAME"
echo "which user running script $USER"
echo "process id of the current shell script $$"
sleep 20 &
echo "proces id of the last background script $!"
