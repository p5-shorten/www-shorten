use Test::More tests => 7;

BEGIN { use_ok WWW::Shorten::SnipURL };

my $url = 'http://perl.dellah.org/WWW-Shorten-1.5.2.tar.gz';
my $code = 'a8f';
my $prefix_RE = qr{http://sn(?:ip)?url\.com/};
my $prefix = 'http://snipurl.com/';
my $shortened = makeashorterlink($url);

like ( $shortened, qr/$prefix_RE$code/, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);
is ( makealongerlink($shortened), $url, 'make it long with what we were given');

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
