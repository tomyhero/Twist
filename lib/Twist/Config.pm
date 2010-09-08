package Twist::Config;
use strict;
use base qw(Polocky::Config);

sub twitter_auth {
    my $self = shift;
    $self->_get('twitter_auth');
}

sub twitter_list {
    my $self = shift;
    $self->_get('twitter_list');
}

sub driver {
    my $self = shift;
    $self->_get('driver');
}

1;

