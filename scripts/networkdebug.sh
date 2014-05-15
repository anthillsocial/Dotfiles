echo -e "\n====== lspci -k | grep -i network ============="
lspci -k | grep -i -A3 network
echo -e "\n======= ip link set wlp4s0 up; ip link ============"
ip link set wlp4s0 up
ip link
echo -e "\n========= dmesg | grep firmware ============"
dmesg | grep firmware
echo -e "\n====== dmesg | grep iwl ==============="
dmesg | grep iwl
echo -e "\n======== lsmod ========================"
lsmod
echo -e "\n================================== /n"

