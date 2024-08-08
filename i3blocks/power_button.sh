#!/bin/bash

case $BLOCK_BUTTON in
    1) i3-msg exec ~/.config/i3/lock.sh &;;  # Left click to lock
    2) systemctl suspend ;;      # Middle click to suspend
    3) systemctl poweroff ;;     # Right click to power off
esac

echo " ⏻  "  # Power symbol
