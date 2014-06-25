# Example
# ip addr add 158.223.2.137/255.255.0.0 broadcast 158.223.2.255 dev enp3s0
# ip route add default via 158.223.2.89
# Grab an IP address: dhcpcd enp3s0
# To delete an IP address: ip addr del 158.223.0.9/16 dev enp3s0
# Show details: clear;ip a show dev enp3s0

# ========= MANUAL SETUP =====================================

# OLD Variables
INTERFACE=enp3s0
IP=10.170.167.220
NETMASK=255.255.0.0
BROADCAST=10.170.255.255
GATEWAY=10.170.0.1
# ip addr add 10.170.167.220/16 broadcast 10.170.225.255 dev enp3s0
# ip route add default via 10.170.0.1
# echo "nameserver 10.1.70.0.1" > /etc/resolv.conf
# ip link set dev enp3s0 down;ip link set dev enp3s0 up
# ip addr del 10.170.167.220/16 dev enp3s0

# NEW Vars
IP=158.223.0.9
NETMASK=255.255.0.0
BROADCAST=158.223.255.255
GATEWAY=158.223.2.89 
# ip addr add 158.223.0.9/16 broadcast 158.223.225.255 dev enp3s0
# ip route add default via 158.223.2.89
# echo "nameserver 158.223.2.89" > /etc/resolv.conf
# ip link set dev enp3s0 down;ip link set dev enp3s0 up
# ip addr del 158.223.0.9/16 dev enp3s0


# ========= AUTO SETUP ======================================

# Lets flush old details
ip link set dev $INTERFACE down
ip link set dev $INTERFACE up

# Create a static IP
ip addr add $IP/$NETMASK broadcast $BROADCAST dev $INTERFACE

# Set default router
ip route add default via $GATEWAY

# To permanently add
# /etc/conf.d/network@$INTERFACE
#    address=$IP
#    `netmask=$NETMASK
#    broadcast=$BROADCAST
#    gateway=GATEWAY

