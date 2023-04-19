#!/bin/bash

changePassword (){
	input=$1
	if_usr_exist=`getent passwd $input | cut -f 1 -d:`
 
	if [ "$input" = "$if_usr_exist" ]; then
		passwd $input
	fi
}
