#!/bin/bash

showDetails(){
	input=$1
	if_usr_exist=`getent passwd $input | cut -f 1 -d:`
	
	if [ "$input" = "$if_usr_exist" ]; then
		echo `id $input `
		echo "Home Directory" 	"`getent passwd $input |cut -f6 -d:`"
		echo "Shell status" 	"`getent passwd $input |cut -f7 -d:`"
		echo "******  user password expiry information ******"
			chage -l $input
	fi

}