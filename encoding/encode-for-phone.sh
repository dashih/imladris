#!/bin/sh

# Final image size = 1280x768 (lumia 920)

ffmpeg -y -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x768" -pass 1 -an -f mp4 -threads 0 /dev/null

ffmpeg -i "$1" -c:v libx264 -preset veryslow -profile:v baseline -b:v 1200k -filter:v "scale=1280x768" -pass 2 -c:a libfdk_aac -b:a 128k -threads 0 "`basename $1 .mkv`.mp4"

exit 0
