PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting="Hello        world!"
echo $greeting

PRICE_PER_APPLE=5
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"

# to avoid ambiguity ${}
MyFirstLetters=ABC
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"

# to avoid white spaces
greeting='Hello        world!'
echo $greeting" now with spaces: $greeting"

# substitution
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
