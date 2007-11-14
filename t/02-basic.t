#!perl
use strict;
use Test::More (tests => 17);

BEGIN
{
    use_ok("Data::Average");
}

{
    my $data = Data::Average->new;
    ok($data);
    isa_ok($data, "Data::Average");

    for my $i (1..10) {
        ok($data->add($i));
    }
    is($data->length, 10);
    is($data->avg, 5.5);
}

{
    my $data = Data::Average->new;
    is($data->length, 0);
    is($data->avg, undef);
}

1;