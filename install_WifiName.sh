#!/bin/bash

# Title: Wifi Name
# Version: 1.0
# Date: Oct. 12, 2024
# Contact: hwac121@ptorbox.onion

# GitHub: https://github.com/hwac121/WifiName.git

#-----------------------------------------------------------------

# Description:
# A simple script to temporarily rename wifi cards on Parrot Home and Parrot Security OS.

#=======================================================================
#                         FUNCTIONS
#=======================================================================

splash(){
	echo -e "\e[33mWifi Name\e[0m"
	echo -e "\e[32mVersion 1.0 for Parrot Home & Parrot Security OS\e[0m"
	echo -e "\e[32mby Majik Cat Security\e[0m"
}

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root\e[0m"
	sleep 0.5
  exit
fi

#===================================================================#
#			 CHECK FOR DEPENDENCIES                     #
#===================================================================#

clear
splash
echo " "
echo -e "\e[35mINSTALLATION PROCESS...\e[0m"
echo " "
echo -e "\e[35mby Majik Cat Security\e[0m"
sleep 2

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nala | grep "install ok installed")
echo Checking for nala: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo -e "\e[35mnala not installed. Attempting to install nala now...\e[0m"
  sleep 0.15
  apt-get install nala
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' figlet | grep "install ok installed")
echo Checking for figlet: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo -e "\e[35mfiglet not installed. Attempting to install figlet now...\e[0m"
  sleep 0.15
  nala install figlet
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' lolcat | grep "install ok installed")
echo Checking for lolcat: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo -e "\e[35mlolcat not installed. Attempting to install lolcat now...\e[0m"
  sleep 0.15
  nala install lolcat
  gem install lolcat
fi

#===================================================================
#			             MAIN INSTALLATION
#===================================================================

echo -e " "
echo -e "\e[35mMaking WifiName available globally...\e[0m"
rm /bin/wifiname
cp WifiName.sh /bin/wifiname
sleep 0.5
echo -e " "
echo -e "\e[35mSetting proper permissions...\e[0m"
chmod +x /bin/wifiname
sleep 0.5
echo -e " "
echo -e "\e[35mJust type wifiname anywhere in terminal to use this utility.\e[0m"
sleep 5
