# basic construct
"""
for arg in [list]
do
 command(s)...
done
"""

# loop on array member
NAMES=(Joe Jenny Sara Tony)
for N in ${NAMES[@]} ; do
  echo "My name is $N"
done

# loop on command output results
for f in $( ls ./loops.sh /etc/localtime ) ; do
  echo "File is: $f"
done