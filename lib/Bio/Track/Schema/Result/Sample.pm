use utf8;
package Bio::Track::Schema::Result::Sample;

=head1 NAME

Bio::Track::Schema::Result::Sample

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<sample>

=cut

__PACKAGE__->table("sample");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 sample_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 project_id

  data_type: 'smallint'
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
  size: 40

=head2 individual_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
  "sample_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "project_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "individual_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
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

=head2 individual

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Individual>

=cut

__PACKAGE__->belongs_to(
  "individual",
  "Bio::Track::Schema::Result::Individual",
  { individual_id => "individual_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 libraries

Type: has_many

Related object: L<Bio::Track::Schema::Result::Library>

=cut

__PACKAGE__->has_many(
  "libraries",
  "Bio::Track::Schema::Result::Library",
  { "foreign.sample_id" => "self.sample_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_requests

Type: has_many

Related object: L<Bio::Track::Schema::Result::LibraryRequest>

=cut

__PACKAGE__->has_many(
  "library_requests",
  "Bio::Track::Schema::Result::LibraryRequest",
  { "foreign.sample_id" => "self.sample_id" },
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

=head2 project

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "Bio::Track::Schema::Result::Project",
  { project_id => "project_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

1;
