#!/bin/bash
APPDIR="/home/tom/Desktop/meteor/DEVanthillsocial"
USERNAME="tom" # has been set in .bashrc
REMOTEHOST="risky" # Has been set in .bashrc 
# Start meteor and dump the local database
echo "1/3: START METEOR AND DUMP DATABASE"
cd $APPDIR
killall meteor
meteor > /dev/null &
mongodump --host localhost:3001
# Copy the database dump to a remote server and restore it
echo "2/3: COPY DATABASE TO REMOTE SERVER"
scp -r $APPDIR/dump $USERNAME@$REMOTEHOST:dump
SC="$SC mongorestore --host localhost --port 27017 --db anthillsocial --username anthillsocial --password ranjit55%33 --drop dump/meteor;"
SC="$SC rm -R dump;"
echo "3/3: RUN REMOTE RESTORE SCRIPT"
ssh -l $USERNAME $REMOTEHOST "$SC"
echo "COMPLETE"
rm -R dump
