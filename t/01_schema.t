
use strict;
use warnings;

use DBD::SQLite;

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
};

# check for exceptions with bad input
throws_ok { Schema->get_lanes_by_id() }
  qr/must supply a name/,
  'got an exception when calling "get_lanes" with no parameters';

throws_ok { Schema->get_lanes_by_id('name') }
  qr/must specify the ID type/,
  'got an exception when calling "get_lanes" without an ID type';

throws_ok { Schema->get_lanes_by_id('name', 'bad_type') }
  qr/not a valid ID type/,
  'got an exception when calling "get_lanes" with a bad ID type';

# should work with valid input
my $lanes_rs;
lives_ok { $lanes_rs = Schema->get_lanes_by_id('5477_6', 'lane') }
  'no exception when using "get_lanes_by_id"';

is $lanes_rs->count, 4, 'got 4 lanes using lane name';
is $lanes_rs->first->name, '5477_6#1', 'got expected lane name';

# check a different ID type
$lanes_rs = Schema->get_lanes_by_id('flexneri', 'species');
is $lanes_rs->count, 4, 'got 4 lanes using species name';

# check that the processed flag works
$lanes_rs = Schema->get_lanes_by_id('flexneri', 'species', 512);
is $lanes_rs->count, 2, 'got 2 lanes using species name and processed flag 512';

# check "get_all_lanes"
$lanes_rs = Schema->get_all_lanes;
is $lanes_rs->count, 11, 'got 11 lanes using "get_all_lanes"';

$DB::single = 1;

done_testing;

unlink 'temp_full.db' unless $ENV{KEEP_DB};

