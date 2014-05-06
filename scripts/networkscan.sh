echo "Select interface to scan [0:wlp3so 1:enp0s25]:  " 
read INPUT
if [ $INPUT == "1" ]
then
  echo "$INPUT: ARP-SCAN ETHERNET INTERFACE"
  sudo arp-scan --interface=enp0s25 --localnet
else
  echo "$INPUT: ARP-SCAN WIFI INTERFACE"
  sudo arp-scan --interface=wlp3s0 --localnet
fi
