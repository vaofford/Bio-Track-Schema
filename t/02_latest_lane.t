
use strict;
use warnings;

use DBD::SQLite;
use File::Copy;

BEGIN {
  # clone the test DB to make sure it doesn't get destroyed or emptied if the
  # script dies prematurely
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
my $lanes_rs = LatestLane->get_lanes_by_lane_name('5477_6');
is $lanes_rs->count, 4, 'got 4 lanes using lane name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';

# search by sample name
$lanes_rs = LatestLane->get_lanes_by_sample_name('test1_1');
is $lanes_rs->count, 1, 'got 1 lane using sample name';
is $lanes_rs->first->acc, 'ERR028809', 'got expected lane accession';

# search by study name
$lanes_rs = LatestLane->get_lanes_by_study_id('Test Study 1');
is $lanes_rs->count, 4, 'got 4 lanes using study name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->ssid, 3,
  'got expected project SSID';

# search by project SSID
$lanes_rs = LatestLane->get_lanes_by_study_id(3);
is $lanes_rs->count, 4, 'got 4 lanes using project SSID';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->name, 'Test Study 1',
  'got expected project name';

# search by study name
$lanes_rs = LatestLane->get_lanes_by_library_name('test1_1');
is $lanes_rs->count, 1, 'got 1 lane using library name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';
is $lanes_rs->first->latest_library->latest_sample->latest_project->ssid, 3,
  'got expected project SSID';

# search by species name
$lanes_rs = LatestLane->get_lanes_by_species_name('Shigella');
is $lanes_rs->count, 4, 'got 4 lanes using species name';
is $lanes_rs->first->acc, 'ERR047288', 'got expected accession';
is $lanes_rs->first->latest_library->latest_sample->individual->species->name, 'Shigella flexneri',
  'got expected species name';

$lanes_rs = LatestLane->get_lanes_by_species_name('flexneri');
is $lanes_rs->count, 4, 'got 4 lanes using end of species name';
is $lanes_rs->first->latest_library->latest_sample->individual->species->name, 'Shigella flexneri',
  'got expected species name';

# check processing flag is applied correctly
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

$lanes_rs = LatestLane->get_lanes_by_species_name('flexneri', 1);
is $lanes_rs->count, 4, 'got 4 lanes with processing flag 1';

$lanes_rs = LatestLane->get_lanes_by_species_name('flexneri', 512);
is $lanes_rs->count, 2, 'got 2 lanes with processing flag 512';
my @lanes = $lanes_rs->all;
is $lanes[0]->lane_id, 2,  'first row has expected ID (2)';
is $lanes[1]->lane_id, 22, 'second row has expected ID (22)';

$lanes_rs = LatestLane->get_lanes_by_species_name('flexneri', 1024);
is $lanes_rs->count, 2, 'got 2 lanes with processing flag 1024';
@lanes = $lanes_rs->all;
is $lanes[0]->lane_id, 9,  'first row has expected ID (9)';
is $lanes[1]->lane_id, 15, 'second row has expected ID (15)';

$lanes_rs = LatestLane->get_lanes_by_species_name('flexneri', 1536);
is $lanes_rs->count, 0, 'got no lanes with processing flag 1536';

$DB::single = 1;

done_testing;

unlink 'temp_full.db' unless $ENV{KEEP_DB};

