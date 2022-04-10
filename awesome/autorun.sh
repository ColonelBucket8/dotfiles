function run {
  if ! pgrep -f "$1" ;
  then
    $@&
  fi
}

run "fcitx5"
run "picom"
run "nm-applet"
