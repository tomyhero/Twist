package Twist::Web::Controller::User;
use Polocky::Class;
BEGIN { extends 'Polocky::WAF::CatalystLike::Controller' };
use Twist::Container 'con';

sub endpoint :Chained('/') :PathPart('user') :CaptureArgs(1) {
    my ($self,$c,$screen_name) = @_;
    $c->stash->{screen_name} = $screen_name;
    1;
}

sub index :Chained('endpoint') :PathPart('') {
    my ($self, $c) = @_;
}

__POLOCKY__;
