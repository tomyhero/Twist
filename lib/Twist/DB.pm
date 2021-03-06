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
    my $sth =$driver->dbh->prepare("INSERT INTO tweet ($fields,created_at) VALUES (?,?,?,?,?,datetime('now', 'localtime'))");
    $sth->execute(@data);
    $sth->finish;
}

sub user_recent {
    my $self = shift;
    my $screen_name = shift;
    my $driver = $self->driver;
    my $sth = $driver->dbh->prepare("SELECT * FROM tweet WHERE screen_name = ? ORDER BY created_at DESC LIMIT 9");
    $sth->execute( $screen_name );
    my @data = ();
    while(my $row = $sth->fetchrow_hashref()){
        push @data,$row;
    }
    $sth->finish;
    @data = reverse @data;
    return \@data;     

}
sub recent {
    my $self = shift;
    my $driver = $self->driver;
    my $sth = $driver->dbh->prepare("SELECT * FROM tweet GROUP BY screen_name having max(created_at) ORDER BY created_at DESC");
    $sth->execute();
    my @data = ();
    while(my $row = $sth->fetchrow_hashref()){
        push @data,$row;
    }
    $sth->finish;
    return \@data;     
}


__POLOCKY__ ;
