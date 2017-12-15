#!/bin/bash

if [[ !( $# -eq 1 ) ]] || [[ !( -f $1 ) ]]
then 
	# Exit if no such file exists or more than one command line args passed
	exit 1
fi

COUNTER=0
CONTENTS=$( cat $1 )
RESULT=0
CURRENT=0

for command in $CONTENTS
do
	if (( $COUNTER % 2 == 0 )) 
	then
		CURRENT=$command
	else 
		if [ $command == '+' ]
		then
			(( RESULT += CURRENT ))
		elif [ $command == '-' ]
		then
			(( RESULT -= CURRENT ))
		elif [ $command == '/' ]
		then 
			(( RESULT /= CURRENT ))
		else 
			(( RESULT *= CURRENT ))
		fi
	fi
	(( COUNTER++ ))
done

echo $RESULT



