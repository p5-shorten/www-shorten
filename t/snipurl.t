use Test::More tests => 7;

BEGIN { use_ok WWW::Shorten::SnipURL };

my $url = 'http://code.mag-sol.com/WWW-Shorten/WWW-Shorten.1.95.tar.gz';
my $code;
my $prefix_RE = qr{http://sn(?:ip)?url\.com/};
my $prefix = 'http://snipurl.com/';
my $shortened = makeashorterlink($url);

if ($shortened =~ m|\Q$prefix\E(\w+)|) {
  $code = $1;
}

like ( $shortened, qr/$prefix_RE$code/, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);
is ( makealongerlink($shortened), $url, 'make it long with what we were given');

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
