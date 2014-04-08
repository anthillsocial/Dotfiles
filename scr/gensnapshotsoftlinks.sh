#!/bin/bash

#### SET THESE VARIABLES ###
# Snapper directory to grab snapshots from:
DIR=/home/.snapshots

# Directory to create softlinks in:
SOFTDIR=/home/citizensense/Desktop/SnapperBackups

### THE SCRIPT ###
# Delete then recreate the soflinks backups directory
rm -R $SOFTDIR
mkdir $SOFTDIR

# loop through and create softlinks to all the data snapshots 
ls $DIR $1 | while read X;
        do
        # Make sure that 'citizensense' can access the snapshots
        chgrp citizensense /home/.snapshots
        # Generate a directory name for the softlink
        SOFTX=$(stat /home/.snapshots/$X | grep Modify | cut -d ' ' -f2,3 | tr ' ' '-' | cut -d '.' -f1)
	THISDIR="/home/.snapshots/$X/snapshot/citizensense/OwnCloud/Citizen_Sense";
        NEWSOFTDIR="$SOFTDIR/$SOFTX"
        ln -s $THISDIR $NEWSOFTDIR;
	echo $THISDIR;
        echo $NEWSOFTDIR;
done
