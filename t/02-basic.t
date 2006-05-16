#!perl
use strict;
use Test::More (tests => 13);

BEGIN
{
    use_ok("Data::Average");
}

my $data = Data::Average->new;

for my $i (1..10) {
    ok($data->add($i));
}
is($data->length, 10);
is($data->avg, 5.5);

1;