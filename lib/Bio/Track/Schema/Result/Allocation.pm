use utf8;
package Bio::Track::Schema::Result::Allocation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Allocation

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<allocation>

=cut

__PACKAGE__->table("allocation");

=head1 ACCESSORS

=head2 study_id

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 individual_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 seq_centre_id

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "individual_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "seq_centre_id",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</study_id>

=item * L</individual_id>

=item * L</seq_centre_id>

=back

=cut

__PACKAGE__->set_primary_key("study_id", "individual_id", "seq_centre_id");

=head1 RELATIONS

=head2 individual

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Individual>

=cut

__PACKAGE__->belongs_to(
  "individual",
  "Bio::Track::Schema::Result::Individual",
  { individual_id => "individual_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 study

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Study>

=cut

__PACKAGE__->belongs_to(
  "study",
  "Bio::Track::Schema::Result::Study",
  { study_id => "study_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

# Modified above this point. Do not regenerate using loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aKV510Saifi95O7WVC/cvA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
