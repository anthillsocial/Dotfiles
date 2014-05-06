echo "====== lspci -k | grep -i network ============="
lspci -k | grep -i -A3 network
echo "======= ip link set wlp4s0 up; ip link ============"
ip link set wlp4s0 up
ip link
echo "========= dmesg | grep firmware ============"
dmesg | grep firmware
echo "====== dmesg | grep iwl ==============="
dmesg | grep iwl
echo "====================="
