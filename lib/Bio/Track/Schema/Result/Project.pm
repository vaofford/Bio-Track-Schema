use utf8;
package Bio::Track::Schema::Result::Project;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Project

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<project>

=cut

__PACKAGE__->table("project");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 project_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ssid

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

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

=head2 study_id

  data_type: 'smallint'
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

=head2 data_access_group

  data_type: 'varchar'
  default_value: (empty string)
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
  "project_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "study_id",
  { data_type => "smallint", is_nullable => 1 },
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
  "data_access_group",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("row_id");

=head1 RELATIONS

=head2 samples

Type: has_many

Related object: L<Bio::Track::Schema::Result::Sample>

=cut

__PACKAGE__->has_many(
  "samples",
  "Bio::Track::Schema::Result::Sample",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "studies",
  "Bio::Track::Schema::Result::Study",
  { "foreign.study_id" => "self.study_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eLMSb4c6o4RXYSbY+853IA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
