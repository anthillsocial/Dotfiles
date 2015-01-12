# Share internet connection accross netwoirk interfaces
SHARE=wlp4s0 # Wifi
OVER=enp0s25 # Ethernet
sudo ip link set up dev $OVER
sudo ip addr add 192.168.123.100/24 dev $OVER
sudo ip addr add 192.168.123.100/24 dev $OVER
sudo sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o $SHARE -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o $SHARE -j MASQUERADE
iptables -A FORWARD -i $OVER -o $SHARE -j ACCEPT
sudo iptables -A FORWARD -i $OVER -o $SHARE -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

