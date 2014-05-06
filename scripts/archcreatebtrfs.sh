mkfs.btrfs -l 16384 /dev/sda
mkdir /mnt/btrfs-root
mount -t btrfs /dev/sda /mnt/btrfs-root
btrfs quota enable /mnt/btrfs-root
btrfstune -x /dev/sda
cd /mnt/btrfs-root
btrfs subvolume create root_subvolume
cd root_subvolume
btrfs subvolume create home
trfs subvolume create var
btrfs subvolume create usr

