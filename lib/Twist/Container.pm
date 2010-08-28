package Twist::Container;
use warnings;
use strict;
use Object::Container '-base';
use Twist::DB;

register db => sub { 
    return Twist::DB->new();
};

1;
