#!/usr/bin/perl

use strict;
use warnings;
use File::Find;

sub process_file {
    my $EXTENSION = qr"\.mov";

    if (/.*$EXTENSION/) {
        print $File::Find::name;
        print "\n";
        my $oldFileName = $_;
        my $newFileName = $_;

        $newFileName =~ s/$EXTENSION/\.mp4/;

        my $cmd0 = "ffmpeg -y -i $oldFileName -c:v libx264 -preset veryslow -b:v 1200k -profile:v high -pass 1 -an -f mp4 -threads 0 /dev/null";
        my $cmd1 = "ffmpeg -i $oldFileName -c:v libx264 -preset veryslow -b:v 1200k -profile:v high -pass 2 -c:a libfdk_aac -b:a 128k -f mp4 -threads 0 $newFileName";
        #my $cmd0 = "ffmpeg10 -y -i $oldFileName -c:v libx264 -preset veryslow -b:v 1200k -profile:v high10 -pass 1 -an -f mp4 -threads 4 /dev/null";
        #my $cmd1 = "ffmpeg10 -i $oldFileName -c:v libx264 -preset veryslow -b:v 1200k -profile:v high10 -pass 2 -c:a libfdk_aac -b:a 128k -f mp4 -threads 4 $newFileName";

        my $cmd2 = "rm ffmpeg2pass*";

        #print $cmd0 . "\n";
        system($cmd0);
        #print $cmd1 . "\n";
        system($cmd1);
        #print $cmd2 . "\n";
        system($cmd2);
    }
}

find(\&process_file, ".");
