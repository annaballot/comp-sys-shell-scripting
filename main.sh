#!/bin/bash
#Author: Anna Ballot
#Program Description:
#UPDATEf

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#	VARIABLES
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------

export GREEN=$'\033[0;32m'
export ENDFORMAT=$'\033[0m'
export BOLD=$'\033[1m'
export RED=$'\033[0;31m'


clear
echo -e "\nWelcome $USER!"
echo "Please choose an option from our main menu:"
while true; do
	echo -e "${GREEN}\n-------------------"
	echo -e "Main Menu"
	echo -e "--------------------${ENDFORMAT}" 
	PS3="What would you like to do?"
	options=("Add Players"
		"Search and View Records"
		"View Reports"
		"Remove Players"
		"Exit")
	COLUMNS=12
	select response in "${options[@]}"
	do
		case $response in 
			"Add Players")
				./add.sh
				sleep 1
				break
				;;
			"Search and View Records")
				./search.sh
				sleep 1
				break
				;;
			"View Reports")
				./report.sh
				sleep 1
				break
				;;
			"Remove Players")
				./remove.sh
				sleep 1
				break
				;;
			"Exit")
				echo "Exiting, Bye..."
				break 2
				;;
			*)
				echo "Invalid option"
				;;
		esac
	done
done
