## TEXT COLORS
col='#aaaaaa'
colsep='#ff8700' 
colok='#00FF00'
colwarning='#ff0000'

## BATTERY MESSAGE 
batterycol=$colok
battery=`acpi -bat | grep "Battery" | awk '{print $4}' | cut -d '%' -f 1`
connected=`acpi -bat | grep "Adapter" | awk '{print $3}' | cut -d '%' -f 1`
if (($battery <= 20));
then batterycol=$colwarning 
fi
batteryspan='<span color="'$batterycol'">'$battery'&#37; '$connected'</span>'

## TEMPERATURE MESSAGE 
temp=`acpi -bat | grep "Thermal" | awk '{print $4}' | cut -d '%' -f 1`
tempspan='<span color="'$col'">'$temp'c</span>'

## SPACE MESSAGE
space=`df -h | grep 'home' | awk '{print $4}'`
space2=`df -h | grep 'sda1' | awk '{print $4}'`
spacespan='<span color="'$col'">'$space2'/'$space'</span>'

## WIFI MESSAGE
wifi=`netctl-auto list | grep '*'`
if (($wifi != 0));
 then 
	wifi=`netctl-auto list | grep '*'`
 else
	wifitxt='No Wifi'
fi

# MPD MESSAGE
mpdmsg=`lsof -Pan -i tcp -i udp | grep mpd | wc -l`
if (($mpdmsg != 0));
 then
    mpdmsg='<span color="'$colok'">mpdON</span>'
 else
    `mpd --kill;mpd`
    mpdmsg='<span color="'$colwarning'">mpdOFF</span>'
fi

## PRINT OUTPUT
echo ' | '$mpdmsg' | '$wifi' | '$spacespan' | '$batteryspan' | '$tempspan' | '
