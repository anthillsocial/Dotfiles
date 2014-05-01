# PAGE LOGIC
start(){
  mount_T440p
}

# CHROOT MOUNT FOR GOAT
mount_goat(){
	mkdir /mnt/sda1
	mkdir /mnt/sda2
	mkdir /mnt/root
	mount /dev/sda1 /mnt/sda1
	mount /dev/sda2 /mnt/sda2
	mount -o defaults,relatime,subvol=rootfs /dev/sda2 /mnt/root
	mount -o defaults,relatime,subvol=home /dev/sda2 /mnt/root/home
	mount -o defaults,relatime,subvol=pacpkg /dev/sda2 /mnt/root/var/cache/pacman/pkg
	mount /dev/sda1 /mnt/root/boot/efi
	echo "/dev/sda1 = 1GB EFI System Partition (ESP) Fat32"
	echo "/dev/sda2 = Rest of disk as btrfs filesystem"
	echo "/dev/sda3 = 4GB swap disk (if its a laptop)"
	echo "USE:"
	echo "arch-chroot /mnt/root /bin/bash"
}

# CHROOT MOUNT FOR T440P
mount_T440p(){
	mkdir /mnt/rootfs
	mount -o defaults,relatime,,discard,ssd,subvol=rootfs -L "ArchOS" /mnt/rootfs
	mount -o defaults,relatime,subvol=home -L "home" /mnt/rootfs/home
	mount -o defaults,relatime,subvol=pacmanpkg -L "home" /mnt/rootfs/var/cache/pacman/pkg
	mount -L "ESP" /mnt/rootfs/boot/efi
	arch-chroot /mnt/rootfs /bin/bash
}

start
