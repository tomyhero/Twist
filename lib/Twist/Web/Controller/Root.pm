package Twist::Web::Controller::Root;
use Polocky::Class;
BEGIN { extends 'Polocky::WAF::CatalystLike::Controller' };
__PACKAGE__->namespace('');
use Twist::Container 'con';

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;
    my $users = con('db')->recent();
    $c->stash->{users} = $users;
}

sub end  :ActionClass('RenderView') {}

__POLOCKY__;
