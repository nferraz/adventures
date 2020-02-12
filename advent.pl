#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use Data::Dumper;

my $player = {
    location => 'entrance',
    alive    => 1,
};

my @objects = (
    {
        name     => 'dragon',
        location => 'entrance',
        alive    => 1,
    },
    {
        name     => 'sword',
        location => 'entrance',
    },
    {
        name     => 'stone',
        location => 'museum',
    },
);

my %object_by_name = map { $_->{name} => $_ } @objects;

while ( $player->{alive} ) {
    say "You are here: $player->{location}";
    print "What do you want to do? ";

    my $sentence = readline();

    my ( $verb, $obj_name ) = split( /\s+/, $sentence );

    if ( $verb eq 'quit' ) {
        say "Bye!";
        exit;
    } elsif ( $verb eq 'look' ) {
        look();
    } elsif ( $verb eq 'take' ) {
        take($obj_name);
    } elsif ( $verb eq 'slay' ) {
        slay($obj_name);
    } else {
        say "I don't understand what you want to do!";
    }

    say "";
}

sub look {
    say "I see here:";

    my @obj_here =
        map { $_->{name} }
        grep { $_->{location} eq $player->{location} } @objects;

    if (@obj_here) {
        say join( "; ", @obj_here );
    } else {
        say "Nothing special.";
    }
}

sub take {
    my ($obj_name) = @_;

    my $object = $object_by_name{$obj_name};

    return if !$object;
    return if $object->{location} ne $player->{location};
    return if $object->{alive};

    $object->{location} = 'PLAYER';
    say "Taken!";
}

sub slay {
    my ($obj_name) = @_;

    my $object = $object_by_name{$obj_name};

    return if !$object;
    return if $object->{location} ne $player->{location};
    return if !$object->{alive};

    if ( $object_by_name{sword}->{location} ne 'PLAYER' ) {
        say "With your bare hands???";
        return;
    }

    $object->{alive} = 0;
    say "You killed it!";
}
