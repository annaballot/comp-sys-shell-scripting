#!/bin/bash
#Author: Anna Ballot
#Program Description:
#UPDATE
echo -e "\n${GREEN}Removing Players${ENDFORMAT}"
echo -e "\n${BOLD}Search for the player you wish to remove:${ENDFORMAT}"
read searchTerm
rm playersToRemove.txt 2> /dev/null
grep -i -n $searchTerm hockeyPlayers.txt | sed 's/:/ /' >> playersToRemove.txt #finds the search term, includes line spaces and replaces : with space, and outputs to remporary file
echo
results=$(wc -l < playersToRemove.txt)
if [[ $results -eq 0 ]]
then
	echo "0 results found for your search"
else
	cat playersToRemove.txt
	echo -e "\n${BOLD}Would you like to remove all occurences(Yes/No)?${ENDFORMAT}"
	while :; do
		read rm_all
		case $rm_all in

			[yY] | [yY][Ee][Ss] )
				grep -i $searchTerm hockeyPlayers.txt | sed -i "/$searchTerm/Id" hockeyPlayers.txt
				echo "All Players matching $searchTerm Removed"
				break
				;;

			[nN] | [nN][oO] )
				echo -e "\n${BOLD}Select (using the line number) which players to remove:${ENDFORMAT}"
				cat playersToRemove.txt
				echo
				#awk '{print $1}' playersToRemove.txt
				var1=`awk '{print $1 " "}' playersToRemove.txt | tr -d "\n"`
				echo "${BOLD}Choose just one line number to delete: $var1${ENDFORMAT}"
				read lineNum
				echo -e "Deleting Line :" #could do with more error checking here and confirmation of deletion but I've already shown
				sed -n "${lineNum}p" hockeyPlayers.txt
				break
				;;
			*)
				echo "${RED}Please enter Yes or No only${ENDFORMAT}"
				;;
		esac
	done
fi
rm playersToRemove.txt 2> /dev/null
