#!/bin/bash
#Author: Anna Ballot
#Program Description:
#UPDATE
echo -e "\n${GREEN}Search or View the File${ENDFORMAT}"
echo -e "\n${BOLD}What would you like to view?${ENDFORMAT}"
PS3='Please enter your choice:'
select viewOpt in "View All Players" "Search for Name"
do
	case $viewOpt in

		"View All Players")
			cat hockeyPlayers.txt
			break
			;;

		"Search for Name")
			echo -e "\n${BOLD}Search for a name:${ENDFORMAT}"
			read searchTerm
			echo -e "\nHere are the players that matched $searchTerm :"
			grep -i $searchTerm hockeyPlayers.txt
			echo
			break
			;;
		*)
			echo "${RED}Invalid option...${ENDFORMAT}"
			;;
	esac
done
