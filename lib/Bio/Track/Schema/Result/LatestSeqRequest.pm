use utf8;
package Bio::Track::Schema::Result::LatestSeqRequest;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestSeqRequest - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_seq_request>

=cut

__PACKAGE__->table("latest_seq_request");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 seq_request_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 multiplex_pool_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ssid

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 seq_type

  data_type: 'enum'
  extra: {list => ["HiSeq Paired end sequencing","Illumina-A HiSeq Paired end sequencing","Illumina-A Paired end sequencing","Illumina-A Pulldown ISC","Illumina-A Pulldown SC","Illumina-A Pulldown WGS","Illumina-A Single ended hi seq sequencing","Illumina-A Single ended sequencing","Illumina-B HiSeq Paired end sequencing","Illumina-B Paired end sequencing","Illumina-B Single ended hi seq sequencing","Illumina-B Single ended sequencing","Illumina-C HiSeq Paired end sequencing","Illumina-C MiSeq sequencing","Illumina-C Paired end sequencing","Illumina-C Single ended hi seq sequencing","Illumina-C Single ended sequencing","MiSeq sequencing","Paired end sequencing","Single ended hi seq sequencing","Single Ended Hi Seq Sequencing Control","Single ended sequencing"]}
  is_nullable: 0

=head2 seq_status

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
  "seq_request_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "multiplex_pool_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "seq_type",
  {
    data_type => "enum",
    extra => {
      list => [
        "HiSeq Paired end sequencing",
        "Illumina-A HiSeq Paired end sequencing",
        "Illumina-A Paired end sequencing",
        "Illumina-A Pulldown ISC",
        "Illumina-A Pulldown SC",
        "Illumina-A Pulldown WGS",
        "Illumina-A Single ended hi seq sequencing",
        "Illumina-A Single ended sequencing",
        "Illumina-B HiSeq Paired end sequencing",
        "Illumina-B Paired end sequencing",
        "Illumina-B Single ended hi seq sequencing",
        "Illumina-B Single ended sequencing",
        "Illumina-C HiSeq Paired end sequencing",
        "Illumina-C MiSeq sequencing",
        "Illumina-C Paired end sequencing",
        "Illumina-C Single ended hi seq sequencing",
        "Illumina-C Single ended sequencing",
        "MiSeq sequencing",
        "Paired end sequencing",
        "Single ended hi seq sequencing",
        "Single Ended Hi Seq Sequencing Control",
        "Single ended sequencing",
      ],
    },
    is_nullable => 0,
  },
  "seq_status",
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
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Nr1gpOASNV+r/Htj0aPXrA

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `seq_request_id`, `library_id`, `multiplex_pool_id`, `ssid`,
  `seq_type`, `seq_status`, `note_id`, `changed`, `latest`
FROM `seq_request` WHERE `seq_request`.`latest` = 1
) );

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
