#!/bin/bash
# A dirty PoC to switch between different desktop themes.
# $1 is associated with a specific moment of the day
# (could be night, day, dusk, whatever you want it to be)
# Here, 0 is day and 1 is night.
# sykhro (c) 2018

# Fade to new background
set-wallpaper --fade-secs 1 --image "path_to_your_image" &

# Switch bar and change color scheme
pkill polybar

if [ $1 -eq 0 ] ; then
  polybar -q your_daytime_bar & disown
  xrdb "path_to_your_daytime_Xresources" &
else
  polybar -q your_nighttime_bar & disown
  xrdb "path_to_your_daytime_Xresources" &
fi

# Can also be applied to change dunst colors.
# Overwriting the config everytime is kinda stupid but it's the fast way to do it
# without messing with sbus and stuff
#cp "$HOME/.config/dunst/dunst-$1" "$HOME/.config/dunst/dunstrc"
#pkill dunst

# Example: reload xst colors
# (this terminal can read .Xresources again when it receives a SIGHUP)
killall -USR1 xst

exit 0
