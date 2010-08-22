package Twist::DB;
use Polocky::Class;
use Twist::Driver;

has driver => (
    is => 'rw',
    lazy_build => 1,
);

sub _build_driver {
    my $self = shift;
    my $driver = Twist::Driver->new();
    $self->{driver} = $driver;
}

sub logging {
    my $self = shift;
    my $data = shift;
    my $driver = $self->driver;
    my @keys = qw/screen_name lat lon geohash text/;
    my $fields = join(',',@keys);
    my @data = ();
    for(@keys){
        push @data , $data->{$_};
    }
    my $sth =$driver->dbh->prepare("INSERT INTO tweet ($fields,created_at) VALUES (?,?,?,?,?,datetime('now'))");
    $sth->execute(@data);
    $sth->finish;
}

__POLOCKY__ ;
