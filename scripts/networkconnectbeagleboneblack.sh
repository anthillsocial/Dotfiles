# Instructions from: https://github.com/anujdeshpande/BBB-workshop
echo "REMEMBER TO SU ROOT THEN RUN"
DEVICE=$(ip a | grep enp | awk '/enp/{i++}i==2' | awk '{print $2}' | sed 's/:$//')
echo "Attempt to connect via $DEVICE"
# On the machine providing internet
iptables -A POSTROUTING -t nat -j MASQUERADE
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null
# On the beaglebine black (poss other machines)
# /sbin/route add default gw 192.168.7.1
# echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sudo ip link set $DEVICE up
sudo killall dhcpcd
sudo dhcpcd $DEVICE
ssh sonic@192.168.7.2
