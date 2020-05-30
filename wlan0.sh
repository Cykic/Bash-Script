service NetworkManager restart
iwconfig 
airmon-ng start wlan0 
sudo airmon-ng start wlan0 
sudo airmon-ng stop wlan0mon
ifconfig wlan0 up
sudo ifconfig wlan0 up
sudo iwconfig wlan0 channel auto
result=$(sudo ifconfig |grep wlan | awk '{print $1}')
echo "$result RESTORED!!!! script by Cykic"
exit

