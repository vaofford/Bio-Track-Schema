use utf8;
package Bio::Track::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zxbcpqNJ+xYA5+kZbU5BoA

# ABSTRACT: DBIC schema for the tracking databases

with 'Bio::Track::Schema::Role::Methods';

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
