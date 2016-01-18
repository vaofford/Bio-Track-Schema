use utf8;
package Bio::Track::Schema::Result::LibraryMultiplexPool;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LibraryMultiplexPool

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<library_multiplex_pool>

=cut

__PACKAGE__->table("library_multiplex_pool");

=head1 ACCESSORS

=head2 library_multiplex_pool_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 multiplex_pool_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "library_multiplex_pool_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "multiplex_pool_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "library_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</library_multiplex_pool_id>

=back

=cut

__PACKAGE__->set_primary_key("library_multiplex_pool_id");

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
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kooEVhctNDCf4OMRRoCPyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
