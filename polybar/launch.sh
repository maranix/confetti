#!/usr/bin/env sh

PID=$(pidof polybar)

if [ -e $PID ]; then
    # Start
    polybar example &
else
    # Kill any running instances
    killall -q polybar

    # Wait until the instances have been closed
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
fi