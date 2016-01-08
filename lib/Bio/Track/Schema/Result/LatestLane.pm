use utf8;
package Bio::Track::Schema::Result::LatestLane;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestLane - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
# extends 'DBIx::Class::Core';
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_lane>

=cut

__PACKAGE__->table("latest_lane");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 seq_request_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 hierarchy_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 acc

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 readlen

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 paired

  data_type: 'tinyint'
  is_nullable: 1

=head2 raw_reads

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 raw_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 npg_qc_status

  data_type: 'enum'
  extra: {list => ["pending","pass","fail","-"]}
  is_nullable: 1

=head2 processed

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 auto_qc_status

  data_type: 'enum'
  extra: {list => ["no_qc","passed","failed"]}
  is_nullable: 1

=head2 qc_status

  data_type: 'enum'
  extra: {list => ["no_qc","pending","passed","failed"]}
  is_nullable: 1

=head2 gt_status

  data_type: 'enum'
  default_value: 'unchecked'
  extra: {list => ["unchecked","confirmed","wrong","unconfirmed","candidate","unknown","swapped"]}
  is_nullable: 1

=head2 submission_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 withdrawn

  data_type: 'tinyint'
  is_nullable: 1

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 changed

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 run_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 storage_path

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 latest

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 manually_withdrawn

  data_type: 'tinyint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "row_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "lane_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "seq_request_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "acc",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "readlen",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "paired",
  { data_type => "tinyint", is_nullable => 1 },
  "raw_reads",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "raw_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "npg_qc_status",
  {
    data_type => "enum",
    extra => { list => ["pending", "pass", "fail", "-"] },
    is_nullable => 1,
  },
  "processed",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "auto_qc_status",
  {
    data_type => "enum",
    extra => { list => ["no_qc", "passed", "failed"] },
    is_nullable => 1,
  },
  "qc_status",
  {
    data_type => "enum",
    extra => { list => ["no_qc", "pending", "passed", "failed"] },
    is_nullable => 1,
  },
  "gt_status",
  {
    data_type => "enum",
    default_value => "unchecked",
    extra => {
      list => [
        "unchecked",
        "confirmed",
        "wrong",
        "unconfirmed",
        "candidate",
        "unknown",
        "swapped",
      ],
    },
    is_nullable => 1,
  },
  "submission_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "withdrawn",
  { data_type => "tinyint", is_nullable => 1 },
  "note_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "changed",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "run_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "storage_path",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "latest",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "manually_withdrawn",
  { data_type => "tinyint", is_nullable => 1 },
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1y2wL+EwvT/62F7VolmXOA

use Carp qw( croak );
use Try::Tiny;
use Path::Class;

use Types::Standard qw( Str Object HashRef );

our %_known_path_fragments = (
  genus                => 1,
  individual           => 1,
  lane                 => 1,
  library              => 1,
  project              => 1,
  projectid            => 1,
  projectssid          => 1,
  sample               => 1,
  'species-subspecies' => 1,
  strain               => 1,
  technology           => 1
);

has 'path' => (
  is      => 'ro',
  isa     => Str,
  lazy    => 1,
  builder => '_build_path',
);

# this is the name of the database in which this result was found, e.g.
# pathogen_prok_track
has 'database_name' => (
  is  => 'rw',
  isa => Str,
);

has 'database' => (
  is  => 'rw',
  isa => Object,
);

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `lane_id`, `library_id`, `seq_request_id`, `name`,
  `hierarchy_name`, `acc`, `readlen`, `paired`, `raw_reads`, `raw_bases`,
  `npg_qc_status`, `processed`, `auto_qc_status`, `qc_status`, `gt_status`,
  `submission_id`, `withdrawn`, `note_id`, `changed`, `run_date`, `storage_path`,
  `latest`, `manually_withdrawn`
FROM `lane` WHERE `lane`.`latest` = 1
) );

__PACKAGE__->belongs_to(
  "latest_library",
  "Bio::Track::Schema::Result::LatestLibrary",
  { library_id => "library_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

__PACKAGE__->has_many(
  "latest_files",
  "Bio::Track::Schema::Result::LatestFile",
  { 'foreign.lane_id' => 'self.lane_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "latest_mapstats",
  "Bio::Track::Schema::Result::LatestMapstat",
  { 'foreign.lane_id' => 'self.lane_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

# explicitly set the ResultSet class that goes along with this Result. This
# is needed to make sure that ResultSet::LatestLane gets correctly associated
# with this Result if we're using Bio::Track::ReducedSchema rather than the
# full Bio::Track::Schema.
#
# The reason for this is that the full Schema class uses load_namespace() to
# load all of the Result and ResultSet classes automatically, and associates
# corresponding pairs. The Bio::Track::ReducedSchema class uses load_classes()
# instead of load_namespaces(), which means that the ResultSet classes don't
# get automatically associated, so the methods that we add in
# ResultSet::LatestLane aren't available unless we explicitly associate it like
# this.
__PACKAGE__->resultset_class('Bio::Track::Schema::ResultSet::LatestLane');

# the guts of this are cargo-culted from VRTrack::VRTrack::hierarchy_path_of_object
# and associated VRTrack classes

sub _build_path {
  my ( $self, $template ) = @_;

  # TODO since there's no way to pass in $template here, this is effectively
  # TODO hard-coded. Need to find a way to fix that...
  $template ||= 'genus:species-subspecies:TRACKING:projectssid:sample:technology:library:lane';

  # build a list of path components, based on the template
  my @path;

  # cache the genus and species...
  my ( $genus, $species );

  FRAGMENT: for ( split m/:/, $template ) {
    # if this is a path fragment for which we have a specific method, use that
    if ( $_known_path_fragments{$_} ) {
      if ( m/genus/ ) {
        ( $genus, $species ) = $self->_get_genus_species unless $genus;
        push @path, $genus;
        next FRAGMENT;
      }
      if ( m/species-subspecies/ ) {
        ( $genus, $species ) = $self->_get_genus_species unless $genus;
        # some organisms simply don't have a species, e.g. Trypanosomatidae.
        # Don't try to add an empty species to the path
        next FRAGMENT unless defined $species;
        $species =~ s/\W/_/g;
        $species =~ s/_+/_/g;
        push @path, $species;
        next FRAGMENT;
      }
      if ( m/strain/      ) { push @path, $self->latest_library->latest_sample->individual->individual_id;  next FRAGMENT; }
      if ( m/individual/  ) { push @path, $self->latest_library->latest_sample->individual->individual_id;  next FRAGMENT; }
      if ( m/projectid/   ) { push @path, $self->latest_library->latest_sample->latest_project->project_id; next FRAGMENT; }
      if ( m/projectssid/ ) { push @path, $self->latest_library->latest_sample->latest_project->ssid;       next FRAGMENT; }
      if ( m/sample/      ) { push @path, $self->latest_library->latest_sample->hierarchy_name;             next FRAGMENT; }
      if ( m/technology/  ) { push @path, $self->latest_library->seq_tech->name;                            next FRAGMENT; }
      if ( m/library/     ) { push @path, $self->latest_library->hierarchy_name;                            next FRAGMENT; }
      # this was in the original code but it's redundant
      # if ( m/lane/ ) { push @path, $self->hierarchy_name; next FRAGMENT; }
      push @path, $self->hierarchy_name;
    }
    # ... otherwise, push in the name of the fragment itself, e.g. "TRACKING"
    else {
      push @path, $_;
    }
  }

  # return the concatenated components of the path
  return file(@path)->stringify;
}

sub _get_genus_species {
  my $self = shift;

  my $genus_species;
  try {
    $genus_species = $self->latest_library->latest_sample->individual->species->name;
  } catch {
    croak q(ERROR: couldn't get species name for lane);
  };

  # as per the original code in VRTrack::VRTrack::hierarchy_path_of_object,
  # genus is everything before the first space, species is everything after it.
  # If there's no space, e.g. Trypanosomatidae, return the name as the genus
  # and leave species as undef
  $genus_species =~ m/^(\S+)(\s+(.*))?/;

  return ( $1, $3 );
}

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
