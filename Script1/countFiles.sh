#!/bin/bash

if [[ $# -eq 0 ]] || [[ !(-d $1) ]]
	then 
	exit 1
fi

if [ $# -eq 1 ]
	then
	N=$( ls $1 | wc -l )
	echo $N
	exit 0
fi

if [ $# -eq 2 ]
	then
	N=$( find $1 -maxdepth 1 -name "*$2" | wc -l )
	echo $N
	exit 0
fi





