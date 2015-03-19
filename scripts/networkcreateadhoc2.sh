DEVICE="wlp0s20u2"
ESSID="sonic-me"
#iwconfig $DEVICE ap any
#iwconfig $DEVICE txpower 30mW
#http://www.teamxlink.co.uk/forum/viewtopic.php?p=233117
sudo rfkill unblock wifi
ip link set $DEVICE down
iwconfig $DEVICE mode ad-hoc
iwconfig $DEVICE channel 1
iwconfig $DEVICE essid $ESSID
#iwconfig $DEVICE retry 0
ip link set $DEVICE up 

