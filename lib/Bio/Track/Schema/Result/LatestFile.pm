use utf8;
package Bio::Track::Schema::Result::LatestFile;

=head1 NAME

Bio::Track::Schema::Result::LatestFile - VIEW

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_file>

=cut

__PACKAGE__->table("latest_file");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 file_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
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
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "file_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "lane_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
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

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `file_id`, `lane_id`, `name`, `hierarchy_name`, `processed`,
  `type`, `readlen`, `raw_reads`, `raw_bases`, `mean_q`, `md5`, `note_id`,
  `changed`, `latest`, `reference`
FROM `file` WHERE `file`.`latest` = 1
) );

__PACKAGE__->belongs_to(
  "latest_lane",
  "Bio::Track::Schema::Result::LatestLane",
  { lane_id => "lane_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

1;
