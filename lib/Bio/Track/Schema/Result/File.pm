use utf8;
package Bio::Track::Schema::Result::File;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::File

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<file>

=cut

__PACKAGE__->table("file");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 file_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 hierarchy_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 processed

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 type

  data_type: 'tinyint'
  is_nullable: 1

=head2 readlen

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 raw_reads

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 raw_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 mean_q

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 md5

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 changed

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 latest

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 reference

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "row_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "file_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "lane_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "processed",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "type",
  { data_type => "tinyint", is_nullable => 1 },
  "readlen",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "raw_reads",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "raw_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "mean_q",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "md5",
  { data_type => "char", is_nullable => 1, size => 32 },
  "note_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "changed",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "latest",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "reference",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("row_id");

=head1 RELATIONS

=head2 lane

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Lane>

=cut

__PACKAGE__->belongs_to(
  "lane",
  "Bio::Track::Schema::Result::Lane",
  { lane_id => "lane_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 note

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Note>

=cut

__PACKAGE__->belongs_to(
  "note",
  "Bio::Track::Schema::Result::Note",
  { note_id => "note_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eq395u1RLPAtPR5wSIofXA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
