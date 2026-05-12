export PATH="$HOME/.local/bin:$PATH"
setxkbmap -option caps:escape &
dunst &
nmcli-notify &
xbindkeys &
slstatus &
exec dbus-run-session dwm
