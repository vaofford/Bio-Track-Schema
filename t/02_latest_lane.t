
use strict;
use warnings;

use DBD::SQLite;
use File::Slurp;

BEGIN {
  # clone the test DB to make sure it doesn't get destroyed or emptied if the
  # test script dies prematurely
  use File::Copy;
  copy 't/data/full.db', 'temp_full.db';
}

use Test::More;
use Test::Exception;
use Test::DBIx::Class {
  schema_class => 'Bio::Track::Schema',
  connect_info => [ 'dbi:SQLite:dbname=temp_full.db', '', '' ],
  connect_opts => { sqlite_open_flags => DBD::SQLite::OPEN_READONLY },
  deploy_db    => 0,
  keep_db      => 1,
}, qw( LatestLane );

# check exceptions for bad input
throws_ok { LatestLane->get_lanes_by_lane_name }
  qr/must supply a search term/,
  'exception with no arguments';

throws_ok { LatestLane->get_lanes_by_lane_name('5477_6', 'a') }
  qr/not a valid "processed_flag"/,
  'exception with bad "processing_flag"';

# search by lane name
my $lanes_rs = LatestLane->get_lanes_by_lane_name(['5477_6']);
is $lanes_rs->count, 4, 'got 4 lanes using lane name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';

# search by multiple lane names
$lanes_rs = LatestLane->get_lanes_by_lane_name(['5477_6','6578_4#1']);
is $lanes_rs->count, 5, 'got 5 lanes using lane names';
my @multiple_lanes = $lanes_rs->all;
is $multiple_lanes[0]->name,  '5477_6#1', 'got expected name first lane';
is $multiple_lanes[-1]->name, '6578_4#1', 'got expected name for last lane';

# search by sample name
$lanes_rs = LatestLane->get_lanes_by_sample_name(['test1_1']);
is $lanes_rs->count, 1, 'got 1 lane using sample name';
is $lanes_rs->first->acc, 'ERR028809', 'got expected lane accession';

# search by multiple sample names
$lanes_rs = LatestLane->get_lanes_by_sample_name(['test1_1','test1_2']);
is $lanes_rs->count, 2, 'got 2 lanes using sample names';
@multiple_lanes = $lanes_rs->all;
is $multiple_lanes[0]->acc,  'ERR028809', 'got expected accession for first lane';
is $multiple_lanes[-1]->acc, 'ERR028812', 'got expected accession for 2nd lane';

# search by study name
$lanes_rs = LatestLane->get_lanes_by_study_id(['Test Study 1']);
is $lanes_rs->count, 4, 'got 4 lanes using study name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->ssid, 3,
  'got expected project SSID';

# search by project SSID
$lanes_rs = LatestLane->get_lanes_by_study_id([3]);
is $lanes_rs->count, 4, 'got 4 lanes using project SSID';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->name, 'Test Study 1',
  'got expected project name';

# search by study name
$lanes_rs = LatestLane->get_lanes_by_library_name(['test1_1']);
is $lanes_rs->count, 1, 'got 1 lane using library name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->ssid, 3,
  'got expected project SSID';

# search by species name
$lanes_rs = LatestLane->get_lanes_by_species_name(['Shigella']);
is $lanes_rs->count, 4, 'got 4 lanes using species name';
is $lanes_rs->first->acc, 'ERR047288', 'got expected accession';
is $lanes_rs->first->latest_library->latest_sample->individual->species->name, 'Shigella flexneri',
  'got expected species name';

$lanes_rs = LatestLane->get_lanes_by_species_name(['flexneri']);
is $lanes_rs->count, 4, 'got 4 lanes using end of species name';
is $lanes_rs->first->latest_library->latest_sample->individual->species->name, 'Shigella flexneri',
  'got expected species name';

# check processing flag is applied correctly
#
#            2 1
#            0 0 5 2 1
#            4 2 1 5 2 6 3 1
# flags      8 4 2 6 8 4 2 6 8 4 2 1
#   783 = 0b 0 0 1 1 0 0 0 0 1 1 1 1
#  3343 = 0b 1 1 0 1 0 0 0 0 1 1 1 1
#
# masks
#     1 = 0b 0 0 0 0 0 0 0 0 0 0 0 1 - should return 4 lanes
#   512 = 0b 0 0 1 0 0 0 0 0 0 0 0 0 - should return 2 lanes
#  1024 = 0b 0 1 0 0 0 0 0 0 0 0 0 0 - should return 2 different lanes
#  1536 = 0b 0 1 1 0 0 0 0 0 0 0 0 0 - shouldn't return any lanes

$lanes_rs = LatestLane->get_lanes_by_species_name(['flexneri'], 1);
is $lanes_rs->count, 4, 'got 4 lanes with processing flag 1';

$lanes_rs = LatestLane->get_lanes_by_species_name(['flexneri'], 512);
is $lanes_rs->count, 2, 'got 2 lanes with processing flag 512';
my @lanes = $lanes_rs->all;
is $lanes[0]->lane_id, 2,  'first row has expected ID (2)';
is $lanes[1]->lane_id, 22, 'second row has expected ID (22)';

$lanes_rs = LatestLane->get_lanes_by_species_name(['flexneri'], 1024);
is $lanes_rs->count, 2, 'got 2 lanes with processing flag 1024';
@lanes = $lanes_rs->all;
is $lanes[0]->lane_id, 9,  'first row has expected ID (9)';
is $lanes[1]->lane_id, 15, 'second row has expected ID (15)';

$lanes_rs = LatestLane->get_lanes_by_species_name(['flexneri'], 1536);
is $lanes_rs->count, 0, 'got no lanes with processing flag 1536';

# get IDs from file
throws_ok { LatestLane->get_lanes_from_id_file() }
  qr/must supply a valid filename/,
  'exception when calling "get_lanes_from_id_file" without a filename';

throws_ok { LatestLane->get_lanes_from_id_file('non-existent-file') }
  qr/must supply a valid filename/,
  'exception when calling "get_lanes_from_id_file" with a bad filename';

throws_ok { LatestLane->get_lanes_from_id_file('t/data/02_lane_names.txt') }
  qr/must be either "lane" or "sample"/,
  'exception when calling "get_lanes_from_id_file" without ID type';

throws_ok { LatestLane->get_lanes_from_id_file('t/data/02_lane_names.txt', 'wrong') }
  qr/must be either "lane" or "sample"/,
  'exception when calling "get_lanes_from_id_file" with invalid ID type';

my $lanes;
lives_ok { $lanes = LatestLane->get_lanes_from_id_file('t/data/02_lane_names.txt', 'lane') }
  'no exception from "get_lanes_from_id_file" with valid input';
is scalar @$lanes, 5, 'got 5 lanes using lane names from file';
is $lanes->[0]->acc,  'ERR028809', 'got expected accession for first lane';
is $lanes->[-1]->acc, 'ERR047288', 'got expected accession for last lane';

# we should find five rows using the IDs in the file:
#
# sqlite> select lane.name, lane.acc, lane.processed, s.name from latest_lane lane
#    ...> join latest_library using (library_id)
#    ...> join latest_sample  using (sample_id)
#    ...> where lane.name like '5477_6%'
#    ...> or    lane.name =    '6578_4#1'
#    ...> order by lane.name;
# lane.name   lane.acc    lane.processed  s.name
# ----------  ----------  --------------  ----------
# 5477_6#1    ERR028809   783             test1_1
# 5477_6#2    ERR028812   3343            test1_2
# 5477_6#3    ERR028813   783             test1_3
# 5477_6#4    ERR028814   783             test1_4
# 6578_4#1    ERR047288   783             test2_1
# CPU Time: user 0.001392 sys 0.000232
# sqlite>
#
# and then one should be filtered out ("5477_6#2") if we use a processed flag of 512

$lanes = LatestLane->get_lanes_from_id_file('t/data/02_lane_names.txt', 'lane', 512);
is scalar @$lanes, 4, 'got 4 lanes using lane names from file with processed flag 512';

$lanes = LatestLane->get_lanes_from_id_file('t/data/02_sample_names.txt', 'sample');
is scalar @$lanes, 2, 'got 2 lanes using sample names from file';
is $lanes->[0]->acc,  'ERR028809', 'got expected accession for first lane';
is $lanes->[-1]->acc, 'ERR047288', 'got expected accession for last lane';

my @ids = read_file 't/data/02_lane_names.txt';

$lanes = LatestLane->get_lanes_from_id_list(\@ids, 'lane');
is scalar @$lanes, 5, 'got expected number of lanes from "get_lanes_from_id_list"';

$DB::single = 1;

done_testing;

unlink 'temp_full.db' unless $ENV{KEEP_DB};

