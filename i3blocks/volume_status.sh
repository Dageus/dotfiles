#!/bin/bash

COLOR="#f8f8f2"

# Get the current volume
VOLUME=$(pulseaudio-ctl full-status | awk '{print $1}')

# Get the mute status
MUTE=$(pulseaudio-ctl full-status | awk '{print $2}')

# Set the icon based on mute status
if [[ "$MUTE" == "yes" ]]; then
    ICON=""
else
    ICON=" "
fi

# Print the volume with icon

echo "$VOLUME" | awk -v icon="$ICON" -v color="$COLOR" '{ printf "<span color=\"%s\">%s</span> %d%%\n", color, icon, $1 }'
echo "#FFFFFF"
echo "#FFFFFF"
echo "#171717"
echo "$COLOR"

