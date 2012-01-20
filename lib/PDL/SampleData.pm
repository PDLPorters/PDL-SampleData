package PDL::SampleData;

use strict;
use warnings;

our $VERSION = 0.01;
$VERSION = eval $VERSION;

use Carp;

use PDL;

use File::ShareDir 'dist_dir';
use File::chdir;
use File::Spec::Functions qw/no_upwards rel2abs/;

use parent 'Exporter';
our @EXPORT_OK = ( qw/
  sample_files
  get_file
  get_pdl
/ );

our %EXPORT_TAGS = (
  'all' => \@EXPORT_OK,
);

sub get_file {
  my $file = shift;
  
  local $CWD = dist_dir 'PDL-SampleData';

  carp "Improper filename"
    unless grep { no_upwards $_ } ($file);

  unless ( -e $file ) {
    local $" = ', ';
    carp "Could not find file $file in $CWD";
    return undef;
  }

  return rel2abs $file;
}

sub get_pdl {
  my $rel_file = shift;

  return undef 
    unless defined $rel_file;

  return rim get_file $rel_file;
}

sub sample_files {
  local $CWD = dist_dir 'PDL-SampleData';

  opendir( my $dh, $CWD);

  my @files = 
     grep { ! -d }
     no_upwards 
     readdir $dh;

  return @files;
}

1;

__END__

__POD__

=head1 NAME

PDL::SampleData - Easy access to data used in the L<PDL> examples and the L<PDL::Book>.

=head1 SYNOPSIS

 use PDL::ShareDir ':all';
 my $file = get_file('m51.fits');
 my $pdl = get_pdl('m51.fits');

=head1 DESCRIPTION

C<PDL::SampleData> allows easy access to the data needed to follow along with the examples and the L<PDL::Book>.

=head1 FUNCTIONS 

Nothing is exported by default. Any of the following functions may be explicitly imported, or import them all with the tag  C<:all>.

=head2 get_file( filename )

Takes the name (with extension) of the file requested. On success it returns the absolute path to the file requested. On failure a warning is issued and C<undef> is returned.

=head2 get_pdl( filename )

Takes the name (with extension) of the file requested. On success it returns the data as a L<PDL> object. On failure a warning is issued and a C<undef> is returned.

=head2 sample_files()

Takes no arguments, returns the sample data files that are available by using C<get_*>.

=head1 SEE ALSO

=over

=item *

L<PDL>

=item *

L<PDL::Book>

=back

=head1 SOURCE REPOSITORY

L<http://github.com/PDLPorters/PDL-SampleData>

=head1 AUTHOR

Joel Berger, E<lt>joel.a.berger@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Joel Berger

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
