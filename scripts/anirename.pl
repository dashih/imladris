#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV+1 != 4)
{
    print "USAGE: ./anirename.pl [SERIES] [EXTENSION] [PRE] [POST]\n";
    exit 1;
}

my $series = $ARGV[0];
my $ext = $ARGV[1];
my $pre = $ARGV[2];
my $post = $ARGV[3];

my @ls = `ls`;
foreach(@ls)
{
    chomp;
    if((substr $_, -3) eq "$ext")
    {
        my $fname = $_;
        $fname =~ s/.*$pre/$series\_/;
        $fname =~ s/$post.*/\.$ext/;
        print "OLD: $_\n";
        print "NEW: $fname\n";

        print "(y, n): ";
        my $ch = <STDIN>;
        chomp $ch;
        if("$ch" eq "q")
        {
            print "ABORT\n";
            exit 2;
        }
        elsif("$ch" eq "y")
        {
            print "CHANGED\n";
            `mv \"$_\" \"$fname\"\n`;
        }

        print "\n";
    }
}
exit 0;
