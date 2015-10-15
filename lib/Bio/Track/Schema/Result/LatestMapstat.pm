use utf8;
package Bio::Track::Schema::Result::LatestMapstat;

### Created by DBIx::Class::Schema::Loader
### DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bio::Track::Schema::Result::LatestMapstat - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'Bio::Track::Schema::ResultBase';

__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<latest_mapstats>

=cut

__PACKAGE__->table("latest_mapstats");

=head1 ACCESSORS

=head2 row_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 mapstats_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lane_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 mapper_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 assembly_id

  data_type: 'integer'
  extra: {unsigned => 1}
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
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "mapstats_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "lane_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "mapper_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "assembly_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
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
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
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
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "percentage_reads_with_transposon",
  { data_type => "float", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_qc",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "prefix",
  { data_type => "varchar", default_value => "_", is_nullable => 1, size => 40 },
);


# Modified above this point; do not regenerate with loader
#
### Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-30 09:36:06
### DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FTt0lgx5rSERNNs0nFg4bQ

__PACKAGE__->result_source_instance->view_definition( q(
SELECT `row_id`, `mapstats_id`, `lane_id`, `mapper_id`, `assembly_id`, `raw_reads`,
  `raw_bases`, `clip_bases`, `reads_mapped`, `reads_paired`, `bases_mapped`,
  `rmdup_reads_mapped`, `rmdup_bases_mapped`, `adapter_reads`, `error_rate`,
  `mean_insert`, `sd_insert`, `gt_expected`, `gt_found`, `gt_ratio`, `note_id`,
  `changed`, `latest`, `bait_near_bases_mapped`, `target_near_bases_mapped`,
  `bait_bases_mapped`, `mean_bait_coverage`, `bait_coverage_sd`,
  `off_bait_bases`, `reads_on_bait`, `reads_on_bait_near`, `reads_on_target`,
  `reads_on_target_near`, `target_bases_mapped`, `mean_target_coverage`,
  `target_coverage_sd`, `target_bases_1X`, `target_bases_2X`,
  `target_bases_5X`, `target_bases_10X`, `target_bases_20X`,
  `target_bases_50X`, `target_bases_100X`, `exome_design_id`,
  `percentage_reads_with_transposon`, `is_qc`, `prefix`
FROM `mapstats` WHERE `mapstats`.`latest` = 1
) );

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
1;
