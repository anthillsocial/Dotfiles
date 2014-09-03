echo "Logging on to ReadyNAS...";
rsync -avzh /home/tomkeene -e ssh --delete --exclude-from '/home/tomkeene/Dropbox/Shellscripts/exludeRsyncFolders.txt' root@192.168.1.70:/c/backup/latest/archant
