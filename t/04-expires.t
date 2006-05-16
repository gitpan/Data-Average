#!perl
use strict;
use Test::More (tests => 13);

BEGIN
{
    use_ok("Data::Average::Expires");
}

my $data = Data::Average::Expires->new(expires_in => 5);

for my $i (1..10) {
    ok($data->add($i));
}

is($data->avg, 5.5);

my $sec = 10;
print STDERR " Sleeping for $sec seconds\n";
sleep($sec);

is($data->length, 0);

1;
