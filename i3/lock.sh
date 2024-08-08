#!/bin/bash

# Pause all media players except Spotify
for player in $(playerctl -l | grep -v "spotify"); do
  playerctl -p $player pause
done

# My i3lock script
# Capture the screen and convert it to a fancy picture,
# then use it as the locked wallpaper

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=171717FF
bshlcolor=171717FF
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=1793d1ff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
font="sans-serif"
locktext='Type password to unlock...'
temp_pic='/tmp/i3lock.png'
final_pic='/tmp/i3lock_final.png'
overlay='/home/jomouzio/Pictures/lockscreen.vagabond.png'
# new
gradient_mask='/tmp/gradient_mask.png'
overlay_with_opacity='/tmp/overlay_with_opacity.png'
overlay_size='50%'
overlay_resized='/tmp/overlay_resized.png'

# Capture the screen
scrot -o -q 100 $temp_pic || exit 1

# magick $overlay -resize $overlay_size $overlay_resized

# Get the dimensions of the resized overlay image
# overlay_dimensions=$(identify -format "%wx%h" $overlay_resized)

# Create a gradient mask from left (black) to right (white)
# convert -size $overlay_dimensions gradient: -rotate 90 $gradient_mask

# Apply the gradient mask to the overlay image to create transparency from left to right
# magick $overlay_resized $gradient_mask -compose CopyOpacity -composite $overlay_with_opacity

# Apply blur to the base image and composite the overlay image with adjusted opacity on top
# magick $temp_pic -blur 0x8 miff:- | \
# magick - $overlay_with_opacity -gravity center -composite $final_pic || exit 1

magick $temp_pic -blur 0x8 \
    $final_pic || exit 1

# Use the final image with i3lock
i3lock \
    -t -e -i $final_pic \
    --time-pos='x+110:h-70' \
    --date-pos='x+43:h-45' \
    --clock --date-align 1 --date-str "$locktext" \
    --inside-color=$insidecolor --ring-color=$ringcolor --line-uses-inside \
    --keyhl-color=$keyhlcolor --bshl-color=$bshlcolor --separator-color=$separatorcolor \
    --insidever-color=$insidevercolor --insidewrong-color=$insidewrongcolor \
    --ringver-color=$ringvercolor --ringwrong-color=$ringwrongcolor --ind-pos='x+280:h-70' \
    --radius=20 --ring-width=4 --verif-text='' --wrong-text='' \
    --verif-color="$verifcolor" --time-color="$timecolor" --date-color="$datecolor" \
    --time-font="$font" --date-font="$font" --layout-font="$font" --verif-font="$font" --wrong-font="$font" \
    --noinput-text='' --force-clock --pass-media-keys \
    || exit 1

