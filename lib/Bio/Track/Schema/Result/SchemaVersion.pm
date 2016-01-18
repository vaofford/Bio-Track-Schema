use utf8;
package Bio::Track::Schema::Result::SchemaVersion;

=head1 NAME

Bio::Track::Schema::Result::SchemaVersion

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';


=head1 TABLE: C<schema_version>

=cut

__PACKAGE__->table("schema_version");

=head1 ACCESSORS

=head2 schema_version

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "schema_version",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</schema_version>

=back

=cut

__PACKAGE__->set_primary_key("schema_version");

1;
