df -h;
echo "";
echo "INSTRUCTIONS";
echo "1. Insert sd card"
echo "2. List connected drives: \$ df -h"
echo "3. Grab the SD card name: Remove the last part of the drive ref ('1' or 'p1') ie '/dev/mmcblk0p1' becomes '/dev/mmcblk0'";
echo "4. Unmount the SD card: \$ umount /dev/mmcblk0*";
echo "5. Copy the Rpi disk image: \$ dcfldd bs=4M if=~/imagetowrite.img of=/dev/mmcblk0";
echo "NAVIGATE TO .img DIR & TRY THIS";
echo "sudo umount /dev/mmcblk0*;sudo dcfldd bs=4M if=2013-07-26-wheezy-raspbian.img of=/dev/mmcblk0";
echo "";
