"""
$0 - The filename of the current script.|
$n - The Nth argument passed to script was invoked or function was called.|
$# - The number of argument passed to script or function.|
$@ - All arguments passed to script or function.|
$* - All arguments passed to script or function.|
$? - The exit status of the last command executed.|
$$ - The process ID of the current shell. For shell scripts, this is the process ID under which they are executing.|
$! - The process number of the last background command.|

"""
# $@ and $* have different behavior when they were enclosed in double quotes.

#!/bin/bash
function func {
    echo "--- \"\$*\""
    for ARG in "$*"
    do
        echo $ARG
    done

    echo "--- \"\$@\""
    for ARG in "$@"
    do
        echo $ARG
    done
}
func We are argument