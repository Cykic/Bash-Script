#!/bin/bash
read -p 'ESSID: ' eSSID
read -s -p 'KEY: ' key
sudo iwconfig wlan0 essid $eSSID key $key

