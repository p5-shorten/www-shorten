use Test::More tests => 1;
use LWP::UserAgent qw();

diag 'Test::More '.Test::More->VERSION();
diag 'LWP::UserAgent '.LWP::UserAgent->VERSION();

pass("Versions checked.");
