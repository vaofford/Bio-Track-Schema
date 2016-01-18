use utf8;
package Bio::Track::Schema::Result::Submission;

=head1 NAME

Bio::Track::Schema::Result::Submission

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<submission>

=cut

__PACKAGE__->table("submission");

=head1 ACCESSORS

=head2 submission_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 acc

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=cut

__PACKAGE__->add_columns(
  "submission_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "acc",
  { data_type => "varchar", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</submission_id>

=back

=cut

__PACKAGE__->set_primary_key("submission_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<acc>

=over 4

=item * L</acc>

=back

=cut

__PACKAGE__->add_unique_constraint("acc", ["acc"]);

=head1 RELATIONS

=head2 lanes

Type: has_many

Related object: L<Bio::Track::Schema::Result::Lane>

=cut

__PACKAGE__->has_many(
  "lanes",
  "Bio::Track::Schema::Result::Lane",
  { "foreign.submission_id" => "self.submission_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
