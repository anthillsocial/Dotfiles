# PORT: 22 <-> 19998
su -s /usr/bin/sh autossh -c 'autossh -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 19998:localhost:22 autossh@theanthillsocial.co.uk';

# PORT: 80 <-> 19999
su -s /usr/bin/sh autossh -c 'autossh -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 19999:localhost:80 autossh@theanthillsocial.co.uk';

# PORT: 443 <-> 19997
su -s /usr/bin/sh autossh -c 'autossh -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 19997:localhost:443 autossh@theanthillsocial.co.uk';

