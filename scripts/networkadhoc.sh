DEVICE="wlp0s26u1u2"
ifconfig $DEVICE down
iwconfig $DEVICE channel 4
iwconfig $DEVICE mode ad-hoc
iwconfig $DEVICE essid 'bikemesh'
#iwconfig $DEVICE key password
ifconfig $DEVICE 192.168.2.1
