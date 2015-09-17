
package Bio::Track::Schema::Role::HasPath;

use Moose::Role;
use namespace::autoclean;

use File::Spec;

use Types::Standard qw( HashRef Str );

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
  return File::Spec->catdir(@path);
}

sub _get_genus_species {
  my $self = shift;

  my $genus_species = $self->latest_library->latest_sample->individual->species->name;

  # as per the original code in VRTrack::VRTrack::hierarchy_path_of_object,
  # genus is everything before the first space, species is everything after it
  $genus_species =~ m/^(\S+)\s+(.*)/;

  return ( $1, $2 );
}

1;

