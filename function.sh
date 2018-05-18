function timestwo {
(($2=$1*2))
}

readf NUMBER
timestwo $NUMBER RESULT
echo "result: $RESULT"
