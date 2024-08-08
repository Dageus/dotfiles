#!/bin/bash

COLOR="#f8f8f2"

# Get GPU usage and temperature
USAGE=$(intel_gpu_top -J -s 500ms -o - | grep -m 1 '"busy":' | awk '{printf "%04.1f",int($2)}')
# TEMP=$(sensors | grep "Package" | awk '{print $4}' | cut -c 2-3)

# Print the GPU usage and temperature
echo "$USAGE<span color=\"$COLOR\">%</span>"
echo "$COLOR"
echo "#ffffff"
echo "#171717"
echo "$COLOR"
