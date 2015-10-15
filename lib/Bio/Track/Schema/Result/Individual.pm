use utf8;
package Bio::Track::Schema::Result::Individual;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Individual

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<individual>

=cut

__PACKAGE__->table("individual");

=head1 ACCESSORS

=head2 individual_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 hierarchy_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 alias

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 sex

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["M","F","unknown"]}
  is_nullable: 1

=head2 acc

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 species_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 population_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "individual_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "alias",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "sex",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => { list => ["M", "F", "unknown"] },
    is_nullable => 1,
  },
  "acc",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "species_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "population_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</individual_id>

=back

=cut

__PACKAGE__->set_primary_key("individual_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<hierarchy_name>

=over 4

=item * L</hierarchy_name>

=back

=cut

__PACKAGE__->add_unique_constraint("hierarchy_name", ["hierarchy_name"]);

=head2 C<name>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name", ["name"]);

=head1 RELATIONS

=head2 allocations

Type: has_many

Related object: L<Bio::Track::Schema::Result::Allocation>

=cut

__PACKAGE__->has_many(
  "allocations",
  "Bio::Track::Schema::Result::Allocation",
  { "foreign.individual_id" => "self.individual_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 population

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Population>

=cut

__PACKAGE__->belongs_to(
  "population",
  "Bio::Track::Schema::Result::Population",
  { population_id => "population_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 samples

Type: has_many

Related object: L<Bio::Track::Schema::Result::Sample>

=cut

__PACKAGE__->has_many(
  "samples",
  "Bio::Track::Schema::Result::Sample",
  { "foreign.individual_id" => "self.individual_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Gbr2tD/iyugQxf/s1f5KZg

# this got missed because there was a relationship missing in the database that
# was used to reverse engineer the schema
__PACKAGE__->belongs_to(
  'species',
  'Bio::Track::Schema::Result::Species',
  { species_id => 'species_id' },
  {
    is_deferrable => 1,
    join_type     => 'LEFT',
    on_delete     => 'NO ACTION',
    on_update     => 'NO ACTION',
  },
);

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
