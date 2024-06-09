trap "rm -f folder; exit" 2

trap <arg/function> <signal>

#!/bin/bash
# traptest.sh
# notice you cannot make Ctrl-C work in this shell, 
# try with your local one, also remeber to chmod +x 
# your local .sh file so you can execute it!

trap "echo Booh!" SIGINT SIGTERM
echo "it's going to run until you hit Ctrl+Z"
echo "hit Ctrl+C to be blown away!"

while true        
do
    sleep 60       
done

kill -l # tocheckout all signal types

