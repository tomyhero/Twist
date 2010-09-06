package Twist::Stream;
use Polocky::Class;
extends 'Polocky::Core';
use Twist::DB;
use AnyEvent;
use AnyEvent::Twitter::Stream;
use Geo::Hash::XS;
use Net::Twitter;

has db => (
        is => 'rw',
        lazy_build => 1,
        );

sub _build_db {
    my $self = shift;
    Twist::DB->new();
}

sub run {
    my $self = shift;
    my $twitter_auth = $self->config->twitter_auth;
    my $followers = $self->config->followers;
    my $twitter = Net::Twitter->new (
            traits   => [qw/API::REST OAuth/],
            %$twitter_auth,
            );

    $twitter->access_token($twitter_auth->{access_token});
    $twitter->access_token_secret($twitter_auth->{access_token_secret});

    my $users = $twitter->lookup_users( screen_name => join(",", @$followers) ) ;
    my @ids = map { $_->{id} } @$users;

    my $done = AnyEvent->condvar;
    my $guard 
        = AnyEvent::Twitter::Stream->new(
            username => $twitter_auth->{username},
            password => $twitter_auth->{password},
            method   => "filter",
            follow   => join(",", @ids),
            on_tweet => sub {
                my $tweet = shift;
                if($tweet->{geo}){
                    my ($lat,$lon) = @{$tweet->{geo}{coordinates}}; 
                    my $geo = Geo::Hash::XS->new();
                    my $geo_hash = $geo->encode($lat,$lon);

                    $self->db->logging({
                        screen_name =>  $tweet->{user}{screen_name},
                        lat => $lat,
                        lon => $lon,
                        geohash => $geo_hash,
                        text => $tweet->{text},
                    });
                    warn 'posted by:' . $tweet->{user}{screen_name};
                }
                else {
                    warn 'no geo support:' . $tweet->{user}{screen_name};
                }
            },
            on_error => sub {
                my $error = shift;
                warn "ERROR: $error";
                $done->send;
            },
            on_eof => sub {
                $done->send;
            },
        );
      $done->recv; 
}

__POLOCKY__ ;
