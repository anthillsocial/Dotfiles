files=(/home/tomkeene/Dropbox/Camera\ Uploads/DesktopPics/*.jpg)
printf "%s" "${files[RANDOM % ${#files[@]}]}"

