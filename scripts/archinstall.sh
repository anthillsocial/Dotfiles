# SET VARIABLES
# I should invetsigate: https://bitbucket.org/flexiondotorg/archinstaller
HOSTNAME=ArchT440
DEFAULTUSER=tom
REALNAME="Tom Keene"
WIFIINTERFACE=wlp4so
ETHINTERFACE=enp0s25

start_me(){
	#installA
	#installnetwork
	#installmanual
	#installuser
	#installsecurity
	#installmousetrackpad
	#installsearch
	#installpacker
	#installvideo
	#installT440pvideo
	#installdesktop
	#installcinnamon
	#installdesktopapps
	#installbluetooth
	#checkforerrors
}
installbluetooth(){
	pacman -S bluez bluez-utils 
	packer -S cinnamon-bluetooth
	modprobe btusb
	systemctl start bluetooth
	gpasswd --add $DEFAULTUSER lp
}
installcinnamon(){
	pacman -S cinnamon
	echo "Add to: pacman.conf\n[cinnamon]\nServer = http://www.equinox-project.org/repos/arch/$arch\n"
	echo "Add to: ~/.xinitrc\nexec cinnamon-session"
	echo "For auto start add to end of:~/.bash_profile\n[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx"

}
installdesktopapps(){
	# some base apps
	packer -S nemo
	pacman -S gnome-terminal chromium
	
	# Nice .pdf reader
	packer -S zathura zathura-pdf-poppler zathura-ps zathura-djvu

	# Install Zim with a spell checker
	packer -S zim-bzr gtkspell python2-gtkspell aspell-en 
	
	# Install dropbox and Create service
	pacman -S dropbox nemo-dropbox-git
	systemctl enable dropboxd.service
	systemctl start dropbox.d.service

	# owncloud client
	packer -S owncloud-client
}
checkforerrors(){
 	# search for potential errors in dmesg or journalctl
	dmesg | egrep -i -A2 -B2 'unsupported|warn|error|disabl|not|doesn|bug' 
}
instalvideo(){
	# Xorg dispaly install
	pacman -S xorg-server xorg-xinit xorg-server-utils mesa xorg-twm xorg-xclock xterm 

	# Idenify video cards
	lspci | grep VGA

	#Install a default fallback video driver
	pacman -S xf86-video
}
installT440pvideo(){
	#video dependencies
	pacman -S intel-dri xf86-video-intel bumblebee primus virtualgl 
        
	#Potential issues with:
	pacman -S bbswitch
	pacman -S lib32-virtualgl lib32-primus nvidia lib32-nvidia-utils lib32-intel-dri
	
	# Video switching
	gpasswd -a root bumblebee
	gpasswd -a $DEFAULTUSER bumblebee
	systemctl enable bumblebeed.service
	systemctl start bumblebeed.service
}
installpacker(){
	# Install packer 
	pacman -S base-devel fakeroot jshon expac
	mkdir /opt/packer
    chown $DEFAULTUSER /opt/packer
    cd /opt/packer
  	wget https://aur.archlinux.org/packages/pa/packer/PKGBUILD
    makepkg
    pacman -U packer-*.pkg.tar.gz
}
installmousetrackpad(){
        #Mouse and trackpad
        pacman -S xf86-input-synaptics
}
installsearch(){
        # Add the 'locate' command for quck file searching
        pacman -S mlocate
        updatedb
}
installA(){
	# THE INSTALL SCRIPT
	# set the root password and default user
	echo -e "\nSET ROOT PASSWORD:\n"
	passwd
	#useradd -m -g $DEFAULTUSER -G wheel,storage,power,network -c $REALNAME -s /bin/bash $DEFAULTUSER
	useradd -m -G wheel -s /bin/bash $DEFAULTUSER
	echo -e "\nSET USER PASSWORD FOR $DEFAULTUSER:\n"
	passwd $DEFAULTUSER

	# Install some default apps
	pacman -S vim sudo git alsa-utils openssh vim-pathogen
    
    # Allow users to use sudo
    # pacman -S sudo
    # EDITOR=vim visudo
    # The uncomment the line: #%wheel      ALL=(ALL) ALL

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
	ln -sf  /usr/share/zoneinfo/Europe/London /etc/localtime
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
	pacman -S ifplugd dialog iw wpa_supplicant wpa_actiond dhcpcd
	ip link set $WIFIINTERFACE up
	ip link set $ETHINTERFACE up
	ip a
        systemctl enable netctl-ifplugd@ETHITERFACE.service
        systemctl enable netctl-auto@WIFIINTERFACE.service
	# if a card gets blocked then issue an: rfkill unblock 2
}
installmanual(){
	# Do by hand
	echo -e "DO THESE FINAL THINGS BY HAND:\n"
	echo "RUN:\nEDITOR=vim visudo"
	echo "Then scroll down until you find this line and uncomment it:\n %wheel ALL=(ALL) ALL\n"
	echo -e "RUN:\n systemctl enable netctl-ifplugd@interface_name.service\n"
	echo -e "ADD TO: /etc/profile\nexport EDITOR=vim"
}
installsecurity(){
    # Do by hand
    # Disable root login over SSH
    # vim /etc/ssh/sshd_config
    # SET:   PermitRootLogin no
    # systemctl restart sshd
}
start_me

