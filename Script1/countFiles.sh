#!/bin/bash
# Counts the number of files in a given path with a given extension
# bash countFiles.sh PATH [extension]

if [[ $# -eq 0 ]] || [[ !(-d "$1") ]]
	then 
	echo "ERROR: Invalid PATH argument"
	exit 1
fi

if [ $# -eq 1 ]
	then
	RESULT=0
	ls -a "$1" | tail -n +4 | 
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





