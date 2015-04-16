#!/bin/bash
echo 'BACKUP CURRENT SD CARD';
echo 'Please name the file:'
read NAME
echo 'SAVING...'
D=`date +"%d.%m.%Y-%R"`
sudo dd if="/dev/mmcblk0" of="$NAME.$D.img"
echo "$NAME.$D.img has been saved"
