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

sub twitter_extra_members {
    my $self = shift;
    $self->_get('twitter_extra_members');
}


sub driver {
    my $self = shift;
    $self->_get('driver');
}

1;

