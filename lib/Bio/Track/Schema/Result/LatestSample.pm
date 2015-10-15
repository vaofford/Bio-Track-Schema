use utf8;
package Bio::Track::Schema::Result::LatestSample;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestSample - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_sample>

=cut

__PACKAGE__->table("latest_sample");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sample_id

  data_type: 'integer'
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
  "sample_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "project_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "hierarchy_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "individual_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
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
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JcgW+CcPvJvkmx32BDwBQA

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `sample_id`, `project_id`, `ssid`, `name`, `hierarchy_name`,
  `individual_id`, `note_id`, `changed`, `latest`
FROM `sample` WHERE `sample`.`latest` = 1
) );

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

__PACKAGE__->belongs_to(
  "latest_project",
  "Bio::Track::Schema::Result::LatestProject",
  { project_id => "project_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
