use utf8;
package Bio::Track::Schema::Result::MultiplexPool;

=head1 NAME

Bio::Track::Schema::Result::MultiplexPool

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<multiplex_pool>

=cut

__PACKAGE__->table("multiplex_pool");

=head1 ACCESSORS

=head2 multiplex_pool_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
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

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "multiplex_pool_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ssid",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "note_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</multiplex_pool_id>

=back

=cut

__PACKAGE__->set_primary_key("multiplex_pool_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<ssid>

=over 4

=item * L</ssid>

=back

=cut

__PACKAGE__->add_unique_constraint("ssid", ["ssid"]);

=head1 RELATIONS

=head2 library_multiplex_pools

Type: has_many

Related object: L<Bio::Track::Schema::Result::LibraryMultiplexPool>

=cut

__PACKAGE__->has_many(
  "library_multiplex_pools",
  "Bio::Track::Schema::Result::LibraryMultiplexPool",
  { "foreign.multiplex_pool_id" => "self.multiplex_pool_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 seq_requests

Type: has_many

Related object: L<Bio::Track::Schema::Result::SeqRequest>

=cut

__PACKAGE__->has_many(
  "seq_requests",
  "Bio::Track::Schema::Result::SeqRequest",
  { "foreign.multiplex_pool_id" => "self.multiplex_pool_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
