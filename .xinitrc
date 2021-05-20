# Statusbar loop
while true; do
   xsetroot -name "$(date +"%F %r" )"
   sleep 1s
done &

xwallpaper --stretch path/to/wallpaper
exec dwm
