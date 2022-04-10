function run {
  if ! pgrep -f "$1" ;
  then
    $@&
  fi
}

run "fcitx5"
run "picom"
run "nm-applet"
run "xrandr --output DVI-D-0 --mode 1920x1080 --rate 120.00 --auto --left-of HDMI-0"
run "xautolock -detectsleep -time 10 -locker "i3lock -c 000000"

