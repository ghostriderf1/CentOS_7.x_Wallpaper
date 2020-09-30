#!/bin/bash

sleep 5			# allow time for the network settings to load on boot

SCHOME=/home/user/Share/wallpaper # edit user
BG=$SCHOME/bg.png
ORIGWALL=/usr/share/backgrounds/backup/default.jpg
NEWWALL=$SCHOME/wallpaper.png
WALL=/usr/share/backgrounds/default.jpg

> $BGFILE

 
B_HOSTNAME=`hostname`
B_IPADDRESS=`ifconfig | awk '/inet 10/ {print $2}'` # edit inet xxx for first octet of ip address to be shown

echo   Project Name >> $BGFILE # edit project name
echo  $B_HOSTNAME >> $BGFILE
echo  $B_IPADDRESS >> $BGFILE


cat $BGFILE | \
convert -font Liberation-Serif -pointsize 60 \
        -background none \
        -fill white \
		-gravity center \
        label:@- $BG 
 
composite -gravity center $BG $ORIGWALL $NEWWALL
cp $NEWWALL $WALL

gconftool-2 --type string --set /desktop/gnome/background/picture_filename /home/user/Share/wallpaper/wallpaper.png # edit user 
