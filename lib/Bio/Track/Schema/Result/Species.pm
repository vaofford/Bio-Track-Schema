use utf8;
package Bio::Track::Schema::Result::Species;

=head1 NAME

Bio::Track::Schema::Result::Species

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<species>

=cut

__PACKAGE__->table("species");

=head1 ACCESSORS

=head2 species_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 taxon_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "species_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "taxon_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</species_id>

=back

=cut

__PACKAGE__->set_primary_key("species_id");

=head1 RELATIONS

=head2 assemblies

Type: has_many

Related object: L<Bio::Track::Schema::Result::Assembly>

=cut

__PACKAGE__->has_many(
  "assemblies",
  "Bio::Track::Schema::Result::Assembly",
  { "foreign.taxon_id" => "self.taxon_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

# this got missed because there was a relationship missing in the database that
# was used to reverse engineer the schema
__PACKAGE__->has_many(
  'individuals',
  'Bio::Track::Schema::Result::Individual',
  { 'foreign.species_id' => 'self.species_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
