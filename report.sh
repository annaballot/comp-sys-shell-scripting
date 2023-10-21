#!/bin/bash
#Author: Anna Ballot
#Description
#This scripts runs some detailed reports on the hockey players file

echo -e "\n${BOLD}What report would you like to run?${ENDFORMAT}"
COLUMNS=12
#lets user choose option of which report they would like to run
options=("List all hockey players in a club, with their contact details"
	"Count number of players in each division"
	"List all Names of players in certain division:"
	"Exit")
select response in "${options[@]}"
do
	case $response in 
		"List all hockey players in a club, with their contact details")
			#lets user input a club name, and then resturns all names, phone numbers and emails for players in that club
			echo "${BOLD}Which club would you like to see the players for?:${ENDFORMAT}"
			read club
			echo -e "\n${BOLD}listing all players in $club${ENDFORMAT}"
			grep -i $club hockeyPlayers.txt | awk '{print $1, $2, $3, $4}'
			#could check for no matches and return special message here, but already did similar logic in the remove.sh script
			break
			;;
		"Count number of players in each division")
			#loops through each division, and counts number of players in that division
			echo -e "\n${BOLD}Number of players in each div${ENDFORMAT}"
			i=1
			while [ $i -le 4 ] #could have found the max from the file, but didn't have time to implement so have hardcoded here
			do
				cnt=$(cat hockeyPlayers.txt | awk '{print $6}' | grep $i | wc -l)
				echo "In Division $i there are $cnt players"
				i=`expr $i + 1`
			done
			break
			;;

		"List all Names of players in certain division:")
			#asks user to choose a division, and lists out all players in that division
			echo -e "\n${BOLD}Enter division to filter for (1-4)${ENDFORMAT}"
			echo "1) Division 1"
			echo "2) Division 2"
			echo "3) Division 3"
			echo "4) Division 4"
			while :; do
			        read division
			        [[ $division =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue;}
			        if (($division >=1 && $division <=4)); then #valid number chosen
			                break
			        else
			                echo "${RED}Choose a number between 1 - 4${ENDFORMAT}"
			        fi
			done
			echo -e "\nAll players in Division $division:"
			cat hockeyPlayers.txt | awk '{print $1, $2, $6}' | grep $division
			break
			;;
		"Exit")
			echo "Exiting, Bye..."
			break 2
			;;
		*)
			echo "${RED}Invalid option${ENDFORMAT}"
			;;
	esac
done
