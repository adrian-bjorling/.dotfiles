#!/bin/bash

killall -q polybar
polybar main 2>&1 | tec -a /tmp/polybar.log & disown
echo "Polybar launched..."
