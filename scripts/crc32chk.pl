#!/usr/bin/perl
use strict;
use warnings;

while(<>)
{
    chop($_);
    if(/.*\[(.+)\]\.mkv$/)
    {
        print "$_ $1\n";
    }
}

exit 0;
