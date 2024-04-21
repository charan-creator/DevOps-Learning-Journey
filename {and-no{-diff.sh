var="foo bar"
for i in "$varbar"; do # Expands to 'for i in ""; do...' since there is no
    echo $i            #   variable named 'varbar', so loop runs once and
done                   #   prints nothing (actually "")

var="foo bar"
for i in "${var}bar"; do # Expands to 'for i in "foo barbar"; do...'
    echo $i              #   so runs the loop once
done
