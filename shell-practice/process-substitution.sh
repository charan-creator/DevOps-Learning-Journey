sort file1 > sorted_file1
sort file2 > sorted_file2
diff sorted_file1 sorted_file2

is same as 

diff <(sort file1) <(sort file2)

Imagine you want to store logs of an application into a file and at the same time print it on the console. A very handy command for that is tee. 👇

echo "Hello, world!" | tee /tmp/hello.txt

let say you want to have only lower case characters in the file but keep the regular case on the output. You could use process substitution that way:

echo "Hello, world!" | tee >(tr '[:upper:]' '[:lower:]' > /tmp/hello.txt)

