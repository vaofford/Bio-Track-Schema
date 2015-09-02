use utf8;
package Bio::Track::Schema::Result::Lane;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Lane

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

=head1 TABLE: C<lane>

=cut

__PACKAGE__->table("lane");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
  is_foreign_key: 1
  is_nullable: 1

=head2 withdrawn

  data_type: 'tinyint'
  is_nullable: 1

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "lane_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
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
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "withdrawn",
  { data_type => "tinyint", is_nullable => 1 },
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

=head1 PRIMARY KEY

=over 4

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("row_id");

=head1 RELATIONS

=head2 files

Type: has_many

Related object: L<Bio::Track::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  "files",
  "Bio::Track::Schema::Result::File",
  { "foreign.lane_id" => "self.lane_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "library",
  "Bio::Track::Schema::Result::Library",
  { library_id => "library_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 mapstats

Type: has_many

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->has_many(
  "mapstats",
  "Bio::Track::Schema::Result::Mapstat",
  { "foreign.lane_id" => "self.lane_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 submission

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Submission>

=cut

__PACKAGE__->belongs_to(
  "submission",
  "Bio::Track::Schema::Result::Submission",
  { submission_id => "submission_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KXgePjOTvW3fCNGiV+Lhkg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
