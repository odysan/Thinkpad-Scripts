#!/bin/sh

xinput list > output123.txt
grep TouchPad output123.txt > lineofoutput123.txt
value=`awk '/id\=/ {print $6 }' lineofoutput123.txt | cut -c 4-`
echo "Enter 1 to enable touchpad, 0 to disable touchpad"
read input

case $input in
1)
	xinput set-prop $value "Device Enabled" $input
	echo "Touchpad enabled"
	;;
0)
	xinput set-prop $value "Device Enabled" $input
	echo "Touchpad cancelled"
	;;
*)
	echo "Wrong input. Exitting."
	;;
esac

rm output123.txt
rm lineofoutput123.txt
