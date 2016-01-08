use utf8;
package Bio::Track::ReducedSchema;

# ABSTRACT: stripped down DBIC schema for the tracking databases

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';
with 'Bio::Track::Schema::Role::Methods';

__PACKAGE__->load_classes(
  {
    'Bio::Track::Schema::Result' => [ qw(
      Individual
      LatestLane
      LatestLibrary
      LatestMapstat
      LatestProject
      LatestSample
      SeqTech
      Species
      Study
    ) ],
  }
);

#-------------------------------------------------------------------------------

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
