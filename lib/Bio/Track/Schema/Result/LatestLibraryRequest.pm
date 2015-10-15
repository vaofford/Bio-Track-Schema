use utf8;
package Bio::Track::Schema::Result::LatestLibraryRequest;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestLibraryRequest - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_library_request>

=cut

__PACKAGE__->table("latest_library_request");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
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

=head2 prep_status

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["unknown","pending","started","passed","failed","cancelled","hold"]}
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
  "library_request_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "sample_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
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
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2knMlAYiX7367YoAzYkSTw

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `library_request_id`, `sample_id`, `ssid`,
  `prep_status`, `note_id`, `changed`, `latest`
FROM `library_request` WHERE `library_request`.`latest` = 1
) );

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
