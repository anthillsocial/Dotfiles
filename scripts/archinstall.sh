# SET VARIABLES
HOSTNAME=ArchT440
DEFAULTUSER=tom

start_me(){
	#installA
	installB
}
installB(){
	pacman -S ntp
	cp /etc/ntp.conf /etc/ntp.conf.backup
	echo -e "server 0.pool.ntp.org iburst\nserver 1.pool.ntp.org iburst\nserver 2.pool.ntp.org iburst\nserver 3.pool.ntp.org iburst\n" > /etc/ntp.conf

	# Video
	pacman -S xorg-server xorg-xinit xorg-server-utils mesa xorg-twm xorg-xclock xterm

        #Mouse and trackpad
        pacman -S xf86-input-synaptics
}
installA(){
	# THE INSTALL SCRIPT
	# set the root password and default user
	echo -e "\nSET ROOT PASSWORD:\n"
	passwd
	useradd -m -g -G wheel,storage,power -s /bin/bash $DEFAULTUSER
	echo -e "\nSET USER PASSWORD FOR $DEFAULTUSER:\n"
	passwd $DEFAULTUSER

	# Install some default apps
	pacman -S vim sudo git alsa-utils

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
	pacman -S terminus-font
	setfont ter-p16n.psf.gz
	echo -e "KEYMAP=uk\nFONT=ter-p16n.psf.gz" > /etc/vconsole.conf

	# Set time zone
	ln -s /usr/share/zoneinfo/Greenwich /etc/localtime
	hwclock --systohc --utc
	systemctl start ntpd.service
	systemctl enable ntpd.service
	ntpq -np

	# Set a hostname
	cp /etc/hosts /etc/hosts.backup
	echo $HOSTNAME > /etc/hostname
	echo "127.0.0.1	localhost.localdomain	localhost	$HOSTNAME" >> /etc/hosts

	# Setup network for: wiredAutoplug, wifimenu, netctl-auto
	pacman -S ifplugd dialog wpa_actiond
	ip a

	# Do by hand
	echo -e "DO THESE FINAL THINGS BY HAND:\n"
	echo "RUN:\nEDITOR=vim visudo"
	echo "Then scroll down until you find this line and uncomment it:\n %wheel ALL=(ALL) ALL\n"
	echo -e "RUN:\n systemctl enable netctl-ifplugd@interface_name.service\n"
}
start_me

