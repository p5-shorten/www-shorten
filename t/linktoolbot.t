use Test::More tests => 6;

BEGIN { use_ok WWW::Shorten::LinkToolbot };

my $url = 'http://mag-sol.com/';
my $re = qr|http://link.toolbot.com/(mag-sol.com/\d+)|;

my $shortened;
like(($shortened = makeashorterlink($url)), $re, 'make it shorter');

is(makealongerlink($shortened), $url, 'make it longer');

my ($code) = $shortened =~ $re;
is (makealongerlink($code), $url, 'make it longer by Id');

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
