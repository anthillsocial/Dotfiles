#!/bin/bash
DEVICE="enp0s25"
ROUTERIP=139.96.30.1 # 192.168.123.1
ip link set $DEVICE down
ip link set $DEVICE up
ip addr add $ROUTERIP/24 dev $DEVICE # arbitrary address
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o internet0 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $DEVICE -o internet0 -j ACCEPT
# Config for the dhcp server vim /etc/dhcpd.conf 
#Config file: /etc/dhcpd.conf
#Database file: /var/lib/dhcp/dhcpd.leases
#PID file: /var/run/dhcpd.pid
dhcpd $DEVICE 
