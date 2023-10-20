#!/bin/bash
#Author: Anna Ballot
#Program Description:
#UPDATE
echo
echo "${BOLD}Enter the players First and Last Name:${ENDFORMAT}" #error checking to check first and last
echo "(Enter two words seperated by one space)"
while :; do
	read playerName
	num_nms=$(echo "$playerName" | wc -w)
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
echo -e "\n${BOLD}Enter Club Name (One word Only)${ENDFORMAT}" # change this to select options
while :; do
	read club
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
	[[ $division =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue;}
	if (($division >=1 && $division <=4)); then #valid number chosen
		break
	else
		echo "${RED}Choose a number between 1 - 4${ENDFORMAT}"
	fi
done
sleep 1
echo -e "\n${BOLD}The details you have entered are:${ENDFORMAT}"
echo "Player Name: $playerName"
echo "Phone Number: $phoneNum"
echo "Email: $email"
echo "Club: $club"
echo "Division: $division"
echo -e "\n${BOLD}Would you like to add these to the file? (Yes/No)${ENDFORMAT}"
while :; do
	read addDetails
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
	esac
done
sleep 1
