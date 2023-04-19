#!/bin/bash

addUser2Group(){
	usr=$1
	grp=$2
	if_usr_exist=`getent passwd $usr | cut -f 1 -d:`
	if_grp_exist=`getent group $grp |cut -d: -f 1`

	if [ "$grp" = "$if_grp_exist" -a "$usr" = "$if_usr_exist" ]; then
		gpasswd  -a $usr   $grp
	fi
}
