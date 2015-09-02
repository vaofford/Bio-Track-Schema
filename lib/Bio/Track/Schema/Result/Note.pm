use utf8;
package Bio::Track::Schema::Result::Note;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Note

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<note>

=cut

__PACKAGE__->table("note");

=head1 ACCESSORS

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 note

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "note_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "note",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</note_id>

=back

=cut

__PACKAGE__->set_primary_key("note_id");

=head1 RELATIONS

=head2 files

Type: has_many

Related object: L<Bio::Track::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  "files",
  "Bio::Track::Schema::Result::File",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 lanes

Type: has_many

Related object: L<Bio::Track::Schema::Result::Lane>

=cut

__PACKAGE__->has_many(
  "lanes",
  "Bio::Track::Schema::Result::Lane",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 libraries

Type: has_many

Related object: L<Bio::Track::Schema::Result::Library>

=cut

__PACKAGE__->has_many(
  "libraries",
  "Bio::Track::Schema::Result::Library",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_requests

Type: has_many

Related object: L<Bio::Track::Schema::Result::LibraryRequest>

=cut

__PACKAGE__->has_many(
  "library_requests",
  "Bio::Track::Schema::Result::LibraryRequest",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 mapstats

Type: has_many

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->has_many(
  "mapstats",
  "Bio::Track::Schema::Result::Mapstat",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 samples

Type: has_many

Related object: L<Bio::Track::Schema::Result::Sample>

=cut

__PACKAGE__->has_many(
  "samples",
  "Bio::Track::Schema::Result::Sample",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 seq_requests

Type: has_many

Related object: L<Bio::Track::Schema::Result::SeqRequest>

=cut

__PACKAGE__->has_many(
  "seq_requests",
  "Bio::Track::Schema::Result::SeqRequest",
  { "foreign.note_id" => "self.note_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Lks9iTl97IRAhnRORXybng


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
