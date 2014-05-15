# ========================================
# Manually connect to a network interface
# Initisally connecting to ethy=ernet
#
# ========================================

# Vars
#IP=158.223.2.137
#MASK=255.255.0.0
#BROADCAST=158.223.2.255
#ROUTER=158.223.2.89

# 
IP=158.223.2.137
MASK=255.255.0.0
BROADCAST=158.223.2.255
ROUTER=158.223.2.89

# Grab interface names
ETH_INTERFACE=`ip link | grep "2: e*" -m 1 | gawk -F: '{print $2}'`

# Flush old details
ip link set $ETH_INTERFACE down
ip link set $ETH_INTERFACE up

# Add the IP address 
ip addr add $IP/$MASK broadcast $BROADCAST dev $ETH_INTERFACE

# Set a default router: 
ip route add default via $ROUTER
