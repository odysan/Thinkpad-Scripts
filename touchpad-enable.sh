#!/bin/sh

xinput list > output123.txt
grep TouchPad output123.txt > lineofoutput123.txt
value=`awk '/id\=/ {print $6 }' lineofoutput123.txt | cut -c 4-`
xinput set-prop $value "Device Enabled" 1
rm output123.txt
rm lineofoutput123.txt
sudo -E -u cody notify-send "Trackpad Settings" "Trackpad is now enabled"
