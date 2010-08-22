package Twist::Driver;
use Polocky::Class;
extends 'Polocky::Core';
use DBI;

sub BUILD {
    my $self = shift;
    $self->{dbh} = $self->connect_db;
    return $self;
}

sub connect_db {
    my $self = shift;
    my $config = $self->config->driver;
    my $dbh = DBI->connect($config->{dsn}, $config->{username}, $config->{password} , $config->{options} );
    return $dbh;
}

sub dbh {
    my $self = shift;
    unless( $self->{dbh} && $self->{dbh}->ping ) {
        $self->{dbh} = $self->connect_db;
    }
    return $self->{dbh};
}

__POLOCKY__ ;
