#!/bin/bash
#Author: Anna Ballot
#Program Description:
#This script allows the user to search for records they would like to remove from the file,
# and then either remove all results, or choose the line they wish to remove

echo -e "\n${GREEN}Removing Players${ENDFORMAT}"
#could have added an option to exit to main menu here, but already covered in search.sh and report.sh
echo -e "\n${BOLD}Search for the player you wish to remove:${ENDFORMAT}"
#allows user to input a search term, and then holds these results in a temporary file
read searchTerm
rm playersToRemove.txt 2> /dev/null
grep -i -n $searchTerm hockeyPlayers.txt | sed 's/:/ /' >> playersToRemove.txt #finds the search term, includes line spaces and replaces : with space, and outputs to remporary file
echo
results=$(wc -l < playersToRemove.txt)
if [[ $results -eq 0 ]]
then
	#if there are no results for the search, it exits back to the main menu
	echo "0 results found for your search"
else
	cat playersToRemove.txt
	echo -e "\n${BOLD}Would you like to remove all occurences(Yes/No)?${ENDFORMAT}"
	#allows user to choose to remove all results, or to select a specific line number to remove
	while :; do
		read rm_all
		case $rm_all in

			[yY] | [yY][Ee][Ss] )
				echo -e "\n${BOLD}You have chosen to remove all occurences above. Are you sure?${ENDFORMAT}"
				while :; do
					read sure
					#makes sure the user does not remove all accidently
					case $sure in
						[yY] | [yY][eE][Ss] )
							grep -i $searchTerm hockeyPlayers.txt | sed -i "/$searchTerm/Id" hockeyPlayers.txt
							echo "All Players matching $searchTerm Removed"
							break 2
							;;
						[nN] | [nN][oO] )
							echo "You chose No. Exiting out to the main menu..."
							break 2
							;;
						* )
							echo "${RED}Please enter Yes or No only${ENDFORMAT}"
			                                break
							;;
					esac
				done
				;;
			[nN] | [nN][oO] )
				allows user to remove specific line numbers from results
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
#delete temporary file
rm playersToRemove.txt 2> /dev/null

