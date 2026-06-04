#!/bin/bash
tput civis
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
RESET='\e[0m'

if ! sudo -v; then
	printf "\r${RED}Authentication failed.${RESET} \n"
	tput cnorm
	exit 1
else
	printf "\r${GREEN}Authentication successful.${RESET} \n"
fi
SPINNER='|/-\'
spinner()
{
	MESSAGE="$1"
	PID="$2"
	
	while kill -0 "$PID" 2>/dev/null
	do
		for ((i=0; i<4; i++))
		do
			printf "\r${YELLOW}${MESSAGE} ${SPINNER:$i:1}      ${RESET}"
			sleep 0.1
		done
	done
}

sudo apt update > /dev/null 2>&1 &
PID=$!
spinner "Fetching updates" "$PID"

UPGRADABLE=$(apt list --upgradable 2>/dev/null | tail -n +2)

if [ -n "$UPGRADABLE" ]; then
	printf "\r${YELLOW}Updates Available. Please wait..${RESET} 							\n"
	echo
	sleep 0.5
	apt list --upgradable
	echo
	sudo apt upgrade -y > /dev/null 2>&1 &
	PID=$!
	spinner "Installing updates" "$PID"
	printf "${CYAN}\rUpdates installed.                  ${RESET}  							\n"
	sudo apt autoremove -y > /dev/null 2>&1 &
	PID=$!
	spinner "System cleanup" "$PID"
	printf "\r${CYAN}Cleanup completed                  ${RESET} 							\n"
	printf "\n${GREEN}System is up to date.             ${RESET}\n"
else
	printf "${GREEN}System is already up to date..${RESET}    \n"
fi
echo
tput cnorm