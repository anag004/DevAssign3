#!/bin/bash

CONTENTS=$( ls "$1" )

if [ $# -eq 2 ] 
then
	echo "Files copied from dir $1 to dir $2 are: "
	PREF=""
elif [ $# -eq 3 ]
then
	PREF="$3"
else 
	echo "Files copied from dir $1 to dir $2 are: "
	PREF=""
fi

ls "$1" | while read file
do
	# Check to see if file is in the second directory
	SEARCH=$( find "$2" -maxdepth 1 -name "$file" )
	# If its a file simply copy it
	if [ -f "${1}/${file}" ] 
	then
		if [[ !($SEARCH) ]] 
		then
			echo "${PREF}${file}"
			cp "${1}/${file}" "$2"
		fi
	else 
		if [[ !($SEARCH) ]]
		then
			mkdir "${2}/${file}"
		fi
		bash backup.sh "${1}/${file}" "${2}/${file}" "${PREF}${file}/"
	fi
done 

if [ $# -eq 2 ] 
then 
	# x y are dummy arguments
	bash backup.sh "$2" "$1" x y
fi



