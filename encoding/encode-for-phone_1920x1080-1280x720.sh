#!/bin/sh

# Input image aspect = 1920x1080, 1280x720 (16:9 = 1.77777)
# Desired image size = 1280x768
# Scale to 1280x720. Pad 24 on top/bottom to make 720 --> 768

ffmpeg -y -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x720,pad=1280:768:0:24:black" -pass 1 -an -f mp4 -threads 0 /dev/null

ffmpeg -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x720,pad=1280:768:0:24:black" -pass 2 -c:a libfdk_aac -b:a 128k -threads 0 "`basename $1 .mkv`.mp4"

exit 0
