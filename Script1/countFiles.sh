#!/bin/bash

if [[ $# -eq 0 ]] || [[ !(-d "$1") ]]
	then 
	exit 1
fi

if [ $# -eq 1 ]
	then
	RESULT=0
	ls -a "$1" | tail -n +3 | 
	{
		while read file
		do
			if [ -f "${1}${file}" ]
			then
				(( RESULT++ ))
			fi
		done
		echo $RESULT
	}
	exit 0
fi

if [ $# -eq 2 ]
	then
	find $1 -maxdepth 1 -name "*$2" | 
	{
		while read file
		do
			if [ -f "$file" ]
			then 
				(( RESULT++ ))
			fi
		done
		echo $RESULT
	}	
	exit 0
fi





