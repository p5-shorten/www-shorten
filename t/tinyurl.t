use Test::More tests => 6;

BEGIN { use_ok WWW::Shorten::TinyURL };

my $url = 'http://perl.dellah.org/WWW-Shorten-1.5.2.tar.gz';
my $code = '2etu';
my $prefix = 'http://tinyurl.com/';
my $prefix2 = 'http://redirecting.tinyurl.com/redirect.php?num=';
is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
is ( makealongerlink($prefix.$code), $prefix2.$code, 'make it longer');
is ( makealongerlink($code), $prefix2.$code, 'make it longer by Id',);

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
