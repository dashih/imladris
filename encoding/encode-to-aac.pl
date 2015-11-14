#!/usr/bin/perl -w

@files = <*.mp3>;
foreach $file (@files) {
    $old = $file;
    $file =~ s/\.mp3/\.m4a/;

    `ffmpeg -i "$old" -c:a libfdk_aac -b:a 320k -map 0:0 "$file"`
}
