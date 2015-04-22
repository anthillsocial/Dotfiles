df -h;
FILELIST=$(ls ./)
echo "";
echo "INSTRUCTIONS";
echo "1. Insert sd card"
echo "2. List connected drives: \$ df -h"
echo "3. Grab the SD card name: Remove the last part of the drive ref ('1' or 'p1') ie '/dev/mmcblk0p1' becomes '/dev/mmcblk0'";
echo "4. Unmount the SD card: \$ umount /dev/mmcblk0*";
echo "5. Copy the Rpi disk image: \$ dcfldd bs=4M if=~/imagetowrite.img of=/dev/mmcblk0";
echo "NAVIGATE TO .img DIR & TRY THIS";
echo "sudo umount /dev/mmcblk0*;sudo dd bs=4M if=RaspberryPiSwampPreOneShotFix.20.04.2015-14:29.img of=/dev/mmcblk0";
echo "";
sudo umount /dev/mmcblk0*;sudo dd bs=4M if=RaspberryPiSwampPreOneShotFix.20.04.2015-14:29.img of=/dev/mmcblk0

