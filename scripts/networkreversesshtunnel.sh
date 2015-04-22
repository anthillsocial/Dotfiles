USER=autosshusser
REMOTE=remotreserveraddress.co.uk
# PORT: 22 <-> 18698
su -s /usr/bin/sh autossh -c '$USER -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 18698:localhost:22 $USER@$REMOTE';

# PORT: 80 <-> 18699
su -s /usr/bin/sh autossh -c '$USER -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 18699:localhost:80 $USER@$REMOTE';

# PORT: 443 <-> 18697
su -s /usr/bin/sh autossh -c '$USER -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 18697:localhost:443 $USER@$REMOTE';

