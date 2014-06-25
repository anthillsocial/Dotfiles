ETH_INTERFACE=`ip link | grep "2: e*" -m 1 | gawk -F: '{print $2}'`
WIFI_INTERFACE=`ip link | grep "3: e*" -m 1 | gawk -F: '{print $2}'`
ip link set $WIFI_INTERFACE down
ip link set $WIFI_INTERFACE up
ip link set $ETH_INTERFACE down
ip link set $ETH_INTERFACE up
sudo systemctl restart netctl-auto@wlp4s0.service
