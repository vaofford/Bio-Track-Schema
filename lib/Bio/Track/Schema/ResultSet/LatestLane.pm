use utf8;
package Bio::Track::Schema::ResultSet::LatestLane;

# ABSTRACT: resultset for the latest_lane table

use Moose;
use MooseX::NonMoose;

use Carp qw ( croak );
use File::Slurp;

extends 'DBIx::Class::ResultSet';

sub BUILDARGS { $_[2] }
# see https://metacpan.org/pod/DBIx::Class::ResultSet#ResultSet-subclassing-with-Moose-and-similar-constructor-providers

#-------------------------------------------------------------------------------
#- public methods --------------------------------------------------------------
#-------------------------------------------------------------------------------

=head1 METHODS

=head2 get_lanes_by_lane_name($lane_name, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing rows matching the
given lane ID. When searching, the supplied C<$lane_name> is tested for:

=over

=item an exact match to a lane name

=item a match to a plex name, i.e. a wildcard match to a lane name (using "${lane_id}#%")

=item an exact match to a lane accession

=back

If C<$processed_flag> is provided, it will be used as a bit mask for the
C<processed> column. C<$processed_flag> defaults to 0, i.e. all rows.

=cut

# original query (from Path::Find::Lanes):
# my $search_term = 'select lane.name from latest_lane as lane where'
#       . ' ( lane.name = "'
#       . $search_id . '"'
#       . ' OR lane.name like "'
#       . escaped($search_id) . '#%"'
#       . ' OR lane.acc like "'
#       . escaped($search_id) . '" )'
#       . ' AND lane.processed & '
#       . $self->processed_flag . ' = '
#       . $self->processed_flag
#       . ' order by lane.name asc';

sub get_lanes_by_lane_name {
  my ( $self, $name ) = @_;
  # we don't care about $processed_flag here, since it's handled entirely in the
  # 'around' method. Similarly, the 'around' modifier checks for a value in $name
  my @name_like_search;
  for my $current_name (@{$name})
  {
	  push(@name_like_search, [{ name => { 'like', "$current_name#%" } }]);
  }

  my $rs = $self->search(
    {
      -or => [
        { name => $name },
        { acc  => $name },
	\@name_like_search
      ]
    },
    {
      order_by => { -asc => 'name' }
    }
  );

  return $rs;
}

#-------------------------------------------------------------------------------

=head2 get_lanes_by_sample_name($sample_name, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing rows matching the
given sample name. When searching, the supplied C<$sample_name> is tested for:

=over

=item an exact match to a sample name

=item an exact match to an individual accession

=back

If C<$processed_flag> is provided, it will be used as a bit mask for the
C<processed> column. C<$processed_flag> defaults to 0, i.e. all rows.

=cut

# original query (from Path::Find::Lanes):
# my $lane_names = $self->dbh->selectall_arrayref(
#     'select lane.name from individual as individual
#     inner join latest_sample as sample on sample.individual_id = individual.individual_id
#     inner join latest_library as library on library.sample_id = sample.sample_id
#     inner join latest_lane as lane on lane.library_id = library.library_id
#     where'
#       . '( individual.acc like "'
#       . escaped($self->search_id) . '"'
#       . ' OR sample.name like "'
#       . escaped($self->search_id) . '" )'
#       . ' AND lane.processed & '
#       . $self->processed_flag . ' = '
#       . $self->processed_flag
#       . ' order by lane.name asc'
# );

sub get_lanes_by_sample_name {
  my ( $self, $name ) = @_;

  my $rs = $self->search(
    {
      -or => [
        { 'latest_sample.name' => $name },
        { 'individual.acc'     => $name },
      ]
    },
    {
      join     => { 'latest_library' => { 'latest_sample' => 'individual' } },
      order_by => { -asc => 'me.name' }
    }
  );

  return $rs;
}

#-------------------------------------------------------------------------------

=head2 get_lanes_by_study_id($study_id, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing rows matching the
given study ID. When searching, the supplied C<$study_id> is tested for an
exact match to a project name. If C<$study_id> is an integer, we also check for
a match to project SSID. If C<$study_id> is B<NOT> an integer, we don't check
is against the SSID, since that field can only store integers in the database.

If C<$processed_flag> is provided, it will be used as a bit mask for the
C<processed> column. C<$processed_flag> defaults to 0, i.e. all rows.

=cut

# original query (from Path::Find::Lanes):
# my $sql_query = 'select lane.name from latest_project as project
#   inner join latest_sample as sample on sample.project_id = project.project_id
#   inner join latest_library as library on library.sample_id = sample.sample_id
#   inner join latest_lane as lane on lane.library_id = library.library_id
#   where (project.ssid like "'
#       . escaped($search_id)
#       . '" OR  project.name like "'
#       . escaped($search_id)
#       . '") AND lane.processed & '
#       . $self->processed_flag . ' = '
#       . $self->processed_flag
#       . ' order by lane.name asc';

sub get_lanes_by_study_id {
  my ( $self, $id ) = @_;

  # the column latest_project.ssid has an integer type. If we try to search
  # against it using a non-integer when were using SQLite (i.e. during testing),
  # DBIC throws a warning. In order to avoid that warning, and partially
  # because it will speed things up, we'll test against latest_project.ssid iff
  # the search term is an integer

  my $terms;

  if (@{$id} > 0 && (  $id->[0] =~ m/^\d+$/ )) {
    $terms = {
      -or => [
        { 'latest_project.name' => $id },
        { 'latest_project.ssid' => $id },
      ]
    };
  }
  else {
      $terms = {
        -or => [
          { 'latest_project.name' => $id },
        ]
      };
  }

  my $rs = $self->search(
    $terms,
    {
      join     => { 'latest_library' => { 'latest_sample' => 'latest_project' } },
      order_by => { -asc => 'me.name' }
    }
  );

  return $rs;
}

#-------------------------------------------------------------------------------

=head2 get_lanes_by_library_name($library_name, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing rows for lanes with the
given library name.

If C<$processed_flag> is provided, it will be used as a bit mask for the
C<processed> column. C<$processed_flag> defaults to 0, i.e. all rows.

=cut

# original query (from Path::Find::Lanes):
# my $sql_query = 'select lane.name from latest_library as library
#   inner join latest_lane as lane on lane.library_id = library.library_id
#   where ( library.name like "'
#       . escaped($search_id)
#       . '") AND lane.processed & '
#       . $self->processed_flag . ' = '
#       . $self->processed_flag
#       . ' order by lane.name asc';

sub get_lanes_by_library_name {
  my ( $self, $name ) = @_;

  my $rs = $self->search(
    { 'latest_library.name' => $name },
    {
      join     => [ 'latest_library' ],
      order_by => { -asc => 'me.name' },
    }
  );

  return $rs;
}

#-------------------------------------------------------------------------------

=head2 get_lanes_by_species_name($species_name, ?$processed_flag)

Returns a L<DBIx::Class::ResultSet|ResultSet> containing rows for lanes where
the species matches C<$species_name>. We use wildcards around the supplied
name, so that, for example, if C<$species_name> is C<Shigella>, we actually
search for C<%Shigella%>.

If C<$processed_flag> is provided, it will be used as a bit mask for the
C<processed> column. C<$processed_flag> defaults to 0, i.e. all rows.

=cut

# original query (from Path::Find::Lanes):
# my $lane_names = $self->dbh->selectall_arrayref(
#     'select lane.name from species as species
#     inner join individual as individual on individual.species_id = species.species_id
#     inner join latest_sample as sample on sample.individual_id = individual.individual_id
#     inner join latest_library as library on library.sample_id = sample.sample_id
#     inner join latest_lane as lane on lane.library_id = library.library_id
#   where species.name like "%'
#       . escaped($self->search_id)
#       . '%" AND lane.processed & '
#       . $self->processed_flag . ' = '
#       . $self->processed_flag
#       . ' order by lane.name asc'
# );

sub get_lanes_by_species_name {
  my ( $self, $name ) = @_;
  
  my @name_like_search;
  for my $current_name (@{$name})
  {
	  push(@name_like_search, [{ 'species.name' => { 'like', "%$current_name%" } }]);
  }

  my $rs = $self->search(
    {
      -or => \@name_like_search
    },
    {
      join => {
        latest_library => {
          latest_sample => {
            individual => 'species'
          }
        }
      },
      order_by => { -asc => 'me.name' },
    }
  );

  return $rs;
}


#-------------------------------------------------------------------------------

=head2 get_lanes_from_id_file($filename, $file_id_type, ?$processed_flag)

Returns a reference to an array containing L<DBIx::Class::Result|Result>
objects matching the lane or sample IDs in the supplied file. The type of ID in
the file must be specified and must be either C<lane> or C<sample>. If
C<$processed_flag> is given, it will be used to filter the results, as in the
other C<get_lanes_by...> methods.

Note that because the returned array is made up of multiple result sets, one
per ID from the file, the final set of lanes is not ordered. If you want the
C<DBIx::Class::Result|Result> objects sorted, use something like:

 @sorted = sort { $a->name <=> $b->name } @$lanes;

=cut

sub get_lanes_from_id_file {
  my ( $self, $filename, $file_id_type, $processed_flag ) = @_;

  croak 'ERROR: must supply a valid filename'
    unless ( defined $filename and -f $filename );

  # "read_file" will croak if it can't read the supplied filename
  my @ids = read_file($filename);

  return $self->get_lanes_from_id_list(\@ids, $file_id_type, $processed_flag );
}

#-------------------------------------------------------------------------------

=head2 get_lanes_from_ids($id, $file_id_type, ?$processed_flag)

Given a reference to a list of IDs, C<$ids>, the type of those IDs
(C<$file_id_type>), which must be either C<lane> or C<sample>, and an optional
C<$processed_flag>, this method returns a reference to an array containing
L<DBIx::Class::Result|Result> objects matching the supplied lane or sample IDs.

Note that because the returned array is made up of multiple result sets, one
per ID from the file, the final set of lanes is not ordered. If you want the
C<DBIx::Class::Result|Result> objects sorted, use something like:

 @sorted = sort { $a->name <=> $b->name } @$lanes;

=cut

sub get_lanes_from_id_list {
  my ( $self, $ids, $file_id_type, $processed_flag ) = @_;

  croak 'ERROR: must supply at least one ID to search on'
    unless scalar @$ids;

  croak 'ERROR: $file_id_type must be either "lane" or "sample"'
    unless ( defined $file_id_type and $file_id_type =~ m/^(lane|sample)$/ );

  my @rs;
  my @all_ids;
  foreach my $id ( @$ids ) {
    next if $id =~ m/^#/; # skip comment lines
    chomp $id;            # trim off newlines before passing ID to the DB
    push(@all_ids, $id);
  }
  
  my $method = "get_lanes_by_${file_id_type}_name";
  my $rs = $self->$method(\@all_ids, $processed_flag);
  push @rs, $rs->all if $rs;

  return \@rs;
}

#-------------------------------------------------------------------------------

# TODO the only method in Path::Find::Lanes that isn't in some way duplicated
# TODO here is "_lookup_by_database". It's tricky to look into other databases
# TODO in the context of DBIC, so that functionality would need to be build
# TODO higher up the stack, where the schema connections are made

#-------------------------------------------------------------------------------
#- method modifiers ------------------------------------------------------------
#-------------------------------------------------------------------------------

# we need to check the row against the "processed" bitmask. The original query,
# from which this method is copied, does it in the SQL query, but trying to do
# similar in DBIC is proving futile, because the value that we're trying to
# compare to gets quoted, so we end up comparing numeric zero to the string
# "0".
#
# This is an annoyingly hacky workaround. We do the queries above but ignore
# "processed", then, if necessary, walk the ResultSet and do the bitwise
# comparison in Perl...
#
# We could potentially do the query in SQL by setting up a custom query
# method in the Result, but we'd then have to do that for every query. At
# least doing it this way we avoid putting any SQL in the code and, unless
# "processed_flag" is given, there's no performance hit.

around qr/^get_lanes_by/ => sub {
  my $orig = shift;
  my $self = shift;

  my ( $id, $processed_flag ) = @_;

  # since we can do it easily here, validate the inputs
  croak 'ERROR: must supply a search term'
    unless $id;

  $processed_flag ||= 0;

  croak 'ERROR: not a valid "processed_flag"; must be an integer >= 0'
    unless ( $processed_flag =~ m/^\d+$/ and
             $processed_flag >= 0 );

  # call the actual method
  my $lanes_rs = $self->$orig($id);

  # if $processed_flag is zero, it will pass every row, so just return
  # the resultset immediately
  return $lanes_rs if $processed_flag == 0;

  # got a non-zero processed flag, so filter the ResultSet using it
  return $self->_filter_by_processed_flag($lanes_rs, $processed_flag);
};

#-------------------------------------------------------------------------------
#- private methods -------------------------------------------------------------
#-------------------------------------------------------------------------------

# filter the provided ResultSet using the specified "processed" flag

sub _filter_by_processed_flag {
  my ( $self, $rs, $processed_flag ) = @_;

  # the mask has a value; collect a list of the rows which it masks out
  my @row_ids;
  while ( my $row = $rs->next ) {
    push @row_ids, $row->row_id
      if ( ( $row->processed & $processed_flag ) != $processed_flag );
  }

  # strip the bad rows out of the resultset
  my $stripped_rs = $rs->search(
    {
      'me.row_id' => { -not_in => \@row_ids },
    }
  );

  return $stripped_rs;
}

#-------------------------------------------------------------------------------

__PACKAGE__->meta->make_immutable;

1;
