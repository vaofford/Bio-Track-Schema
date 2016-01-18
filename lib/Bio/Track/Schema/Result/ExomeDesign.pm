use utf8;
package Bio::Track::Schema::Result::ExomeDesign;

=head1 NAME

Bio::Track::Schema::Result::ExomeDesign

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<exome_design>

=cut

__PACKAGE__->table("exome_design");

=head1 ACCESSORS

=head2 exome_design_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 bait_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "exome_design_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "bait_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</exome_design_id>

=back

=cut

__PACKAGE__->set_primary_key("exome_design_id");

=head1 RELATIONS

=head2 mapstats

Type: has_many

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->has_many(
  "mapstats",
  "Bio::Track::Schema::Result::Mapstat",
  { "foreign.exome_design_id" => "self.exome_design_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
