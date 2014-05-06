# SNAPSHOT ID's to rollback to 
ROOTFSID=NotSet
HOMEID=NotSet

# REMEMBER
# Disconnect internet
# Stop owncloud

echo "Check the conents of this script before running. HOMEID=$HOMEID ROOTFSID=$ROOTFSID"
exit 1

# Move the screwed up version of the filesystem out the way
mv /mnt/sda2/home /mnt/sda2/home-bad  
mv /mnt/sda2/rootfs /mnt/sda2/rootfs-bad

# And rollback to the previous snapshot
mv /mnt/sda2/rootfsPRE /mnt/sda2/rootfs
mv /mnt/sda2/homePRE /mnt/sda2/home

# OR create a new snapshot from an older snapshot
# btrfs subvolume snapshot /mnt/sda2/rootfs/.snapshots/$ROOTFSID/snapshot /mnt/sda2/rootfs
# btrfs subvolume snapshot /mnt/sda2/home/.snapshots/$HOMEID/snapshot /mnt/sda2/home



