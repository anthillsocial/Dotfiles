LOCAL_USER=alocalusername
REMOTE_USER=aremoteusername
REMOTE_PORT=1234
LOCAL_PORT=1233
REMOTE_ADDR=awebsite.co.uk

#=====================================================================================
# Whats happening:
# $LOCAL_USER ssh $REMOTE_USER@$REMOTE_ADDR then map $REMOTE_PORT to $LOCAL_PORT
#=====================================================================================
su -s /usr/bin/sh $LOCAL_USER -c '$LOCAL_USER -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R $REMOTE_PORT:localhost:$LOCAL_PORT $REMOTE_USER@$REMOTE_ADDR';



