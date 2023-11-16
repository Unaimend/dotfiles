#/usr/bin/sh
#Next  https://community.spotify.com/t5/Desktop-Linux/Basic-controls-via-command-line/td-p/4295625
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous > /dev/null 2>&1

