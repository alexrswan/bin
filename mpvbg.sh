#!/bin/bash
#
# http://github.com/mitchweaver/bin
#
# play a video on the root window
#

[ -f "$1" ] || exit 1

pkill -9 xwinwrap

xwin="xwinwrap -ni -sh rectangle -b -nf -ov -fs -- "
#xwin="xwinwrap -ni -b -fs -- "

#mpv="mpv --wid WID --no-config --keepaspect=no --loop \
#	--really-quiet"
mpv="mpv --wid WID --no-config --keepaspect=no --loop \
    --no-border --vd-lavc-fast --x11-bypass-compositor=no \
    --gapless-audio=yes --vo=xv --hwdec=auto --really-quiet \
    --name=mpvbg"

wallpaper=$( ls /home/alex/.wallpapers | sort -R | tail -n 1 )
echo $xwin $mpv $wallpaper
$xwin $mpv "$1"  /dev/null 2>&1 &
echo -n $! > ${HOME}/.cache/mpvbg.pid
