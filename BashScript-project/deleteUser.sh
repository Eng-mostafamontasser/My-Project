#!/bin/bash

deleteUser (){
	input=$1
	if_usr_exist=`getent passwd $input | cut -f 1 -d:`
	
	if [ "$input" = "$if_usr_exist" ]; then
		userdel -r $input
		if_usr_exist=`getent passwd $input | cut -f 1 -d:`
 # If user deleted that mean user not exist in passwd file  (more precaution)
		if [ "$input" != "$if_usr_exist" ] ; then 
			echo " $input is deleted successfully "
		fi
	else 
		echo "$input Is not Exist"
	fi 
}