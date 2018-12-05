#!/bin/bash
# evaluates a mathematical expression specified in input.txt

if [[ !( $# -eq 1 ) ]] || [[ !( -f $1 ) ]]
then 
	# Exit if no such file exists or more than one command line args passed
	exit 1
fi

CONTENTS=$( cat "$1" )
RESULT=0
NUMBER=0
SYMBOL=0

while read command
do
	# splits the number and symbol into two different lines
	TEMP=$( echo "$command" | tr -s " " "\012" )
	while read val 
	do
		if (( COUNTER % 2 == 0 ))
		then 
			NUMBER="$val"
		else 
			SYMBOL="$val"
		fi
		(( COUNTER++ ))
	done <<< "$TEMP"

	if [ "$SYMBOL" == "+" ]
	then
		(( RESULT += NUMBER ))
	fi
	if [ "$SYMBOL" == "-" ]
	then
		(( RESULT -= NUMBER ))
	fi
	if [ "$SYMBOL" == "/" ]
	then
		(( RESULT /= NUMBER ))
	fi
	if [ "$SYMBOL" == "*" ]
	then
		(( RESULT *= NUMBER ))
	fi
			
done <<< "$CONTENTS"

echo $RESULT



