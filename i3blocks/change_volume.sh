#!/bin/bash

# Adjust volume
pulseaudio-ctl "$@"

# Signal i3blocks to update the volume block
pkill -RTMIN+10 i3blocks
