use strict;
use warnings;

use Test::More;

use File::chdir;
use File::ShareDir 'dist_dir';
use File::Spec::Functions 'file_name_is_absolute';

use PDL::SampleData qw/sample_files/;

my @files = sample_files;

ok( @files, "Finds sample files" );
ok( ! grep { /^\.+$/ } @files, "Ignores . and .." );

my $file = shift @files;

{
  local $CWD = dist_dir 'PDL-SampleData';
  ok( -e $file, "File exists" );
}

ok( ! file_name_is_absolute $file, "sample_files returns file name not path" );

done_testing;
