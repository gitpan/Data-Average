#!perl
use strict;
use Test::More (tests => 23);

BEGIN
{
    use_ok("Data::Average::Bounded");
}

my $data = Data::Average::Bounded->new(max => 5);

for my $i (1..10) {
    ok($data->add($i));
    ok($data->length <= 5);
}
is($data->length, 5);
is($data->avg, 8);

1;