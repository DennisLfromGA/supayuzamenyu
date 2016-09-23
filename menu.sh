#!/bin/bash
#Chromebook chroot menu

PS3='Please enter your choice (number): '
options=("Minecraft (full Ubuntu in separate environment)" "Window (full Ubuntu in Chrome window)" "Terminal (Ubuntu terminal in Chrome tab)" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"${options[0]}")
			sudo startxfce4 -X xorg
			;;
		"${options[1]}")
			sudo startxfce4 -X xiwi
			;;
		"${options[2]}")
			sudo bash ~/Downloads/crouton-crucial-master/crucial.sh -c "xiwi -T xfce4-terminal"
			;;
		"Quit")
			break
			;;
		*) echo "Invalid option" ;;
	esac
done

