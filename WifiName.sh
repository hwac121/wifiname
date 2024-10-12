#!/bin/bash

#==============================================#
#                     DETAILS                  #
#==============================================#

# Title: Wifi Name
# Version: 1.0
# Date: Oct. 12, 2024
# Contact: hwac121@ptorbox.onion

# GitHub: https://github.com/hwac121/WifiName.git

#-----------------------------------------------------------------

# Description:
# A simple script to temporarily rename wifi cards on Parrot Home and Parrot Security OS.

#================================================================================================
#========                                 FUNCTIONS                                     ========#
#================================================================================================

Splash(){
	figlet "Wifi Name" | lolcat
	sleep 0.05
	echo "Version 1.0 designed for Parrot Security and Parrot Home OS\e[0m" | lolcat
	echo "Visit my channel on YouTube - Majik Cat Security" | lolcat
	echo "by Majik Cat Security" | lolcat
	sleep 0.05
	echo "......................................................................................"
	sleep .75
	echo " "
}

#================================================================================================
#========                          CHECK IF ROOT OR EXIT                                ========#
#================================================================================================

echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Now running as root..." | lolcat
sleep 2

#=================================================================================================
#========                                 MENU SYSTEM                                    ========#
#=================================================================================================

options=("Rename wlan0" "Rename wlan1" "Rename wlan2" "Rename wlan3" "Rename wlan4" "Quit")
PS3='Choose which WiFi card name to change:  '

while [ "$menu" != 1 ]; do
clear
Splash
select opt in "${options[@]}" ; do
		case $opt in
#=================================================================================================
#========                                 WiFi CARD MENU                                 ========#
#=================================================================================================
		"Rename wlan0")
			clear
			Splash
			echo "What is the exact name of the card you want to change to wlan0?"
			read curwlan0
			echo "Changing name to wlan0"
			ifconfig $curwlan0 down
			ip link set $curwlan0 name wlan0
			ifconfig wlan0 up
			sleep 6
		break
		;;
		"Rename wlan1")
			clear
			Splash
			echo "What is the exact name of the card you want to change to wlan1?"
			read curwlan1
			echo "Changing name to wlan1"
			ifconfig $curwlan1 down
			ip link set $curwlan1 name wlan1
			ifconfig wlan1 up
			sleep 6
		break
		;;
		"Rename wlan2")
			clear
			Splash
			echo "What is the exact name of the card you want to change to wlan2?"
			read curwlan2
			echo "Changing name to wlan2"
			ifconfig $curwlan2 down
			ip link set $curwlan2 name wlan2
			ifconfig wlan2 up
			sleep 6
		break
		;;
		"Rename wlan3")
			clear
			Splash
			echo "What is the exact name of the card you want to change to wlan3?"
			read curwlan3
			echo "Changing name to wlan3"
			ifconfig $curwlan3 down
			ip link set $curwlan3 name wlan3
			ifconfig wlan3 up
			sleep 6
		break
		;;
		"Rename wlan4")
			clear
			Splash
			echo "What is the exact name of the card you want to change to wlan4?"
			read curwlan4
			echo "Changing name to wlan4"
			ifconfig $curwlan4 down
			ip link set $curwlan4 name wlan4
			ifconfig wlan4 up
			sleep 6
		break
		;;
#=================================================================================================
#========                               QUIT FUNCTION                                    ========#
#=================================================================================================
		"Quit")
			clear
			Splash
			echo -e " "
			echo -e "\e[37mThank you for using Wifi Rename 1.0 by Majik Cat Security - Oct. 2024\e[0m"
			sleep 3
			clear
			menu=1
		break
		;;
#=================================================================================================
#========                        ERROR CAPTURE - INVALID OPTION                          ========#
#=================================================================================================
		*) 
			clear
			Splash
			echo -e "invalid option $REPLY"
		break
		;;
		esac
	done
done
