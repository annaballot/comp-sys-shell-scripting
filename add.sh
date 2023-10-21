#!/bin/bash
#Author: Anna Ballot
#Program Description:
#This script allows the user to add a player to the file, and does the appropriate error checkin on each field


#should have added an option to return to the main menu here, but already covered this in report.sh and search.sh
echo
echo "${BOLD}Enter the players First and Last Name:${ENDFORMAT}"
echo "(Enter two words seperated by one space)"
while :; do
	read playerName
	num_nms=$(echo "$playerName" | wc -w)
		#error checking to see if user has entered both a first name and last name (and no more).
		if [[ $num_nms -ne 2 ]]
		then
			echo "${RED}Please enter first and last name only${ENDFORMAT}"
		else
			break
		fi
done
echo -e "\n${BOLD}Enter players phone number (10 digits,beginning with 0):${ENDFORMAT}"
while :; do
	read phoneNum
		#check that the phone number only contains numbers, is 10 digits long, and starts with 0
		if [[ $phoneNum =~ ^[0-9]{10}+$ ]] && [[ ${phoneNum::1} -eq 0 ]]
		then
			break
		else
			echo "${RED}Please enter a 10 digit number, beginning with 0${ENDFORMAT}"
		fi
done
echo -e "\n${BOLD}Enter email address:${ENDFORMAT}"
while :; do
	read email
		#check the input is in an email address format (example@domain.com)
		if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
		then
			break
		else
			echo "${RED}Please enter a valid email address in the format example@domain.com${ENDFORMAT}"
		fi
done
echo -e "\n${BOLD}Enter Club Name (One word Only)${ENDFORMAT}"
while :; do
	read club
	#error checking to check only one word for the club name is input
	num_wds=$(echo "$club" | wc -w)
		if [[ $num_wds -ne 1 ]]
		then
			echo "${RED}Please enter one word only${ENDFORMAT}"
		else
			break
		fi
done
echo -e "\n${BOLD}Enter division player plays (1-4)${ENDFORMAT}"
echo "1) Division 1"
echo "2) Division 2"
echo "3) Division 3"
echo "4) Division 4"
while :; do
	read division
	#error checking to make sure only numbers are input, and that they are in the valid range
	[[ $division =~ ^[0-9]+$ ]] || { echo "${RED}Enter a valid number${ENDFORMAT}"; continue;}
	if (($division >=1 && $division <=4)); then #valid number chosen
		break
	else
		echo "${RED}Choose a number between 1 - 4${ENDFORMAT}"
	fi
done
sleep 1
#shows all inputted values back to user
echo -e "\n${BOLD}The details you have entered are:${ENDFORMAT}"
echo "Player Name: $playerName"
echo "Phone Number: $phoneNum"
echo "Email: $email"
echo "Club: $club"
echo "Division: $division"
echo -e "\n${BOLD}Would you like to add these to the file? (Yes/No)${ENDFORMAT}"
while :; do
	read addDetails
	#checks with user whether they want to add the above details to the file
	case $addDetails in

		[yY] | [yY][Ee][Ss] )
			echo $playerName, $phoneNum $email $club $division  >> hockeyPlayers.txt
			echo -e "\nUser added!"
			break
			;;

		[nN] | [nN][oO] )
			echo -e "\nUser Discarded"
			break
			;;
		*)
			echo "${RED}Invalid option, Choose Yes or No${ENDFORMAT}"
			;;
	esac
done
sleep 1
