#!/bin/bash

addGroup() {
	input=$1
	if_grp_exist=`getent group $input |cut -d: -f 1`

	if [ "$input" != "$if_grp_exist" ]; then
		groupadd $input
 # More precaution
		if_grp_exist=`getent group $input |cut -d: -f 1`
		if [ "$input" = "$if_grp_exist" ]; then
			echo "Group   $input   is Added successfully"
		fi
	elif [ "$input" = "$if_grp_exist" ]; then
		echo "Group   $input   is already Exists"
	else
		echo "Error! group   $input   Not Added"
	fi
}