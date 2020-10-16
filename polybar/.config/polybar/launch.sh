#!/bin/bash

echo ""
echo "Polybar is starting"

# kill
killall -q polybar-git

# wait
while pgrep -u $UID -x polybar-git > /dev/null; do sleep 1; done

# start
polybar-git default -c ~/.config/polybar/config &

echo ""
echo "Polybar is launched."
