package Twist::WAF::CatalystLike::Controller::Plugin::JSON;
use Polocky::Role;

after 'execute' => sub {
    my ( $orig , $self , $c ) = @_;
    $c->view()->render($c,'JSON', $c->stash->{json} );
};

1;

