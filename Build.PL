#!perl
use strict;
use Module::Build;

my $build = Module::Build->new(
    dist_name => 'Data-Average',
    dist_version_from => 'lib/Data/Average.pm',
    requires => {
        'UNIVERSAL::isa' => 0
    },
    license => 'perl',
    create_readme => 1,
    create_makefile_pl => 'traditional',
);
$build->create_build_script;