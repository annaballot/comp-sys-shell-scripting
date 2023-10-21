#!/bin/bash
#Author: Anna Ballot
#Program Description:
#this script lets the user view the whole file, or search and view specific sets of results

echo -e "\n${GREEN}Search or View the File${ENDFORMAT}"
echo -e "\n${BOLD}What would you like to view?${ENDFORMAT}"
PS3='Please enter your choice:'
select viewOpt in "View All Players" "Search for Name" "Return to Main Menu"
do
	case $viewOpt in

		"View All Players")
			cat hockeyPlayers.txt
			break
			;;

		"Search for Name")
			#searches for name, counts results and displays count and results
			echo -e "\n${BOLD}Search for a name:${ENDFORMAT}"
			read searchTerm
			results=$(grep -c -i $searchTerm hockeyPlayers.txt)
			echo -e "\n${BOLD}There were ${results} players that matched $searchTerm.\n${ENDFORMAT}"
			grep -i $searchTerm hockeyPlayers.txt
			echo
			break
			;;
		"Return to Main Menu")
			echo -e "\nExiting to Main Menu"
			break
			;;
		*)
			echo "${RED}Invalid option...${ENDFORMAT}"
			;;
	esac
done
