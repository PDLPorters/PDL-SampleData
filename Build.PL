#!/usr/bin/env perl

use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name        => 'PDL::SampleData',
  dist_version_from  => 'lib/PDL/SampleData.pm',
  dist_author        => 'Joel Berger <joel.a.berger@gmail.com>',
  license            => 'perl',
  share_dir => 'files',
  configure_requires => { 
    'Module::Build' => 0.36
  },
  requires => {
    'File::ShareDir' => 0,
    'File::chdir'   => 0,
    'Carp' => 0,
    'File::Spec::Functions' => 0,
    'parent' => 0,
  },
  recommends => {
    'PDL::Book' => 0,
  },
);

$build->create_build_script;
