Often you will want to do some file tests on the file system you are running. In this case, shell will provide you with several useful commands to achieve it.

The command looks like the following

-<command> [filename]
[filename1] -<command> [filename2]

# -e to test a file

#!/bin/bash
filename="sample.md"
if [ -e "$filename" ]; then
    echo "$filename exists as a file"
fi

# -d to test if a directory exists

#!/bin/bash
directory_name="test_directory"
if [ -d "$directory_name" ]; then
    echo "$directory_name exists as a directory"
fi

# "-r" to test if file has read permission for the user running the script/test

#!/bin/bash
filename="sample.md"
if [ ! -f "$filename" ]; then
    touch "$filename"
fi
if [ -r "$filename" ]; then
    echo "you are allowed to read $filename"
else
    echo "you are not allowed to read $filename"
fi

