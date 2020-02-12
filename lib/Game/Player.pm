package Game::Player;

use strict;
use warnings;

sub new {
    my ( $class, $ref ) = @_;
    return bless $ref, $class;
}

sub location {
    my ($self) = @_;
    return $self->{location};
}

sub alive {
    my ($self) = @_;
    return $self->{alive};
}

sub go_to {
    my ( $self, $new_location ) = @_;
    $self->{location} = $new_location;
}

1;
