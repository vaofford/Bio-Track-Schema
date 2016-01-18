use utf8;
package Bio::Track::Schema::Result::SeqRequest;

=head1 NAME

Bio::Track::Schema::Result::SeqRequest

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<seq_request>

=cut

__PACKAGE__->table("seq_request");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 seq_request_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 multiplex_pool_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
  "seq_request_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "library_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "multiplex_pool_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
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

=head2 multiplex_pool

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::MultiplexPool>

=cut

__PACKAGE__->belongs_to(
  "multiplex_pool",
  "Bio::Track::Schema::Result::MultiplexPool",
  { multiplex_pool_id => "multiplex_pool_id" },
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

1;
