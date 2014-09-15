use Test::More tests => 1;
# Basic test of 'does the module load, damnit!'
use WWW::Shorten::TinyURL;

eval { WWW::Shorten::TinyURL->import(':invalid') };

ok($@);
