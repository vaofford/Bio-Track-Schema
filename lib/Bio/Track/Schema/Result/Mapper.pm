use utf8;
package Bio::Track::Schema::Result::Mapper;

=head1 NAME

Bio::Track::Schema::Result::Mapper

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<mapper>

=cut

__PACKAGE__->table("mapper");

=head1 ACCESSORS

=head2 mapper_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 version

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=cut

__PACKAGE__->add_columns(
  "mapper_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "version",
  { data_type => "varchar", is_nullable => 0, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</mapper_id>

=back

=cut

__PACKAGE__->set_primary_key("mapper_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_v>

=over 4

=item * L</name>

=item * L</version>

=back

=cut

__PACKAGE__->add_unique_constraint("name_v", ["name", "version"]);

=head1 RELATIONS

=head2 mapstats

Type: has_many

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->has_many(
  "mapstats",
  "Bio::Track::Schema::Result::Mapstat",
  { "foreign.mapper_id" => "self.mapper_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
