ETH_INTERFACE=`ip link | grep "2: e*" -m 1 | gawk -F: '{print $2}'`
WIFI_INTERFACE=`ip link | grep "3: e*" -m 1 | gawk -F: '{print $2}'`
sudo ip link set $WIFI_INTERFACE down
sudo ip link set $WIFI_INTERFACE up
sudo ip link set $ETH_INTERFACE down
sudo ip link set $ETH_INTERFACE up
sudo systemctl restart netctl-auto@wlp4s0.service
sudo systemctl restart netctl-auto@wlp0s29u1u1.service
sudo rfkill unblock 1
# sudo rfkill list all
