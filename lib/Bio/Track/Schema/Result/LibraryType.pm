use utf8;
package Bio::Track::Schema::Result::LibraryType;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LibraryType

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

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


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C8nPRwm/aGKBZGyxYp6PtQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
