use Test::More tests => 1;
# Basic test of 'does the module load, damnit!'
use WWW::Shorten::Metamark;

eval { WWW::Shorten::Metamark->import(':invalid') };

ok($@);
