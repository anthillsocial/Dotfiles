#!/bin/bash 
# Read Better Bash in 15 mins: 
# http://robertmuth.blogspot.co.uk/2012/08/better-bash-scripting-in-15-minutes.html
# Ref undefined vars & Ignore failing commands
set -o nounset
set -o errexit

# Set My Vars
SetVars() {
	# Check if an argument has been defined 
	COM1=${1:-Unset}
	if [ "$COM1" == "Unset" ] 
	then
		echo -e "Help:"
		echo " A. Create ADHOC network: networkcreateadhoc.sh adhoc WIFI ETH SSID PASS"
		exit
	else
		COM1=$1
	fi
    	echo "SELECT INTERFACE [0:wlp3s0 1:wlan0]:  " 
    	IFACE=wlp3s0
    	read INPUT
	if [ $INPUT == "1" ] ; then
		IFACE=wlan0
	fi
	MySSID=AntSSID
}

ShareNetwork(){
	create_ap $WIFI $ETH $SSID $PASS
}

# Script control logic
ControlLogic() {
	if [ $COM1 == "create"] ; then
		ShareNetwork
	fi
	if [ $COM1 == "start" ] ; then
	    Start
	fi
	if [ $COM1 == "stop" ] ; then
		printf "\n STOP ADHOC NETWORK\n"
		Stop
	fi
	if [ $COM1 == "status" ] ; then
		Status
	fi
}

# Functions
Start() {
	printf "\nSTART ADHOC NETWORK ON: $IFACE\n"
	# Stop any old links
	Stop
	# Setup the interface
	ip link set $IFACE up
	iw $IFACE  set type ibss
	iw $IFACE ibss join $MySSID 2432

	# Assign an IP address anmd start the DHCP server
	ip link set up dev $IFACE
	ip addr add 139.96.30.100/24 dev $IFACE
	systemctl start dhcpd4@$IFACE.service
}
Stop() {
	# Stop the network
	ip link set $IFACE down
	systemctl stop dhcpd4@$IFACE.service
	ip addr flush dev $IFACE
}
Status() {
	printf "\nSTATUS: ip a \n"
	# Show the status
	ip a
	printf "\n\nSTATUS: iw dev $IFACE info\n"
	iw dev $IFACE info
    printf "\n\nSTATUS: dmesg | grep firmware | grep wifi\n"
	dmesg | grep firmware | grep wifi
	echo ""
}
# Run the script
SetVars
ControlLogic


