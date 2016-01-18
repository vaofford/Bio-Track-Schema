use utf8;
package Bio::Track::Schema::Result::Image;

=head1 NAME

Bio::Track::Schema::Result::Image

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<image>

=cut

__PACKAGE__->table("image");

=head1 ACCESSORS

=head2 image_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mapstats_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 caption

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 image

  data_type: 'mediumblob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "image_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "mapstats_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "caption",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "image",
  { data_type => "mediumblob", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</image_id>

=back

=cut

__PACKAGE__->set_primary_key("image_id");

=head1 RELATIONS

=head2 mapstat

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->belongs_to(
  "mapstat",
  "Bio::Track::Schema::Result::Mapstat",
  { mapstats_id => "mapstats_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

1;
