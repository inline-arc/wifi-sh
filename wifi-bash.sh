#!/usr/bin/env bash


printf "           _   __  _              _     
__      __(_) / _|(_)        ___ | |__  
\ \ /\ / /| || |_ | | _____ / __|| '_ \ 
 \ V  V / | ||  _|| ||_____|\__ \| | | |
  \_/\_/  |_||_|  |_|       |___/|_| |_|
                                        
"


# getting wifi name 
AP=$(iwconfig wlp2s0 | grep 'ESSID:' | awk '{print $3}' | sed 's/ESSID://g' | sed 's/"//')
echo $AP

tool=qrencode

# your password is safe 
echo "Whats your wifi password! shussh is safe"
read  -s wifipass

# qrencode command 
comd=$($tool -s 6 -l H -o "wifi.png" "WIFI:T:WPA;S:<$wifiname>;P:<$wifipass>;;")
echo $comd

# display img with sxiv 
img=$(sxiv wifi.png)
echo $img

#del the image from sys after display is over
del=$(rm wifi.png)
echo $del

