use utf8;
package Bio::Track::Schema::Result::LibraryType;

=head1 NAME

Bio::Track::Schema::Result::LibraryType

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<library_type>

=cut

__PACKAGE__->table("library_type");

=head1 ACCESSORS

=head2 library_type_id

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
  "library_type_id",
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

=item * L</library_type_id>

=back

=cut

__PACKAGE__->set_primary_key("library_type_id");

=head1 RELATIONS

=head2 libraries

Type: has_many

Related object: L<Bio::Track::Schema::Result::Library>

=cut

__PACKAGE__->has_many(
  "libraries",
  "Bio::Track::Schema::Result::Library",
  { "foreign.library_type_id" => "self.library_type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
