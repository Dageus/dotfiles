#!/bin/bash

COLOR="#f8f8f2"

# Get the current brightness
BRIGHTNESS=$(brightnessctl get)

# Get the maximum brightness
MAX_BRIGHTNESS=$(brightnessctl max)

# Calculate the brightness percentage
BRIGHTNESS_PERCENT=$(( 100 * BRIGHTNESS / MAX_BRIGHTNESS ))

ICON=" " # brightness symbol

# Output the brightness percentage with formatting
echo "$BRIGHTNESS_PERCENT" | awk -v icon="$ICON" -v color="$COLOR" '{ printf "<span color=\"%s\">%s</span> %d%%\n", color, icon, $1 }'
echo "#FFFFFF"
echo "#FFFFFF"
echo "#171717"
echo "$COLOR"
