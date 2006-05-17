# $Id: Average.pm 1 2006-05-16 15:02:55Z daisuke $
#
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Data::Average;
use strict;
use UNIVERSAL::isa;
use vars qw($VERSION);

BEGIN
{
    $VERSION = '0.02';
}

sub new
{
    my $class = shift;
    my $self  = bless {
        data => []
    }, $class;
    return $self;
}

sub avg
{
    my $self   = shift;
    my $total  = 0;
    my $length = $self->length;
    for my $i (0..$length - 1) {
        my $v = $self->{data}->[$i];
        if (ref($v) && $v->can('value')) {
            $total += $v->value;
        } else {
            $total += $v;
        }
    }

    return $total / $length;
}

sub length { scalar(@{$_[0]->{data}}) }
sub add    { 
    my $self = shift;
    $self->{data}->[ $self->length ] = $_ for @_;
    1;
}

1;

__END__

=head1 NAME

Data::Average - Hold Data Set To Calculate Average

=head1 SYNOPSIS

  use Data::Average;

  my $data = Data::Average->new;
  $data->add($_) for (1..100);

  print $data->avg; # 55

=head1 DESCRIPTION

Data::Average is a very simple module: You add values to it, and then you
compute the average using the avg() function.

=head1 METHODS

=head2 new()

Creates a new Data::Average object

=head2 add($value)

Adds a value to the Data::Average set.

=head2 length()

Returns the current data set

=head2 avg()

Returns the average of the entire set

=head1 AUTHOR

Copyright (c) 2006 Daisuke Maki E<lt>dmaki@cpan.orgE<gt>
All rights reserved.

=cut