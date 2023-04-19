#!/bin/bash

deleteGroup(){
	input=$1
	if_grp_exist=`getent group $input |cut -d: -f 1`

	if [ "$input" = "$if_grp_exist" ]; then
		groupdel $input
 # More precaution
		if_grp_exist=`getent group $input |cut -d: -f 1`
		if [ "$input" != "$if_grp_exist" ]; then
			echo "Group   $input   is Deleted successfully"
		fi
	elif [ "$input" != "$if_grp_exist" ]; then
		echo "Group   $input   is Not Exists"
	else
		echo "Error! when deleteng group"
	fi
}