#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use Data::Dumper;

my $player = {
    location => 'entrance',
    alive    => 1,
};

while ( $player->{alive} ) {
    say "You are here: $player->{location}";
    print "What do you want to do? ";

    my $sentence = readline();

    say "";
}
