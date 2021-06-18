# Statusbar loop
while true; do
	~/.local/share/statusBar.sh
	sleep 1m
done &

# Avoid battery saver screen
xset -dpms
xset s off

xwallpaper --stretch ~/.local/share/wallpaper/snowMountains.jpg
exec dwm
