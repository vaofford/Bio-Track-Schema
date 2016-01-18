use utf8;
package Bio::Track::Schema::Result::SeqCentre;

=head1 NAME

Bio::Track::Schema::Result::SeqCentre

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<seq_centre>

=cut

__PACKAGE__->table("seq_centre");

=head1 ACCESSORS

=head2 seq_centre_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "seq_centre_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</seq_centre_id>

=back

=cut

__PACKAGE__->set_primary_key("seq_centre_id");

=head1 RELATIONS

=head2 libraries

Type: has_many

Related object: L<Bio::Track::Schema::Result::Library>

=cut

__PACKAGE__->has_many(
  "libraries",
  "Bio::Track::Schema::Result::Library",
  { "foreign.seq_centre_id" => "self.seq_centre_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
