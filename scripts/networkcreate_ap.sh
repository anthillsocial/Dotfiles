WIFI=wlan0
ETH="enp3s0"
SSID="goat"
PASS="123456768"
NO_VIRT="--no-virt"


### passphrase (open network):
    #create_ap $WIFI $ETH $SSID $NO_VIRT

### WPA + WPA2 passphrase:
    #create_ap $WIFI $ETH $SSID $PASS $NO_VIRT

### AP without Internet sharing:
    #create_ap -n $WIFI $SSID $PASS $NO_VIRT

### Bridged Internet sharing:
    create_ap -m bridge $WIFI $ETH $SSID $PASS $NO_VIRT

### Internet sharing from the same WiFi interface:
    #create_ap $WIFI $WIFI $SSID $PASS $NO_VIRT

### Choose a different WiFi adapter driver
    #create_ap --driver rtl871xdrv $WIFI $ETH $SSID $PASS $NO_VIRT


