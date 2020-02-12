#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use Data::Dumper;

my $player = {
    location => 'entrance',
    alive    => 1,
};

say Dumper $player;
