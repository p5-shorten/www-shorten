use Test::More tests => 6;


use WWW::Shorten qw( SnipURL :short );

ok( exists $::{'short_link'}, 'shorter exists');
ok( exists $::{'long_link'}, 'longer exists');

use WWW::Shorten qw( SnipURL :default );

ok( exists $::{'makeashorterlink'}, 'shorter exists');
ok( exists $::{'makealongerlink'}, 'longer exists');

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
