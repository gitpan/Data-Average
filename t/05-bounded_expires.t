#!perl
use strict;
use Test::More (tests => 34);

BEGIN
{
    use_ok("Data::Average::BoundedExpires");
}

my $data = Data::Average::BoundedExpires->new(max => 10, expires_in => 5);

for my $i (1..10) {
    ok($data->add($i));
}

is($data->avg, 5.5);

my $sec = 10;
print STDERR " Sleeping for $sec seconds\n";
sleep($sec);

is($data->length, 0);

for my $i (1..20) {
    ok($data->add($i));
}
is($data->length, 10);

1;
