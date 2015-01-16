echo "Stop dropbox, reset /proc/sys/fs/inotify/max_user_watches, then start again"
dropbox stop;
echo 100000 | sudo tee /proc/sys/fs/inotify/max_user_watches;
dropbox start;
