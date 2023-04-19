#!/bin/bash 
addUser (){
	input=$1     # radwan is exist       #  radwan1   not exist
	
	if_usr_exist=`getent passwd $input |cut -f 1 -d:`
	usr=$if_usr_exist                            ### to hold uername 	
	while [ "$input" = "$if_usr_exist" ]   	     ### If input is radwan while will work 
	do
		echo "user name   $input   IS exist   to more details about $input choose 9) "
                rand=$(( ( RANDOM % 1000 ) ))
                username=$input${rand}
	
		if_usr_exist=`getent passwd $username |cut -f 1 -d:`
	done
 # This IF condition used when user is not exist 
	if [ "$input" != "$usr" ]     
	then
		useradd $input
		if_usr_exist=`getent passwd $input |cut -f 1 -d:`
 # The previous line check if user is added and the following line print message tell that user is added
 # I use If condition so Non sudoers can forget write sudo before script when run it
		if [ "$input" = "$if_usr_exist" ]
		then
			echo "username $input added successfully"
			echo "Don't forget choose 5) to put password"
		else
		 	echo "####### Failed! Try to Enter as a Sudo #######"
		fi
 # If user is Exist and while make arandom user and asking if the user need the random user or not
	else
		read -p "That user   $username   is available [Y/N]: "  ans
		if [ "$ans" = "y" -o "$ans" = "Y" ]
		then
            useradd $username
			if_usr_exist=`getent passwd $username |cut -f 1 -d:`
 # The previous line check if user is added and the following line print message tell that user is added
			if [ "$username" = "$if_usr_exist" ]
			then
				echo "username $username added successfully"
				echo "Don't forget choose 5) to put password"
			else
		 		echo "####### Failed! Try to Enter as a Sudo #######"
			fi

		elif [ "$ans" = "n" -o "$ans" = "N" ] 
		then
			echo "Enter another user to chek if is it valid"
        fi
	fi
}