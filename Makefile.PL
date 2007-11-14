use strict;
use inc::Module::Install;

name('Data-Average');
all_from('lib/Data/Average.pm');
requires('UNIVERSAL::isa');

WriteAll;
