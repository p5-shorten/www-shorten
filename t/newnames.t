use Test::More tests => 4;


use WWW::Shorten qw( SnipURL :short );

ok( exists $::{'short_link'}, 'shorter exists');
ok( exists $::{'long_link'}, 'longer exists');

use WWW::Shorten qw( SnipURL :default );

ok( exists $::{'makeashorterlink'}, 'shorter exists');
ok( exists $::{'makealongerlink'}, 'longer exists');
