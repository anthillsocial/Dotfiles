dropboxd stop;
echo 100000 | sudo tee /proc/sys/fs/inotify/max_user_watches;
dropboxd start;
