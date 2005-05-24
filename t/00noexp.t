use Test::More tests => 1;
# Basic test of 'does the module load, damnit!'
use WWW::Shorten::MakeAShorterLink;

eval { WWW::Shorten::MakeAShorterLink->import(':invalid') };

ok($@);
