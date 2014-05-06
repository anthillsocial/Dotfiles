echo "sudo nmap -sP 192.168.43.0/24 | grep grep \"Nmap scan report\""
echo "[Specify the correct IP for your LAN/WLAN]"
sudo nmap -sP 192.168.43.0/24 | grep "Nmap scan report"
