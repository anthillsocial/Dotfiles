# SET VARIABLES
HOSTNAME=ArchT440
DEFAULTUSER=tom
REALNAME="Tom Keene"
WIFIINTERFACE=wlp4so
ETHINTERFACE=enp0s25

start_me(){
	#installA
	#installnetwork
	#installmanual
	#installB
	#installC
	#installvideo
	#installT440p
	#installdesktop
	installcinnamon
	#checkforerrors
}
installcinnamon(){
	pacman -S cinnamon
	echo "Add to: pacman.conf\n[cinnamon]\nServer = http://www.equinox-project.org/repos/arch/$arch\n"
	echo "Add to: ~/.xinitrc\nexec cinnamon-session"
}
checkforerrors(){
 	# search for potential errors in dmesg or journalctl
	dmesg | egrep -i -A2 -B2 'unsupported|warn|error|disabl|not|doesn|bug' 
}
instalvideo(){
	# Video
	pacman -S xorg-server xorg-xinit xorg-server-utils mesa xorg-twm xorg-xclock xterm 

	# Intel driver
	pacman -S xf86-video-intel lib32-intel-dri
	
	# for newer Intel GPU's
	pacman -S libva-intel-driver
}
installT440p(){
	#video dependencies
	pacman -S intel-dri xf86-video-intel bumblebee primus virtualgl 
        
	#Potential issues with:
	#pacman -S bbswitch
	#pacman -S lib32-virtualgl lib32-primus nvidia lib32-nvidia-utils lib32-intel-dri
	
	# Video switching
	gpasswd -a root bumblebee
	gpasswd -a $DEFAULTUSER bumblebee
	systemctl enable bumblebeed.service
	systemctl start bumblebeed.service
}
installC(){
	# TODO: This section needs work!!
	# Install packer 
	pacman -S base-devel fakeroot jshon expac
	mkdir /opt/packer
        chown $DEFAULTUSER /opt/packer
        cd /opt/packer
  	wget https://aur.archlinux.org/packages/pa/packer/PKGBUILD
        makepkg
        pacman -U packer-*.pkg.tar.gz
}
installB(){
        #Mouse and trackpad
        pacman -S xf86-input-synaptics
	
        # Add the 'locate' command for quck file searching
        pacman -S mlocate
        updatedb
}
installA(){
	# THE INSTALL SCRIPT
	# set the root password and default user
	echo -e "\nSET ROOT PASSWORD:\n"
	passwd
	useradd -m -g $DEFAULTUSER -G wheel,storage,power,network -c $REALNAME -s /bin/bash $DEFAULTUSER
	echo -e "\nSET USER PASSWORD FOR $DEFAULTUSER:\n"
	passwd $DEFAULTUSER

	# Install some default apps
	pacman -S vim sudo git alsa-utils
        
        # And setup pacman
	pacman-key --init
	pacman-key --populate archlinux

	# Set the locale
	echo "en_GB.UTF-8 UTF-8 " >> /etc/locale.gen
	locale-gen
	echo "LANG=en_GB.UTF-8" > /etc/locale.conf
	export LANG=en_GB.UTF-8

	# Setup the best mirror for pacman
	pacman -S reflector  
	cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
	reflector --verbose -l 100 --sort rate --save /etc/pacman.d/mirrorlist

	# Set fonts
	pacman -S terminus-font ttf-dejavu
	setfont ter-p16n.psf.gz
	echo -e "KEYMAP=uk\nFONT=ter-p16n.psf.gz" > /etc/vconsole.conf

	# Set time 
	ln -s /usr/share/zoneinfo/Greenwich /etc/localtime
	hwclock --systohc --utc
	systemctl start ntpd.service
	systemctl enable ntpd.service
	ntpq -np
	pacman -S ntp
	cp /etc/ntp.conf /etc/ntp.conf.backup
	echo -e "server 0.pool.ntp.org iburst\nserver 1.pool.ntp.org iburst\nserver 2.pool.ntp.org iburst\nserver 3.pool.ntp.org iburst\n" > /etc/ntp.conf

	# Set a hostname
	cp /etc/hosts /etc/hosts.backup
	echo $HOSTNAME > /etc/hostname
	echo "127.0.0.1	localhost.localdomain	localhost	$HOSTNAME" >> /etc/hosts
}
installnetwork(){
	# Setup network for: wiredAutoplug, wifimenu, netctl-auto rfkill
	pacman -S ifplugd dialog wpa_actiond
	ip link set $WIFIINTERFACE up
	ip link set $ETHINTERFACE up
	ip a
        systemctl enable netctl-ifplugd@ETHITERFACE.service
        systemctl enable netctl-auto@WIFIINTERFACE.service
}
installmanual(){
	# Do by hand
	echo -e "DO THESE FINAL THINGS BY HAND:\n"
	echo "RUN:\nEDITOR=vim visudo"
	echo "Then scroll down until you find this line and uncomment it:\n %wheel ALL=(ALL) ALL\n"
	echo -e "RUN:\n systemctl enable netctl-ifplugd@interface_name.service\n"
}
start_me

