use utf8;
package Bio::Track::Schema::Result::LatestLane;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestLane - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
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


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1y2wL+EwvT/62F7VolmXOA

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

__PACKAGE__->meta->make_immutable;
1;
