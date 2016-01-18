use utf8;
package Bio::Track::Schema::Result::Study;

=head1 NAME

Bio::Track::Schema::Result::Study

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<study>

=cut

__PACKAGE__->table("study");

=head1 ACCESSORS

=head2 study_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 acc

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 ssid

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "acc",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "note_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</study_id>

=back

=cut

__PACKAGE__->set_primary_key("study_id");

=head1 RELATIONS

=head2 allocations

Type: has_many

Related object: L<Bio::Track::Schema::Result::Allocation>

=cut

__PACKAGE__->has_many(
  "allocations",
  "Bio::Track::Schema::Result::Allocation",
  { "foreign.study_id" => "self.study_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
