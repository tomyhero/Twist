package Twist::Web::Controller::API;
use Polocky::Class;
BEGIN { extends 'Polocky::WAF::CatalystLike::Controller' };
use Twist::Container 'con';

sub recent :Local :Plugin('~JSON') {
    my ( $self , $c ) = @_;
    my $tweets = con('db')->recent();
    $c->stash->{json} = {
        result => 'ok',
        tweets => $tweets,
    };
}

sub user_recent :Local :Plugin('~JSON') {
    my ( $self , $c ) = @_;
    my $tweets = con('db')->user_recent( $c->req->param('screen_name') );
    $c->stash->{json} = {
        result => 'ok',
        tweets => $tweets,
    };

}

__POLOCKY__;
