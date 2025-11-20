#!/bin/bash


line(){
printf "\n"
}

echo -e "\e[38;2;184;255;68m
  _   _  ___           _ _        _    _   _ 
 | \ | |/ _ \__      _(_) |      / \  | \ | |
 |  \| | | | \ \ /\ / / | |     / _ \ |  \| |
 | |\  | |_| |\ V  V /| | |___ / ___ \| |\  |
 |_| \_|\___/  \_/\_/ |_|_____/_/   \_\_| \_|

\e[0m"

line

while true; do
if [ $(ifconfig | grep -oE "wlan0") == "" ]; then
echo -e "The Wlan0 network interface is not operational\n"
else
echo -e "Operational Wlan0 network interface\n"
break
fi

sleep 2
done

# echo -e "IP-local: $(ifconfig | grep -oE "inet ([0-9]{1,3}\.){3}[0-9]{1,3}" | awk '{print $2}')\n"

while true; do

	read -p "What do you want to do with TCP? (-h): " wh
	line

	case $wh in

		cre)
			read -p "Specify the port: " port
			line
			echo -e "Waiting for a device to connect...\n"

			nc -l -p $port
			line
		;;

		con)
			read -p "Specify the port: " port
			line
			read -s -p "Specify the IP: " ip
			line

			echo -e "Waiting for the connection...\n"

			nc $ip $port
			line
		;;

		-d)
			echo -e "The download is about to start...\n"

			sudo apt install net-tools
			sudo apt install netcat-openbsd
			line
		;;

		exit)
			exit
		;;

		-v)
			echo -e "--NowiLAN-- V 0.0.1\n"
		;;
		-h)
			echo "With the command (cre) you can create a TCP server"
			echo "With the command (con) you can establish a connection with a TCP server"
			echo "With the command (-d) you can install all the necessary dependencies"
			echo "With the command (-v) you can see which version of NowiLAN you are using"
			echo -e "You can exit NowiLAN with the command (exit)\n"

		;;

 	esac


done
