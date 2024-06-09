# basic construct

"""
while [ condition ]
do
 command(s)...
done

"""

COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done