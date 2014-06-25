#!/bin/bash
set -e
playlistdir=/home/tom/.local/share/mopidy/local/playlists

declare -A radios
radios["BBC Radio 4"]="http://www.bbc.co.uk/radio/listen/live/r4_aaclca.pls"
radios["BBC 6 Music"]="http://www.bbc.co.uk/radio/listen/live/r6_aaclca.pls"
radios["BBC Radio 3"]="http://www.bbc.co.uk/radio/listen/live/r3_aaclca.pls"

for k in "${!radios[@]}"
do
filepath="${playlistdir}/${k}.m3u"
rm -f "$filepath"
echo "#EXTM3U" >> "$filepath"
pls=${radios[$k]}
echo "#EXTINF:-1, BBC - $k" >> "$filepath"
curl -s $pls | grep File1 | sed 's/File1=\(.*\)/\1/' >> "$filepath"
done
