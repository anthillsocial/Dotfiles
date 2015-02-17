ip a | grep BROADCAST | awk '{print substr($2,0, length($2)-1)}' 
ip a | grep BROADCAST | awk '{print substr($2,0, length($2)-1)}' | xargs -I{} cat /sys/class/net/{}/address
