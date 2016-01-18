use utf8;
package Bio::Track::Schema::Result::LatestProject;

=head1 NAME

Bio::Track::Schema::Result::LatestProject - VIEW

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_project>

=cut

__PACKAGE__->table("latest_project");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
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

=cut

__PACKAGE__->add_columns(
  "row_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
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
);


__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `project_id`, `ssid`, `name`, `hierarchy_name`, `study_id`,
  `note_id`, `changed`, `latest`
FROM `project` WHERE `project`.`latest` = 1
) );

1;
