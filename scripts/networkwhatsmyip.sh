# USAGE:  './networkwhatsmyip.sh URLTOPOSTTO KEY'
PUBLICIP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
#echo $PUBLICIP > /tmp/publicip.txt
URL="$1?key=$2&post=$PUBLICIP"
RESPONSE=$(curl -s $URL)
echo "SEND:$PUBLICIP TO:$URL RESPONSE:$RESPONSE"
