#!/bin/bash

#Calling functions
source ./addGroup.sh
source  ./addUser.sh		
source ./addUser2Group.sh
source ./changePassword.sh	
source ./deleteUser.sh
source ./deleteGroup.sh
source ./enableUser.sh
source ./disableUser.sh	
source ./showDetails.sh	



echo """
	Please! Make sure that you are root or member in wheel group Before choose
"""

PS3="""
Please! Enter your choice : """

enter_user_name="""
Please enter user name  : """
enter_grp_name="""
Please enter group name  : """

select choice in "Add user" "Delete user" "Disable user" "Enable user" "Change password for user" "Create new group" "Delete group"  "Add user to group" "Show user details " "Exit "
do
	case $choice in
# That To Add user 
"Add user")  	
		read -p "$enter_user_name" username 
				addUser $username ;;
# That to delete user
"Delete user")  	
		read -p "$enter_user_name" username 
				deleteUser $username ;;
# That to disable user
"Disable user")  	
		read -p "$enter_user_name" username 
				disableUser $username ;;
# That to enable user
"Enable user")  	
		read -p "$enter_user_name" username 
				enableUser $username ;;
# That to change Password for users
"Change password for user")  	
		read -p "$enter_user_name" username  
				 changePassword $username ;;
# That to Delete Group 
"Delete group")  	
		read -p "$enter_grp_name" grpname
				deleteGroup $grpname ;;	
# That to new Group 
"Create new group")  	
		read -p "$enter_grp_name" grpname
				addGroup $grpname ;;	
# That to Add user to group 
"Add user to group")  	
	read -p "$enter_user_name" username
	read -p "$enter_grp_name" grpname
		addUser2Group $username $grpname ;;
# That to Add user to group 
"Show user details ") 
	read -p "$enter_user_name" username
		showDetails $username  ;;
"Exit ")
	exit ;;
	
	esac
done
