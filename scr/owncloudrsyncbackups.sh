# Snapper directory to grab snapshots from:
DIR=/home/.snapshots

# Directories to rsync to:
DAILYDIR=/home/citizensense/OwnCloud/BACKUP-daily
WEEKLYDIR=/home/citizensense/OwnCloud/BACKUP-weekly
MONTHLYDIR=/home/citizensense/OwnCloud/BACKUP-monthly
YEARLYDIR=/home/citizensense/OwnCloud/BACKUP-yearly

# Dates
DAYAGO=$(date --date="1 day ago" +"%Y-%m-%d")
WEEKAGO=$(date --date="1 week ago" +"%Y-%m-%d")
MONTHAGO=$(date --date="1 month ago" +"%Y-%m-%d")
YEARAGO=$(date --date="1 year ago" +"%Y-%m-%d")
echo "DAYAGO: $DAYAGO"
echo "WEEKAGO: $WEEKAGO"
echo "MONTHAGO: $MONTHAGO"
echo "YEARAGO: $YEARAGO"
echo "----------------------"

# loop through the snapshots 
ls $DIR $1 | while read X; do
        FOUND=0
        
        # Current directory
        THISDIR="/home/.snapshots/$X/snapshot/citizensense/OwnCloud/Citizen_Sense";

        # Grab dates directories were created
        DIRDATE=$(stat /home/.snapshots/$X | grep Modify | cut -d ' ' -f2)
        
        # Find day ago directory
        if [ $DIRDATE == $DAYAGO ]; then
        	echo "DAYAGO $DIRDATE"
                DAYAGO="FOUND"
                FOUND=1
                rsync -rtvu --delete /home/citizensense/OwnCloud/Citizen_Sense $DAILYDIR
	fi

        # Find week ago directory
        if [ $DIRDATE == $WEEKAGO ]; then
                echo "WEEKAGO $DIRDATE"
                WEEKAGO="FOUND"
                FOUND=1
                rsync -rtvu --delete /home/citizensense/OwnCloud/Citizen_Sense $WEEKLYDIR
        fi

        # Find month ago directory
        if [ $DIRDATE == $MONTHAGO ]; then
                echo "MONTHAGO $DIRDATE"
                MONTHAGO="FOUND"
                FOUND=1
                rsync -rtvu --delete /home/citizensense/OwnCloud/Citizen_Sense $MONTHLYDIR
        fi

        # Find year ago directory
        if [ $DIRDATE == $YEARAGO ]; then
                echo "YEARAGO $DIRDATE"
                YEARAGO="FOUND"
                FOUND=1
                rsync -rtvu --delete /home/citizensense/OwnCloud/Citizen_Sense $YEARLYDIR
        fi      

        # print feeback
        if [ $FOUND -ne 1 ]; then
          echo $DIRDATE
        fi

done

