#!/bin/sh

# Input image aspect = 1920x800 (12:5 = 2.4)
# Desired image size = 1280x768
# Scale to 1280x532. Pad 118 on top/bottom to make 532 --> 768

ffmpeg -y -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x532,pad=1280:768:0:118:black" -pass 1 -an -f mp4 -threads 0 /dev/null

ffmpeg -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x532,pad=1280:768:0:118:black" -pass 2 -c:a libfdk_aac -b:a 128k -threads 0 "`basename $1 .mkv`.mp4"

exit 0
