use utf8;
package Bio::Track::Schema::Result::Library;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Library

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

=head1 TABLE: C<library>

=cut

__PACKAGE__->table("library");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_request_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 sample_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
  is_foreign_key: 1
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
  is_foreign_key: 1
  is_nullable: 1

=head2 seq_tech_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 open

  data_type: 'tinyint'
  default_value: 1
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

=head2 latest

  data_type: 'tinyint'
  default_value: 0
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
  "library_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_request_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "sample_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
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
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "library_tag",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_tag_group",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "library_tag_sequence",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "seq_centre_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "seq_tech_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "open",
  { data_type => "tinyint", default_value => 1, is_nullable => 1 },
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
);

=head1 PRIMARY KEY

=over 4

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("row_id");

=head1 RELATIONS

=head2 lanes

Type: has_many

Related object: L<Bio::Track::Schema::Result::Lane>

=cut

__PACKAGE__->has_many(
  "lanes",
  "Bio::Track::Schema::Result::Lane",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_multiplex_pools

Type: has_many

Related object: L<Bio::Track::Schema::Result::LibraryMultiplexPool>

=cut

__PACKAGE__->has_many(
  "library_multiplex_pools",
  "Bio::Track::Schema::Result::LibraryMultiplexPool",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_request

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::LibraryRequest>

=cut

__PACKAGE__->belongs_to(
  "library_request",
  "Bio::Track::Schema::Result::LibraryRequest",
  { library_request_id => "library_request_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 library_type

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::LibraryType>

=cut

__PACKAGE__->belongs_to(
  "library_type",
  "Bio::Track::Schema::Result::LibraryType",
  { library_type_id => "library_type_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
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

=head2 sample

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Sample>

=cut

__PACKAGE__->belongs_to(
  "sample",
  "Bio::Track::Schema::Result::Sample",
  { sample_id => "sample_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 seq_centre

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::SeqCentre>

=cut

__PACKAGE__->belongs_to(
  "seq_centre",
  "Bio::Track::Schema::Result::SeqCentre",
  { seq_centre_id => "seq_centre_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 seq_requests

Type: has_many

Related object: L<Bio::Track::Schema::Result::SeqRequest>

=cut

__PACKAGE__->has_many(
  "seq_requests",
  "Bio::Track::Schema::Result::SeqRequest",
  { "foreign.library_id" => "self.library_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 seq_tech

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::SeqTech>

=cut

__PACKAGE__->belongs_to(
  "seq_tech",
  "Bio::Track::Schema::Result::SeqTech",
  { seq_tech_id => "seq_tech_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T1qJmTlfMypS6chkKwop/w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
