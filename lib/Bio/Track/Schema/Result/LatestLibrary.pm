use utf8;
package Bio::Track::Schema::Result::LatestLibrary;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestLibrary - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_library>

=cut

__PACKAGE__->table("latest_library");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_request_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sample_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ssid

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 hierarchy_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 prep_status

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["unknown","pending","started","passed","failed","cancelled","hold"]}
  is_nullable: 1

=head2 auto_qc_status

  data_type: 'enum'
  extra: {list => ["no_qc","passed","failed"]}
  is_nullable: 1

=head2 qc_status

  data_type: 'enum'
  default_value: 'no_qc'
  extra: {list => ["no_qc","pending","passed","failed"]}
  is_nullable: 1

=head2 fragment_size_from

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fragment_size_to

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 library_type_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 library_tag

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 library_tag_group

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 library_tag_sequence

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 seq_centre_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 seq_tech_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 open

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 1

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

=cut

__PACKAGE__->add_columns(
  "row_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "library_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_request_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "sample_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "prep_status",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => {
      list => [
        "unknown",
        "pending",
        "started",
        "passed",
        "failed",
        "cancelled",
        "hold",
      ],
    },
    is_nullable => 1,
  },
  "auto_qc_status",
  {
    data_type => "enum",
    extra => { list => ["no_qc", "passed", "failed"] },
    is_nullable => 1,
  },
  "qc_status",
  {
    data_type => "enum",
    default_value => "no_qc",
    extra => { list => ["no_qc", "pending", "passed", "failed"] },
    is_nullable => 1,
  },
  "fragment_size_from",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "fragment_size_to",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_type_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_tag",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_tag_group",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_tag_sequence",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "seq_centre_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "seq_tech_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "open",
  { data_type => "tinyint", default_value => 1, is_nullable => 1 },
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
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m95aLA5NDxPT1lD+dwXL7A

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `library_id`, `library_request_id`, `sample_id`, `ssid`,
  `name`, `hierarchy_name`, `prep_status`, `auto_qc_status`, `qc_status`,
  `fragment_size_from`, `fragment_size_to`, `library_type_id`, `library_tag`,
  `library_tag_group`, `library_tag_sequence`, `seq_centre_id`, `seq_tech_id`,
  `open`, `note_id`, `changed`, `latest`
FROM `library` WHERE `library`.`latest` = 1
) );

__PACKAGE__->belongs_to(
  "seq_tech",
  "Bio::Track::Schema::Result::SeqTech",
  { seq_tech_id => "seq_tech_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

__PACKAGE__->belongs_to(
  "latest_sample",
  "Bio::Track::Schema::Result::LatestSample",
  { sample_id => "sample_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
