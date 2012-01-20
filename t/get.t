use strict;
use warnings;

use Test::More;

use File::Spec::Functions 'file_name_is_absolute';

use PDL::SampleData ':all';

my $file = get_file 'm51.fits';

ok( file_name_is_absolute $file, "get_file returns absolute path" );
ok( -e $file, "file from get_file exists" );

my $pdl_rel = get_pdl 'm51.fits';
isa_ok( $pdl_rel, 'PDL' );

my $pdl_abs = get_pdl $file;
isa_ok( $pdl_abs, 'PDL' );

done_testing;

