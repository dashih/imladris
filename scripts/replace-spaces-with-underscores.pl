#!/usr/bin/perl

use strict;
use warnings;
use File::Find;

sub process_file {
    if (/ +/) {
        my $newFileName = $_;

        # Replace spaces with _
        $newFileName =~ s/ /_/;

        # Replace ( with --
        $newFileName =~ s/\(/--/;

        # Replace ) with nothing.
        $newFileName =~ s/\)//;

        my $cmd = "mv \"$_\" $newFileName";
        print $cmd . "\n";
        system($cmd);
    }
}

find(\&process_file, ".");
