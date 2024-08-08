#!/bin/bash

# Get the battery status
STATUS=$(cat /sys/class/power_supply/BAT0/status)
CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

# Define icons or symbols
CHARGING_ICON=" "
LOW_ICON=" "
MEDIUM_ICON=" "
DISCHARGING_ICON=" "
FULL_ICON=" "

# Determine the output based on the status
if [ "$STATUS" == "Charging" ]; then
    ICON=$CHARGING_ICON 
elif [ "$STATUS" == "Discharging" ]; then
    if [ "$CAPACITY" -ge 80 ]; then
        ICON=$FULL_ICON
    elif [ "$CAPACITY" -le 20 ]; then
        ICON=$MEDIUM_ICON
    elif [ "$CAPACITY" -le 10 ]; then
        ICON=$LOW_ICON
    else
        ICON=$DISCHARGING_ICON
    fi
else
    ICON=$FULL_ICON
fi

# Set colors based on battery level
if [ "$CAPACITY" -le 10 ]; then
    COLOR="#FF0000"
elif [ "$CAPACITY" -le 20 ]; then
    COLOR="#FF8000"
elif [ "$CAPACITY" -le 30 ]; then
    COLOR="#FFD700"
else
    COLOR="#f8f8f2"
fi

echo "$CAPACITY%" | awk -v icon="$ICON" -v color="$COLOR" '{ printf "<span color=\"%s\">%s</span> %d%%\n", color, icon, $1 }'
echo "#ffffff"
echo "#ffffff"
echo "#171717"
echo "#f8f8f2"
