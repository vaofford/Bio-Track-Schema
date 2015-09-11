use utf8;
package Bio::Track::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zxbcpqNJ+xYA5+kZbU5BoA

# ABSTRACT: DBIC schema for the tracking databases

use Carp qw( croak );

#-------------------------------------------------------------------------------
#- class variables -------------------------------------------------------------
#-------------------------------------------------------------------------------

# this is a mapping between the type of ID that the caller specifies and the
# search methods that are found in Bio::Track::Schema::ResultSet::LatestLane.

our $_search_methods = {
  lane    => 'get_lanes_by_lane_name',
  sample  => 'get_lanes_by_sample_name',
  study   => 'get_lanes_by_study_id',
  library => 'get_lanes_by_library_name',
  species => 'get_lanes_by_species_name',
};

#-------------------------------------------------------------------------------
#- public methods --------------------------------------------------------------
#-------------------------------------------------------------------------------

=head1 METHODS

=head2 get_lanes_by_id($lane_id, $id_type, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing
L<Bio::Track::Schema::Result::LatestLane> objects matching the given ID,
C<$lane_id>. The type of the ID must be specified (C<$id_type>). If
C<$processed_flag> is given, it will be used to filter the returned lanes.
See L<Bio::Track::Schema::ResultSet::LatestLane::get_lanes_by_lane_name>.

The accepted ID types are:

=over

=item lane

=item sample

=item study

=item library

=item species

=back

=cut

sub get_lanes_by_id {
  my ( $self, $lane_id, $id_type, $processed_flag ) = @_;

  croak 'ERROR: must supply a name or ID to search with'
    unless ( defined $lane_id and $lane_id ne '' );

  croak 'ERROR: must specify the ID type'
    unless ( defined $id_type and $id_type ne '' );

  croak "ERROR: not a valid ID type ($id_type)"
    unless $_search_methods->{$id_type};

  my $method = $_search_methods->{$id_type};

  return $self->resultset('LatestLane')->$method($lane_id, $processed_flag);
}

#-------------------------------------------------------------------------------

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
