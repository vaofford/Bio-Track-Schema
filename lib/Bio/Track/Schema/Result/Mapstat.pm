use utf8;
package Bio::Track::Schema::Result::Mapstat;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::Mapstat

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<mapstats>

=cut

__PACKAGE__->table("mapstats");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mapstats_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 mapper_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 assembly_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 raw_reads

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 raw_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 clip_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_paired

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rmdup_reads_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rmdup_bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 adapter_reads

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 error_rate

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 mean_insert

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 sd_insert

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 gt_expected

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 gt_found

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 gt_ratio

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 note_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 changed

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 latest

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 bait_near_bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_near_bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bait_bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 mean_bait_coverage

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bait_coverage_sd

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 off_bait_bases

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_on_bait

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_on_bait_near

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_on_target

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 reads_on_target_near

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_mapped

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 mean_target_coverage

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_coverage_sd

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_1x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_2x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_5x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_10x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_20x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_50x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 target_bases_100x

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 exome_design_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 percentage_reads_with_transposon

  data_type: 'float'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 is_qc

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 prefix

  data_type: 'varchar'
  default_value: '_'
  is_nullable: 1
  size: 40

=cut

__PACKAGE__->add_columns(
  "row_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "mapstats_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "lane_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "mapper_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "assembly_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "raw_reads",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "raw_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "clip_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_paired",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "rmdup_reads_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "rmdup_bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "adapter_reads",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "error_rate",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "mean_insert",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "sd_insert",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "gt_expected",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "gt_found",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "gt_ratio",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "note_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "changed",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "latest",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "bait_near_bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_near_bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "bait_bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "mean_bait_coverage",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "bait_coverage_sd",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "off_bait_bases",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_on_bait",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_on_bait_near",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_on_target",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "reads_on_target_near",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_mapped",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "mean_target_coverage",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_coverage_sd",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_1x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_2x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_5x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_10x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_20x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_50x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "target_bases_100x",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "exome_design_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "percentage_reads_with_transposon",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_qc",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "prefix",
  { data_type => "varchar", default_value => "_", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("row_id");

=head1 RELATIONS

=head2 assembly

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Assembly>

=cut

__PACKAGE__->belongs_to(
  "assembly",
  "Bio::Track::Schema::Result::Assembly",
  { assembly_id => "assembly_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 autoqcs

Type: has_many

Related object: L<Bio::Track::Schema::Result::Autoqc>

=cut

__PACKAGE__->has_many(
  "autoqcs",
  "Bio::Track::Schema::Result::Autoqc",
  { "foreign.mapstats_id" => "self.mapstats_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 exome_design

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::ExomeDesign>

=cut

__PACKAGE__->belongs_to(
  "exome_design",
  "Bio::Track::Schema::Result::ExomeDesign",
  { exome_design_id => "exome_design_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 images

Type: has_many

Related object: L<Bio::Track::Schema::Result::Image>

=cut

__PACKAGE__->has_many(
  "images",
  "Bio::Track::Schema::Result::Image",
  { "foreign.mapstats_id" => "self.mapstats_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 lane

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Lane>

=cut

__PACKAGE__->belongs_to(
  "lane",
  "Bio::Track::Schema::Result::Lane",
  { lane_id => "lane_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 mapper

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Mapper>

=cut

__PACKAGE__->belongs_to(
  "mapper",
  "Bio::Track::Schema::Result::Mapper",
  { mapper_id => "mapper_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 note

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Note>

=cut

__PACKAGE__->belongs_to(
  "note",
  "Bio::Track::Schema::Result::Note",
  { note_id => "note_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fV2yJ/VzPKGdfITOf+bOwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
