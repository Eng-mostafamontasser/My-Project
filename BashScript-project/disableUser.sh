#!/bin/bash

disableUser(){
	input=$1
	if_usr_exist=`getent passwd $input | cut -f 1 -d:`
	
	if [ "$input" = "$if_usr_exist" ]; then
		passwd -l $input
 # To check if user is actually disabled
		if_usr_dis=`sudo getent shadow $input |cut -d: -f 2 |cut -b 1,2`
		if [ "$if_usr_dis" = "!!" ]; then
			echo "Now   $input   is disabled successfully"
		else 
			echo "Error! "
		fi
	fi
}