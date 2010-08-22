#!/usr/bin/perl
use strict;
use warnings;
use FindBin::libs;
use Polocky::Util::Initializer 'Twist::Stream';
use Twist::Stream;

while(1){
  eval{
        my $stream = Twist::Stream->new();
        $stream->run;
    };
  if($@){
      warn $@;
      sleep 3;
  }
}

__END__;
